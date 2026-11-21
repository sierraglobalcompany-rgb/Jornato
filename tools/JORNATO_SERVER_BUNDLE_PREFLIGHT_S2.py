#!/usr/bin/env python3
"""Jornato S2: read-only ZIP packaging gate for a Laravel server artifact.

No extraction, PHP, Laravel, DB, network, subprocesses, or modifications of source.
The result is ZIP *layout* verification, never runtime, content-secret, or release approval.
Requires Python 3.10+ standard library only. Checks filenames/ZIP metadata only.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import sys
import tempfile
import zipfile
from pathlib import Path

MAX_MEMBERS = 15000
MAX_ARCHIVE_BYTES = 1_000_000_000
MAX_TOTAL_UNPACKED = 1_500_000_000
MAX_MEMBER_UNPACKED = 250_000_000
MAX_COMPRESSION_RATIO = 300
REQUIRED = ('composer.json', 'composer.lock', 'artisan',
            'bootstrap/app.php', 'public/index.php')
SECRET_NAMES = {'.env', '.env.example', '.env.testing', '.env.local', '.htpasswd',
                'id_rsa', 'id_ed25519', 'credentials.json', 'service-account.json',
                'auth.json', 'secrets.json', 'docker-compose.override.yml'}
SECRET_SUFFIXES = ('.pem', '.key', '.pfx', '.p12', '.jks', '.keystore',
                   '.sqlite', '.sqlite3', '.db', '.sql', '.sql.gz', '.dump',
                   '.bak', '.backup', '.log')
DISALLOWED_SEGMENTS = {'.git', '.svn', '.hg', 'backups', 'backup', 'private',
                       'secrets', '__pycache__', '.dart_tool', '.idea'}


def sha256_file(path: Path) -> str:
    d = hashlib.sha256()
    with path.open('rb') as inp:
        for chunk in iter(lambda: inp.read(1024 * 1024), b''):
            d.update(chunk)
    return d.hexdigest()


def name_violations(name: str) -> list[str]:
    problems = []
    if '\\' in name or '\x00' in name or name.startswith(('/', '~')):
        problems.append('UNSAFE_PATH_SYNTAX')
    if ':' in name or re.match(r'^[a-zA-Z]:', name):
        problems.append('UNSAFE_PATH_SYNTAX')
    parts = name.split('/')
    if any(p in ('.', '..') for p in parts) or any(not p for p in parts[:-1]):
        problems.append('TRAVERSAL_OR_EMPTY_SEGMENT')
    for p in parts:
        if not p:
            continue
        norm = p.casefold().rstrip(' .')
        # Windows can strip trailing spaces/dots, causing archive entry collisions.
        if p != p.rstrip(' .'):
            problems.append('AMBIGUOUS_WINDOWS_NAME')
        if norm.startswith('.env') or norm in SECRET_NAMES or norm.endswith(SECRET_SUFFIXES):
            problems.append('SENSITIVE_FILE_NAME')
        if norm in DISALLOWED_SEGMENTS:
            problems.append('SENSITIVE_DIRECTORY')
        if norm.split('.')[0] in {'con', 'prn', 'aux', 'nul', 'com1', 'lpt1'}:
            problems.append('RESERVED_DEVICE_NAME')
    return sorted(set(problems))


def inspect(path: Path) -> dict:
    if not path.is_file() or path.is_symlink():
        return {'status': 'BLOCKED_INPUT', 'reasons': ['NOT_REGULAR_FILE']}
    size = path.stat().st_size
    if size > MAX_ARCHIVE_BYTES:
        return {'status': 'BLOCKED_INPUT', 'reasons': ['ARCHIVE_TOO_LARGE']}
    totals = {'entries': 0, 'files': 0, 'directories': 0, 'total_unpacked_bytes': 0}
    counters: dict[str, int] = {}
    entries: set[str] = set()
    seen: set[str] = set()
    def flag(code: str) -> None:
        counters[code] = counters.get(code, 0) + 1
    try:
        with zipfile.ZipFile(path, 'r') as archive:
            members = archive.infolist()
            totals['entries'] = len(members)
            if len(members) > MAX_MEMBERS:
                flag('TOO_MANY_ENTRIES')
                members = members[:MAX_MEMBERS]
            for info in members:
                is_dir = info.is_dir()
                totals['directories' if is_dir else 'files'] += 1
                name = info.filename
                for violation in name_violations(name):
                    flag(violation)
                casefolded = name.rstrip('/').casefold()
                if casefolded in seen:
                    flag('DUPLICATE_OR_CASE_COLLISION')
                seen.add(casefolded)
                if info.flag_bits & 1:
                    flag('ENCRYPTED_MEMBER')
                if info.create_system == 3 and stat.S_IFMT(info.external_attr >> 16) == stat.S_IFLNK:
                    flag('SYMLINK_MEMBER')
                if not is_dir:
                    totals['total_unpacked_bytes'] += info.file_size
                    if info.file_size > MAX_MEMBER_UNPACKED:
                        flag('OVERSIZED_MEMBER')
                    if info.file_size and info.file_size / max(info.compress_size, 1) > MAX_COMPRESSION_RATIO:
                        flag('EXCESSIVE_COMPRESSION_RATIO')
                    if not name_violations(name):
                        entries.add(name)
            if totals['total_unpacked_bytes'] > MAX_TOTAL_UNPACKED:
                flag('EXCESSIVE_UNCOMPRESSED_TOTAL')
    except (OSError, zipfile.BadZipFile, RuntimeError, EOFError):
        return {'status': 'BLOCKED_INPUT', 'reasons': ['UNREADABLE_ZIP']}
    candidate_roots = set()
    for n in entries:
        if n.endswith('composer.json'):
            prefix = n[:-len('composer.json')]
            if all(prefix + req in entries for req in REQUIRED):
                candidate_roots.add(prefix)
    if not candidate_roots:
        flag('LARAVEL_LAYOUT_INCOMPLETE')
    if len(candidate_roots) > 1:
        flag('MULTIPLE_SERVER_ROOTS')
    # No paths, secrets, member content, or source data in the report.
    reasons = sorted(counters)
    return {
        'schema': 'jornato.server.bundle_preflight.v1',
        'status': 'BUNDLE_LAYOUT_PASS_SCOPED' if not reasons else 'BLOCKED_BUNDLE_LAYOUT',
        'evidence_scope': 'ZIP_METADATA_ONLY_NOT_RUNTIME_OR_SECRET_CONTENT_SCAN',
        'zip_sha256': sha256_file(path),
        'zip_bytes': size,
        'totals': totals,
        'laravel_root_candidates': len(candidate_roots),
        'issues': counters,
        'never_verified': ['FILE_CONTENT_SECRETS', 'PERSONAL_DATA', 'VENDOR_INTEGRITY',
                           'COMPOSER_INSTALL', 'PHP_BOOT', 'MIGRATIONS', 'DATABASE',
                           'HTTP', 'TLS', 'TENANT', 'DEPLOY', 'ROLLBACK'],
        'release_go': False,
    }


def make_fixture(path: Path, *, extra=(), omit=(), symlink=False) -> None:
    with zipfile.ZipFile(path, 'w', zipfile.ZIP_DEFLATED) as z:
        for name in REQUIRED:
            if name not in omit:
                z.writestr('server/' + name, '{}')
        for name in extra:
            z.writestr(name, 'SIMULATED_CONTENT_NO_SECRETS')
        if symlink:
            entry = zipfile.ZipInfo('server/link')
            entry.create_system = 3
            entry.external_attr = (stat.S_IFLNK | 0o777) << 16
            z.writestr(entry, 'outside')


def self_test() -> None:
    with tempfile.TemporaryDirectory(prefix='jornato_s2_') as work:
        root = Path(work)
        tests = [
            ('good', {}, 'BUNDLE_LAYOUT_PASS_SCOPED', None),
            ('missing', {'omit': ('artisan',)}, 'BLOCKED_BUNDLE_LAYOUT', 'LARAVEL_LAYOUT_INCOMPLETE'),
            ('env', {'extra': ('server/.env.production',)}, 'BLOCKED_BUNDLE_LAYOUT', 'SENSITIVE_FILE_NAME'),
            ('backup', {'extra': ('server/backups/db.sql',)}, 'BLOCKED_BUNDLE_LAYOUT', 'SENSITIVE_DIRECTORY'),
            ('traversal', {'extra': ('../steal.txt',)}, 'BLOCKED_BUNDLE_LAYOUT', 'TRAVERSAL_OR_EMPTY_SEGMENT'),
            ('absolute', {'extra': ('/absolute.txt',)}, 'BLOCKED_BUNDLE_LAYOUT', 'UNSAFE_PATH_SYNTAX'),
            ('windows', {'extra': ('C:/windows/test.txt',)}, 'BLOCKED_BUNDLE_LAYOUT', 'UNSAFE_PATH_SYNTAX'),
            ('keys', {'extra': ('server/id_rsa',)}, 'BLOCKED_BUNDLE_LAYOUT', 'SENSITIVE_FILE_NAME'),
            ('sql', {'extra': ('server/data.sql',)}, 'BLOCKED_BUNDLE_LAYOUT', 'SENSITIVE_FILE_NAME'),
            ('symlink', {'symlink': True}, 'BLOCKED_BUNDLE_LAYOUT', 'SYMLINK_MEMBER'),
            ('case', {'extra': ('server/Composer.json',)}, 'BLOCKED_BUNDLE_LAYOUT', 'DUPLICATE_OR_CASE_COLLISION'),
        ]
        count = 0
        for case, opts, expected, reason in tests:
            target = root / (case + '.zip')
            make_fixture(target, **opts)
            r = inspect(target)
            assert r['status'] == expected, (case, r)
            assert not r['release_go']
            if reason:
                assert reason in r['issues'], (case, r['issues'])
            count += 1
        raw = root / 'invalid.zip'
        raw.write_text('not a zip')
        assert inspect(raw)['status'] == 'BLOCKED_INPUT'
        count += 1
        print(f'SELF_TEST=PASS scenarios={count} synthetic_only=yes release_go=NO')


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--bundle', type=Path, help='Laravel release candidate ZIP (read only)')
    p.add_argument('--out', type=Path, help='New JSON output file OUTSIDE bundle')
    p.add_argument('--self-test', action='store_true')
    args = p.parse_args()
    if args.self_test:
        self_test()
        return 0
    if not args.bundle or not args.out:
        p.error('specify --bundle and --out (or --self-test)')
    if args.out.exists():
        print('RESULT=BLOCKED_OUTPUT_EXISTS', file=sys.stderr)
        return 4
    src = args.bundle.resolve(strict=False)
    out = args.out.resolve(strict=False)
    if src == out or src in out.parents or out.is_symlink():
        print('RESULT=BLOCKED_OUTPUT_LOCATION', file=sys.stderr)
        return 4
    try:
        result = inspect(src)
        out.parent.mkdir(parents=True, exist_ok=True)
        with out.open('x', encoding='utf-8') as f:
            json.dump(result, f, indent=2, sort_keys=True)
            f.write('\n')
    except (OSError, ValueError):
        print('RESULT=BLOCKED_IO', file=sys.stderr)
        return 4
    print('RESULT=' + result['status'] + ' release_go=NO')
    return 0 if result['status'] == 'BUNDLE_LAYOUT_PASS_SCOPED' else 3


if __name__ == '__main__':
    raise SystemExit(main())
