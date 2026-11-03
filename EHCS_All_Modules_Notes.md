# EH&CS — All 6 Modules
## Short Notes + Viva Questions with Simple Answers

**Subject:** Ethical Hacking and Cyber Security (EH&CS)  
**Teacher:** Vikas Gupta  
**Prepared for:** TE-CSE practical exam revision  
**Style:** short points, simple English, examples, viva-ready answers

---

> **Source note:** All six modules follow the topic list of sir's PPTs uploaded in Google Classroom (EH&CS). A few slides are picture-only, so those points are explained using the standard textbook meaning of the same topic. Nothing is taken from any other subject or class.

**Module map (as per sir's PPTs):**

| Module | Title | Main topics |
|---|---|---|
| **1** | Introduction to Ethical Hacking, Network and Domain | Computer security, hacking phases, keywords, virtualization, network basics, IANA, OSI, ports, DNS, ICANN, gTLD, DNS enumeration |
| **2** | Email Security & Malware Threat Protection | Identity attacks, MAC spoofing, steganography, email security/protocols/spoofing/spamming, malware, password cracking, sniffing |
| **3** | Other Types of Attacks | Phishing, other attacks, deception technology, website security, mobile security |
| **4** | IoT Hacking | Wireless security, social engineering, basics of IoT |
| **5** | Cyber Crime Case Reporting & International Standards | Reporting, cyber law, IT Act, ISO standards, CERT-In, DoT |
| **6** | Future of Cyber Security | API security, mobile app security, web app security |

---

## How to use these notes

1. Read the **key points** first.
2. Learn the **tables** — viva examiners love differences.
3. Practise the **viva Q&A** by covering the answers.
4. Revise the **Last-minute** box before entering the lab.

---

# MODULE 1 — Introduction to Ethical Hacking, Network and Domain

## 1.1 Computer security

**Computer security** = protecting computer systems, networks and data from theft, damage, unauthorized access or disruption.

The main goals are the **CIA Triad**:

| Goal | Simple meaning | Example |
|---|---|---|
| **Confidentiality** | Only authorized people can see the data | Your bank password is not visible to others |
| **Integrity** | Data is not changed by unauthorized people | A student cannot edit exam marks |
| **Availability** | Systems and data work when needed | IRCTC works during Tatkal booking |

> **Memory trick:** **CIA** = **C**onfidentiality, **I**ntegrity, **A**vailability.

**Other security goals:**

- **Authentication** — prove who you are (password, OTP, fingerprint).
- **Authorization** — decide what you are allowed to do.
- **Non-repudiation** — you cannot later deny an action (digital signature).

**What we protect (assets):**

| Asset | Example |
|---|---|
| **Hardware** | Laptop, server, router |
| **Software** | Operating system, applications |
| **Data** | Customer records, marks, bank details |
| **Network** | Wi-Fi, LAN, internet connection |
| **People** | Employees, students, users |

**Security controls:**

| Control | Job | Example |
|---|---|---|
| **Preventive** | Stop the attack | Firewall, strong password |
| **Detective** | Detect the attack | IDS, logs, CCTV |
| **Corrective** | Fix after the attack | Backup restore, patch |

**Common threats:** malware, phishing, password attacks, DoS/DDoS, insider threat, physical theft, misconfiguration.

## 1.2 Ethical hacking and its phases

**Hacking** = gaining unauthorized access to a computer, network or data.

**Ethical hacking** = hacking **with written permission** to find weaknesses and fix them before criminals use them. It is also called **penetration testing**.

| Point | Criminal hacking | Ethical hacking |
|---|---|---|
| Permission | No permission | Written permission |
| Goal | Steal, damage, spy | Find and fix weaknesses |
| Legal status | Illegal | Legal (within scope) |
| Report | Keeps it secret | Reports to the owner |

**Types of hackers:**

| Type | Meaning | Example |
|---|---|---|
| **White hat** | Ethical hacker, works with permission | Company hires a tester |
| **Black hat** | Criminal hacker, personal gain | Steals card data |
| **Grey hat** | No permission, but no bad intention | Finds a bug and reports later |
| **Script kiddie** | Uses ready-made tools without understanding | Runs a YouTube tool |
| **Hacktivist** | Hacks for a social/political message | Defaces a government site |
| **Insider** | Employee or ex-employee | Leaks company data |
| **State-sponsored** | Supported by a government | Cyber espionage |

**Phases of ethical hacking (5 phases):**

| Phase | What happens | Example / tool |
|---|---|---|
| **1. Reconnaissance (footprinting)** | Collect information about the target | Google, WHOIS, LinkedIn |
| **2. Scanning and enumeration** | Find live hosts, open ports, services, users and shares | Nmap, ping, enum4linux |
| **3. Gaining access** | Exploit a weakness and enter the system | Metasploit, password attack |
| **4. Maintaining access** | Create a backdoor to return later | Backdoor, trojan |
| **5. Covering tracks** | Clear logs and hide evidence | Delete logs, change timestamps |

> Some books add a **6th phase: Reporting** — write the findings and fixes for the client. In a viva, say "5 technical phases + reporting".

**Easy example:** A thief watches a house (recon), checks open windows (scanning), finds names of family members (enumeration), enters (gaining access), makes a duplicate key (maintaining access), wipes fingerprints (covering tracks).

> **Important:** Without written permission, the same activity is a crime. The tester must know the **scope**, **time window** and **rules of engagement**.

## 1.3 Common keywords (from sir's slides)

| Keyword | Simple meaning |
|---|---|
| **Vulnerability** | A security weakness in software that puts the system at risk |
| **Security bug / defect** | A software bug that can be exploited to get unauthorized access or privileges |
| **Exploit** | Software, data or a sequence of commands that uses a bug/vulnerability to cause unintended behaviour |
| **Threat** | A possible danger that can exploit a vulnerability and cause harm |
| **GUI** | Graphical User Interface — windows, icons and menus used with a mouse and keyboard |
| **CLI** | Command Line Interface — the user types commands at a prompt and gets a response |
| **System files** | Critical files without which the computer may not work correctly (OS files, drivers) |

**Extra words often asked:**

| Keyword | Meaning |
|---|---|
| **Payload** | The actual harmful action of an exploit (e.g., open a shell) |
| **Zero-day** | A vulnerability with no patch available yet |
| **Backdoor** | A hidden way to enter a system later |
| **Risk** | Chance of loss = threat × vulnerability × impact |

## 1.4 Virtualization

**Virtualization** = creating a **virtual version** of a physical resource — a server, desktop, storage, network or operating system.

- **Host** = the real physical machine.
- **Guest** = the virtual machine (VM) running on the host.
- **Hypervisor** = software that creates and runs VMs.

| Type | Meaning | Examples |
|---|---|---|
| **Type 1 (bare-metal)** | Runs directly on hardware | VMware ESXi, Microsoft Hyper-V, Xen |
| **Type 2 (hosted)** | Runs as an app on an OS | Oracle VirtualBox, VMware Workstation |

**Benefits:**

- Saves cost and hardware.
- Easy to take **snapshots** and roll back.
- Strong **isolation** between VMs.
- Perfect for a **hacking lab** — test malware safely.
- Easy to clone machines for practice.

**Risks:**

- **VM escape** — malware breaks out of the VM to the host.
- **VM sprawl** — too many unmanaged VMs.
- Old snapshots may contain sensitive data.

> **Example:** In Kali Linux practicals, you run Kali as a VM in VirtualBox. If your test breaks Kali, you restore a snapshot — your real laptop is safe.

## 1.5 Network fundamentals

**Computer network** = two or more devices connected to share data and resources.

| Network type | Area covered | Example |
|---|---|---|
| **PAN** | A person's workspace (~10 m) | Bluetooth earphones |
| **LAN** | A room, lab or building | College computer lab |
| **MAN** | A city | Cable TV network |
| **WAN** | Large area / countries | The internet |

**Topologies:** bus, star, ring, mesh, hybrid. **Star** is most common because one cable failure does not stop the whole network.

**Network devices:**

| Device | Work |
|---|---|
| **Hub** | Sends data to all ports (dumb, collision-prone) |
| **Switch** | Sends data only to the correct port using MAC address |
| **Router** | Connects different networks using IP address |
| **Firewall** | Allows or blocks traffic by rules |
| **Access point** | Gives Wi-Fi connectivity |
| **Modem** | Converts signals for internet access |

**Addressing:**

- **IP address** — logical address. IPv4 is 32-bit (e.g., `192.168.1.10`); IPv6 is 128-bit.
- **Private IP ranges:** `10.0.0.0/8`, `172.16.0.0/12`, `192.168.0.0/16`.
- **MAC address** — physical hardware address of the network card (48-bit).
- **Subnet mask** — decides the network and host parts.
- **Default gateway** — the router used to leave the network.
- **DNS** — converts names to IP addresses.
- **DHCP** — gives IP addresses automatically.

**TCP vs UDP:**

| Point | TCP | UDP |
|---|---|---|
| Connection | Connection-oriented (3-way handshake) | Connectionless |
| Reliability | Reliable, retransmits lost packets | No guarantee |
| Speed | Slower | Faster |
| Use | HTTP, HTTPS, FTP, SSH, email | DNS, DHCP, VoIP, video streaming |

## 1.6 IANA

**IANA = Internet Assigned Numbers Authority.**

It is the organization that **manages unique Internet identifiers**:

1. **IP address allocation** — gives address blocks to Regional Internet Registries (RIRs).
2. **DNS root zone** — manages the root zone of the DNS.
3. **Protocol parameters** — port numbers, protocol numbers, MIME types.

**Port ranges managed by IANA:**

| Range | Name | Meaning |
|---|---|---|
| **0–1023** | Well-known ports | Fixed services (HTTP 80, DNS 53) |
| **1024–49151** | Registered ports | Registered by companies for their products |
| **49152–65535** | Dynamic / private ports | Free for temporary use |

> IANA functions are performed under **ICANN**. In simple words: **ICANN makes policy, IANA implements it.**

## 1.7 OSI model

**OSI (Open Systems Interconnection)** is a **7-layer reference model** that explains how data moves from one computer to another.

| Layer | Name | Main work | Example protocols | Device |
|---|---|---|---|---|
| **7** | Application | Services for the user | HTTP, FTP, SMTP, DNS | — |
| **6** | Presentation | Format, encrypt, compress data | SSL/TLS, JPEG, ASCII | — |
| **5** | Session | Start, manage and end sessions | RPC, NetBIOS | — |
| **4** | Transport | End-to-end delivery, ports, error control | TCP, UDP | — |
| **3** | Network | Logical addressing and routing | IP, ICMP, ARP | Router |
| **2** | Data Link | Framing, MAC addressing, error detection | Ethernet, Wi-Fi, PPP | Switch |
| **1** | Physical | Sends raw bits over the medium | Cable, radio, fibre | Hub, cable |

> **Mnemonic (Layer 7 → 1):** **P**lease **D**o **N**ot **T**hrow **S**ausage **P**izza **A**way.  
> **P**hysical, **D**ata link, **N**etwork, **T**ransport, **S**ession, **P**resentation, **A**pplication.

**TCP/IP model (4 layers):** Application → Transport → Internet → Network Access.

**Easy example (opening a website):**

1. Application — browser creates an HTTP request.
2. Presentation — HTTPS encrypts it.
3. Session — a session is maintained.
4. Transport — TCP breaks it into segments with port 443.
5. Network — IP adds source and destination IP.
6. Data Link — Ethernet adds MAC addresses.
7. Physical — bits travel as signals.

At the receiver, the same steps happen in reverse.

## 1.8 Ports and port scanning

**Port** = a logical endpoint (a "door") used by a service on a computer. A port number, together with an IP address, identifies a service.

- Port numbers: **0 to 65535**.
- **Well-known:** 0–1023.
- **Registered:** 1024–49151.
- **Dynamic/private:** 49152–65535.

**Port states:**

| State | Meaning |
|---|---|
| **Open** | Host replies — a service is listening (possible entry point) |
| **Closed** | Host replies but no service is listening |
| **Filtered** | No reply — maybe a firewall dropped the packet |

**Common ports:**

| Port | Service | Port | Service |
|---|---|---|---|
| 20/21 | FTP | 110 | POP3 |
| 22 | SSH | 143 | IMAP |
| 23 | Telnet | 161 | SNMP |
| 25 | SMTP | 389 | LDAP |
| 53 | DNS | 443 | HTTPS |
| 67/68 | DHCP | 445 | SMB |
| 80 | HTTP | 3389 | RDP |

**Port scanning vs port sweeping:**

- **Port scanning** — checks **many ports on one system**.
- **Port sweeping** — checks **one port across many systems**.

**Common port scanning techniques:**

| Technique | How it works | Key point |
|---|---|---|
| **Ping scan** | Sends ICMP requests | Finds live hosts, not ports |
| **SYN scan (half-open)** | Sends SYN, gets SYN-ACK, then sends RST | Fast, stealthy, not fully logged |
| **Vanilla scan (full-connect)** | Completes the full TCP handshake on all ports | Accurate but easily logged |
| **XMAS scan** | Sends packets with FIN, SYN, ACK, etc. | No reply = open; RST = closed; stealthy |
| **UDP scan** | Sends UDP packets | Slow, finds DNS/DHCP/SNMP |
| **Stealth scan** | Avoids full connection and logs | Harder to detect |
| **FTP bounce** | Uses an FTP server to hide the source | Old technique |

**What a port scan can reveal:** running services, service owners, whether anonymous login is allowed, which services need authentication, and whether a firewall is present.

**Tools:** **Nmap**, Zenmap, Netcat, Angry IP Scanner, Advanced Port Scanner, MASSCAN.

**Why port scanning matters:** it is part of the **pre-attack phase**. Attackers use it to find open doors; ethical hackers use it to close them.

**Prevention of port scan attacks:**

- Use a strong, up-to-date **firewall**.
- Apply **TCP wrappers** (allow/deny by IP or domain).
- Close unused ports and stop unused services.
- Run **regular port scans and penetration tests**.
- Monitor logs for repeated connection attempts.

## 1.9 Domain name and DNS

**DNS = Domain Name System.** It is an **application-layer** protocol and a **distributed directory service** that converts a human-readable domain name into an IP address.

> **Example:** You type `www.google.com`; DNS returns something like `142.250.183.36`, and your browser connects to that IP.
>
> **Why names?** Names are easier to remember than numbers. If the IP changes, the name can stay the same.

**Domain name structure:** `www.example.com.`

- `.` — root
- `.com` — top-level domain (TLD)
- `example` — second-level domain
- `www` — subdomain / host

**Types of domains:**

| Type | Meaning | Example |
|---|---|---|
| **Generic domain** | 3-letter label showing organization type | `.com`, `.org`, `.net`, `.edu` |
| **Country domain** | 2-letter country code | `.in`, `.us`, `.uk` |
| **Inverse domain** | Maps an IP address back to a name | Reverse DNS (PTR) |

**Important DNS records:**

| Record | Meaning |
|---|---|
| **A** | Name → IPv4 address |
| **AAAA** | Name → IPv6 address |
| **CNAME** | Alias of another name |
| **MX** | Mail server for the domain |
| **NS** | Name server for the domain |
| **TXT** | Text record (SPF, DKIM, verification) |
| **SOA** | Start of authority — zone information |
| **PTR** | IP → name (reverse lookup) |

**Forward vs reverse lookup:**

- **Forward DNS lookup** — name → IP.
- **Reverse DNS lookup** — IP → name.

**Working of DNS (simple steps):**

1. You type a name in the browser.
2. The computer asks the **DNS resolver** (usually the ISP's).
3. The resolver checks its **cache**. If not found, it asks a **root server**.
4. The root server points to the **TLD server** (e.g., `.com`).
5. The TLD server points to the domain's **authoritative name server**.
6. The authoritative server returns the **IP address**.
7. The resolver caches the answer and the browser connects to the website.

**DNS spoofing vs DNS poisoning:**

| Point | DNS spoofing | DNS poisoning |
|---|---|---|
| Meaning | Giving a **wrong DNS response** to a request | Inserting **false entries into a DNS server/cache** |
| Scope | Usually one request/one victim | Affects many users through the poisoned server |
| Result | User is redirected to a fake site | Fake IP is stored and served to everyone |

**How DNS spoofing works:**

1. The user requests a real website.
2. The attacker sends a fake DNS reply (or has already changed the DNS server).
3. The fake reply points to the attacker's IP.
4. The user lands on a fake website that looks real.

**Prevention of DNS spoofing/poisoning:**

- **DNSSEC** — digitally signs DNS data so the browser can verify it.
- **Source authentication** using IPsec or TLS.
- **Response Rate Limiting (RRL)** — limits how fast a server answers.
- **DNS filtering** — block known malicious domains (blacklist/whitelist).
- **DNS monitoring** — watch for unusual traffic (packet capture, logs).
- **Regular updates and patches** for DNS software.
- Use trusted DNS resolvers and encrypt DNS (DoH/DoT).

## 1.10 DNS enumeration

**DNS enumeration** = collecting DNS information about a target — subdomains, mail servers, name servers, IP addresses and other records.

**Information we can find:**

- Subdomains and hostnames.
- Mail servers (MX records).
- Name servers (NS records).
- IP addresses (A/AAAA).
- SPF and other TXT records.
- Zone information (SOA).
- Sometimes the internal network structure.

**Techniques:**

| Technique | Meaning | Example |
|---|---|---|
| **Zone transfer (AXFR)** | Copy the whole DNS zone from a misconfigured server | `dig axfr @ns1.example.com example.com` |
| **Brute force** | Try common subdomain names from a wordlist | `admin`, `mail`, `dev`, `test` |
| **Reverse DNS** | Find names for a range of IPs | `nslookup 192.168.1.10` |
| **Cache snooping** | Check what names the resolver has cached | `dig +norecurse @dns example.com` |
| **Search engines** | Find indexed subdomains | `site:example.com` |
| **Certificate transparency** | Find subdomains from SSL certificates | crt.sh |

**Tools:** `nslookup`, `dig`, `host`, `dnsenum`, `dnsrecon`, `fierce`, DNSdumpster, Sublist3r.

**Zone transfer example:**

```
dig axfr @ns1.example.com example.com
```

If the server allows it, the whole zone is printed — a serious misconfiguration.

**Prevention:**

- Allow zone transfers only to **authorized secondary servers**.
- Use **TSIG** (transaction signatures) for zone transfers.
- Hide version information.
- Use split-horizon DNS (separate internal and external views).
- Monitor DNS queries for brute-force patterns.

## 1.11 ICANN

**ICANN = Internet Corporation for Assigned Names and Numbers.**

- It is a **multistakeholder, private, global, not-for-profit** organization.
- It manages Internet resources **for the public benefit**.
- It coordinates the **top level of the Internet's unique identifier system**:
  - domain names (DNS root),
  - IP addresses,
  - protocol parameters.
- It makes policy through **bottom-up, consensus-based** processes.
- The policies are implemented through the **IANA functions**.
- Formed in **1998**; headquarters in Los Angeles, USA.

> **Simple line for viva:** "ICANN is the global body that coordinates domain names and IP addressing, and it runs the IANA functions."

## 1.12 Lifecycle of a gTLD

**gTLD = generic Top-Level Domain**, e.g., `.com`, `.org`, `.net`, `.bank`, `.shop`.

The term "gTLD lifecycle" is used in two ways. Learn both — the examiner may mean either.

### (a) New gTLD application lifecycle (ICANN process)

| Stage | What happens |
|---|---|
| **1. Application** | A company applies for a new gTLD and pays the fee |
| **2. Evaluation** | ICANN checks the applicant, string similarity, DNS stability and financial strength |
| **3. Dispute resolution** | Objections and competing applications are resolved (sometimes by auction) |
| **4. Pre-delegation testing** | The registry must pass technical tests |
| **5. Delegation** | The TLD is added to the DNS root zone and goes live |
| **6. Operation and renewal** | The registry runs the TLD and renews its agreement |
| **7. Termination** | If the registry fails, the TLD is retired or transferred |

### (b) Domain name registration lifecycle

| Stage | Meaning |
|---|---|
| **Available** | The name is free |
| **Registered** | Someone owns it for a fixed period |
| **Renewal** | Owner renews before expiry |
| **Grace period** | Short time after expiry to renew |
| **Redemption period** | Last chance to restore, with extra fee |
| **Pending delete** | Name is deleted and returns to the available pool |

> **Easy line:** "A gTLD is born through application → evaluation → delegation, lives through operation and renewal, and ends by termination or deletion."

## 1.13 Viva questions — Module 1

**Q1. What is computer security?**  
A: Protecting computer systems, networks and data from theft, damage, unauthorized access or disruption.

**Q2. Explain the CIA triad with examples.**  
A: Confidentiality = only authorized people see data (bank password); Integrity = data is not changed (exam marks); Availability = systems work when needed (IRCTC during Tatkal).

**Q3. What is ethical hacking?**  
A: Authorized hacking done with written permission to find and fix security weaknesses before attackers use them.

**Q4. Difference between a white-hat and a black-hat hacker?**  
A: A white hat works with permission and reports weaknesses. A black hat works without permission for personal gain or damage.

**Q5. What are the phases of ethical hacking?**  
A: Reconnaissance, scanning and enumeration, gaining access, maintaining access and covering tracks (plus reporting).

**Q6. What is the difference between a vulnerability, a threat and an exploit?**  
A: A vulnerability is a weakness; a threat is a person or thing that can cause harm; an exploit is the technique or code that uses the weakness.

**Q7. What is a security bug?**  
A: A software bug that can be exploited to gain unauthorized access or privileges.

**Q8. What is virtualization?**  
A: Creating a virtual version of a physical resource such as a server, OS, storage or network. Examples: VirtualBox, VMware.

**Q9. Difference between Type 1 and Type 2 hypervisors?**  
A: Type 1 runs directly on hardware (ESXi, Hyper-V). Type 2 runs as an application on an operating system (VirtualBox, VMware Workstation).

**Q10. Explain the OSI model in one line.**  
A: A 7-layer reference model that describes how data moves from an application on one computer to an application on another.

**Q11. Which OSI layer uses IP addresses and which uses MAC addresses?**  
A: Network layer (Layer 3) uses IP addresses; Data Link layer (Layer 2) uses MAC addresses.

**Q12. What is a port? What is the range?**  
A: A logical endpoint used by a service. Port numbers range from 0 to 65535. Well-known ports are 0–1023.

**Q13. Difference between port scanning and port sweeping?**  
A: Port scanning checks many ports on one system; port sweeping checks one port across many systems.

**Q14. Difference between SYN scan and full-connect scan?**  
A: SYN scan is half-open — it sends SYN, receives SYN-ACK and sends RST, so it is fast and stealthy. Full-connect completes the 3-way handshake, so it is accurate but easily logged.

**Q15. What is DNS?**  
A: Domain Name System — an application-layer service that converts domain names into IP addresses.

**Q16. Difference between forward and reverse DNS lookup?**  
A: Forward = name to IP. Reverse = IP to name.

**Q17. What is DNS spoofing?**  
A: Sending a fake DNS response so the user is redirected to an attacker's website.

**Q18. Difference between DNS spoofing and DNS poisoning?**  
A: Spoofing gives a wrong reply to a request; poisoning stores false entries in a DNS server or cache, affecting many users.

**Q19. What is DNSSEC?**  
A: DNS Security Extensions — it digitally signs DNS data so the receiver can verify that the answer is genuine.

**Q20. What is DNS enumeration?**  
A: Collecting DNS information such as subdomains, MX, NS and TXT records about a target.

**Q21. What is a DNS zone transfer?**  
A: Copying all records of a DNS zone from a misconfigured server using AXFR, which reveals subdomains and IPs.

**Q22. What is ICANN?**  
A: A global, not-for-profit, multistakeholder organization that coordinates domain names, IP addresses and protocol parameters, and implements policy through IANA functions.

**Q23. What is a gTLD? Give examples.**  
A: Generic Top-Level Domain, such as `.com`, `.org`, `.net`, `.shop`.

**Q24. What is IANA?**  
A: Internet Assigned Numbers Authority — it manages IP address allocation, the DNS root zone and protocol parameters such as port numbers.

**Last-minute:** CIA triad → 5 hacking phases → vulnerability/threat/exploit → Type 1 vs Type 2 hypervisor → OSI layers → port ranges → SYN vs full-connect → DNS records → DNS spoofing vs poisoning → DNSSEC → ICANN/IANA → gTLD lifecycle.

---

# MODULE 2 — Email Security & Malware Threat Protection

## 2.1 Identity attacks

**Identity attack** = an attack that steals or misuses a person's identity or credentials (username, password, OTP, MAC address, email address) to act as that person.

| Attack | Simple meaning | Example |
|---|---|---|
| **Phishing** | Fake message to steal credentials | Fake bank login page |
| **Credential stuffing** | Use leaked username/password pairs on other sites | Reusing a leaked password |
| **Password spraying** | Try one common password on many accounts | `Password@123` on all accounts |
| **Brute force** | Try many passwords | Trying every combination |
| **Session hijacking** | Steal a logged-in session ID | Copying a cookie |
| **MAC spoofing** | Change the hardware address | Bypass MAC filtering |
| **IP spoofing** | Fake the source IP address | Hide the attacker's origin |
| **Email spoofing** | Fake the sender address | Email that looks like it came from the boss |
| **SIM swapping** | Get the victim's number on a new SIM | Intercept OTPs |
| **Identity theft** | Use someone's personal data for fraud | Open a bank account with stolen ID |

**Prevention:** MFA, strong unique passwords, monitor accounts, least privilege, verify requests, protect personal data, use security alerts.

## 2.2 MAC address and MAC spoofing

**MAC address (Media Access Control)** = the **48-bit physical address** burned into a network card.

- Written as 12 hexadecimal digits: `00:1A:2B:3C:4D:5E`.
- First 3 bytes = **OUI** (manufacturer ID); last 3 bytes = device ID.
- Works at the **Data Link layer (Layer 2)**.

**MAC spoofing** = changing a device's MAC address to another value.

**Why attackers do it:**

- Bypass **MAC filtering** on a Wi-Fi router.
- Impersonate another device on the network.
- Avoid detection or blame another device.
- Bypass port security (in some weak setups).

**How to change MAC in Kali Linux (`macchanger`):**

| Step | Command | Purpose |
|---|---|---|
| 1 | `macchanger -h` | Show help |
| 2 | `macchanger -s eth0` | Show current and permanent MAC |
| 3 | `ifconfig` | Check the interface name (e.g., `eth0`) |
| 4 | `macchanger -r eth0` | Set a random MAC |
| 5 | `macchanger -s eth0` | Verify the change |
| 6 | `macchanger -m 00:11:22:33:44:55 eth0` | Set a MAC of your choice |
| 7 | `macchanger -p eth0` | Reset to the permanent MAC |

> On Windows, you can change it from Device Manager → network adapter → Advanced → **Network Address**, or use a tool such as Technitium MAC Address Changer.

**Prevention:**

- **Port security** on switches (limit MAC addresses per port).
- **802.1X** authentication (certificate or login, not just MAC).
- **Dynamic ARP Inspection (DAI)** to stop ARP spoofing.
- Monitor for MAC address changes and duplicate MACs.
- Use **NAC** (Network Access Control).
- Remember: MAC filtering alone is weak — MAC addresses can be spoofed.

## 2.3 Steganography

**Steganography** = hiding **secret data inside another file** so that nobody even knows the data exists.

> **Cryptography vs steganography:** Cryptography hides the **meaning** of the message. Steganography hides the **existence** of the message.

**Common carriers (cover files):**

| Type | How data is hidden | Example |
|---|---|---|
| **Image** | Least Significant Bit (LSB) of pixels | Secret text inside a `.jpg`/`.png` |
| **Audio** | Slight changes in sound samples | Message inside a `.wav`/`.mp3` |
| **Video** | Frames or metadata | Data inside an `.mp4` |
| **Text** | Null cipher, whitespace, first letters | First letter of each line forms a word |
| **Network** | Covert channels in unused header fields | Data hidden in packet headers |

**LSB example (simple):**

- A pixel value is `10110101`.
- Change the last bit to hide one bit of the message.
- The colour change is too small for the human eye to notice.

**Tools:** Steghide, OpenStego, OutGuess, SilentEye, SNOW, StegHide.

**Attacker uses:**

- Hide malware or a payload inside an image.
- Steal data out of a company without raising alarms.
- Hide instructions or maps in innocent-looking files.

**Detection (steganalysis):**

- Compare file size and hashes with the original.
- Look for unusual file sizes or metadata.
- Use steganalysis tools and statistical analysis.
- Re-save or convert the file to destroy hidden data.

**Prevention:** block unknown file types at the gateway, scan attachments, use DLP, restrict uploads, train users.

## 2.4 Email security

**Email security** = protecting email accounts, messages and attachments from unauthorized access, spoofing, phishing, malware and data theft.

**Main threats:**

| Threat | Meaning |
|---|---|
| **Email spoofing** | Fake sender address |
| **Phishing** | Fake email that steals credentials or pushes malware |
| **Spam** | Unwanted bulk email |
| **Malware attachments** | Virus/trojan/ransomware in an attachment |
| **Business Email Compromise (BEC)** | Fake boss/vendor email asking for money |
| **Eavesdropping** | Reading email in transit |
| **Account takeover** | Attacker logs into the mailbox |

**Email security measures:**

- **SPF** — lists servers allowed to send mail for your domain.
- **DKIM** — adds a digital signature to prove the message was not changed.
- **DMARC** — tells the receiver what to do if SPF/DKIM fail (none, quarantine, reject).
- **TLS** — encrypts email between servers.
- **S/MIME or PGP** — end-to-end encryption and digital signatures.
- **2FA/MFA** on the email account.
- Spam filters, antivirus and attachment sandboxing.
- User awareness: check the sender, links and attachments.

## 2.5 Email protocols

| Protocol | Full form | Job | Ports |
|---|---|---|---|
| **SMTP** | Simple Mail Transfer Protocol | **Sends** email from client to server and between servers | 25 (server), 587 (submission), 465 (SMTPS) |
| **POP3** | Post Office Protocol v3 | **Downloads** mail to one device (usually deletes from server) | 110, 995 (secure) |
| **IMAP** | Internet Message Access Protocol | **Syncs** mail across many devices, keeps it on the server | 143, 993 (secure) |
| **HTTP/HTTPS** | Webmail | Browser-based mail (Gmail, Outlook.com) | 80/443 |

**Easy difference:**

- **SMTP = sending** (post office counter).
- **POP3 = download and take away** (collect the letter).
- **IMAP = read from the shelf** (letter stays in the post office, synced on all devices).

## 2.6 Email spoofing

**Email spoofing** = sending an email with a **fake sender address** so it looks like it came from a person or company the victim trusts.

**Why it is possible:**

- Email protocols (SMTP) **do not authenticate the sender** by themselves.
- The sender address is set by the client or API and is not checked by the outgoing server.
- Attackers can forge the **email headers** so the mail app shows a fake "From" name.
- Many users never check the full header.

**Parts of an email:**

1. **Sender address** (From)
2. **Recipient address** (To)
3. **Body**
4. **Reply-To** — where a reply goes; attackers set it to a different address.

**How email spoofing works:**

1. Attacker chooses a trusted name (colleague, bank, vendor).
2. Sends a message through a script or email API with a forged From address.
3. The outgoing SMTP server routes it without checking the sender.
4. The victim's server delivers it; the mail app shows the fake sender.
5. Victim clicks a link, opens an attachment or sends data/money.

> The **headers** record every server hop and can reveal the real route, but most users do not check them.

**Signs of a spoofed email:**

- From address and Reply-To do not match.
- Display name is known but the actual address is different.
- Urgent or threatening language.
- Link text and real URL differ.
- Unexpected attachment or request for money/password.
- SPF/DKIM/DMARC fail in the header.

**Prevention:**

- **SPF, DKIM and DMARC** on your domain.
- Email gateway with spoofing detection.
- Show a warning for external senders.
- **2FA** on email accounts.
- Train users to check headers and verify unusual requests by phone.
- Use digital signatures (S/MIME).

## 2.7 Email spamming

**Spam** = unsolicited bulk email sent to many people, usually for advertising, scams or malware.

**Types:**

| Type | Meaning |
|---|---|
| **Advertisement spam** | Unwanted product offers |
| **Phishing spam** | Fake login or payment requests |
| **Malware spam** | Infected attachments or links |
| **419 / advance-fee scam** | "You won a lottery, pay a fee" |
| **Chain letters / hoaxes** | Forward this to 10 friends |
| **Pharming spam** | Redirect to a fake website |

**How spammers get addresses:** website scraping, data breaches, mailing lists, dictionary guessing (`abc1@`, `abc2@`), social media.

**Why spam is harmful:** wastes time and bandwidth, spreads malware, steals data, damages brand trust, fills mailboxes.

**Prevention:**

- Spam filters (content-based, Bayesian, blacklists/RBL).
- **SPF, DKIM, DMARC**.
- Greylisting and rate limiting.
- Never publish your email in plain text; use a disposable address for sign-ups.
- Do not click unsubscribe on suspicious mail.
- Report spam and train users.

## 2.8 Malware

**Malware = malicious software** — any program written to harm, steal from or gain unauthorized access to a system.

| Type | Simple meaning | Example |
|---|---|---|
| **Virus** | Attaches to a file and spreads when the file runs | Infected `.exe` |
| **Worm** | Self-replicates over the network without user action | WannaCry spread as a worm |
| **Trojan** | Looks useful but is harmful | Fake "free antivirus" |
| **Ransomware** | Encrypts files and demands money | LockBit, WannaCry |
| **Spyware** | Secretly watches the user | Tracks browsing, steals data |
| **Adware** | Shows unwanted ads | Pop-up ads |
| **Rootkit** | Hides malware and gives hidden privileged access | Kernel rootkit |
| **Keylogger** | Records keystrokes | Steals passwords |
| **Botnet** | Network of infected devices controlled remotely | Mirai |
| **Logic bomb** | Triggers when a condition is met | Deletes files on a date |
| **Fileless malware** | Runs in memory, no file on disk | PowerShell attack |

**Common symptoms:** slow system, unusual network traffic, files encrypted, unknown processes, browser changes, disabled antivirus.

**Prevention:** antivirus/EDR, patch software, do not open unknown attachments, least privilege, backups, email filtering, user awareness.

## 2.9 Password cracking and prevention

**Password cracking** = recovering a password from a system or from stored password hashes.

**How passwords should be stored:** as a **hash** (one-way) with a **salt** (random value). Hashing is not encryption — you cannot "decrypt" a hash, you can only guess and compare.

| Attack | How it works | Example |
|---|---|---|
| **Brute force** | Try every possible combination | `aaaa`, `aaab`, ... |
| **Dictionary attack** | Try common words from a list | `rockyou.txt` |
| **Hybrid attack** | Dictionary words + numbers/symbols | `password123` |
| **Rainbow table** | Precomputed hash table for fast lookup | Common hash databases |
| **Credential stuffing** | Reuse leaked username/password pairs | Leaked password on another site |
| **Password spraying** | One common password on many accounts | `Welcome@123` |
| **Shoulder surfing** | Watch the user type | Reading a PIN at an ATM |
| **Phishing** | Trick the user into giving the password | Fake login page |
| **Sniffing** | Capture passwords on the network | Wireshark on HTTP |
| **Keylogging** | Record keystrokes | Hardware/software keylogger |

**Tools:** John the Ripper, Hashcat, Hydra, Medusa, Burp Suite Intruder.

**Prevention:**

- Long passwords or **passphrases** (12+ characters).
- **MFA** everywhere possible.
- Account lockout and rate limiting.
- **Salt + strong hashing** (bcrypt, Argon2, PBKDF2).
- Never reuse passwords; use a password manager.
- Do not share passwords; check for breaches.
- Use HTTPS/SSH instead of HTTP/Telnet.
- Monitor failed login attempts.

## 2.10 Sniffing

**Sniffing** = capturing network packets and reading their contents.

| Type | Meaning |
|---|---|
| **Passive sniffing** | Only listens to traffic (e.g., on a hub or open Wi-Fi) |
| **Active sniffing** | Injects packets to force traffic through the attacker (e.g., ARP spoofing, MAC flooding) |

**How it works:** the network card is put in **promiscuous mode** so it accepts all packets, not only packets addressed to it.

**Common active sniffing attacks:**

| Attack | Meaning |
|---|---|
| **ARP spoofing** | Send fake ARP replies so traffic goes through the attacker |
| **MAC flooding** | Fill the switch's MAC table so it behaves like a hub |
| **DNS spoofing** | Redirect the victim to a fake site |
| **DHCP starvation** | Exhaust the DHCP pool, then run a fake DHCP server |
| **SSL stripping** | Downgrade HTTPS to HTTP |

**What attackers look for:** passwords, session cookies, emails, credit card data, chat messages.

**Vulnerable protocols (plain text):** HTTP, FTP, Telnet, POP3, IMAP, SMTP, SNMP.

**Tools:** Wireshark, tcpdump, tshark, Ettercap, Bettercap, Cain & Abel.

**Prevention:**

- Use **HTTPS/TLS**, SSH and VPN.
- Use **WPA2/WPA3** on Wi-Fi (not WEP).
- **Static ARP** entries and **Dynamic ARP Inspection**.
- Switch **port security** to stop MAC flooding.
- Segment networks and monitor for ARP anomalies.
- Avoid public Wi-Fi for sensitive work.

## 2.11 Viva questions — Module 2

**Q1. What is an identity attack?**  
A: An attack that steals or misuses a person's identity or credentials to act as that person.

**Q2. What is a MAC address?**  
A: A 48-bit physical address burned into a network card, written as 12 hexadecimal digits.

**Q3. What is MAC spoofing?**  
A: Changing a device's MAC address to impersonate another device or bypass MAC filtering.

**Q4. Which tool changes the MAC address in Kali Linux?**  
A: `macchanger`. Example: `macchanger -r eth0` sets a random MAC.

**Q5. How can MAC spoofing be prevented?**  
A: Port security, 802.1X, Dynamic ARP Inspection, NAC and monitoring for duplicate or changing MACs.

**Q6. What is steganography?**  
A: Hiding secret data inside another file (image, audio, video, text) so nobody knows it exists.

**Q7. Difference between cryptography and steganography?**  
A: Cryptography hides the meaning of the message; steganography hides the existence of the message.

**Q8. What is LSB steganography?**  
A: Hiding data in the least significant bit of each pixel, which changes the image too little to see.

**Q9. What is email spoofing?**  
A: Sending email with a fake sender address so it looks like it came from a trusted person.

**Q10. Why is email spoofing possible?**  
A: SMTP does not authenticate the sender; the From header can be forged.

**Q11. What is the Reply-To field?**  
A: It tells the mail client where to send a reply. Attackers set it to a different address.

**Q12. Difference between SMTP, POP3 and IMAP?**  
A: SMTP sends mail; POP3 downloads mail to one device; IMAP syncs mail across devices and keeps it on the server.

**Q13. What is SPF?**  
A: Sender Policy Framework — a DNS record that lists which servers are allowed to send email for a domain.

**Q14. What is DKIM?**  
A: DomainKeys Identified Mail — adds a digital signature to prove the message was not altered.

**Q15. What is DMARC?**  
A: A policy that tells the receiver what to do when SPF or DKIM fails (none, quarantine, reject).

**Q16. What is email spam?**  
A: Unsolicited bulk email, usually advertising, scams or malware.

**Q17. Difference between a virus and a worm?**  
A: A virus needs a host file and user action; a worm spreads by itself over the network.

**Q18. What is a trojan?**  
A: Malware that looks like useful software but performs harmful actions.

**Q19. What is ransomware?**  
A: Malware that encrypts files and demands payment for the decryption key.

**Q20. Difference between brute force and dictionary attack?**  
A: Brute force tries every possible combination; a dictionary attack tries common words from a list.

**Q21. What is a rainbow table?**  
A: A precomputed table of password hashes used to crack passwords quickly. Salting defeats it.

**Q22. What is salting?**  
A: Adding a random value to a password before hashing, so the same password gives different hashes.

**Q23. What is sniffing?**  
A: Capturing network packets and reading their contents.

**Q24. Difference between passive and active sniffing?**  
A: Passive only listens; active injects packets (ARP spoofing, MAC flooding) to force traffic through the attacker.

**Q25. How can sniffing be prevented?**  
A: Use HTTPS/TLS, SSH, VPN, WPA2/WPA3, static ARP, Dynamic ARP Inspection and port security.

**Last-minute:** MAC spoofing + macchanger → steganography vs cryptography → email protocols → spoofing (SPF/DKIM/DMARC) → spam → malware types → password attacks → sniffing (ARP spoofing).

---

# MODULE 3 — Other Types of Attacks

## 3.1 Phishing

**Phishing** = a fake message or website that tricks a user into revealing information or installing malware.

**How it works:**

1. Attacker creates a fake page or message that looks real.
2. Sends it to many users with urgency ("account blocked", "verify now").
3. Victim clicks the link and enters credentials/OTP or downloads a file.
4. Attacker uses the data for fraud.

**Types of phishing:**

| Type | Meaning | Example |
|---|---|---|
| **Email phishing** | Bulk fake email | Fake bank email |
| **Spear phishing** | Targeted at one person/team | Email to the accounts department |
| **Whaling** | Aimed at top executives | Fake CEO email about a merger |
| **Vishing** | Voice phishing by phone | Fake bank call asking for OTP |
| **Smishing** | SMS phishing | "Your parcel is held, click here" |
| **Clone phishing** | Copy a real email and resend with a malicious link | Reused invoice email |
| **Pharming** | Redirect users through DNS/website poisoning | Fake bank site |
| **Angler phishing** | Fake social-media support account | Fake "support" reply |
| **HTTPS phishing** | Phishing site with a valid-looking HTTPS lock | Fake login page on a free host |

**Signs:** unknown sender, urgency, spelling mistakes, mismatched link, unexpected attachment, request for OTP/password, generic greeting.

**Prevention:** check the URL, use MFA, do not click unknown links, verify by phone, use email filters, report phishing, train users.

## 3.2 Other types of attacks (quick table)

| Attack | Simple meaning | Example |
|---|---|---|
| **DoS / DDoS** | Make a service unavailable by flooding it | Many bots flood a website |
| **MITM** | Sit between two parties and read/modify traffic | ARP spoofing on Wi-Fi |
| **Session hijacking** | Steal a logged-in session | Copying a cookie |
| **SQL injection** | Insert SQL through input fields | `' OR 1=1 --` |
| **XSS** | Inject JavaScript into a page | Script steals cookies |
| **CSRF** | Force a logged-in user to perform an action | Hidden bank transfer request |
| **Clickjacking** | Hide a button under a fake page | "Click to win" clicks "Delete" |
| **DNS spoofing** | Fake DNS reply | Redirect to a fake site |
| **Brute force** | Try many passwords | Hydra |
| **Insider threat** | Attack from inside the organization | Employee leaks data |
| **Zero-day** | Attack on an unpatched unknown flaw | No fix available yet |

## 3.3 Deception technology

**Deception technology** = a security solution that uses **fake systems (decoys)** to trick attackers into engaging with them, so their presence and tactics are revealed.

**Goal:** divert the attacker away from real IT assets and give the security team early, accurate intelligence.

**Why it is useful:**

- Makes security more **proactive**.
- Prevents a criminal who has already entered the network from doing major damage.
- Gives **faster and more accurate detection**.
- Creates **no false positives** — if someone touches a decoy, it is definitely suspicious.

**Honeypots:** the first and simplest form of deception. A honeypot is a fake system/service that detects intrusions and reports intelligence to the security team.

**Types of deception:**

| Type | Meaning |
|---|---|
| **Active deception** | Gives **wrong/inaccurate** information on purpose so the intruder falls for the trap |
| **Passive deception** | Gives **incomplete** information (only half the picture), so the intruder keeps searching and reveals more |

**Working principle:**

- A **decoy network** runs on the existing infrastructure.
- It is **not visible to genuine staff**.
- When an attacker enters, the decoy looks like an easy target.
- The attacker engages with it, and the security team observes and collects evidence.

> This idea comes from **MILDEC (military deception)**.

**Methods mentioned in the slides:**

| Method | Meaning |
|---|---|
| **Piggybacking** | Attacker follows an authorized person into a protected area; also using an unsecured wireless network without permission |
| **Impersonation** | Pretending to be another person to obtain information |
| **Web-based deception** | Hoax emails, jokes, movies and non-business mail that violate the acceptable-use policy |
| **Shoulder surfing** | Getting personal data by direct observation (binoculars, cameras) |
| **Hoaxes** | False warnings that cause unnecessary fear and unreasonable behaviour |

**Examples of decoys:** fake servers, fake databases, fake user accounts, fake files ("passwords.xlsx"), fake login pages, breadcrumbs (fake links).

## 3.4 Website security

**Website security** = the practices, methods and protocols used to protect a website and its data.

It prevents threats such as **DDoS, SQL injection, XSS and malware**.

**Impact of a website attack:**

- **Economic:** lost revenue and remediation cost.
- **Reputation:** bad media coverage and loss of trust.
- **Regulatory:** fines for failing to protect personal data (GDPR, HIPAA).

**Threats to a website:**

| Threat | Meaning |
|---|---|
| **DDoS** | Flooding the site so it slows down or crashes |
| **Malware** | Malicious software that steals data or gives access |
| **Injection attacks** | Malicious code/commands in input fields (SQLi, XSS) |
| **Blacklisting** | Search engines flag the site and remove it from results |
| **Vulnerability exploits** | Using weak spots such as an outdated plugin |
| **Defacement** | Replacing the site content with attacker content |

**Risks to visitors:**

- Stolen data (email, payment info).
- Phishing pages on the site.
- Session hijacking.
- Malicious redirects.
- SEO spam (fake links/pages to drive traffic to bad sites).

### HTTP security headers

HTTP security headers are key-value pairs sent between the browser and server. They protect against XSS, code injection, clickjacking and more.

| Header | What it does |
|---|---|
| **Strict-Transport-Security (HSTS)** | Tells the browser to use **HTTPS only**; protects against MITM and cookie hijacking |
| **X-XSS-Protection** | Asks the browser to block reflected XSS (older browsers) |
| **X-Frame-Options** | Stops the page from being shown in a frame/iframe; protects against **clickjacking** |
| **X-Content-Type-Options** | Stops **MIME sniffing**, so the browser follows the declared content type |
| **Content-Security-Policy (CSP)** | Whitelist of allowed sources for scripts, images, CSS; prevents XSS, clickjacking and HTML injection |

> **Why headers matter:** they block common attacks and also improve the site's security score and SEO.

**Example:** With HSTS, even if a user types `http://example.com`, the browser automatically switches to `https://example.com`.

### Two-factor authentication (2FA)

**2FA** = a security method that requires **two forms of identification**.

**How it works:**

1. User enters username and password.
2. Authentication server checks the password.
3. If correct, the server sends a **unique code** to the second-factor device.
4. The user approves/enters the code.
5. Access is granted.

**Benefits:** even if the password is stolen, the attacker still needs the second factor.

### SSL/TLS certificate and handshake

An **SSL/TLS certificate** proves the identity of a website and enables an encrypted HTTPS connection.

**SSL/TLS handshake steps:**

1. Browser connects to the web server.
2. Browser asks for proof of the server's identity.
3. Server sends its **SSL/TLS certificate** containing its **public key**.
4. Browser verifies the certificate (valid, trusted, matches the domain).
5. Browser uses the public key to encrypt and send a **secret session key**.
6. Server decrypts it with its **private key**.
7. Both sides now use the same session key for encrypted communication.

> **HTTP vs HTTPS:** HTTP sends data in plain text and can be intercepted. HTTPS = HTTP + SSL/TLS, so data is encrypted.

**Website security best practices:**

- Use HTTPS everywhere and HSTS.
- Keep the CMS, plugins and server **patched**.
- Use a **WAF** and input validation.
- Strong passwords + 2FA for admin accounts.
- Regular backups and vulnerability scans.
- Least privilege for admin users.
- Monitor logs and block suspicious traffic.

## 3.5 Mobile security

**Mobile security** = the protection measures used to prevent hackers and unauthorized users from accessing smartphones, tablets and other portable devices.

It protects **private, sensitive and personal data** on the device, and also covers endpoints and network hardware connected to the device.

**Goals:** prevent unauthorized access, data breaches and virus attacks on mobile devices.

### Mobile encryption

**Mobile encryption** = protecting data stored on a mobile device or sent through it by converting it into **ciphertext**, which looks like gibberish unless decrypted with the correct key.

- The key is created during encryption.
- It is unique to each set of data.
- Only authorized users can decrypt and read the data.

**Two main types:**

| Type | Meaning |
|---|---|
| **Device encryption** | Full-disk/disk encryption of the device's internal storage. Protects files, app data and even login credentials. Once the device is locked or rebooted, it cannot be accessed without the key. |
| **Communication encryption** | Encrypts data in transit between the device and other systems (e.g., HTTPS, VPN, encrypted messaging). |

**Why mobile encryption matters:** without it, a thief or malware could read personal and confidential data. Encryption protects data if the device is lost or stolen.

### Mobile malware

**Mobile malware** = malicious software designed to target smartphones and tablets to gain access to private data.

It is a growing threat because many companies allow **BYOD** (personal devices on the corporate network).

**Types:**

| Type | Meaning |
|---|---|
| **Remote Access Tool (RAT)** | Gives the attacker wide access: apps, call history, contacts, browser history, SMS, camera, GPS |
| **Bank trojan** | Disguised as a real app; steals banking login and password details |
| **Ransomware** | Locks the device and demands payment (often Bitcoin) |
| **Cryptomining malware** | Secretly uses the device's CPU to mine cryptocurrency |
| **Advertising click fraud** | Hijacks the device to generate fake ad clicks and income |

### Zero-day attack

- **Zero-day** = a vulnerability that the vendor has just learned about — so there are **"zero days"** to fix it.
- **Zero-day vulnerability** — a flaw discovered by attackers before the vendor knows; no patch exists.
- **Zero-day exploit** — the method used to attack that flaw.
- **Zero-day attack** — using the exploit to damage or steal data.

> Because no patch exists, these attacks often succeed. Defence: keep software updated, use layered security, behaviour-based detection and least privilege.

### Remote wipe

**Remote wipe** = deleting data from a device (laptop, phone, tablet) from a distance.

**When it is used:**

- Device is lost or stolen.
- Employee quits or is fired.
- Device contains malware that attacks the corporate network.

**How it works:**

- A command is sent from another device or a web-based management system.
- It deletes/overwrites the data so it cannot be recovered.
- It may also **lock** the device or remove it from the account.

**Why it is important for enterprises:**

- Protects intellectual property, trade secrets and customer data.
- Reduces the risk of malware spreading to the corporate network.
- Quickly removes corporate data and minimizes loss.

**Limitation:** a remote wipe may not erase **all** residual data — some data may still be recovered with forensic tools. So devices must be wiped properly before recycling.

**Mobile security best practices:**

- Use a screen lock/PIN/biometric.
- Keep the OS and apps updated.
- Install apps only from official stores.
- Check app permissions (allow only what is needed).
- Enable device encryption.
- Use MDM (Mobile Device Management) and remote wipe.
- Avoid public Wi-Fi for banking; use a VPN.
- Enable 2FA and backups.

## 3.6 Viva questions — Module 3

**Q1. What is phishing?**  
A: A fake message or website that tricks a user into revealing information or installing malware.

**Q2. Difference between phishing and spear phishing?**  
A: Phishing is sent to many users; spear phishing is targeted at one person or team.

**Q3. What is whaling?**  
A: Phishing aimed at senior executives such as a CEO.

**Q4. What is vishing and smishing?**  
A: Vishing is voice phishing by phone; smishing is phishing by SMS.

**Q5. What is pharming?**  
A: Redirecting users to a fake website through DNS or website poisoning.

**Q6. What is deception technology?**  
A: A security solution that uses fake systems (decoys) to trick attackers and reveal their presence and tactics.

**Q7. What is a honeypot?**  
A: A fake system or service used to detect intrusions and collect intelligence about attackers.

**Q8. Difference between active and passive deception?**  
A: Active deception gives wrong/inaccurate information on purpose; passive deception gives incomplete information so the attacker keeps searching.

**Q9. What is website security?**  
A: The practices, methods and protocols used to protect a website and its data from threats such as DDoS, SQL injection and malware.

**Q10. Name four threats to a website.**  
A: DDoS, malware, injection attacks (SQLi/XSS), defacement (also blacklisting and vulnerability exploits).

**Q11. What is HSTS?**  
A: HTTP Strict Transport Security — it forces the browser to use HTTPS only.

**Q12. What does X-Frame-Options protect against?**  
A: Clickjacking, by stopping the page from being loaded in a frame/iframe.

**Q13. What is Content-Security-Policy?**  
A: A header that whitelists allowed sources for scripts, images and CSS, helping prevent XSS and clickjacking.

**Q14. What is 2FA?**  
A: A security method requiring two forms of identification, such as a password plus an OTP.

**Q15. What is an SSL/TLS certificate?**  
A: A digital certificate that proves a website's identity and enables an encrypted HTTPS connection.

**Q16. What is mobile security?**  
A: Protecting smartphones and tablets from unauthorized access, data breaches and malware.

**Q17. What is mobile encryption?**  
A: Converting data on a mobile device into ciphertext so only authorized users with the key can read it.

**Q18. Difference between device encryption and communication encryption?**  
A: Device encryption protects data stored on the device; communication encryption protects data in transit.

**Q19. Name the types of mobile malware.**  
A: RATs, bank trojans, ransomware, cryptomining malware and advertising click fraud.

**Q20. What is a zero-day attack?**  
A: An attack that exploits a vulnerability before the vendor knows about it, so no patch exists.

**Q21. What is remote wipe?**  
A: Deleting data from a device from a distance, usually when it is lost, stolen or infected.

**Q22. What is the limitation of remote wipe?**  
A: It may not erase all residual data; some data can still be recovered with forensic tools.

**Last-minute:** phishing types → deception technology (active/passive) → website threats → security headers (HSTS, X-Frame-Options, CSP) → 2FA → SSL/TLS handshake → mobile encryption → mobile malware → zero-day → remote wipe.

---

# MODULE 4 — IoT Hacking
### (Wireless Security + Social Engineering + Basics of IoT)
*Based on sir's Module 4 PPTs.*

## Part A — Wireless Security

### 4A.1 Wireless security protocols

| Protocol | Year | Encryption | Key point | Status |
|---|---|---|---|---|
| **WEP** | Late 1990s | 64/128-bit, RC4 | Basic encryption, static keys | **Outdated and insecure** |
| **WPA** | 2003 | 128/256-bit, TKIP | Stronger than WEP; works on older hardware | Older but still seen |
| **WPA2** | 2004 | AES-CCMP | Strong and widely used; personal and enterprise modes | **Most common today** |
| **WPA3** | 2018 | 192/256/384-bit, SAE | Strongest; better for Wi-Fi 6; forward secrecy | Newest |

### 4A.2 Why WEP is weak

- **Static keys** — the key rarely changes, so it is easy to guess.
- **IV collisions** — the 24-bit initialization vector repeats, which helps attackers recover the key.
- **No mutual authentication** — the client does not truly verify the access point.
- **No forward secrecy** — if the key leaks, old traffic can be decrypted.
- **Poor implementation** — weak ICV/IV handling in many products.

> **Example:** WEP is like a lock with only 10,000 possible keys. An attacker can try all keys in a short time.

### 4A.3 IoT authentication methods

| Method | Factors | Example |
|---|---|---|
| **One-factor** | Something you know | Username + password |
| **Two-factor** | Password + something you have/are | Password + OTP or fingerprint |
| **Three-factor / MFA** | Know + are + possess | Password + fingerprint + OTP token |
| **Cryptographic authentication** | Digital certificates / public keys | Device certificate; mutual authentication |

**Mutual authentication** = both client and server verify each other. Common in IoT protocols using public keys.

## Part B — Social Engineering

### 4B.1 What is social engineering?

Social engineering is the use of **psychological manipulation** to trick people into:

- revealing sensitive information,
- making security mistakes, or
- giving access to systems.

It targets **people**, not machines.

### 4B.2 Steps in a social engineering attack

1. **Investigate** the victim (background, weak points).
2. **Gain trust** (pretend to be a co-worker, bank, police, etc.).
3. **Trigger an action** (share a password, click a link, open a file).

### 4B.3 Techniques

| Technique | Simple meaning | Example |
|---|---|---|
| **Phishing** | Fake email/message that creates urgency or fear | "Your account will be blocked — click here" |
| **Pretexting** | Invented story to get information | "I'm from IT; I need your password to fix your account" |
| **Scareware** | Fake warning that the system is infected | "Your PC has 5 viruses — install this cleaner" |
| **Tailgating** | Following someone into a restricted area | Walking in behind an employee at a locked door |
| **Whaling** | Phishing aimed at a senior person | Fake email to the CEO about a merger |
| **Vishing** | Voice phishing by phone | Fake bank call asking for an OTP |
| **Baiting** | Tempting offer or infected USB | "Free movie" USB left in a parking lot |
| **Quid pro quo** | Offer a service in exchange for information | "I'll fix your printer if you give me your login" |
| **Shoulder surfing** | Watching someone type | Reading a password at a cafe |
| **Social media** | Using public posts to plan an attack | Using birthday/employee info for a fake call |

### 4B.4 Prevention

- Do not open suspicious emails or attachments.
- Verify the sender through another channel.
- Use **MFA**.
- Be careful with "too good to be true" offers.
- Keep antivirus and software updated.
- Train users regularly.
- Follow the principle: **trust but verify**.

## Part C — Basics of IoT

### 4C.1 What is IoT?

**Internet of Things (IoT)** = a network of physical devices with sensors, software and connectivity that collect and exchange data over the internet.

Examples: smart bulbs, smart watches, CCTV cameras, smart ACs, industrial sensors, connected cars.

### 4C.2 IoT architecture (simple)

```
Sensors/Devices → Gateway → Network → Cloud → User App
```

### 4C.3 Security challenges of IoT

- **Weak authentication** — default or no passwords.
- **Insecure interfaces** — no encryption, poor authentication.
- **Outdated software** — no patches.
- **Insecure data transfer** — plain text data.
- **Insecure components** — unsupported hardware/software.
- **Lack of security controls** — built without security.
- **Vulnerable APIs** — easy entry points.
- **Poor physical security** — device can be stolen or tampered with.
- **Limited network visibility** — security tools cannot see IoT devices.
- **Malware shipped with devices** — infected supply chain.
- **Lack of transparency** — unclear security practices.

### 4C.4 Common IoT attacks

| Attack | Meaning | Example |
|---|---|---|
| **Brute force** | Try many passwords | Cracking a weak camera password |
| **Phishing** | Trick the user into installing malware | Fake app update |
| **Man-in-the-Middle (MitM)** | Intercept and modify traffic | Attacker sits between device and cloud |
| **Botnet / DDoS** | Many infected devices attack a target | **Mirai botnet** |
| **Firmware attack** | Replace or corrupt device firmware | Malicious firmware update |
| **Physical tampering** | Open or steal the device | Attaching a debug cable |

### 4C.5 Effects of IoT hacking

- Data breaches
- Identity theft
- Financial fraud
- Loss of customer trust
- Device instability
- Physical damage
- Privacy violations

### 4C.6 Attack vectors and fixes

| Attack vector | Fix |
|---|---|
| Weak/default credentials | Change defaults; strong passwords; passwordless/MFA |
| Phishing | Awareness training, spam filters, MFA |
| Malware | Firewalls, patching, antivirus |
| Unpatched software | Automatic updates, vulnerability assessment |
| Third-party vendors | Least privilege, vendor access control, audit trail |
| Insider threats | Least privilege, monitoring, Zero Trust |
| Lack of encryption | Encrypt data at rest and in transit; DLP |
| Misconfiguration | Secure defaults, reviews, hardening |
| Default passwords | Force change on first login; unique per device |

> **Mirai example:** Mirai infected IoT devices by trying default usernames/passwords, then used them as a botnet for large DDoS attacks.

## 4.7 Viva questions — Module 4

**Q1. Difference between WEP, WPA, WPA2 and WPA3?**  
A: WEP uses static keys and RC4 and is insecure. WPA uses TKIP. WPA2 uses AES-CCMP and is the most common. WPA3 uses SAE, stronger encryption and forward secrecy.

**Q2. Why is WEP insecure?**  
A: It uses static keys, has IV collisions, no mutual authentication, no forward secrecy and poor implementations.

**Q3. What is TKIP?**  
A: Temporal Key Integrity Protocol — the encryption protocol used by WPA to improve on WEP.

**Q4. What is AES?**  
A: Advanced Encryption Standard — a strong symmetric encryption algorithm used in WPA2/WPA3.

**Q5. Difference between 2FA and MFA?**  
A: 2FA uses exactly two factors. MFA uses two or more factors (two, three or more).

**Q6. What is mutual authentication?**  
A: Both parties (client and server/device) verify each other's identity.

**Q7. What is social engineering?**  
A: Manipulating people psychologically to reveal information or make security mistakes.

**Q8. Phishing vs pretexting?**  
A: Phishing uses fake emails/messages to trick users into clicking or sharing data. Pretexting uses a made-up story and impersonation to get information.

**Q9. What is scareware?**  
A: Fake warnings about viruses or threats that push the victim to install malicious or useless software.

**Q10. What is tailgating?**  
A: Following an authorized person into a restricted area without permission.

**Q11. What is whaling?**  
A: Phishing aimed at senior executives such as a CEO.

**Q12. What is vishing?**  
A: Voice phishing — tricking someone over a phone call.

**Q13. What is IoT?**  
A: A network of connected physical devices that collect and exchange data over the internet.

**Q14. Name any four IoT security challenges.**  
A: Weak/default passwords, outdated software, insecure data transfer and vulnerable APIs (also insecure interfaces, poor physical security).

**Q15. What was the Mirai botnet?**  
A: A botnet that infected IoT devices using default credentials and launched large DDoS attacks.

**Q16. Why are default passwords dangerous?**  
A: Attackers know them, so devices can be hijacked, used for botnets, or used to access the network.

**Q17. How can IoT devices be secured?**  
A: Change defaults, use strong passwords/MFA, patch firmware, encrypt data, segment networks, monitor devices and apply least privilege.

**Last-minute:** WEP→WPA→WPA2→WPA3 table → WEP weaknesses → social engineering techniques → IoT challenges → Mirai.

---

# MODULE 5 — Cyber Crime Case Reporting & International Standards
*Based on sir's Module 5 PPTs and documents.*

## 5.1 What is cybercrime?

**Cybercrime** = any illegal activity that uses a computer, network or digital device.

### Common types

| Type | Meaning | Example |
|---|---|---|
| **Phishing** | Fake message to steal information | Fake bank email |
| **Hacking** | Unauthorized access to a system | Breaking into a website |
| **Identity theft** | Using someone else's personal data | Opening a bank account with stolen ID |
| **Ransomware** | Encrypts files and demands money | Locked hospital records |
| **Online scams** | Fraud over the internet | Fake job offer asking for a fee |
| **PUPs** | Potentially Unwanted Programs | Bundled adware |
| **DoS/DDoS** | Making a service unavailable | Flooding a website with traffic |
| **Cyberstalking** | Repeated online harassment | Threatening messages |
| **Cyber defamation** | False online statements damaging reputation | Fake posts about a person |

## 5.2 Reporting cybercrime in India

### Two main ways

1. **Helpline:** call **1930** for cyber fraud (especially financial fraud).
2. **Online portal:** **https://cybercrime.gov.in**

### Steps to file a complaint online

1. Visit **cybercrime.gov.in**.
2. Click **File a Complaint** and accept the terms.
3. Select the cybercrime type (e.g., **Report Other Cyber Crime**).
4. Do **Citizen Login** and enter personal information.
5. Verify with the **OTP** sent to your mobile number.
6. Fill the captcha and submit.
7. Complete the sections: **General Information, Victim Information, Cybercrime Information, Preview**.
8. Upload **evidence** (screenshots, files, statements).
9. Add **suspect information** if known (otherwise skip).
10. Review and **Submit**.
11. Note the **complaint ID** sent by email.

### Documents to attach

- Proof of fraudulent transaction (bank statement)
- Address and ID proof
- Suspicious messages/emails
- Screenshots of the incident

> **Tip:** Report financial fraud **as early as possible** so the bank/portal can try to freeze the transaction.

## 5.3 What is cyber law?

**Cyber law** = the legal rules and frameworks that govern digital activities such as online communication, e-commerce, privacy and cybercrime.

### Advantages

- Protection against cybercrimes
- Data privacy
- E-commerce regulation
- Intellectual property protection
- Cybersecurity standards

### Types of cyber law

| Type | What it covers |
|---|---|
| **Privacy laws** | Protection of personal data |
| **Cybercrime laws** | Definition and punishment of cyber offences |
| **Intellectual property laws** | Copyright, patents, trademarks online |
| **E-commerce laws** | Online contracts, transactions, consumer protection |
| **Cyber defamation laws** | Online libel and slander |
| **Cybersecurity laws** | Security standards for systems and data |
| **Social media laws** | User rights and content regulation |
| **Cyber contracts / e-signature laws** | Validity of online contracts and digital signatures |
| **International cyber laws** | Cross-border cooperation |
| **Data breach notification laws** | Duty to inform users/authorities after a breach |

## 5.4 IT Act 2000 (India)

The **Information Technology Act, 2000** is India's main cyber law.

Key points:

- Gives **legal recognition** to electronic records and digital signatures.
- Prescribes **penalties** for cybercrimes and fraud.
- Was amended in **2008** to add more offences and stronger provisions.
- Common sections to remember (simple):
  - **Sec. 43** — damage to computer/data
  - **Sec. 65** — tampering with computer source documents
  - **Sec. 66** — computer-related offences
  - **Sec. 66C** — identity theft
  - **Sec. 66D** — cheating by impersonation
  - **Sec. 66E** — violation of privacy
  - **Sec. 66F** — cyber terrorism
  - **Sec. 67** — publishing obscene material

> You do not need to memorise every section for a viva. Remember: **IT Act 2000 = main Indian cyber law; amended 2008; covers e-records, digital signatures and cybercrimes.**

## 5.5 International standards

| Standard / body | Simple meaning |
|---|---|
| **ISO 27001** | International standard for an **Information Security Management System (ISMS)** — minimum requirements to protect data |
| **ISO 22301** | International standard for **Business Continuity Management System (BCMS)** — keep working during disruptions |
| **International human rights law** | Applies to cyber operations; states must respect human rights |
| **CERT** | Computer Emergency Response Team — detects and responds to cyber attacks |
| **IT Act 2000** | Indian law for cybercrimes and digital signatures |
| **Budapest Convention** | International treaty for cooperation against cybercrime |

**Why international cooperation matters:** cybercrime crosses borders, so countries must share evidence and coordinate investigations.

## 5.6 CERT-In

**CERT-In (Indian Computer Emergency Response Team)** is India's **national nodal agency** for cybersecurity.

Functions:

- **Incident response** — 24/7 helpdesk
- **Security awareness** — advisories and guidelines
- **Technical assistance** — help victims recover
- **Information sharing** — collect, analyse and share incident data
- **Trend analysis** — identify attack trends
- **Collaboration** — work with other organizations

## 5.7 DoT — be careful, two meanings

Your PPT mentions **"CERT-In and DOT"**. There are two common meanings:

1. **DoT = Department of Telecommunications** (Government of India) — looks after telecom security and related services.
2. **DoT = DNS-over-TLS** — an IETF standard that encrypts DNS queries between a DNS client and a DNS server (port **853**).

The PPT slide describes **DNS-over-TLS**, so in the exam write:

> "DoT can mean Department of Telecommunications, but in the context of this slide it refers to DNS-over-TLS, which encrypts DNS traffic between client and resolver using TLS."

**Why DNS-over-TLS matters:** normal DNS is plain text and can be watched or spoofed. DoT encrypts it, improving privacy.

## 5.8 Case study examples you can mention

- **WannaCry (2017):** ransomware that spread as a worm using an unpatched Windows vulnerability; affected hospitals and businesses worldwide.
- **UPI/OTP fraud:** attacker tricks the victim into sharing an OTP or approving a collect request.
- **Phishing email:** fake login page steals credentials.
- **Mirai (2016):** IoT botnet used for DDoS.

## 5.9 Viva questions — Module 5

**Q1. What is cybercrime?**  
A: An illegal activity that uses a computer, network or digital device.

**Q2. Name any five types of cybercrime.**  
A: Phishing, hacking, identity theft, ransomware and online scams (also DoS, cyberstalking, PUPs).

**Q3. What is the cybercrime helpline number in India?**  
A: **1930**.

**Q4. What is the cybercrime reporting portal?**  
A: **cybercrime.gov.in**.

**Q5. What evidence should be attached to a cybercrime complaint?**  
A: Bank statements/proof of transaction, ID and address proof, suspicious messages/emails and screenshots.

**Q6. What is cyber law?**  
A: The legal rules governing digital activities such as online communication, e-commerce, privacy and cybercrime.

**Q7. Name any four types of cyber law.**  
A: Privacy law, cybercrime law, intellectual property law and e-commerce law.

**Q8. What is the IT Act 2000?**  
A: India's main cyber law; it recognizes electronic records and digital signatures and punishes cybercrimes. It was amended in 2008.

**Q9. What is CERT-In?**  
A: India's national agency for cyber incident response, awareness, technical assistance and trend analysis.

**Q10. Difference between ISO 27001 and ISO 22301?**  
A: ISO 27001 is for information security management (ISMS). ISO 22301 is for business continuity management (BCMS).

**Q11. What is the Budapest Convention?**  
A: An international treaty that helps countries cooperate against cybercrime.

**Q12. What is DoT?**  
A: It can mean Department of Telecommunications. In the slide context, it means DNS-over-TLS, which encrypts DNS queries.

**Q13. What is a PUP?**  
A: Potentially Unwanted Program — software that may harm the computer or user and is often installed without clear consent.

**Q14. What is cyberstalking?**  
A: Repeated online harassment or stalking through electronic means.

**Q15. Why is international cooperation needed for cybercrime?**  
A: Because attackers and evidence can cross borders, so countries must share information and coordinate investigations.

**Last-minute:** 1930 → cybercrime.gov.in → reporting steps → cyber law types → IT Act 2000 → ISO 27001/22301 → CERT-In → DoT = DNS-over-TLS.

---

# MODULE 6 — Future of Cyber Security
### (API Security + Mobile App Security + Web App Security)
*Based on sir's Module 6 PPTs.*

## 6.1 What is an API?

**API (Application Programming Interface)** = a way for two software applications to talk to each other.

Examples:

- A food delivery app uses an API to get restaurant menus.
- A weather app uses an API to get temperature data.
- A banking app uses an API to fetch your balance.

APIs are the **backend** for mobile apps, websites and IoT devices. They are also used in **microservices** architecture.

## 6.2 API security risks (simple list)

| Risk | Simple meaning | Example |
|---|---|---|
| **Broken authentication** | Weak login/token checks | API accepts a stolen token |
| **BOLA / IDOR** | User can access another user's object by changing an ID | `/user/101` changed to `/user/102` |
| **Excessive data exposure** | API returns more data than needed | Full user record instead of name only |
| **Lack of rate limiting** | Attacker can send unlimited requests | Password brute force |
| **Injection** | Malicious input is executed | SQL injection through an API parameter |
| **Security misconfiguration** | Wrong settings | Debug mode on in production |
| **Improper inventory** | Old/forgotten APIs still running | An old `/v1` endpoint with no auth |
| **Insufficient logging** | Attacks are not detected | No alert on repeated failures |

## 6.3 Web application security

**Web application security** = protecting web apps and APIs from attacks, and finding/fixing vulnerabilities before release.

Ways to improve web app security:

| Practice | Simple meaning |
|---|---|
| **Penetration testing** | Authorized simulated attack |
| **Application security testing** | Find bugs and vulnerabilities (SAST/DAST) |
| **RASP** | Runtime Application Self-Protection — detects attacks while the app runs |
| **Vulnerability management** | Continuously find, prioritise and fix weaknesses |
| **API security testing** | Test APIs for auth, input and logic flaws |
| **Automation** | Automate repetitive security checks |
| **Input validation** | Check all user input before processing |

## 6.4 Input validation

**Input validation** = checking that data entered into a system is valid and safe.

### Two types

| Type | What it checks | Example |
|---|---|---|
| **Syntactic validation** | Type, length, format | Email must contain `@`; age must be a number |
| **Semantic validation** | Whether the value makes sense in context | Date of birth cannot be in the future |

### Two approaches

| Approach | Meaning | Security |
|---|---|---|
| **Whitelist** | Allow only known-good input | Stronger |
| **Blacklist** | Block known-bad input | Weaker (attackers can bypass) |

### Where to validate?

**Server-side**, before the application processes the data. Client-side validation is good for user experience but can be bypassed.

### Why input validation matters

- Prevents **SQL injection**
- Prevents **cross-site scripting (XSS)**
- Prevents **command injection**
- Maintains **data integrity**
- Prevents unauthorized access

> **Example:** If a form expects an age, accept only digits between 1 and 120. Reject `1 OR 1=1` instead of passing it to the database.

## 6.5 Session management

A **session** remembers that a user is logged in. The **session ID** is usually stored in a cookie.

### Risks

- **Session hijacking** — attacker steals the session ID.
- **Session fixation** — attacker forces a known session ID on the victim.

### Best practices

- Use long, random session IDs.
- Set cookies with **Secure**, **HttpOnly** and **SameSite**.
- Use **HTTPS** everywhere.
- Set an idle/absolute timeout.
- **Rotate** the session ID after login.
- Log out properly and invalidate the session on the server.

| Cookie flag | Meaning |
|---|---|
| **Secure** | Cookie sent only over HTTPS |
| **HttpOnly** | JavaScript cannot read the cookie (helps against XSS) |
| **SameSite** | Limits cross-site cookie sending (helps against CSRF) |

## 6.6 Mobile app security

**Mobile application security** = technologies and procedures that protect mobile apps from cyberattacks and data theft.

### Runtime permissions

When an app needs a feature, it asks the user:

| Choice | Meaning |
|---|---|
| **Always allow** | App can use the feature even in the background |
| **Allow while in use** | App can use it only while running |
| **Deny** | App cannot use the feature |

**Why runtime permissions matter:**

- **Transparency** — user sees what the app wants.
- **Consent** — app cannot access data without permission.
- **Restricted actions** — app cannot delete contacts or take photos without permission.

### Protecting sensitive data

- Strong encryption **in transit** and **at rest**
- Store private data in internal storage
- Use network security measures (firewalls, segmentation)
- Keep services and dependencies updated
- Educate users (avoid public Wi-Fi for banking)
- Regular backups and restore testing
- Clear privacy policy

### Bluetooth attacks

| Attack | Meaning |
|---|---|
| **Bluesnarfing** | Stealing data (contacts, messages) over Bluetooth |
| **Bluejacking** | Sending unsolicited messages to a Bluetooth device |
| **Bluebugging** | Gaining control of a Bluetooth device |
| **Eavesdropping** | Intercepting Bluetooth signals |
| **Car whispering** | Eavesdropping/injecting audio in a car via Bluetooth |

**Prevention:** turn off Bluetooth when not needed, don't accept unknown pairing requests, keep devices updated, use secure pairing.

### BYOD (Bring Your Own Device)

BYOD means employees use personal devices for work.

Security measures:

- Data encryption
- Standard antivirus
- App management (in-house app store / MAM)
- Data loss prevention (DLP)
- Endpoint protection
- **Remote wipe** if lost/stolen
- Two-factor authentication
- Conditional access
- Restrict data access (least privilege)

### Patch management

Updates and patches:

- Fix security vulnerabilities
- Prevent unauthorized access
- Protect against new threats
- Maintain compliance

Good patch management:

1. Prioritise high-risk updates.
2. Define who applies patches and when.
3. Test patches before deployment.
4. Automate with **MDM**.
5. Add antivirus, anti-phishing and firewall.
6. Train users on passwords and screen locks.

## 6.7 Future trends (short points)

- **AI-driven attacks:** deepfakes, AI phishing, voice cloning.
- **AI-based defence:** anomaly detection, automated response.
- **Zero Trust:** "never trust, always verify."
- **Cloud and container security:** misconfigurations, Kubernetes.
- **API security:** BOLA, token flaws, rate limiting.
- **Supply chain attacks:** compromised third-party software.
- **Quantum-safe cryptography:** preparing for future quantum computers.

## 6.8 Viva questions — Module 6

**Q1. What is an API?**  
A: An interface that lets two software applications communicate, e.g., a weather app fetching data from a weather server.

**Q2. Why is API security important?**  
A: APIs expose business logic and data. A flaw can let attackers read other users' data, bypass authentication or automate abuse.

**Q3. What is BOLA/IDOR?**  
A: Broken Object Level Authorization — changing an object ID to access another user's data, e.g., `/user/101` → `/user/102`.

**Q4. What is input validation?**  
A: Checking that user input is valid, safe and in the expected format before processing it.

**Q5. Difference between syntactic and semantic validation?**  
A: Syntactic checks type, length and format; semantic checks whether the value makes sense in the application context.

**Q6. Whitelist vs blacklist validation?**  
A: Whitelist allows only known-good input (stronger). Blacklist blocks known-bad input (weaker, can be bypassed).

**Q7. Where should input validation be done?**  
A: On the **server side**, before the application processes the data.

**Q8. Which attacks does input validation prevent?**  
A: SQL injection, XSS, command injection and other injection attacks.

**Q9. What is session hijacking?**  
A: Stealing a valid session ID to act as the logged-in user.

**Q10. What is session fixation?**  
A: Forcing a known session ID on the victim so the attacker can reuse it after login.

**Q11. What do Secure, HttpOnly and SameSite cookie flags do?**  
A: Secure sends the cookie only over HTTPS; HttpOnly blocks JavaScript access; SameSite limits cross-site sending.

**Q12. What are runtime permissions in mobile apps?**  
A: Permissions asked at runtime, such as allow, allow while in use, or deny, so apps cannot access private data without consent.

**Q13. Difference between bluesnarfing and bluejacking?**  
A: Bluesnarfing steals data over Bluetooth. Bluejacking sends unsolicited messages.

**Q14. What is bluebugging?**  
A: Gaining control of a Bluetooth device, such as making calls or reading data.

**Q15. What is BYOD?**  
A: Bring Your Own Device — employees using personal devices for work.

**Q16. How can BYOD be secured?**  
A: Encryption, antivirus, app management, DLP, endpoint protection, remote wipe, 2FA, conditional access and least privilege.

**Q17. Why is patch management important?**  
A: It fixes known vulnerabilities, prevents unauthorized access and protects against new threats.

**Q18. What is RASP?**  
A: Runtime Application Self-Protection — detects and blocks attacks while the application is running.

**Q19. What is Zero Trust?**  
A: A security model that never trusts anyone by default and verifies every request.

**Q20. What is a deepfake?**  
A: AI-generated fake audio/video/image that looks real, often used for impersonation and fraud.

**Last-minute:** API risks → input validation (whitelist, server-side) → session flags → runtime permissions → Bluetooth attacks → BYOD → patch management.

---

# APPENDIX A — Common Ports (very useful in viva)

| Port | Service |
|---|---|
| 20/21 | FTP |
| 22 | SSH |
| 23 | Telnet |
| 25 | SMTP |
| 53 | DNS |
| 67/68 | DHCP |
| 80 | HTTP |
| 110 | POP3 |
| 143 | IMAP |
| 161 | SNMP |
| 389 | LDAP |
| 443 | HTTPS |
| 445 | SMB |
| 853 | DNS-over-TLS |
| 3306 | MySQL |
| 3389 | RDP |
| 8080 | HTTP alternate / proxy |

---

# APPENDIX B — Tools to remember

| Tool | Use |
|---|---|
| **Nmap** | Port scanning, service/OS detection |
| **Wireshark** | Packet capture and analysis |
| **Netcat (nc)** | Banner grabbing, simple connections |
| **Metasploit** | Exploitation framework |
| **Burp Suite** | Web app testing / proxy |
| **OWASP ZAP** | Web app vulnerability scanning |
| **SQLmap** | SQL injection testing |
| **John the Ripper** | Password cracking |
| **Hydra** | Online password attacks |
| **Hashcat** | GPU password cracking |
| **Aircrack-ng** | Wi-Fi security testing |
| **Maltego** | OSINT / footprinting |
| **theHarvester** | Email, domain and host gathering |
| **Shodan** | Search for exposed devices/services |
| **Nessus / OpenVAS** | Vulnerability scanning |
| **enum4linux** | SMB/NetBIOS enumeration |
| **snmpwalk** | SNMP enumeration |
| **dig / nslookup / host** | DNS lookups and DNS enumeration |
| **dnsenum / dnsrecon / fierce** | DNS enumeration and subdomain discovery |
| **macchanger** | Change MAC address (Kali Linux) |
| **Steghide / OpenStego** | Hide and extract data in files (steganography) |
| **Ettercap / Bettercap** | MITM, ARP spoofing and sniffing |
| **Nikto** | Web server vulnerability scanning |
| **DVWA** | Practice web app for SQLi/XSS |

---

# APPENDIX C — One-line definitions (rapid revision)

- **Computer security:** protecting systems, networks and data from theft, damage and unauthorized access.
- **CIA triad:** Confidentiality, Integrity, Availability.
- **Ethical hacking:** authorized hacking to find and fix weaknesses.
- **Hacker types:** white hat (ethical), black hat (criminal), grey hat (no permission, no bad intent), script kiddie (ready-made tools).
- **Vulnerability:** a weakness.
- **Security bug:** a bug that can be exploited to gain unauthorized access.
- **Threat:** a potential cause of harm.
- **Exploit:** code/technique that uses a vulnerability.
- **Risk:** chance of loss from a threat exploiting a vulnerability.
- **Virtualization:** creating a virtual version of a physical resource.
- **Hypervisor:** software that creates and runs virtual machines.
- **OSI model:** 7-layer reference model for network communication.
- **Port:** a logical endpoint used by a service (0–65535).
- **Port scanning:** checking many ports on one system.
- **Port sweeping:** checking one port on many systems.
- **SYN scan:** half-open scan (SYN → SYN-ACK → RST).
- **DNS:** Domain Name System — converts names to IP addresses.
- **DNS spoofing:** sending a fake DNS reply.
- **DNS poisoning:** inserting false entries into a DNS server/cache.
- **DNSSEC:** digital signatures for DNS data.
- **DNS enumeration:** collecting DNS records and subdomains about a target.
- **ICANN:** global body that coordinates domain names and IP addressing.
- **IANA:** body that manages IP allocation, the DNS root zone and protocol parameters.
- **gTLD:** generic Top-Level Domain such as `.com`, `.org`, `.shop`.
- **Footprinting:** collecting target information.
- **Scanning:** finding live hosts, ports and services.
- **Enumeration:** extracting users, shares and service details.
- **Privilege escalation:** gaining higher permissions.
- **Identity attack:** stealing or misusing a person's identity/credentials.
- **MAC address:** 48-bit physical address of a network card.
- **MAC spoofing:** changing a device's MAC address.
- **Steganography:** hiding data inside another file so its existence is hidden.
- **Steganalysis:** detecting hidden data.
- **SMTP:** protocol for sending email.
- **POP3:** protocol that downloads email to one device.
- **IMAP:** protocol that syncs email across devices.
- **Email spoofing:** sending email with a fake sender address.
- **SPF:** DNS record listing allowed sending servers.
- **DKIM:** digital signature that proves an email was not altered.
- **DMARC:** policy for handling mail that fails SPF/DKIM.
- **Spam:** unsolicited bulk email.
- **Virus:** malware that attaches to a file and needs user action.
- **Worm:** malware that self-replicates over the network.
- **Trojan:** malware disguised as useful software.
- **Ransomware:** malware that encrypts files and demands payment.
- **Rootkit:** malware that hides itself and gives hidden access.
- **Brute force:** trying every possible password combination.
- **Rainbow table:** precomputed password-hash table.
- **Salting:** adding a random value before hashing.
- **Sniffing:** capturing network packets.
- **ARP spoofing:** sending fake ARP replies to intercept traffic.
- **Social engineering:** manipulating people to break security.
- **Phishing:** fake message to steal information.
- **Spear phishing:** phishing targeted at one person or team.
- **Pretexting:** fake story to get information.
- **Scareware:** fake virus warning.
- **Tailgating:** following someone into a restricted area.
- **Whaling:** phishing aimed at top executives.
- **Vishing:** voice phishing.
- **Smishing:** SMS phishing.
- **Pharming:** redirecting users to a fake site via DNS/website poisoning.
- **Deception technology:** using fake systems (decoys) to trap attackers.
- **Honeypot:** a fake system/service used to detect attackers.
- **Active deception:** gives wrong information on purpose.
- **Passive deception:** gives incomplete information.
- **Website security:** protecting a website and its data from attacks.
- **HSTS:** header that forces HTTPS.
- **X-Frame-Options:** header that stops clickjacking.
- **CSP:** whitelist of allowed content sources.
- **2FA:** authentication with two factors.
- **SSL/TLS:** protocols that encrypt and authenticate HTTPS traffic.
- **Mobile security:** protecting mobile devices from unauthorized access and malware.
- **Mobile encryption:** converting mobile data into ciphertext.
- **RAT:** Remote Access Tool — gives an attacker wide access to a device.
- **Zero-day:** a vulnerability with no patch yet.
- **Remote wipe:** deleting device data from a distance.
- **IoT:** network of connected physical devices.
- **WEP:** outdated wireless protocol with static keys.
- **WPA2:** widely used wireless protocol using AES-CCMP.
- **WPA3:** newest wireless protocol using SAE.
- **Cybercrime:** illegal activity using computers/networks.
- **Cyber law:** legal rules for digital activities.
- **CERT-In:** India's national cyber incident response agency.
- **ISO 27001:** information security management standard.
- **ISO 22301:** business continuity management standard.
- **API:** interface for two applications to communicate.
- **BOLA/IDOR:** accessing another user's object by changing an ID.
- **Input validation:** checking input before processing.
- **Session hijacking:** stealing a session ID.
- **Session fixation:** forcing a known session ID on a victim.
- **Runtime permission:** app permission asked while the app is running.
- **BYOD:** Bring Your Own Device.
- **Bluesnarfing:** stealing data over Bluetooth.
- **Bluejacking:** sending unsolicited Bluetooth messages.
- **Bluebugging:** taking control of a Bluetooth device.
- **Zero Trust:** never trust by default; verify everything.

---

# APPENDIX D — Practical exam tips

1. **Start with the definition** — one clean sentence.
2. **Give one example** — examiners remember examples.
3. **Use a table for differences** — WEP vs WPA, virus vs worm, active vs passive.
4. **Say the tool name** — Nmap, Wireshark, Burp Suite, Hydra, etc.
5. **Mention defence** — every attack question can end with "Prevention: ...".
6. **Don't confuse:**
   - Scanning ≠ Enumeration
   - Vulnerability ≠ Threat ≠ Exploit
   - Port scanning ≠ Port sweeping
   - DNS spoofing ≠ DNS poisoning
   - Cryptography ≠ Steganography
   - SMTP ≠ POP3 ≠ IMAP
   - Active deception ≠ Passive deception
   - WPA2 ≠ WPA3
   - Session hijacking ≠ Session fixation
   - Device encryption ≠ Communication encryption
   - Bluesnarfing ≠ Bluejacking ≠ Bluebugging

**All the best for your practical exam!**
