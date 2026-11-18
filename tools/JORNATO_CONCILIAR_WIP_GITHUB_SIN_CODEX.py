#!/usr/bin/env python3
"""Compare Jornato's Windows WIP against the five F0 domain modules in PR #3.

Offline, read-only for source files, stdlib only. Results are metadata only.
This is a bridge for human review, NOT an auto-merger or a security scanner.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
from datetime import datetime, timezone
from collections import Counter
import sys
import uuid

REFERENCE_REPO = "sierraglobalcompany-rgb/Jornato"
REFERENCE_PR = 3
REFERENCE_HEAD = "78b32284c207f2d04a4c5b6cb3c21ebb470eb46d"
# SHA-1 is used ONLY to compare against Git's exact blob identities, not
# for cryptographic authentication or any sensitive-file validation.
REFERENCE = (
    ("lib/src/domain/attendance.dart", "c8086e2cb2727c9e6992f01be64525eecab4f38f"),
    ("lib/src/domain/attendance_archive.dart", "714d50e1a2b7dd61b68b2abf10b71a9823533e80"),
    ("lib/src/domain/attendance_csv_report.dart", "93d37dae047e5347b4dd1e01f7908b96887643c3"),
    ("lib/src/domain/attendance_report.dart", "949ce954078b8af99a93af231641bd248ec91ac2"),
    ("lib/src/domain/location_rule.dart", "ce99acddf44cc01fe43c60914ebe19e411e98104"),
)

SKIP_DIRS = frozenset({
    ".git", ".dart_tool", ".gradle", ".idea", ".vs", ".vscode", ".venv",
    "node_modules", "vendor", "storage", "uploads", "private", "secrets",
    "data", "logs", "backups", "backup", "build", "dist", "coverage",
    "tmp", "temp", "__pycache__", "_reportes", "generated", "datadir",
})
# Never inventory individual paths outside the five known module basenames.
FILE_TYPES = frozenset({".dart", ".php", ".kt", ".java", ".sql", ".ts", ".js"})
MAX_MATCH_BYTES = 2 * 1024 * 1024


def git_blob_id(path: Path) -> str:
    """Git blob object identity, read-only and streamed; no git subprocess."""
    size = path.stat().st_size
    if not path.is_file() or path.is_symlink() or size > MAX_MATCH_BYTES:
        raise ValueError("Not a regular, bounded source file")
    h = hashlib.sha1()
    h.update(f"blob {size}\0".encode("ascii"))
    with path.open("rb") as stream:
        while chunk := stream.read(128 * 1024):
            h.update(chunk)
    # Refuse a raced mutation: the size must remain stable while hashing.
    if path.stat().st_size != size:
        raise OSError("File changed while reading")
    return h.hexdigest()


def is_outside(root: Path, target: Path) -> bool:
    """Prevent any report location inside the code tree (including symlinks)."""
    try:
        target.relative_to(root)
        return False
    except ValueError:
        return True


def inventory(root: Path, module_basenames: set[str]) -> tuple[dict[str, list[str]], dict[str, int], int, int, int]:
    """Inventory only source counts plus paths matching the five PR3 names."""
    candidates: dict[str, list[str]] = {n: [] for n in module_basenames}
    counts: Counter[str] = Counter()
    ignored_symlinks = 0
    unreadable = 0
    walk_errors = 0

    def on_walk_error(_error: OSError) -> None:
        nonlocal walk_errors
        walk_errors += 1

    # os.walk silently ignores unreadable directories unless onerror is set.
    # Such a scan MUST NOT report an expected module as confidently absent.
    for directory, subdirs, filenames in os.walk(
        root, topdown=True, followlinks=False, onerror=on_walk_error
    ):
        current = Path(directory)
        keep = []
        for d in subdirs:
            p = current / d
            if p.is_symlink() or (hasattr(p, "is_junction") and p.is_junction()):
                ignored_symlinks += 1
            elif d.casefold() not in SKIP_DIRS:
                keep.append(d)
        subdirs[:] = keep
        for name in filenames:
            p = current / name
            # Remember a known basename BEFORE checking readable metadata.
            # Failure to stat() a match is READ_BLOCKED, not NOT_FOUND.
            if name.casefold() in module_basenames:
                candidates[name.casefold()].append(p.relative_to(root).as_posix())
            try:
                if p.is_symlink() or not p.is_file():
                    ignored_symlinks += 1
                    continue
                ext = p.suffix.casefold()
                if ext not in FILE_TYPES:
                    continue
                if p.stat().st_size > MAX_MATCH_BYTES:
                    continue
                counts[ext] += 1
            except (OSError, PermissionError):
                unreadable += 1
    return candidates, dict(sorted(counts.items())), ignored_symlinks, unreadable, walk_errors


def compare(root: Path, reference: tuple[tuple[str, str], ...] | None = None) -> dict:
    if reference is None:
        reference = REFERENCE
    root = root.resolve(strict=True)
    if not root.is_dir():
        raise ValueError("WIP root must be a directory")
    names = {p.rsplit("/", 1)[-1].casefold() for p, _ in reference}
    found, extensions, symlinks, unreadable, walk_errors = inventory(root, names)
    results = []
    for expected_path, expected_id in reference:
        basename = expected_path.rsplit("/", 1)[-1].casefold()
        files = sorted(found.get(basename, []), key=str.casefold)
        matches = []
        for rel in files:
            full = root / Path(rel)
            try:
                identity = git_blob_id(full)
                matches.append({"relative_path": rel, "git_blob_sha1": identity, "same_bytes": identity == expected_id})
            except (OSError, ValueError, PermissionError):
                matches.append({"relative_path": rel, "git_blob_sha1": None, "same_bytes": None})
                unreadable += 1
        if not matches:
            state = "SCAN_INCOMPLETE" if walk_errors or unreadable else "NOT_FOUND_BY_BASENAME"
        elif len(matches) > 1:
            state = "REVIEW_AMBIGUOUS"
        elif matches[0]["same_bytes"] is None:
            state = "READ_BLOCKED"
        elif matches[0]["same_bytes"]:
            state = "SAME_BYTES"
        else:
            state = "REVIEW_DIFFERENT"
        results.append({"pr3_path": expected_path, "pr3_git_blob_sha1": expected_id,
                        "decision": state, "wip_candidates": matches})
    return {
        "reference": {"repo": REFERENCE_REPO, "pr": REFERENCE_PR, "head": REFERENCE_HEAD},
        "source_inventory_counts_by_extension": extensions,
        "symlinks_skipped": symlinks,
        "unreadable_entries": unreadable,
        "directory_read_errors": walk_errors,
        "inventory_complete": walk_errors == 0 and unreadable == 0,
        "modules": results,
        "global_gate": "REVIEW_ONLY_NO_MERGE_NO_RELEASE",
        "claims": "Exact blob comparison only; not semantic equivalence, QA, source sanitization, or merge approval",
    }


def render_md(outcome: dict) -> str:
    module_rows = [
        "| Módulo F0 de GitHub | Resultado en WIP | Candidatos encontrados |",
        "|---|---|---:|",
    ]
    for mod in outcome["modules"]:
        module_rows.append(f"| `{mod['pr3_path']}` | `{mod['decision']}` | {len(mod['wip_candidates'])} |")
    counts = ", ".join(f"{k}: {v}" for k, v in outcome["source_inventory_counts_by_extension"].items()) or "ningún archivo elegible"
    return "\n".join([
        "# Jornato — conciliación F0 / WIP (lectura solamente)",
        "", f"Referencia remota: `{outcome['reference']['repo']}` PR #{outcome['reference']['pr']}, SHA `{outcome['reference']['head']}`.",
        "", "No se copió, fusionó ni modificó ningún archivo de código. GitHub Actions y Codex no intervienen.",
        "El informe compara **solo cinco nombres de módulos Dart**: no certifica que una función exista o falte en el WIP con otro nombre.",
        "", *module_rows, "", f"Inventario agregado por extensión (sin contenido): {counts}.",
        f"Enlaces simbólicos omitidos: {outcome['symlinks_skipped']}; errores de lectura: {outcome['unreadable_entries']}.",
        f"Directorios inaccesibles: {outcome['directory_read_errors']}; inventario completo: {'SÍ' if outcome['inventory_complete'] else 'NO'}.",
        "", "**Decisión:** `SAME_BYTES` = ya idéntico; `REVIEW_DIFFERENT` = NO copiar sin revisar; ",
        "`REVIEW_AMBIGUOUS` = múltiples ubicaciones; `NOT_FOUND_BY_BASENAME` = buscar equivalencia por comportamiento; ",
        "`READ_BLOCKED` = candidato sin lectura válida; `SCAN_INCOMPLETE` = no puede descartarse el módulo.",
        "", "El JSON complementario aporta **solo rutas/hashes de candidatos**, no código ni datos. Revisar también esas rutas antes de compartir.",
        "Esta herramienta NO detecta secretos ni anonimiza el WIP; no autoriza merge, H9 ni lanzamiento.",
        "", "**QUIÉN SIGUE: CHATGPT DIRECTOR** tras recibir un paquete de fuentes sanitizado y aprobado manualmente.",
        "",
    ])


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Jornato: conciliación local read-only F0/WIP (Python stdlib).")
    parser.add_argument("--wip", type=Path, required=True, help="Carpeta del proyecto avanzado en Windows")
    parser.add_argument("--out", type=Path, required=True, help="Carpeta EXTERNA donde escribir solo informes")
    args = parser.parse_args(argv)
    try:
        root = args.wip.resolve(strict=True)
        target = args.out.expanduser().resolve(strict=False)
        if not root.is_dir():
            raise ValueError("Origen no es carpeta")
        if not is_outside(root, target):
            raise ValueError("Salida debe estar FUERA del WIP")
        report = compare(root)
        # Create only a unique report folder, never overwrite earlier evidence.
        target.mkdir(parents=True, exist_ok=True)
        stem = "JORNATO_WIP_BRIDGE_" + datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ") + "_" + uuid.uuid4().hex[:8]
        result_dir = target / stem
        result_dir.mkdir()
        (result_dir / "RESUMEN.md").write_text(render_md(report), encoding="utf-8")
        (result_dir / "MATRIZ.json").write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        print("RESULT=" + ("REPORT_READY_REVIEW_ONLY" if report["inventory_complete"]
                           else "REPORT_PARTIAL_SCAN_INCOMPLETE"))
        print("SOURCE_CHANGES=NONE")
        print("FILES_EXPORTED=0")
        print("REPORT_DIR=" + str(result_dir))
        for item in report["modules"]:
            print(item["pr3_path"].rsplit("/", 1)[-1] + "=" + item["decision"])
        print("NEXT_OWNER=CHATGPT_DIRECTOR")
        # A partial scan may still be useful but must never exit with success.
        return 0 if report["inventory_complete"] else 3
    except (OSError, ValueError) as exc:
        print("RESULT=BLOCKED; " + str(exc), file=sys.stderr)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
