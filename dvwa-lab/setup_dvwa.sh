#!/usr/bin/env bash
# =============================================================================
#  DVWA one-shot installer  (Kali / Ubuntu / Debian)
#  Usage:  sudo bash setup_dvwa.sh
#  Idempotent: safe to run again if something fails.
# =============================================================================
set -uo pipefail

GREEN='\033[0;32m'; RED='\033[0;31m'; YEL='\033[1;33m'; NC='\033[0m'
info() { echo -e "${GREEN}[+]${NC} $*"; }
warn() { echo -e "${YEL}[!]${NC} $*"; }
die()  { echo -e "${RED}[-]${NC} $*"; exit 1; }

[ "$(id -u)" -eq 0 ] || die "Run this with sudo:  sudo bash setup_dvwa.sh"

WEBROOT=/var/www/html
DVWA_DIR="$WEBROOT/DVWA"
DB_NAME=dvwa
DB_USER=dvwa
DB_PASS='p@ssw0rd'
CONF="$DVWA_DIR/config/config.inc.php"

export DEBIAN_FRONTEND=noninteractive

# ---------------------------------------------------------------- 1. packages
info "Updating package lists (needs internet)..."
apt-get update -y || warn "apt update had warnings, continuing..."

info "Installing Apache + MariaDB + PHP + git + sqlmap..."
apt-get install -y apache2 mariadb-server \
    php php-mysqli php-gd php-curl php-xml php-mbstring git sqlmap \
    || die "Package installation failed. Check internet / apt sources."

# ---------------------------------------------------------------- 2. services
info "Starting services..."
systemctl enable --now apache2 2>/dev/null || warn "could not enable apache2"
systemctl enable --now mariadb 2>/dev/null || warn "could not enable mariadb"
systemctl restart apache2 2>/dev/null || true

# ---------------------------------------------------------------- 3. DVWA code
info "Fetching DVWA..."
if [ -d "$DVWA_DIR/.git" ]; then
    warn "DVWA already present - updating instead of re-cloning"
    git -C "$DVWA_DIR" pull --ff-only 2>/dev/null || warn "git pull skipped"
else
    rm -rf "$DVWA_DIR"
    git clone --depth 1 https://github.com/digininja/DVWA.git "$DVWA_DIR" \
        || die "git clone failed. Is the VM online?"
fi

# ---------------------------------------------------------------- 4. perms
info "Fixing file ownership/permissions (Apache runs as www-data)..."
chown -R www-data:www-data "$DVWA_DIR"
find "$DVWA_DIR" -type d -exec chmod 755 {} \;
find "$DVWA_DIR" -type f -exec chmod 644 {} \;

# ---------------------------------------------------------------- 5. database
info "Creating database '$DB_NAME' and user '$DB_USER'..."
mysql <<SQL || die "MariaDB setup failed. Is mariadb running?"
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
ALTER USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
FLUSH PRIVILEGES;
SQL

# ---------------------------------------------------------------- 6. config
info "Writing DVWA config..."
cp -f "$DVWA_DIR/config/config.inc.php.dist" "$CONF"
sed -i "s|.*'db_user'.*|\\\$_DVWA[ 'db_user' ]     = '${DB_USER}';|"     "$CONF"
sed -i "s|.*'db_password'.*|\\\$_DVWA[ 'db_password' ] = '${DB_PASS}';|" "$CONF"
sed -i "s|.*'db_database'.*|\\\$_DVWA[ 'db_database' ] = '${DB_NAME}';|" "$CONF"

# verify the three lines really landed
grep -q "db_user' ]     = '${DB_USER}'"     "$CONF" || warn "check db_user line manually"
grep -q "db_database' ] = '${DB_NAME}'"     "$CONF" || warn "check db_database line manually"

# ---------------------------------------------------------------- 7. restart
info "Restarting Apache..."
systemctl restart apache2 || die "Apache restart failed"

# ---------------------------------------------------------------- 8. verify
sleep 2
CODE=$(curl -s -o /dev/null -w '%{http_code}' http://localhost/DVWA/setup.php || echo 000)
IP=$(hostname -I 2>/dev/null | awk '{print $1}')

echo
echo "======================================================================"
echo "  DVWA INSTALLED"
echo "======================================================================"
if [ "$CODE" = "200" ]; then
    info "http://localhost/DVWA/setup.php  ->  HTTP $CODE (OK)"
else
    warn "setup.php returned HTTP $CODE - open it in a browser and check"
fi
[ -n "${IP:-}" ] && info "From your host machine:  http://${IP}/DVWA/setup.php"
echo
echo "  NEXT (in the browser):"
echo "   1) http://localhost/DVWA/setup.php  -> click 'Create / Reset Database'"
echo "   2) http://localhost/DVWA/login.php  -> admin / password"
echo "   3) Left menu -> DVWA Security -> set to 'Low' -> Submit"
echo
echo "  DB user : ${DB_USER} / ${DB_PASS}   (database: ${DB_NAME})"
echo "======================================================================"
echo
