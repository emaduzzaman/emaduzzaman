# DNS, Web, and Mail Server Tasks

## Task 1: DNS Server Setup

* Create two VMs: DNS and Web+Email.
* Configure the BIND DNS server to act as both authoritative DNS and Recursive DNS.
* Add your domain zone file (e.g., `youname.com`) to the DNS server with the following records:

| Record Name | Type  | Value                                              |
| ----------- | ----- | -------------------------------------------------- |
| ns1         | NS    | ns1.youname.com                                    |
| ns1         | A     | `<youname.com DNS server IP>`                      |
| @           | A     | `<youname.com Web server IP>`                      |
| www         | CNAME | youname.com                                        |
| mail        | A     | `<youname.com Email server IP>`                    |
| mail        | MX    | Priority: 10, Value: mail.youname.com              |
| @           | TXT   | "v=spf1 ip4:`<yourname.com Email server IP>` -all" |

* Add all team members’ zone files to your DNS server so that it contains all domains.
* Configure all servers to use your DNS server as a resolver. For testing, you may also use this DNS server as a resolver on your desktop.

## Task 2: Web Server Setup

* Configure Apache or Nginx on the Web server.
* Create a virtual host for yourdomain.com and alias `www.yourdomain.com` in the same virtual host.
* Verify that accessing `yourdomain.com` displays the web server correctly.

## Task 3: Mail Server Setup

* Install and configure the following:

  * SMTP/MTA: Postfix
  * IMAP/POP3: Dovecot
  * Webmail: Roundcube
* Ensure that email can be sent and received between all team members’ domains.
