#!/usr/bin/env python3
# scripts/fix_mojibake_docs.py
# Agresywna naprawa „mojibake” w plikach Markdown w katalogu docs/.

from __future__ import annotations
import argparse
import pathlib
import sys
import re
import shutil

POLISH = "ąćęłńóśżźĄĆĘŁŃÓŚŻŹ"
RE_PL = re.compile(f"[{POLISH}]")

# Najczęstsze śmieci gdy UTF-8 został błędnie zdekodowany jako latin1/cp1252/cp1250
HINTS = [
    "ModuĹ", "PrzeglÄ", "Å¼", "Å‚", "Ã³", "Ã„", "Ã…", "Ãł", "Ä™", "Ä‡", "Å›", "Åº", "Å„",
    "Â", "Ë", "Ð", "Ĺ", "Ă", "Ľ", "Ä…", "Ä‡", "Å¼", "Å›"
]

def count_pl(s: str) -> int:
    return len(RE_PL.findall(s))

def crap_score(s: str) -> int:
    # im mniej „śmieci”, tym lepiej (mniejszy wynik)
    return sum(s.count(h) for h in HINTS)

def mk_variants(s: str) -> list[tuple[str, str]]:
    out: list[tuple[str, str]] = []
    def add(label: str, enc: str):
        try:
            out.append( (s.encode(enc, errors="strict").decode("utf-8", errors="strict"), label) )
        except Exception:
            # wersja z ignore – czasem ratuje pojedyncze znaki
            try:
                out.append( (s.encode(enc, errors="ignore").decode("utf-8", errors="ignore"), label+"(ign)") )
            except Exception:
                pass
    # klasyka: tekst = (utf8-bytes) źle zdekodowane jako X → teraz mamy Unicode-śmieci
    for enc in ("latin1", "cp1252", "cp1250"):
        add(f"{enc}->utf8", enc)
    return out

def better(a: str, b: str) -> bool:
    """Zwraca True jeśli b jest lepsze od a."""
    # 1) więcej polskich znaków
    pa, pb = count_pl(a), count_pl(b)
    if pb > pa:
        return True
    if pb < pa:
        return False
    # 2) mniej śmieci
    sa, sb = crap_score(a), crap_score(b)
    if sb < sa:
        return True
    return False

def fix_text(s: str) -> tuple[str, str] | None:
    candidates = mk_variants(s)
    best = s
    best_label = ""
    improved = False
    for cand, label in candidates:
        if better(best, cand):
            best = cand
            best_label = label
            improved = True
    return (best, best_label) if improved else None

def process_file(p: pathlib.Path, dry: bool) -> tuple[bool, str]:
    orig = p.read_text(encoding="utf-8", errors="strict")
    need = (crap_score(orig) > 0) or (count_pl(orig) == 0)  # agresywna heurystyka
    fixed = None
    if need:
        fixed = fix_text(orig)
    else:
        # nawet jeśli heurystyka mówi OK, spróbuj i tak — może da się poprawić subtelnie
        fixed = fix_text(orig)

    if not fixed:
        return (False, "")
    new_text, how = fixed
    if new_text == orig:
        return (False, "")

    if not dry:
        bak = p.with_suffix(p.suffix + ".bak")
        if not bak.exists():
            shutil.copy2(p, bak)
        p.write_text(new_text, encoding="utf-8", newline="\n")
    return (True, how)

def main() -> int:
    ap = argparse.ArgumentParser(description="Napraw zmojibake w docs/*.md (latin1/cp1252/cp1250 → utf8).")
    ap.add_argument("--root", default="docs", help="katalog bazowy z dokumentacją (domyślnie: docs)")
    ap.add_argument("--dry-run", action="store_true", help="tylko raportuj, bez zapisu")
    args = ap.parse_args()

    root = pathlib.Path(args.root)
    if not root.exists():
        print(f"Brak katalogu: {root}", file=sys.stderr)
        return 2

    md_files = sorted(root.rglob("*.md"))
    if not md_files:
        print("Brak plików .md")
        return 0

    changed = []
    for p in md_files:
        try:
            ok, how = process_file(p, args.dry_run)
        except UnicodeDecodeError:
            # Plik nie jest w UTF-8 — spróbuj wczytać jako cp1250 i od razu zapisać jako UTF-8
            try:
                raw = p.read_text(encoding="cp1250", errors="strict")
                if not args.dry_run:
                    bak = p.with_suffix(p.suffix + ".bak")
                    if not bak.exists():
                        shutil.copy2(p, bak)
                    p.write_text(raw, encoding="utf-8", newline="\n")
                changed.append((p, "cp1250->utf8(reload)"))
                continue
            except Exception as e:
                print(f"[WARN] {p}: nie udało się odczytać ({e})", file=sys.stderr)
                continue

        if ok:
            changed.append((p, how))

    if args.dry_run:
        if changed:
            print("Znalazłem kandydatów do poprawy:")
            for p, how in changed:
                print(f" - {p.as_posix()}    [{how}]")
        else:
            print("Nic do poprawy (wg heurystyki).")
    else:
        if changed:
            print("Naprawiono:")
            for p, how in changed:
                print(f" - {p.as_posix()}    [{how}]  (backup: *.bak)")
        else:
            print("Brak zmian.")

    return 0

if __name__ == "__main__":
    raise SystemExit(main())
