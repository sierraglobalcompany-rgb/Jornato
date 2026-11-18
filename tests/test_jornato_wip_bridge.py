import contextlib
import io
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

import sys

# In GitHub this test lives in tests/, while the module is in tools/.
sys.path.insert(0, str(Path(__file__).resolve().parents[1] / 'tools'))
import JORNATO_CONCILIAR_WIP_GITHUB_SIN_CODEX as b


class TestBridge(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory(prefix="jornato_bridge_test_")
        self.addCleanup(self.tmp.cleanup)
        self.parent = Path(self.tmp.name)
        self.wip = self.parent / "wip"
        self.wip.mkdir()
        self.out = self.parent / "reports"
        self.sample = self.wip / "lib" / "src" / "domain" / "attendance.dart"
        self.sample.parent.mkdir(parents=True)
        self.sample.write_text("hello\n", encoding="utf-8")
        self.sha = b.git_blob_id(self.sample)
        self.ref = (("lib/src/domain/attendance.dart", self.sha),)

    def test_git_blob_stable(self):
        self.assertEqual(self.sha, "ce013625030ba8dba906f756967f9e9ca394464a")

    def test_exact_match(self):
        result = b.compare(self.wip, self.ref)
        self.assertEqual(result["modules"][0]["decision"], "SAME_BYTES")
        self.assertEqual(result["source_inventory_counts_by_extension"], {".dart": 1})

    def test_divergent_module_not_merged(self):
        ref = (("lib/src/domain/attendance.dart", "0" * 40),)
        self.assertEqual(b.compare(self.wip, ref)["modules"][0]["decision"], "REVIEW_DIFFERENT")
        self.assertEqual(self.sample.read_text(), "hello\n")

    def test_ambiguous_basenames_are_fail_closed(self):
        other = self.wip / "mobile" / "lib" / "attendance.dart"
        other.parent.mkdir(parents=True)
        other.write_text("different", encoding="utf-8")
        self.assertEqual(b.compare(self.wip, self.ref)["modules"][0]["decision"], "REVIEW_AMBIGUOUS")

    def test_missing_uses_only_basename_signal(self):
        self.assertEqual(b.compare(self.wip, (("lib/src/domain/unknown.dart", "0" * 40),))["modules"][0]["decision"], "NOT_FOUND_BY_BASENAME")

    def test_secret_directories_excluded_from_inventory(self):
        secret = self.wip / ".git" / "attendance.dart"
        secret.parent.mkdir()
        secret.write_text("secret-value", encoding="utf-8")
        report = b.compare(self.wip, self.ref)
        self.assertEqual(len(report["modules"][0]["wip_candidates"]), 1)
        self.assertNotIn("secret-value", json.dumps(report))

    def test_symlink_not_followed(self):
        external = self.parent / "external"
        external.mkdir()
        (external / "attendance.dart").write_text("outside", encoding="utf-8")
        link = self.wip / "linked"
        try:
            link.symlink_to(external, target_is_directory=True)
        except (OSError, NotImplementedError):
            self.skipTest("Symlinks not supported on this OS")
        report = b.compare(self.wip, self.ref)
        self.assertEqual(len(report["modules"][0]["wip_candidates"]), 1)
        self.assertEqual(report["symlinks_skipped"], 1)

    def test_report_outside_tree_required(self):
        self.assertFalse(b.is_outside(self.wip.resolve(), (self.wip / "report").resolve()))
        with contextlib.redirect_stderr(io.StringIO()):
            exit_code = b.main(["--wip", str(self.wip), "--out", str(self.wip / "reports")])
        self.assertEqual(exit_code, 2)
        self.assertFalse((self.wip / "reports").exists())

    def test_smoke_main_writes_only_two_reports(self):
        before = self.sample.read_bytes()
        with patch.object(b, "REFERENCE", self.ref):
            with contextlib.redirect_stdout(io.StringIO()) as printed:
                ret = b.main(["--wip", str(self.wip), "--out", str(self.out)])
        self.assertEqual(ret, 0)
        self.assertIn("SOURCE_CHANGES=NONE", printed.getvalue())
        self.assertEqual(self.sample.read_bytes(), before)
        folders = list(self.out.iterdir())
        self.assertEqual(len(folders), 1)
        self.assertEqual(sorted(p.name for p in folders[0].iterdir()), ["MATRIZ.json", "RESUMEN.md"])
        report = json.loads((folders[0] / "MATRIZ.json").read_text(encoding="utf-8"))
        self.assertEqual(report["modules"][0]["decision"], "SAME_BYTES")

    def test_unreadable_known_file_does_not_look_absent(self):
        real_stat = Path.stat

        def deny_known_file(path, *args, **kwargs):
            if path == self.sample:
                raise PermissionError("permission denied for source")
            return real_stat(path, *args, **kwargs)

        with patch.object(Path, "stat", deny_known_file):
            report = b.compare(self.wip, self.ref)
        self.assertEqual(report["modules"][0]["decision"], "READ_BLOCKED")
        self.assertFalse(report["inventory_complete"])
        self.assertGreater(report["unreadable_entries"], 0)

    def test_unreadable_directory_does_not_look_absent(self):
        def deny_walk(*_args, **kwargs):
            kwargs["onerror"](PermissionError("permission denied for directory"))
            return iter(())

        with patch.object(b.os, "walk", deny_walk):
            report = b.compare(self.wip, self.ref)
        self.assertEqual(report["directory_read_errors"], 1)
        self.assertEqual(report["modules"][0]["decision"], "SCAN_INCOMPLETE")
        self.assertFalse(report["inventory_complete"])

    def test_incomplete_scan_exits_nonzero_but_keeps_report(self):
        def incomplete_inventory(*_args, **_kwargs):
            return ({"attendance.dart": []}, {}, 0, 0, 1)

        with patch.object(b, "inventory", incomplete_inventory):
            with contextlib.redirect_stdout(io.StringIO()) as output:
                code = b.main(["--wip", str(self.wip), "--out", str(self.out)])
        self.assertEqual(code, 3)
        self.assertIn("RESULT=REPORT_PARTIAL_SCAN_INCOMPLETE", output.getvalue())
        result_files = list(self.out.glob("*/*"))
        self.assertEqual(len(result_files), 2)
        matrix = json.loads(next(self.out.glob("*/MATRIZ.json")).read_text(encoding="utf-8"))
        self.assertEqual(matrix["modules"][0]["decision"], "SCAN_INCOMPLETE")

    def test_symlink_named_like_target_is_not_read(self):
        target = self.parent / "outside.dart"
        target.write_text("outside source secret", encoding="utf-8")
        self.sample.unlink()
        try:
            self.sample.symlink_to(target)
        except (OSError, NotImplementedError):
            self.skipTest("Symlinks unsupported")
        report = b.compare(self.wip, self.ref)
        self.assertEqual(report["modules"][0]["decision"], "READ_BLOCKED")
        self.assertFalse(report["inventory_complete"])
        self.assertNotIn("outside source secret", json.dumps(report))

    def test_does_not_copy_sources_into_report(self):
        with patch.object(b, "REFERENCE", self.ref):
            with contextlib.redirect_stdout(io.StringIO()):
                b.main(["--wip", str(self.wip), "--out", str(self.out)])
        reports = list(self.out.glob("*/*"))
        self.assertFalse(any(p.suffix == ".dart" for p in reports))


if __name__ == "__main__":
    unittest.main(verbosity=2)
