# DNS, Web Server and Mail Server in OpenStack - PICO Public Cloud Environment

## **Project Summary**

In this project, a full DNS setup (both recursive and authoritative), along with Web and Mail services using virtual hosts on one server, will be implemented using two virtual machines. A complete local service environment will be configured and tested to ensure proper name resolution, website hosting, and internal email functionality.

---
## Project Documentation Structure

The following files and directories provide detailed documentation, implementation steps, and verification evidence for this project:

- **[project_documentation.md](project-documentation.md)** – Main project documentation
- **[production-security-hardening-guide.md](production-security-hardening-guide.md)** – Security guidelines for production deployment
- **[cli-dns-lab.md](cli-dns-lab.md)** – Command-line history and actual implementation steps for DNS server
- **[cli-web-mail.md](cli-web-mail.md)** – Command-line history and actual implementation steps for Web/Mail server
- **[test_result-screenshots](test_result-screenshots/)** – Screenshots and validation evidence for Web/Mail server testing
- **[README.md](README.md)** – Brief summary of the project scope and overall implementation overview

## **1. DNS Server (BIND)**

BIND9 will be used to configure a DNS server that operates as both an authoritative DNS server and a recursive resolver.  
A zone file for **gelani.com** will be created, containing the necessary DNS records for proper operation.

### **DNS Records for gelani.com**

| Record Name | Type  | Value                                           |
|-------------|-------|-------------------------------------------------|
| ns1         | NS    | ns1.gelani.com                                  |
| ns1         | A     | `<gelani.com DNS server IP>`                    |
| @           | A     | `<gelani.com Web server IP>`                    |
| www         | CNAME | gelani.com                                      |
| mail        | A     | `<gelani.com Email server IP>`                  |
| mail        | MX    | Priority: 10, Value: mail.gelani.com            |
| @           | TXT   | "v=spf1 ip4:<gelani.com Email server IP> -all"  |

---

## **2. Web Server**

Nginx will be installed and configured on the Web+Email virtual machine using virtual hosting.  
A virtual host for **gelani.com** and **www.gelani.com** will be created and activated.  
The server will be tested to ensure that the website loads correctly and that DNS resolves the domain names properly within the network.

---

## **3. Mail Server**

A complete mail system will be deployed by installing and configuring the following components:

- **Postfix** for SMTP services  
- **Dovecot** for IMAP/POP3 services  
- **Roundcube** for webmail access  

Multiple users will be created, and local email functionality will be enabled to allow messages to be sent and received within the internal network.  
DNS records from the DNS server will support routing and delivery of mail between users and servers in the environment.

---

## **Project Documentation Structure**

The project repository contains the following documentation and resources:

- **project-documentation.md** – Main project documentation  
- **production-security-hardening-guide.md** – Security guidelines for production deployment  
- **cli-dns-lab.md** – Command-line history and actual implementation steps for the DNS server  
- **cli-web-mail.md** – Command-line history and actual implementation steps for the Web and Mail server  
- **test_result-screenshots/** – Screenshots and command-line output showing test results  
- **README.md** – Brief summary of the project scope and overall implementation overview  

---

## **Status**

This project provides a fully functional DNS, web hosting, and email communication setup within a controlled network environment for testing and demonstration.