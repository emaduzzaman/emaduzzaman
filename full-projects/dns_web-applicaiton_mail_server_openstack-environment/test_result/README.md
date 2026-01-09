# Test Results

This folder contains verification results for the internal mail server **mail.gelani.com** running on the local network.  
The tests were performed from client machine **PC-1** to confirm connectivity, DNS resolution, and web access.

---

## Video Demonstration (Live Test)

A full screen-recorded demo of these tests is available here:

▶ **Watch the test video:**  
https://youtu.be/fT2w8vPYR8E  

---

## Test Machine

**Client:** PC-1  
**Operating System:** Windows 10  
**IPv4 Address:** `192.168.20.13`  
**Default Gateway:** `192.168.20.1`  

**Mail Server:** `mail.gelani.com`  
**Resolved IP:** `192.168.20.15`

---

## Test Evidence

### Network Configuration (PC-1)
Shows IP address, subnet mask, and gateway of the test machine.

Click to view:  
[pc-1_ss1_network_config.png](pc-1_ss1_network_config.png)

---

### Mail Server Web Access
Confirms that the mail server web interface is accessible in the browser.

Click to view:  
[pc-1_ss2_webmail_access.png](pc-1_ss2_webmail_access.png)

---

### Ping Test to mail.gelani.com
Confirms DNS resolution and network connectivity to the mail server.

Results:
- IP resolved: `192.168.20.15`
- 0% packet loss
- Average response ≈ 2ms

Click to view:  
[pc-1_ss3_ping_test.png](pc-1_ss3_ping_test.png)

---