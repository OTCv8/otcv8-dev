#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from pathlib import Path
import argparse

ROOT = Path(__file__).resolve().parents[1]

def convert_file(p: Path, dry: bool) -> bool:
    data = p.read_bytes()
    # zdejmij BOM jeśli jest
    if data[:3] == b'\xEF\xBB\xBF':
        data = data[3:]
    changed = False
    try:
        text = data.decode("utf-8")
    except UnicodeDecodeError:
        text = data.decode("cp1250", errors="replace")
        changed = True
    # normalizuj EOL do LF
    text_lf = text.replace("\r\n", "\n").replace("\r", "\n")
    if text_lf != text or changed:
        changed = True
    if changed and not dry:
        p.write_text(text_lf, encoding="utf-8", newline="\n")
    return changed

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()

    exts = (".md", ".yml", ".yaml")
    cnt = 0
    for p in ROOT.rglob("*"):
        if p.suffix.lower() in exts and p.is_file():
            if convert_file(p, args.dry_run):
                cnt += 1
                print(("FIXED  -> " if not args.dry_run else "WOULD -> ") + str(p))
    print(f"Done. {'Changed' if not args.dry_run else 'Would change'} files: {cnt}")

if __name__ == "__main__":
    main()
