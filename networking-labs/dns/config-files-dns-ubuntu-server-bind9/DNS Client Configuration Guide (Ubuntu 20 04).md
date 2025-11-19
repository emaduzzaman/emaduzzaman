# DNS Client Configuration Guide (Ubuntu 20.04)

## Permanently Set Hostname

```bash
sudo hostnamectl set-hostname emaduzzaman-dns
hostnamectl
```

Expected output:

```
Static hostname: emaduzzaman-dns

```

Edit **/etc/hosts**:

```bash
sudo nano /etc/hosts

```

Add:

```
127.0.0.1       localhost
192.168.10.148  emaduzzaman-dns

```

---

## Backup Default BIND Config

```bash
sudo cp /etc/bind/named.conf.options /etc/bind/named.conf.options.backup
sudo cp /etc/bind/named.conf.local /etc/bind/named.conf.local.backup

```

---

## Configure Recursive Resolver

Edit the options file:

```bash
sudo nano /etc/bind/named.conf.options

```

Paste:

```
options {
    directory "/var/cache/bind";

    recursion yes;
    allow-query { any; };
    allow-recursion { any; };

    forwarders { };

    dnssec-validation auto;

    listen-on { any; };
    listen-on-v6 { any; };

    rate-limit {
        responses-per-second 15;
    };

    max-cache-size 256M;
    minimal-responses yes;

    version "emaduzzaman-dns resolver";

    root-delegation-only exclude { "localhost"; "localdomain"; };
};

```

---

## Include Root Zone Hints

Ensure the root hints file exists:

```bash
sudo nano /etc/bind/named.conf.default-zones

```

Verify:

```
zone "." {
    type hint;
    file "/usr/share/dns/root.hints";
};

```

If missing:

```bash
sudo wget https://www.internic.net/domain/named.root -O /usr/share/dns/root.hints

```

---

## Local Config File

```bash
sudo nano /etc/bind/named.conf.local

```

Ensure it contains:

```
// No local zones — pure recursive resolver

```

---

## Fix AppArmor Permissions

```bash
sudo apparmor_parser -r /etc/apparmor.d/usr.sbin.named

```

---

## Restart and Enable BIND (Ubuntu 20.04 uses bind9.service)

```bash
sudo systemctl restart bind9
sudo systemctl enable bind9
sudo systemctl status bind9

```

Check port 53:

```bash
sudo ss -tulpn | grep named

```

---

## Verify BIND Installation

```bash
sudo apt list --installed | grep bind9

```

---

## Configure BIND as Recursive Resolver

Edit:

```bash
sudo nano /etc/bind/named.conf.options

```

Ensure:

```
options {
    directory "/var/cache/bind";
    allow-query { 192.168.10.0/24; localhost; };
    recursion yes;
    forwarders { };
    listen-on { 127.0.0.1; 192.168.10.148; };
    listen-on-v6 { none; };
    dnssec-validation auto;
    auth-nxdomain no;
};

```

Check root hints:

```bash
ls /usr/share/dns/root.hints

```

Run config check:

```bash
sudo named-checkconf

```

Restart BIND:

```bash
sudo systemctl restart bind9
sudo systemctl enable bind9

```

Test recursion:

```bash
dig @127.0.0.1 google.com

```

---

# Configure Client VM to Use Your DNS Server

Your DNS server: **192.168.10.148**

Your hostname: **emaduzzaman-dns**

## Check Current DNS

```bash
resolvectl status

```

## Configure systemd-resolved to Use Your DNS

Set DNS for interface (replace *ens3* if needed):

```bash
sudo resolvectl dns ens3 192.168.10.148
sudo resolvectl domain ens3 picocloud.test

```

Restart systemd-resolved:

```bash
sudo systemctl restart systemd-resolved

```

Check again:

```bash
resolvectl status

```

---

## Test Resolution

```bash
dig @127.0.0.53 google.com +short
dig @127.0.0.53 ubuntu.com +short

```

Test DNSSEC:

```bash
dig +dnssec cloudflare.com @127.0.0.53
dig +dnssec dnssec-failed.org @127.0.0.53

```

---

## Optional: Revert Changes

Remove upstream DNS from resolved.conf:

```bash
sudo sed -i '/^DNS=/d' /etc/systemd/resolved.conf
sudo systemctl restart systemd-resolved

```

Revert per-interface DNS:

```bash
sudo resolvectl revert ens3

```