'''

AllowedIPs = 10.0.0.0/24,
             192.168.95.0/24,
             192.168.110.0/24,
             172.30.30.0/24,
             172.30.31.0/24

AllowedIPs = 10.0.0.0/24, 192.168.95.0/24, 192.168.110.0/24, 172.30.30.0/24, 172.30.31.0/24

sysctl net.ipv4.ip_forward

sudo iptables -t nat -A POSTROUTING -o ens3 -s 10.0.0.0/24 -d 172.30.30.0/24 -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -o ens3 -s 10.0.0.0/24 -d 172.30.31.0/24 -j MASQUERADE
sudo iptables -t nat -L POSTROUTING -v -n

sudo iptables -I FORWARD -i wg0 -o ens3 -s 10.0.0.0/24 -d 172.30.30.0/24 -j ACCEPT
sudo iptables -I FORWARD -i ens3 -o wg0 -s 172.30.30.0/24 -d 10.0.0.0/24 -j ACCEPT

sudo iptables -I FORWARD -i wg0 -o ens3 -s 10.0.0.0/24 -d 172.30.31.0/24 -j ACCEPT
sudo iptables -I FORWARD -i ens3 -o wg0 -s 172.30.31.0/24 -d 10.0.0.0/24 -j ACCEPT


sudo iptables -L FORWARD -v -n

#restart wg
sudo wg-quick down wg0
sudo wg-quick up wg0
