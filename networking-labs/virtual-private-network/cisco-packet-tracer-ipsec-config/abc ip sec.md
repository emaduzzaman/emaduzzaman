# Configuring Site-to-Site VPN

## 1. Initial Configuration

### BR Router

```bash
en
conf t
hostname BR
int f0/0
ip address 172.16.1.1 255.255.255.0
no shut
int f1/0
ip address 123.49.41.2 255.255.255.252
no shut
ip route 0.0.0.0 0.0.0.0 123.49.41.1
```

### DC Router

```bash
en
conf t
hostname DC
int f0/0
ip address 172.16.2.1 255.255.255.0
no shut
int f1/0
ip address 182.160.97.2 255.255.255.252
no shut
ip route 0.0.0.0 0.0.0.0 182.160.97.1
```

### Upstream Router

```bash
en
conf t
hostname Upstream
int f0/0
ip address 8.8.8.1 255.0.0.0
no shut
int s0/0/0
ip address 5.5.5.1 255.255.255.252
no shut
int s0/0/1
ip address 7.7.7.1 255.255.255.252
no shut
```

### ISP1 Router

```bash
en
conf t
hostname ISP1
int f1/0
ip address 123.49.41.1 255.255.255.252
no shut
int s0/0/0
ip address 5.5.5.2 255.255.255.252
no shut
ip access-list standard Block-Private
  deny 10.0.0.0 0.255.255.255
  deny 172.16.0.0 0.15.255.255
  deny 192.168.0.0 0.0.255.255
  permit any
int f1/0
ip access-group Block-Private in
router bgp 100
  neighbor 5.5.5.1 remote-as 300
  network 123.49.41.0 mask 255.255.255.252
```

### ISP2 Router

```bash
en
conf t
hostname ISP2
int fa1/0
ip address 182.160.97.1 255.255.255.252
no shut
int s0/0/1
ip address 7.7.7.2 255.255.255.252
no shut
ip access-list standard Block-Private
  deny 10.0.0.0 0.255.255.255
  deny 172.16.0.0 0.15.255.255
  deny 192.168.0.0 0.0.255.255
  permit any
int f1/0
ip access-group Block-Private in
router bgp 200
  neighbor 7.7.7.1 remote-as 300
  network 182.160.97.0 mask 255.255.255.252
```

---

## 2. Modify NAT Source ACL

### BR

```bash
ip access-list extended NAT-SOURCE
  5 deny ip 172.16.1.0 0.0.0.255 172.16.2.0 0.0.0.255
```

### DC

```bash
ip access-list extended NAT-SOURCE
  5 deny ip 172.16.2.0 0.0.0.255 172.16.1.0 0.0.0.255
```

---

## 3. Define Interesting Traffic

### BR

```bash
ip access-list extended BR-Interesting-Traffic
  permit ip 172.16.1.0 0.0.0.255 172.16.2.0 0.0.0.255
```

### DC

```bash
ip access-list extended DC-Interesting-Traffic
  permit ip 172.16.2.0 0.0.0.255 172.16.1.0 0.0.0.255
```

---

## 4. Configure ISAKMP Phase 1 Parameters

### BR

```bash
crypto isakmp policy 1
  authentication pre-share
  encryption aes
  group 5
  hash sha
crypto isakmp key cricket address 182.160.97.2
```

### DC

```bash
crypto isakmp policy 1
  authentication pre-share
  encryption aes
  group 5
  hash sha
crypto isakmp key cricket address 123.49.41.2
```

---

## 5. Configure ISAKMP Phase 2 Parameters

### BR & DC

```bash
crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac
```

---

## 6. Create the Crypto Map

### BR

```bash
crypto map VPN-MAP 1 ipsec-isakmp
  match address BR-Interesting-Traffic
  set peer 182.160.97.2
  set transform-set VPN-SET
```

### DC

```bash
crypto map VPN-MAP 1 ipsec-isakmp
  match address DC-Interesting-Traffic
  set peer 123.49.41.2
  set transform-set VPN-SET
```

---

## 7. Apply Crypto Map

### BR

```bash
int f1/0
crypto map VPN-MAP
```

### DC

```bash
int f1/0
crypto map VPN-MAP
```
