# Site-to-Site VPN Configuration

A comprehensive guide to configuring IPSec Site-to-Site VPN between two branch offices using Cisco routers.

---

## Table of Contents

- [Network Overview](#network-overview)
- [Network Topology](#network-topology)
- [Initial Configuration](#initial-configuration)
- [NAT Configuration](#nat-configuration)
- [VPN Configuration](#vpn-configuration)
- [Verification](#verification)
- [Summary](#summary)

---

## Network Overview

This project demonstrates a Site-to-Site VPN tunnel between two branch offices (BR and DC) connected through the internet via ISP routers.

### Network Details

**Branch Office (BR):**
- LAN Network: 172.16.1.0/24
- LAN Gateway: 172.16.1.1
- Public IP: 123.49.41.2/30
- ISP Connection: ISP1

**Data Center (DC):**
- LAN Network: 172.16.2.0/24
- LAN Gateway: 172.16.2.1
- Public IP: 182.160.97.2/30
- ISP Connection: ISP2

**ISP Network:**
- ISP1 AS: 100
- ISP2 AS: 200
- Upstream AS: 300

---

## Network Topology

```
[BR LAN]                                                [DC LAN]
172.16.1.0/24                                          172.16.2.0/24
     |                                                      |
     | F0/0                                                 | F0/0
     |                                                      |
  [BR Router]                                          [DC Router]
  172.16.1.1                                           172.16.2.1
     |                                                      |
     | F1/0                                                 | F1/0
     | 123.49.41.2/30                                       | 182.160.97.2/30
     |                                                      |
     |                                                      |
  [ISP1]                                                [ISP2]
  123.49.41.1/30                                       182.160.97.1/30
  AS 100                                               AS 200
     |                                                      |
     | S0/0/0                                               | S0/0/1
     | 5.5.5.2/30                                           | 7.7.7.2/30
     |                                                      |
     └──────────────────────────┐   ┌───────────────────────┘
                                |   |               
                              [Upstream]
                              AS 300
                              8.8.8.1/8
                              S0/0/0: 5.5.5.1/30
                              S0/0/1: 7.7.7.1/30
                                    |
                                    |
                                    |
                                [Internet]
                                 8.8.8.0/8
```

---

## Initial Configuration

### BR Router Configuration

```
Router>en
Router#conf t
Router(config)#hostname BR
BR(config)#int f0/0
BR(config-if)#ip address 172.16.1.1 255.255.255.0
BR(config-if)#no shut
BR(config-if)#exit
BR(config)#int f1/0
BR(config-if)#ip address 123.49.41.2 255.255.255.252
BR(config-if)#no shut
BR(config-if)#exit
```

### DC Router Configuration

```
Router>en
Router#conf t
Router(config)#hostname DC
DC(config)#int f0/0
DC(config-if)#ip address 172.16.2.1 255.255.255.0
DC(config-if)#no shut
DC(config-if)#exit
DC(config)#int f1/0
DC(config-if)#ip address 182.160.97.2 255.255.255.252
DC(config-if)#no shut
DC(config-if)#exit
```

### Upstream Router Configuration

```
Router>en
Router#conf t
Router(config)#hostname Upstream
Upstream(config)#int f0/0
Upstream(config-if)#ip address 8.8.8.1 255.0.0.0
Upstream(config-if)#no shut
Upstream(config-if)#exit
Upstream(config)#int s0/0/0
Upstream(config-if)#ip address 5.5.5.1 255.255.255.252
Upstream(config-if)#no sh
Upstream(config-if)#exit
Upstream(config)#int s0/0/1
Upstream(config-if)#ip address 7.7.7.1 255.255.255.252
Upstream(config-if)#no sh
Upstream(config-if)#exit
```

### ISP1 Router Configuration

```
Router>en
Router#conf t
Router(config)#hostname ISP1
ISP1(config)#int f1/0
ISP1(config-if)#ip address 123.49.41.1 255.255.255.252
ISP1(config-if)#no shut
ISP1(config-if)#exit
ISP1(config)#int s0/0/0
ISP1(config-if)#ip add 5.5.5.2 255.255.255.252
ISP1(config-if)#no sh
ISP1(config-if)#exit
```

### ISP2 Router Configuration

```
Router>en
Router#conf t
Router(config)#hostname ISP2
ISP2(config)#int fa1/0
ISP2(config-if)#ip address 182.160.97.1 255.255.255.252
ISP2(config-if)#no shut
ISP2(config-if)#exit
ISP2(config)#int s0/0/1
ISP2(config-if)#ip address 7.7.7.2 255.255.255.252
ISP2(config-if)#no sh
ISP2(config-if)#exit
```

### ISP1 - Block Private IP Addresses

```
ISP1(config)#ip access-list standard Block-Private
ISP1(config-std-nacl)#deny 10.0.0.0 0.255.255.255
ISP1(config-std-nacl)#deny 172.16.0.0 0.15.255.255
ISP1(config-std-nacl)#deny 192.168.0.0 0.0.255.255
ISP1(config-std-nacl)#permit any
ISP1(config-std-nacl)#exit
ISP1(config)#int f1/0
ISP1(config-if)#ip access-group Block-Private in
ISP1(config-if)#exit
```

### ISP2 - Block Private IP Addresses

```
ISP2(config)#ip access-list standard Block-Private
ISP2(config-std-nacl)#deny 10.0.0.0 0.255.255.255
ISP2(config-std-nacl)#deny 172.16.0.0 0.15.255.255
ISP2(config-std-nacl)#deny 192.168.0.0 0.0.255.255
ISP2(config-std-nacl)#permit any
ISP2(config-std-nacl)#exit
ISP2(config)#int f1/0
ISP2(config-if)#ip access-group Block-Private in
ISP2(config-if)#exit
```

### BGP Configuration - ISP1

```
ISP1(config)#router bgp 100
ISP1(config-router)#neighbor 5.5.5.1 remote-as 300
ISP1(config-router)#network 123.49.41.0 mask 255.255.255.252
ISP1(config-router)#exit
```

### BGP Configuration - Upstream

```
Upstream(config)#router bgp 300
Upstream(config-router)#neighbor 5.5.5.2 remote-as 100
Upstream(config-router)#network 8.8.8.0 mask 255.0.0.0
Upstream(config-router)#neighbor 7.7.7.2 remote-as 200
Upstream(config-router)#exit
```

### BGP Configuration - ISP2

```
ISP2(config)#router bgp 200
ISP2(config-router)#neighbor 7.7.7.1 remote-as 300
ISP2(config-router)#network 182.160.97.0 mask 255.255.255.252
ISP2(config-router)#exit
```

---

## NAT Configuration

### BR Router - Default Route and NAT

```
BR(config)#ip route 0.0.0.0 0.0.0.0 123.49.41.1
BR(config)#ip access-list extended NAT-SOURCE
BR(config-ext-nacl)#permit ip 172.16.1.0 0.0.0.255 any
BR(config-ext-nacl)#exit
BR(config)#ip nat inside source list NAT-SOURCE interface f1/0 overload
BR(config)#int f0/0
BR(config-if)#ip nat inside
BR(config-if)#exit
BR(config)#int f1/0
BR(config-if)#ip nat outside
BR(config-if)#exit
```

### DC Router - Default Route and NAT

```
DC(config)#ip route 0.0.0.0 0.0.0.0 182.160.97.1
DC(config)#ip access-list extended NAT-SOURCE
DC(config-ext-nacl)#permit ip 172.16.2.0 0.0.0.255 any
DC(config-ext-nacl)#exit
DC(config)#ip nat inside source list NAT-SOURCE interface f1/0 overload
DC(config)#int f0/0
DC(config-if)#ip nat inside
DC(config-if)#exit
DC(config)#int f1/0
DC(config-if)#ip nat outside
DC(config-if)#exit
```

---

## VPN Configuration

### Step 1: Modify NAT Source ACL

**Purpose:** Exclude VPN traffic from NAT translation

**BR Router:**

```
BR(config)#ip access-list extended NAT-SOURCE
BR(config-ext-nacl)#5 deny ip 172.16.1.0 0.0.0.255 172.16.2.0 0.0.0.255
BR(config-ext-nacl)#exit
```

**DC Router:**

```
DC(config)#ip access-list extended NAT-SOURCE
DC(config-ext-nacl)#5 deny ip 172.16.2.0 0.0.0.255 172.16.1.0 0.0.0.255
DC(config-ext-nacl)#exit
```

### Step 2: Define Interesting Traffic

**Purpose:** Identify traffic that should trigger the VPN tunnel

**BR Router:**

```
BR(config)#ip access-list extended BR-Interesting-Traffic
BR(config-ext-nacl)#permit ip 172.16.1.0 0.0.0.255 172.16.2.0 0.0.0.255
BR(config-ext-nacl)#exit
```

**DC Router:**

```
DC(config)#ip access-list extended DC-Interesting-Traffic
DC(config-ext-nacl)#permit ip 172.16.2.0 0.0.0.255 172.16.1.0 0.0.0.255
DC(config-ext-nacl)#exit
```

### Step 3: Configure ISAKMP Phase 1 Parameters

**Purpose:** Establish IKE security association for key exchange

**BR Router:**

```
BR(config)#crypto isakmp policy 1 
BR(config-isakmp)#authentication pre-share 
BR(config-isakmp)#encryption aes
BR(config-isakmp)#group 5
BR(config-isakmp)#hash sha 
BR(config-isakmp)#exit
BR(config)#crypto isakmp key cricket address 182.160.97.2
```

**DC Router:**

```
DC(config)#crypto isakmp policy 1
DC(config-isakmp)#authentication pre-share
DC(config-isakmp)#encryption aes
DC(config-isakmp)#group 5
DC(config-isakmp)#hash sha
DC(config-isakmp)#exit
DC(config)#crypto isakmp key cricket address 123.49.41.2
```

**Phase 1 Parameters Explanation:**
- Authentication: Pre-shared key (PSK)
- Encryption: AES
- DH Group: 5 (1536-bit)
- Hash: SHA-1
- Pre-shared Key: "cricket"

### Step 4: Configure ISAKMP Phase 2 Parameters

**Purpose:** Define IPSec transform set for data encryption

**BR Router:**

```
BR(config)#crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac
```

**DC Router:**

```
DC(config)#crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac
```

**Phase 2 Parameters Explanation:**
- ESP Encryption: AES
- ESP Authentication: SHA-HMAC

### Step 5: Create the Crypto Map

**Purpose:** Bind all VPN parameters together

**BR Router:**

```
BR(config)#crypto map VPN-MAP 1 ipsec-isakmp 
BR(config-crypto-map)#match address BR-Interesting-Traffic
BR(config-crypto-map)#set peer 182.160.97.2
BR(config-crypto-map)#set transform-set VPN-SET
BR(config-crypto-map)#exit
```

**DC Router:**

```
DC(config)#crypto map VPN-MAP 1 ipsec-isakmp 
DC(config-crypto-map)#match address DC-Interesting-Traffic
DC(config-crypto-map)#set peer 123.49.41.2
DC(config-crypto-map)#set transform-set VPN-SET
DC(config-crypto-map)#exit
```

### Step 6: Apply Crypto Map

**Purpose:** Activate VPN on the outside interface

**BR Router:**

```
BR(config)#int f1/0
BR(config-if)#crypto map VPN-MAP
BR(config-if)#exit
```

**DC Router:**

```
DC(config)#int f1/0
DC(config-if)#crypto map VPN-MAP
DC(config-if)#exit
```

---

## Verification

### Verify ISAKMP Phase 1

```
BR#show crypto isakmp sa
DC#show crypto isakmp sa
```

**Expected Output:**
- State: QM_IDLE (Phase 1 complete)

### Verify IPSec Phase 2

```
BR#show crypto ipsec sa
DC#show crypto ipsec sa
```

**Expected Output:**
- Encaps/Decaps counters incrementing
- SA status: ACTIVE

### Verify VPN Tunnel Status

```
BR#show crypto session
DC#show crypto session
```

### Test Connectivity

**From BR LAN to DC LAN:**

```
BR-PC>ping 172.16.2.1
```

**From DC LAN to BR LAN:**

```
DC-PC>ping 172.16.1.1
```

### Verify NAT Exemption

```
BR#show ip nat translations
DC#show ip nat translations
```

**Expected:** VPN traffic (172.16.1.0 to 172.16.2.0) should NOT appear in NAT table

---