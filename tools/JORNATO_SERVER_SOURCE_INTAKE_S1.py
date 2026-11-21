#!/usr/bin/env python3
"""Jornato S1: offline, read-only Laravel source preflight (stdlib only).

No subprocesses, no network, no DB, no environment inspection and no source edits.
Reads only composer.json and composer.lock JSON metadata and selected code files
for bounded SHA-256 digests; never prints raw source, file paths, secrets or PII.

This is an evidence preparation tool, NOT proof of server runtime or deployment.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import sys
import tempfile
from pathlib import Path
from typing import Any

SKIP = frozenset({
    '.git', '.dart_tool', '.idea', '.vscode', '.gradle', '.venv', '.env',
    'vendor', 'node_modules', 'storage', 'bootstrap', 'cache', 'build',
    'dist', 'coverage', 'private', 'secrets', 'logs', 'backups', 'backup',
    'tmp', 'temp', '__pycache__', '.pytest_cache', '.phpunit.cache',
})
MAX_JSON_BYTES = 16 * 1024 * 1024
MAX_SOURCE_BYTES = 4 * 1024 * 1024
MAX_FILES_PER_GROUP = 4000
GROUPS = {
    'routes_php': ('routes', '.php'),
    'migrations_php': ('database/migrations', '.php'),
    'phpunit_tests': ('tests', '.php'),
    'application_php': ('app', '.php'),
}


def forbidden_link(path: Path) -> bool:
    return path.is_symlink() or bool(getattr(path, 'is_junction', lambda: False)())


def sha256_bounded(path: Path, max_bytes: int) -> str | None:
    if forbidden_link(path) or not path.is_file():
        return None
    size = path.stat().st_size
    if size > max_bytes:
        return None
    dig = hashlib.sha256()
    n = 0
    with path.open('rb') as handle:
        while chunk := handle.read(128 * 1024):
            dig.update(chunk)
            n += len(chunk)
            if n > max_bytes:
                return None
    if path.stat().st_size != size:
        return None
    return dig.hexdigest()


def json_metadata(root: Path, filename: str, limit: int) -> tuple[dict[str, Any] | None, str]:
    p = root / filename
    if not p.is_file() or forbidden_link(p):
        return None, 'MISSING_OR_UNSAFE'
    if p.stat().st_size > limit:
        return None, 'OVERSIZED'
    try:
        with p.open('r', encoding='utf-8-sig') as stream:
            x = json.load(stream)
    except (ValueError, UnicodeError, OSError):
        return None, 'UNREADABLE_JSON'
    return (x if isinstance(x, dict) else None), ('OK' if isinstance(x, dict) else 'INVALID_STRUCTURE')


def safe_version(text: Any) -> str:
    if not isinstance(text, str):
        return 'NOT_FOUND'
    # No package metadata / URLs / arbitrary strings escape the output.
    if re.fullmatch(r'[0-9A-Za-z.*|^~<>=!+,_ -]{1,64}', text):
        return text
    return 'UNSAFE_OR_UNRECOGNIZED'


def walk_group(base: Path, extension: str) -> dict[str, Any]:
    found = 0
    hashed = 0
    excluded_large = 0
    skipped_links = 0
    walk_errors = 0
    digest = hashlib.sha256()
    if not base.exists() or forbidden_link(base) or not base.is_dir():
        return {'present': False, 'files': 0, 'hashed': 0, 'too_large_or_changed': 0,
                'skipped_links': 0, 'walk_errors': 0, 'digest': None, 'complete': False}

    def on_walk_error(_error: OSError) -> None:
        nonlocal walk_errors
        walk_errors += 1

    for parent, dirs, names in os.walk(
        base, topdown=True, followlinks=False, onerror=on_walk_error
    ):
        current = Path(parent)
        keep = []
        for d in sorted(dirs):
            child = current / d
            if forbidden_link(child):
                skipped_links += 1
            elif d.casefold() not in SKIP and not d.startswith('.'):
                keep.append(d)
        dirs[:] = keep
        for name in sorted(names):
            child = current / name
            if forbidden_link(child):
                skipped_links += 1
                continue
            if child.suffix.casefold() != extension:
                continue
            found += 1
            if found > MAX_FILES_PER_GROUP:
                return {'present': True, 'files': found, 'hashed': hashed,
                        'too_large_or_changed': excluded_large, 'skipped_links': skipped_links,
                        'walk_errors': walk_errors, 'digest': None, 'complete': False,
                        'reason': 'LIMIT_REACHED'}
            try:
                # Relative names influence digest internally only; never emitted.
                relative = child.relative_to(base).as_posix()
                sh = sha256_bounded(child, MAX_SOURCE_BYTES)
                if sh is None:
                    excluded_large += 1
                    continue
                digest.update(relative.encode('utf-8', errors='replace'))
                digest.update(bytes.fromhex(sh))
                hashed += 1
            except (OSError, ValueError):
                walk_errors += 1

    return {'present': True, 'files': found, 'hashed': hashed,
            'too_large_or_changed': excluded_large, 'skipped_links': skipped_links,
            'walk_errors': walk_errors, 'digest': digest.hexdigest(),
            'complete': walk_errors == 0 and excluded_large == 0 and found <= MAX_FILES_PER_GROUP}


def inspect(root: Path) -> dict[str, Any]:
    root = root.resolve(strict=True)
    if forbidden_link(root) or not root.is_dir():
        raise ValueError('INVALID_ROOT')
    # Accept only an explicit Laravel server root, not a broad WIP scan.
    composer, cs = json_metadata(root, 'composer.json', MAX_JSON_BYTES)
    lock, ls = json_metadata(root, 'composer.lock', MAX_JSON_BYTES)
    req = composer.get('require') if composer else None
    req = req if isinstance(req, dict) else {}
    php_requirement = safe_version(req.get('php'))
    laravel_constraint = safe_version(req.get('laravel/framework'))
    laravel_locked = 'NOT_FOUND'
    sanctum_locked = 'NOT_FOUND'
    if lock is not None:
        packages = lock.get('packages')
        if isinstance(packages, list):
            for package in packages:
                if not isinstance(package, dict):
                    continue
                if package.get('name') == 'laravel/framework':
                    laravel_locked = safe_version(package.get('version'))
                if package.get('name') == 'laravel/sanctum':
                    sanctum_locked = safe_version(package.get('version'))
    groups = {name: walk_group(root / rel, ext) for name, (rel, ext) in GROUPS.items()}
    artisan_present = (root / 'artisan').is_file() and not forbidden_link(root / 'artisan')
    status = ('SOURCE_STRUCTURE_PRESENT' if composer is not None and artisan_present and
              groups['routes_php']['present'] and groups['application_php']['present']
              else 'BLOCKED_SOURCE_STRUCTURE')
    complete = all(v['complete'] for v in groups.values())
    # It is a scoped inventory, not an attestation of all code or secrets.
    return {
        'schema': 'jornato.server.intake.v1',
        'status': status,
        'evidence_scope': 'READ_ONLY_SOURCE_METADATA_NOT_RUNTIME_QA',
        'inventory_complete_within_selected_groups': complete,
        'composer_json_status': cs,
        'composer_lock_status': ls,
        'composer_json_sha256': sha256_bounded(root / 'composer.json', MAX_JSON_BYTES),
        'composer_lock_sha256': sha256_bounded(root / 'composer.lock', MAX_JSON_BYTES),
        'artisan_present': artisan_present,
        'php_requirement': php_requirement,
        'laravel_constraint': laravel_constraint,
        'laravel_locked': laravel_locked,
        'sanctum_locked': sanctum_locked,
        'groups': groups,
        'not_performed': ['PHP_BOOT', 'ARTISAN_ROUTE_LIST', 'MIGRATIONS', 'DATABASE',
                          'HTTP', 'AUTH', 'TENANT', 'DEPLOY', 'SECRET_SCANNING'],
        'no_sensitive_files_read': 'BY_EXPLICIT_INPUT_SCOPE_ONLY',
    }


def self_test() -> None:
    with tempfile.TemporaryDirectory(prefix='jornato_s1_test_') as temp:
        t = Path(temp)
        server = t / 'server'
        server.mkdir()
        (server / 'artisan').write_text('<?php\n', encoding='utf-8')
        (server / 'composer.json').write_text(json.dumps({'require': {'php': '^8.3', 'laravel/framework': '^13.0'}}))
        (server / 'composer.lock').write_text(json.dumps({'packages': [
            {'name': 'laravel/framework', 'version': 'v13.0.1'},
            {'name': 'laravel/sanctum', 'version': 'v4.4.0'}]}))
        for folder, file in [('routes','api.php'), ('database/migrations','create_a.php'),
                             ('tests','ExampleTest.php'), ('app','Service.php')]:
            p = server / folder / file
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text('<?php\n', encoding='utf-8')
        (server / '.env').write_text('SECRET_SHOULD_NEVER_BE_READ\n', encoding='utf-8')
        report = inspect(server)
        assert report['status'] == 'SOURCE_STRUCTURE_PRESENT'
        assert report['laravel_locked'] == 'v13.0.1'
        assert report['groups']['routes_php']['files'] == 1
        assert report['groups']['migrations_php']['files'] == 1
        assert report['groups']['phpunit_tests']['files'] == 1
        assert report['groups']['application_php']['files'] == 1
        assert 'SECRET_SHOULD_NEVER' not in json.dumps(report)
        assert report['inventory_complete_within_selected_groups']
        missing = inspect(t)
        assert missing['status'] == 'BLOCKED_SOURCE_STRUCTURE'
        (server / 'routes' / 'extra.php').symlink_to(server / 'routes' / 'api.php')
        linked = inspect(server)
        assert linked['groups']['routes_php']['skipped_links'] == 1
        assert linked['groups']['routes_php']['files'] == 1
    print('SELF_TEST=PASS checks=11 (synthetic only, no Jornato server inspected)')


def main() -> int:
    args = argparse.ArgumentParser(description=__doc__)
    args.add_argument('--source', type=Path, help='Existing Laravel server root (e.g. D:\codex\Jornato\server)')
    args.add_argument('--out', type=Path, help='JSON report path OUTSIDE source tree')
    args.add_argument('--self-test', action='store_true')
    opt = args.parse_args()
    if opt.self_test:
        self_test()
        return 0
    if not opt.source or not opt.out:
        args.error('--source and --out are required unless --self-test')
    if forbidden_link(opt.source) or not opt.source.is_dir():
        print('RESULT=BLOCKED_SOURCE', file=sys.stderr)
        return 3
    src = opt.source.resolve(strict=True)
    out = opt.out.resolve(strict=False)
    if out == src or src in out.parents or forbidden_link(opt.out):
        print('RESULT=BLOCKED_OUTPUT_LOCATION', file=sys.stderr)
        return 3
    try:
        data = inspect(src)
        out.parent.mkdir(parents=True, exist_ok=True)
        # fail rather than silently overwrite previous evidence
        with out.open('x', encoding='utf-8', newline='\n') as stream:
            json.dump(data, stream, indent=2, sort_keys=True, ensure_ascii=False)
            stream.write('\n')
    except (OSError, ValueError) as err:
        print('RESULT=BLOCKED_IO reason=' + type(err).__name__, file=sys.stderr)
        return 3
    print('RESULT=' + data['status'])
    print('EVIDENCE=SCOPED_SOURCE_METADATA_ONLY')
    return 0 if data['status'] == 'SOURCE_STRUCTURE_PRESENT' else 2


if __name__ == '__main__':
    sys.exit(main())
