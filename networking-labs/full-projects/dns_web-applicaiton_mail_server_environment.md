# DNS, Web, and Mail Server Project  

## **Project Summary**

In this project, a full DNS setup (both recursive and authoritative), along with Web and Mail services using virtual hosts on one server, will be implemented using two virtual machines. A complete local service environment will be configured and tested to ensure proper name resolution, website hosting, and internal email functionality.

---

## **1. DNS Server (BIND)**

BIND9 will be used to configure a DNS server that operates as both an authoritative DNS server and a recursive resolver.  
A zone file for **gelani.com** will be created, containing A, NS, CNAME, MX, and SPF records.  
Zone files for all team members’ domains will also be added so that each domain resolves correctly within the network.  
All servers will be configured to use this DNS server as their primary resolver to support consistent and centralized name resolution.

---

## **2. Web Server**

Nginx will be installed and configured on the Web+Email virtual machine using virtual hosting.  
A virtual host for **gelani.com** and **www.gelani.com** will be created and activated.  
The server will be tested to ensure that the website loads correctly and responds as expected from within the network.

---

## **3. Mail Server**

A complete mail system will be deployed by installing and configuring the following components:

- **Postfix** for SMTP services  
- **Dovecot** for IMAP/POP3 services  
- **Roundcube** for webmail access  

Multiple users will be created, and local email functionality will be enabled to allow messages to be sent and received within the internal network.  
DNS records from the DNS server will support routing and delivery of mail between users and servers in the environment.

---

## **Status**

This project will provide a fully functional DNS, web hosting, and email communication setup within a controlled network environment for testing and demonstration.

