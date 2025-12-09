# ================================
# Initial Configuration
# ================================

Sat Nov 1 15:59:40 2025   BR   Router>en
Sat Nov 1 15:59:41 2025   BR   Router#conf t
Sat Nov 1 15:59:44 2025   BR   Router(config)#hostname BR     ! Set router hostname
Sat Nov 1 16:00:17 2025   BR   BR(config)#int f0/0
Sat Nov 1 16:00:26 2025   BR   BR(config-if)#ip address 172.16.1.1 255.255.255.0   ! LAN interface IP
Sat Nov 1 16:00:28 2025   BR   BR(config-if)#no shut                               ! Enable interface

Sat Nov 1 16:01:14 2025   DC   Router>en
Sat Nov 1 16:01:15 2025   DC   Router#conf t
Sat Nov 1 16:01:18 2025   DC   Router(config)#hostname DC     ! Set router hostname
Sat Nov 1 16:01:21 2025   DC   DC(config)#int f0/0
Sat Nov 1 16:01:31 2025   DC   DC(config-if)#ip address 172.16.2.1 255.255.255.0   ! LAN interface IP
Sat Nov 1 16:01:32 2025   DC   DC(config-if)#no shut                               ! Enable interface

Sat Nov 1 16:02:39 2025   Upstream   Router>en
Sat Nov 1 16:02:40 2025   Upstream   Router#conf t
Sat Nov 1 16:02:46 2025   Upstream   Router(config)#hostname Upstream
Sat Nov 1 16:02:52 2025   Upstream   Upstream(config)#int f0/0
Sat Nov 1 16:02:59 2025   Upstream   Upstream(config-if)#ip address 8.8.8.1 255.0.0.0
Sat Nov 1 16:03:03 2025   Upstream   Upstream(config-if)#no shut

Sat Nov 1 16:04:06 2025   ISP1   Router>en
Sat Nov 1 16:04:08 2025   ISP1   Router#conf t
Sat Nov 1 16:04:17 2025   ISP1   Router(config)#hostname ISP1
Sat Nov 1 16:04:21 2025   ISP1   ISP1(config)#int f1/0
Sat Nov 1 16:04:30 2025   ISP1   ISP1(config-if)#ip address 123.49.41.1 255.255.255.252   ! WAN to BR
Sat Nov 1 16:04:32 2025   ISP1   ISP1(config-if)#no shut

Sat Nov 1 16:04:39 2025   BR   BR(config-if)#int f1/0
Sat Nov 1 16:04:46 2025   BR   BR(config-if)#ip address 123.49.41.2 255.255.255.252       ! WAN to ISP1
Sat Nov 1 16:04:48 2025   BR   BR(config-if)#no shut

Sat Nov 1 16:05:42 2025   ISP2   Router>en
Sat Nov 1 16:05:45 2025   ISP2   Router#conf t
Sat Nov 1 16:05:51 2025   ISP2   Router(config)#hostname ISP2
Sat Nov 1 16:06:08 2025   ISP2   ISP2(config)#int fa1/0
Sat Nov 1 16:06:15 2025   ISP2   ISP2(config-if)#ip address 182.160.97.1 255.255.255.252   ! WAN to DC
Sat Nov 1 16:06:17 2025   ISP2   ISP2(config-if)#no shut

Sat Nov 1 16:06:24 2025   DC   DC(config-if)#int f1/0
Sat Nov 1 16:06:32 2025   DC   DC(config-if)#ip address 182.160.97.2 255.255.255.252       ! WAN to ISP2
Sat Nov 1 16:06:34 2025   DC   DC(config-if)#no shut

# Serial Link Configurations
! Establish serial WAN links between ISP routers and upstream

Sat Nov 1 16:07:36 2025   Upstream   Upstream(config-if)#exit
Sat Nov 1 16:07:39 2025   Upstream   Upstream(config)#int s0/0/0
Sat Nov 1 16:07:48 2025   Upstream   Upstream(config-if)#ip address 5.5.5.1 255.255.255.252
Sat Nov 1 16:07:51 2025   Upstream   Upstream(config-if)#no sh

Sat Nov 1 16:08:00 2025   ISP1   ISP1(config-if)#int s0/0/0
Sat Nov 1 16:08:07 2025   ISP1   ISP1(config-if)#ip add 5.5.5.2 255.255.255.252
Sat Nov 1 16:08:09 2025   ISP1   ISP1(config-if)#no sh

Sat Nov 1 16:08:19 2025   Upstream   Upstream(config-if)#int s0/0/1
Sat Nov 1 16:08:30 2025   Upstream   Upstream(config-if)#ip address 7.7.7.1 255.255.255.252
Sat Nov 1 16:08:32 2025   Upstream   Upstream(config-if)#no sh

Sat Nov 1 16:08:38 2025   ISP2   ISP2(config-if)#int s0/0/1
Sat Nov 1 16:08:46 2025   ISP2   ISP2(config-if)#ip address 7.7.7.2 255.255.255.252
Sat Nov 1 16:08:48 2025   ISP2   ISP2(config-if)#no sh

# =====================================
# ACL to block private IPs at ISP edges
# =====================================

ISP1(config)#ip access-list standard Block-Private
ISP1(config-std-nacl)#deny 10.0.0.0 0.255.255.255
ISP1(config-std-nacl)#deny 172.16.0.0 0.15.255.255
ISP1(config-std-nacl)#deny 192.168.0.0 0.0.255.255
ISP1(config-std-nacl)#permit any          ! Allow public IPs

ISP2(config)#ip access-list standard Block-Private
ISP2(config-std-nacl)#deny 10.0.0.0 0.255.255.255
ISP2(config-std-nacl)#deny 172.16.0.0 0.15.255.255
ISP2(config-std-nacl)#deny 192.168.0.0 0.0.255.255
ISP2(config-std-nacl)#permit any

# Apply ACL to incoming WAN
ISP1(config)#int f1/0
ISP1(config-if)#ip access-group Block-Private in

ISP2(config)#int f1/0
ISP2(config-if)#ip access-group Block-Private in

# ========================
# Configure BGP Routing
# ========================

! ISP1 AS = 100
ISP1(config)#router bgp 100
ISP1(config-router)#neighbor 5.5.5.1 remote-as 300
ISP1(config-router)#network 123.49.41.0 mask 255.255.255.252

! Upstream AS = 300
Upstream(config-router)#router bgp 300
Upstream(config-router)#neighbor 5.5.5.2 remote-as 100
Upstream(config-router)#network 8.8.8.0 mask 255.0.0.0
Upstream(config-router)#neighbor 7.7.7.2 remote-as 200

! ISP2 AS = 200
ISP2(config)#router bgp 200
ISP2(config-router)#neighbor 7.7.7.1 remote-as 300
ISP2(config-router)#network 182.160.97.0 mask 255.255.255.252

# ============================
# Static Routes & NAT on BR/DC
# ============================

! BR default route
BR(config)#ip route 0.0.0.0 0.0.0.0 123.49.41.1

! NAT ACL
BR(config)#ip access-list extended NAT-SOURCE
BR(config-ext-nacl)#permit ip 172.16.1.0 0.0.0.255 any

! NAT overload (PAT)
BR(config)#ip nat inside source list NAT-SOURCE interface f1/0 overload

BR(config)#int f0/0
BR(config-if)#ip nat inside
BR(config)#int f1/0
BR(config-if)#ip nat outside

! DC same setup
DC(config)#ip route 0.0.0.0 0.0.0.0 182.160.97.1
DC(config)#ip access-list extended NAT-SOURCE
DC(config-ext-nacl)#permit ip 172.16.2.0 0.0.0.255 any
DC(config)#ip nat inside source list NAT-SOURCE interface f1/0 overload
DC(config)#int f0/0
DC(config-if)#ip nat inside
DC(config)#int f1/0
DC(config-if)#ip nat outside

# ====================================================
# 1. Modify NAT Source ACL — Exclude VPN traffic
# ====================================================

BR(config)#ip access-list extended NAT-SOURCE
BR(config-ext-nacl)#5 deny ip 172.16.1.0 0.0.0.255 172.16.2.0 0.0.0.255    ! Do NOT NAT VPN traffic

DC(config)#ip access-list extended NAT-SOURCE
DC(config-ext-nacl)#5 deny ip 172.16.2.0 0.0.0.255 172.16.1.0 0.0.0.255    ! Do NOT NAT VPN traffic

# ====================================================
# 2. Define Interesting Traffic (Traffic to Encrypt)
# ====================================================

BR(config)#ip access-list extended BR-Interesting-Traffic
BR(config-ext-nacl)#permit ip 172.16.1.0 0.0.0.255 172.16.2.0 0.0.0.255

DC(config)#ip access-list extended DC-Interesting-Traffic
DC(config-ext-nacl)#permit ip 172.16.2.0 0.0.0.255 172.16.1.0 0.0.0.255

# ====================================================
# 3. ISAKMP Phase 1 (IKE Phase 1) — Tunnel Negotiation
# ====================================================

BR(config)#crypto isakmp policy 1
BR(config-isakmp)#authentication pre-share   ! Use PSK
BR(config-isakmp)#encryption aes             ! AES encryption
BR(config-isakmp)#group 5                    ! DH Group 5
BR(config-isakmp)#hash sha                   ! SHA hashing
BR(config)#crypto isakmp key cricket address 182.160.97.2   ! Pre-shared key for DC

DC(config)#crypto isakmp policy 1
DC(config-isakmp)#authentication pre-share
DC(config-isakmp)#encryption aes
DC(config-isakmp)#group 5
DC(config-isakmp)#hash sha
DC(config)#crypto isakmp key cricket address 123.49.41.2     ! Pre-shared key for BR

# ====================================================
# 4. ISAKMP Phase 2 — IPSec Transform Set
# ====================================================

BR(config)#crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac
DC(config)#crypto ipsec transform-set VPN-SET esp-aes esp-sha-hmac

# ====================================================
# 5. Create Crypto Map (Bind Peer + ACL + Transform Set)
# ====================================================

BR(config)#crypto map VPN-MAP 1 ipsec-isakmp
BR(config-crypto-map)#match address BR-Interesting-Traffic
BR(config-crypto-map)#set peer 182.160.97.2
BR(config-crypto-map)#set transform-set VPN-SET

DC(config)#crypto map VPN-MAP 1 ipsec-isakmp
DC(config-crypto-map)#match address DC-Interesting-Traffic
DC(config-crypto-map)#set peer 123.49.41.2
DC(config-crypto-map)#set transform-set VPN-SET

# ======================
# 6. Apply Crypto Map
# ======================

BR(config)#int f1/0
BR(config-if)#crypto map VPN-MAP        ! Apply IPSec to WAN interface

DC(config)#int f1/0
DC(config-if)#crypto map VPN-MAP        ! Apply IPSec to WAN interface
