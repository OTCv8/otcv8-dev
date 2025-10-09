import sys, re
from pathlib import Path

ROOTS = [
    Path("docs/modules"),
    Path("docs/modules/structured"),
]
BAD_CHUNKS = ["Â", "â", "Ă", "Å", "Ĺ", "Ä"]  # typowe śmieci
POLISH = "ąćęłńóśźżĄĆĘŁŃÓŚŹŻ"

def score(text: str) -> int:
    # + punkty za polskie litery, - punkty za śmieci
    good = sum(text.count(ch) for ch in POLISH)
    bad = sum(text.count(b) for b in BAD_CHUNKS)
    # dodatkowo karzemy długie sekwencje typu krĂłtko, WspĂłł, itp.
    bad += len(re.findall(r"[ĂÂÅĹÄ][\w’‚„”…-]{1,6}", text))
    return good * 10 - bad * 7

def try_fix_one_round(s: str, enc: str) -> str:
    # typowy sposób “odkręcenia”: zinterpretuj obecne znaki jako bajty enc i odczytaj jako utf-8
    try:
        return s.encode(enc, errors="ignore").decode("utf-8", errors="ignore")
    except Exception:
        return s

def best_fix(s: str) -> str:
    cands = [s]
    for enc in ("cp1250", "cp1252", "iso-8859-2"):
        cands.append(try_fix_one_round(s, enc))
        # czasem trzeba 2x (podwójnie popsute pliki)
        cands.append(try_fix_one_round(cands[-1], enc))
    # prosty cleanup najczęstszych artefaktów NBSP i dywizów
    cleaned = []
    for c in cands:
        x = c.replace("Â ", " ") \
             .replace("â€“", "–") \
             .replace("â€”", "—") \
             .replace("â€ś", "“").replace("â€ť", "”") \
             .replace("â€˘", "•").replace("â€˛", "′") \
             .replace("â€ś", "“").replace("â€ť", "”") \
             .replace("â€¦", "…")
        cleaned.append(x)
    # wybór najlepszego wg score
    best = max(cleaned, key=score)
    return best

def process_file(path: Path) -> bool:
    try:
        orig = path.read_text(encoding="utf-8", errors="replace")
    except Exception:
        try:
            orig = path.read_text(encoding="cp1250", errors="replace")
        except Exception:
            return False
    fixed = best_fix(orig)
    if score(fixed) > score(orig) and fixed != orig:
        path.write_text(fixed, encoding="utf-8", errors="ignore")
        return True
    return False

def main():
    changed = 0
    for root in ROOTS:
        if not root.exists():
            continue
        for p in root.rglob("*.md"):
            if process_file(p):
                changed += 1
                print(f"[OK] {p}")
    print(f"\nGotowe. Zmieniono plików: {changed}")

if __name__ == "__main__":
    sys.exit(main())
