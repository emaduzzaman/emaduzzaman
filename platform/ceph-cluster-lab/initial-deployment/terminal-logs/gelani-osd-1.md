```
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.105
ubuntu@192.168.95.105's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Jan 27 12:45:31 UTC 2026

  System load:  0.82              Processes:             133
  Usage of /:   7.6% of 28.89GB   Users logged in:       1
  Memory usage: 5%                IPv4 address for ens3: 192.168.95.105
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

98 updates can be applied immediately.
77 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


*** System restart required ***
Last login: Tue Jan 27 12:43:54 2026 from 192.168.95.86
ubuntu@gelani-osd-1:~$ sudo apt update && sudo apt upgrade -y
Hit:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease                                  
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease
Hit:4 http://security.ubuntu.com/ubuntu jammy-security InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)      
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Waiting for cache lock: Could not get lock /var/lib/dpkg/lock-frontend. It is held by process 1958 (apt)       
Reading package lists... Done                                                                           
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-osd-1:~$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0     7:0    0 63.8M  1 loop /snap/core20/2599
loop1     7:1    0 89.4M  1 loop /snap/lxd/31333
loop2     7:2    0 50.9M  1 loop /snap/snapd/24718
vda     252:0    0   30G  0 disk 
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part 
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0   30G  0 disk 
vdc     252:32   0   30G  0 disk 
vdd     252:48   0   30G  0 disk 
ubuntu@gelani-osd-1:~$ 


emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.105
ubuntu@192.168.95.105's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Jan 28 04:53:09 UTC 2026

  System load:  0.0               Processes:             116
  Usage of /:   7.8% of 28.89GB   Users logged in:       1
  Memory usage: 4%                IPv4 address for ens3: 192.168.95.105
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


*** System restart required ***
Last login: Wed Jan 28 04:15:49 2026 from 192.168.95.86
ubuntu@gelani-osd-1:~$ hostnamectl --static
gelani-osd-1
ubuntu@gelani-osd-1:~$ hostnamectl --static
gelani-osd-1
ubuntu@gelani-osd-1:~$ sudo hostnamectl set-hostname gelani-osd-1
ubuntu@gelani-osd-1:~$ hostnamectl --static
gelani-osd-1
ubuntu@gelani-osd-1:~$ sudo tee -a /etc/hosts >/dev/null <<'EOF'

# Ceph lab nodes (private)
192.168.95.19   gelani-mon-1
192.168.95.240  gelani-mon-2
192.168.95.221  gelani-mon-3
192.168.95.105  gelani-osd-1
192.168.95.250  gelani-osd-2
EOF
ubuntu@gelani-osd-1:~$ getent hosts gelani-mon-1 gelani-mon-2 gelani-mon-3 gelani-osd-1 gelani-osd-2
192.168.95.19   gelani-mon-1
192.168.95.240  gelani-mon-2
192.168.95.221  gelani-mon-3
192.168.95.105  gelani-osd-1
192.168.95.250  gelani-osd-2
ubuntu@gelani-osd-1:~$ sudo apt update && sudo apt -y upgrade && sudo apt -y install chrony curl gnupg lsb-release ca-certificates vim nano jq
Hit:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:3 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [3,165 kB]
Get:6 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [2,905 kB]
Get:7 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [19.2 kB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [14.1 kB]
Fetched 6,487 kB in 4s (1,600 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following packages will be upgraded:
  libssl3 openssl
2 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
2 standard LTS security updates
Need to get 3,089 kB of archives.
After this operation, 1,024 B of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssl3 amd64 3.0.2-0ubuntu1.21 [1,905 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.21 [1,184 kB]
Fetched 3,089 kB in 4s (727 kB/s)
Preconfiguring packages ...
(Reading database ... 94196 files and directories currently installed.)
Preparing to unpack .../libssl3_3.0.2-0ubuntu1.21_amd64.deb ...
Unpacking libssl3:amd64 (3.0.2-0ubuntu1.21) over (3.0.2-0ubuntu1.20) ...
Setting up libssl3:amd64 (3.0.2-0ubuntu1.21) ...
(Reading database ... 94196 files and directories currently installed.)
Preparing to unpack .../openssl_3.0.2-0ubuntu1.21_amd64.deb ...
Unpacking openssl (3.0.2-0ubuntu1.21) over (3.0.2-0ubuntu1.20) ...
Setting up openssl (3.0.2-0ubuntu1.21) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.12) ...
Scanning processes...
Scanning candidates...
Scanning linux images...

Restarting services...
 /etc/needrestart/restart.d/systemd-manager
 systemctl restart packagekit.service ssh.service systemd-journald.service systemd-networkd.service systemd-resolved.service systemd-timesyncd.service systemd-udevd.service
Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart getty@tty1.service
 systemctl restart networkd-dispatcher.service
 systemctl restart systemd-logind.service
 systemctl restart unattended-upgrades.service
 systemctl restart user@1000.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
lsb-release is already the newest version (11.1.0ubuntu4).
lsb-release set to manually installed.
ca-certificates is already the newest version (20240203~22.04.1).
ca-certificates set to manually installed.
curl is already the newest version (7.81.0-1ubuntu1.21).
curl set to manually installed.
gnupg is already the newest version (2.2.27-3ubuntu2.5).
gnupg set to manually installed.
nano is already the newest version (6.2-1ubuntu0.1).
nano set to manually installed.
vim is already the newest version (2:8.2.3995-1ubuntu2.24).
vim set to manually installed.
The following additional packages will be installed:
  libjq1 libonig5
The following packages will be REMOVED:
  systemd-timesyncd
The following NEW packages will be installed:
  chrony jq libjq1 libonig5
0 upgraded, 4 newly installed, 1 to remove and 0 not upgraded.
Need to get 647 kB of archives.
After this operation, 1,448 kB of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 chrony amd64 4.2-2ubuntu2 [290 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libonig5 amd64 6.9.7.1-2build1 [172 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libjq1 amd64 1.6-2.1ubuntu3.1 [133 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 jq amd64 1.6-2.1ubuntu3.1 [52.5 kB]
Fetched 647 kB in 4s (146 kB/s)
(Reading database ... 94196 files and directories currently installed.)
Removing systemd-timesyncd (249.11-0ubuntu3.17) ...
Selecting previously unselected package chrony.
(Reading database ... 94182 files and directories currently installed.)
Preparing to unpack .../chrony_4.2-2ubuntu2_amd64.deb ...
Unpacking chrony (4.2-2ubuntu2) ...
Selecting previously unselected package libonig5:amd64.
Preparing to unpack .../libonig5_6.9.7.1-2build1_amd64.deb ...
Unpacking libonig5:amd64 (6.9.7.1-2build1) ...
Selecting previously unselected package libjq1:amd64.
Preparing to unpack .../libjq1_1.6-2.1ubuntu3.1_amd64.deb ...
Unpacking libjq1:amd64 (1.6-2.1ubuntu3.1) ...
Selecting previously unselected package jq.
Preparing to unpack .../jq_1.6-2.1ubuntu3.1_amd64.deb ...
Unpacking jq (1.6-2.1ubuntu3.1) ...
Setting up chrony (4.2-2ubuntu2) ...

Creating config file /etc/chrony/chrony.conf with new version

Creating config file /etc/chrony/chrony.keys with new version
dpkg-statoverride: warning: --update given but /var/log/chrony does not exist
Created symlink /etc/systemd/system/chronyd.service → /lib/systemd/system/chrony.service.
Created symlink /etc/systemd/system/multi-user.target.wants/chrony.service → /lib/systemd/system/chrony.service.
Setting up libonig5:amd64 (6.9.7.1-2build1) ...
Setting up libjq1:amd64 (1.6-2.1ubuntu3.1) ...
Setting up jq (1.6-2.1ubuntu3.1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for dbus (1.12.20-2ubuntu4.1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.12) ...
Scanning processes...
Scanning candidates...
Scanning linux images...

Restarting services...
Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart getty@tty1.service
 systemctl restart networkd-dispatcher.service
 systemctl restart systemd-logind.service
 systemctl restart unattended-upgrades.service
 systemctl restart user@1000.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@gelani-osd-1:~$ sudo systemctl enable --now chrony && chronyc tracking
Synchronizing state of chrony.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable chrony
Reference ID    : 67BA76DB (103.186.118.219)
Stratum         : 3
Ref time (UTC)  : Wed Jan 28 05:07:08 2026
System time     : 0.002110885 seconds slow of NTP time
Last offset     : -0.002321950 seconds
RMS offset      : 0.002321950 seconds
Frequency       : 5.609 ppm slow
Residual freq   : +13.747 ppm
Skew            : 1000000.000 ppm
Root delay      : 0.147922873 seconds
Root dispersion : 41.135047913 seconds
Update interval : 65.2 seconds
Leap status     : Normal
ubuntu@gelani-osd-1:~$ sudo swapoff -a &&  sudo sed -i.bak '/\sswap\s/ s/^/#/' /etc/fstab && free -h | grep -i swap
Swap:             0B          0B          0B
ubuntu@gelani-osd-1:~$ lsblk -f
NAME    FSTYPE   FSVER LABEL           UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop0   squashfs 4.0                                                              0   100% /snap/core20/2599
loop1   squashfs 4.0                                                              0   100% /snap/lxd/31333
loop2   squashfs 4.0                                                              0   100% /snap/snapd/24718
loop3                                                                             0   100% /snap/core20/2686
loop4                                                                             0   100% /snap/lxd/36918
vda
├─vda1  ext4     1.0   cloudimg-rootfs 9686db4d-2c4c-4029-a6ea-ca7b8bae111c   26.6G     8% /
├─vda14
└─vda15 vfat     FAT32 UEFI            F76C-DD6B                              98.3M     6% /boot/efi
vdb
vdc
vdd
ubuntu@gelani-osd-1:~$ sudo wipefs -n /dev/vdb /dev/vdc /dev/vdd
ubuntu@gelani-osd-1:~$ echo "== $(hostname) ==";
ip -br a | grep -E 'UP|UNKNOWN' | head -n 2;
chronyc tracking | head -n 5;
free -h | grep -i swap
== gelani-osd-1 ==
lo               UNKNOWN        127.0.0.1/8 ::1/128
ens3             UP             192.168.95.105/24 metric 100 fe80::f816:3eff:fe71:93d7/64
Reference ID    : 67BA76DB (103.186.118.219)
Stratum         : 3
Ref time (UTC)  : Wed Jan 28 05:12:33 2026
System time     : 0.000442967 seconds fast of NTP time
Last offset     : -0.000016014 seconds
Swap:             0B          0B          0B
ubuntu@gelani-osd-1:~$ hostname; lsblk; lsblk -f; sudo wipefs -n /dev/vdb /dev/vdc /dev/vdd
gelani-osd-1
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0     7:0    0 63.8M  1 loop /snap/core20/2599
loop1     7:1    0 89.4M  1 loop /snap/lxd/31333
loop2     7:2    0 50.9M  1 loop /snap/snapd/24718
loop3     7:3    0 63.8M  1 loop /snap/core20/2686
loop4     7:4    0 91.4M  1 loop /snap/lxd/36918
vda     252:0    0   30G  0 disk
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0   30G  0 disk
vdc     252:32   0   30G  0 disk
vdd     252:48   0   30G  0 disk
NAME    FSTYPE   FSVER LABEL           UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop0   squashfs 4.0                                                              0   100% /snap/core20/2599
loop1   squashfs 4.0                                                              0   100% /snap/lxd/31333
loop2   squashfs 4.0                                                              0   100% /snap/snapd/24718
loop3                                                                             0   100% /snap/core20/2686
loop4                                                                             0   100% /snap/lxd/36918
vda
├─vda1  ext4     1.0   cloudimg-rootfs 9686db4d-2c4c-4029-a6ea-ca7b8bae111c   26.6G     8% /
├─vda14
└─vda15 vfat     FAT32 UEFI            F76C-DD6B                              98.3M     6% /boot/efi
vdb
vdc
vdd
ubuntu@gelani-osd-1:~$ hostname; lsblk; lsblk -f; sudo wipefs -n /dev/vdb /dev/vdc /dev/vdd
gelani-osd-1
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0     7:0    0 63.8M  1 loop /snap/core20/2599
loop1     7:1    0 89.4M  1 loop /snap/lxd/31333
loop2     7:2    0 50.9M  1 loop /snap/snapd/24718
loop3     7:3    0 63.8M  1 loop /snap/core20/2686
loop4     7:4    0 91.4M  1 loop /snap/lxd/36918
vda     252:0    0   30G  0 disk
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0   30G  0 disk
vdc     252:32   0   30G  0 disk
vdd     252:48   0   30G  0 disk
NAME    FSTYPE   FSVER LABEL           UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
loop0   squashfs 4.0                                                              0   100% /snap/core20/2599
loop1   squashfs 4.0                                                              0   100% /snap/lxd/31333
loop2   squashfs 4.0                                                              0   100% /snap/snapd/24718
loop3                                                                             0   100% /snap/core20/2686
loop4                                                                             0   100% /snap/lxd/36918
vda
├─vda1  ext4     1.0   cloudimg-rootfs 9686db4d-2c4c-4029-a6ea-ca7b8bae111c   26.6G     8% /
├─vda14
└─vda15 vfat     FAT32 UEFI            F76C-DD6B                              98.3M     6% /boot/efi
vdb
vdc
vdd
ubuntu@gelani-osd-1:~$
ubuntu@gelani-osd-1:~$ sudo ufw status
Status: inactive
ubuntu@gelani-osd-1:~$


ubuntu@gelani-osd-1:~$ sudo reboot
Connection to 192.168.95.105 closed by remote host.
Connection to 192.168.95.105 closed.
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.105
ubuntu@192.168.95.105's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Jan 28 05:49:42 UTC 2026

  System load:  0.49              Processes:             125
  Usage of /:   7.7% of 28.89GB   Users logged in:       0
  Memory usage: 2%                IPv4 address for ens3: 192.168.95.105
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Wed Jan 28 04:53:09 2026 from 192.168.95.86
ubuntu@gelani-osd-1:~$ hostname && uptime && systemctl is-active chrony &&  free -h | grep -i swap
gelani-osd-1
 05:50:54 up 1 min,  1 user,  load average: 0.15, 0.12, 0.05
active
Swap:             0B          0B          0B
ubuntu@gelani-osd-1:~$

ubuntu@gelani-osd-1:~$ hostname; uptime; systemctl is-active chrony; free -h | grep -i swap; lsblk
gelani-osd-1
 05:54:34 up 5 min,  1 user,  load average: 0.06, 0.07, 0.03
active
Swap:             0B          0B          0B
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0     7:0    0 63.8M  1 loop /snap/core20/2599
loop1     7:1    0 63.8M  1 loop /snap/core20/2686
loop2     7:2    0 89.4M  1 loop /snap/lxd/31333
loop3     7:3    0 91.4M  1 loop /snap/lxd/36918
loop4     7:4    0 50.9M  1 loop /snap/snapd/24718
vda     252:0    0   30G  0 disk
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0   30G  0 disk
vdc     252:32   0   30G  0 disk
vdd     252:48   0   30G  0 disk
ubuntu@gelani-osd-1:~$ sudo apt update
sudo apt install -y docker.io
sudo systemctl enable --now docker
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Fetched 384 kB in 2s (161 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  bridge-utils containerd dns-root-data dnsmasq-base pigz runc ubuntu-fan
Suggested packages:
  ifupdown aufs-tools cgroupfs-mount | cgroup-lite debootstrap docker-buildx docker-compose-v2 docker-doc rinse zfs-fuse | zfsutils
The following NEW packages will be installed:
  bridge-utils containerd dns-root-data dnsmasq-base docker.io pigz runc ubuntu-fan
0 upgraded, 8 newly installed, 0 to remove and 0 not upgraded.
Need to get 76.3 MB of archives.
After this operation, 289 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 pigz amd64 2.6-1 [63.6 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 bridge-utils amd64 1.7-1ubuntu3 [34.4 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 runc amd64 1.3.3-0ubuntu1~22.04.3 [8,857 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 containerd amd64 1.7.28-0ubuntu1~22.04.1 [38.5 MB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dns-root-data all 2024071801~ubuntu0.22.04.1 [6,132 B]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dnsmasq-base amd64 2.90-0ubuntu0.22.04.1 [374 kB]
Get:7 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 docker.io amd64 28.2.2-0ubuntu1~22.04.1 [28.4 MB]
Get:8 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 ubuntu-fan all 0.12.16 [35.2 kB]
Fetched 76.3 MB in 9s (8,125 kB/s)
Preconfiguring packages ...
Selecting previously unselected package pigz.
(Reading database ... 94256 files and directories currently installed.)
Preparing to unpack .../0-pigz_2.6-1_amd64.deb ...
Unpacking pigz (2.6-1) ...
Selecting previously unselected package bridge-utils.
Preparing to unpack .../1-bridge-utils_1.7-1ubuntu3_amd64.deb ...
Unpacking bridge-utils (1.7-1ubuntu3) ...
Selecting previously unselected package runc.
Preparing to unpack .../2-runc_1.3.3-0ubuntu1~22.04.3_amd64.deb ...
Unpacking runc (1.3.3-0ubuntu1~22.04.3) ...
Selecting previously unselected package containerd.
Preparing to unpack .../3-containerd_1.7.28-0ubuntu1~22.04.1_amd64.deb ...
Unpacking containerd (1.7.28-0ubuntu1~22.04.1) ...
Selecting previously unselected package dns-root-data.
Preparing to unpack .../4-dns-root-data_2024071801~ubuntu0.22.04.1_all.deb ...
Unpacking dns-root-data (2024071801~ubuntu0.22.04.1) ...
Selecting previously unselected package dnsmasq-base.
Preparing to unpack .../5-dnsmasq-base_2.90-0ubuntu0.22.04.1_amd64.deb ...
Unpacking dnsmasq-base (2.90-0ubuntu0.22.04.1) ...
Selecting previously unselected package docker.io.
Preparing to unpack .../6-docker.io_28.2.2-0ubuntu1~22.04.1_amd64.deb ...
Unpacking docker.io (28.2.2-0ubuntu1~22.04.1) ...
Selecting previously unselected package ubuntu-fan.
Preparing to unpack .../7-ubuntu-fan_0.12.16_all.deb ...
Unpacking ubuntu-fan (0.12.16) ...
Setting up dnsmasq-base (2.90-0ubuntu0.22.04.1) ...
Setting up runc (1.3.3-0ubuntu1~22.04.3) ...
Setting up dns-root-data (2024071801~ubuntu0.22.04.1) ...
Setting up bridge-utils (1.7-1ubuntu3) ...
Setting up pigz (2.6-1) ...
Setting up containerd (1.7.28-0ubuntu1~22.04.1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/containerd.service → /lib/systemd/system/containerd.service.
Setting up ubuntu-fan (0.12.16) ...
Created symlink /etc/systemd/system/multi-user.target.wants/ubuntu-fan.service → /lib/systemd/system/ubuntu-fan.service.
Setting up docker.io (28.2.2-0ubuntu1~22.04.1) ...
Adding group `docker' (GID 122) ...
Done.
Created symlink /etc/systemd/system/multi-user.target.wants/docker.service → /lib/systemd/system/docker.service.
Created symlink /etc/systemd/system/sockets.target.wants/docker.socket → /lib/systemd/system/docker.socket.
Processing triggers for dbus (1.12.20-2ubuntu4.1) ...
Processing triggers for man-db (2.10.2-1) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@gelani-osd-1:~$ docker --version
systemctl is-active docker
Docker version 28.2.2, build 28.2.2-0ubuntu1~22.04.1
active
ubuntu@gelani-osd-1:~$


```