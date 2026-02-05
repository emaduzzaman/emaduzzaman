```
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ 

emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.19
ubuntu@192.168.95.19's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Jan 28 04:51:21 UTC 2026

  System load:  0.0               Processes:             98
  Usage of /:   4.5% of 38.58GB   Users logged in:       1
  Memory usage: 6%                IPv4 address for ens3: 192.168.95.19
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Wed Jan 28 04:14:47 2026 from 192.168.95.86
ubuntu@gelani-mon-1:~$ sudo hostnamectl set-hostname gelani-mon-1
ubuntu@gelani-mon-1:~$ hostnamectl
 Static hostname: gelani-mon-1
       Icon name: computer-vm
         Chassis: vm
      Machine ID: d0a08804c7aa4808b8e93ce9c8300048
         Boot ID: c2353c1908fe4112b4fe4df7aff0aae7
  Virtualization: kvm
Operating System: Ubuntu 22.04.5 LTS
          Kernel: Linux 5.15.0-143-generic
    Architecture: x86-64
 Hardware Vendor: OpenStack Foundation
  Hardware Model: OpenStack Nova
ubuntu@gelani-mon-1:~$ sudo hostnamectl set-hostname gelani-mon-1
ubuntu@gelani-mon-1:~$ hostnamectl --static
gelani-mon-1
ubuntu@gelani-mon-1:~$ sudo tee -a /etc/hosts >/dev/null <<'EOF'

# Ceph lab nodes (private)
192.168.95.19   gelani-mon-1
192.168.95.240  gelani-mon-2
192.168.95.221  gelani-mon-3
192.168.95.105  gelani-osd-1
192.168.95.250  gelani-osd-2
EOF
ubuntu@gelani-mon-1:~$ getent hosts gelani-mon-1 gelani-mon-2 gelani-mon-3 gelani-osd-1 gelani-osd-2
192.168.95.19   gelani-mon-1
192.168.95.240  gelani-mon-2
192.168.95.221  gelani-mon-3
192.168.95.105  gelani-osd-1
192.168.95.250  gelani-osd-2
ubuntu@gelani-mon-1:~$ sudo apt update && sudo apt -y upgrade && sudo apt -y install chrony curl gnupg lsb-release ca-certificates vim nano jq
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [2,905 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]
Get:7 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en [419 kB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [14.1 kB]
Get:9 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [4,883 kB]
Get:10 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe Translation-en [5,652 kB]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en [917 kB]
Get:12 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 c-n-f Metadata [652 B]
Get:13 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1,012 kB]
Get:14 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [222 kB]
Get:15 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [22.5 kB]
Get:16 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [51.1 kB]
Get:17 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [10.5 kB]
Get:18 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [376 B]
Get:19 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]
Get:20 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]
Get:21 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]
Get:22 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8,372 B]
Get:23 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [3,165 kB]
Get:24 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [486 kB]
Get:25 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [19.2 kB]
Get:26 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [5,110 kB]
Get:27 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [958 kB]
Get:28 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata [676 B]
Get:29 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1,249 kB]
Get:30 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [311 kB]
Get:31 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [30.1 kB]
Get:32 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [59.0 kB]
Get:33 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [13.5 kB]
Get:34 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [612 B]
Get:35 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [69.4 kB]
Get:36 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.5 kB]
Get:37 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [412 B]
Get:38 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]
Get:39 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [31.7 kB]
Get:40 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [16.9 kB]
Get:41 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [672 B]
Get:42 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]
Fetched 42.7 MB in 8s (5,283 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
94 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following NEW packages will be installed:
  linux-headers-5.15.0-164 linux-headers-5.15.0-164-generic linux-image-5.15.0-164-generic
  linux-modules-5.15.0-164-generic
The following packages will be upgraded:
  apparmor apport bind9-dnsutils bind9-host bind9-libs binutils binutils-common binutils-x86-64-linux-gnu
  cloud-init curl dirmngr distro-info-data dpkg gcc-12-base git git-man gnupg gnupg-l10n gnupg-utils gpg gpg-agent
  gpg-wks-client gpg-wks-server gpgconf gpgsm gpgv iputils-ping iputils-tracepath klibc-utils landscape-common
  libapparmor1 libbinutils libc-bin libc6 libctf-nobfd0 libctf0 libcurl3-gnutls libcurl4 libgcc-s1 libglib2.0-0
  libglib2.0-bin libglib2.0-data libgnutls30 libklibc libnss-systemd libpam-systemd libperl5.34 libpng16-16
  libpython3.10 libpython3.10-minimal libpython3.10-stdlib libsodium23 libsqlite3-0 libssh-4 libssl3 libstdc++6
  libsystemd0 libtasn1-6 libudev1 libudisks2-0 libxml2 libxslt1.1 linux-headers-generic linux-headers-virtual
  linux-image-virtual linux-virtual locales needrestart open-vm-tools openssl perl perl-base perl-modules-5.34
  powermgmt-base python-apt-common python3-apport python3-apt python3-attr python3-problem-report python3-pyasn1
  python3-urllib3 python3.10 python3.10-minimal screen snapd sosreport systemd systemd-hwe-hwdb systemd-sysv
  systemd-timesyncd ubuntu-advantage-tools ubuntu-pro-client ubuntu-pro-client-l10n udev
94 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
69 standard LTS security updates
Need to get 140 MB of archives.
After this operation, 244 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dpkg amd64 1.21.1ubuntu2.6 [1,239 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libperl5.34 amd64 5.34.0-3ubuntu1.5 [4,797 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl amd64 5.34.0-3ubuntu1.5 [232 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-base amd64 5.34.0-3ubuntu1.5 [1,761 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-modules-5.34 all 5.34.0-3ubuntu1.5 [2,977 kB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gcc-12-base amd64 12.3.0-1ubuntu1~22.04.2 [20.6 kB]
Get:7 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgcc-s1 amd64 12.3.0-1ubuntu1~22.04.2 [53.9 kB]
Get:8 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libstdc++6 amd64 12.3.0-1ubuntu1~22.04.2 [699 kB]
Get:9 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc6 amd64 2.35-0ubuntu3.12 [3,235 kB]
Get:10 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc-bin amd64 2.35-0ubuntu3.12 [706 kB]
Get:11 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnss-systemd amd64 249.11-0ubuntu3.17 [133 kB]
Get:12 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsystemd0 amd64 249.11-0ubuntu3.17 [317 kB]
Get:13 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-timesyncd amd64 249.11-0ubuntu3.17 [31.2 kB]
Get:14 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-sysv amd64 249.11-0ubuntu3.17 [10.5 kB]
Get:15 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-systemd amd64 249.11-0ubuntu3.17 [203 kB]
Get:16 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd amd64 249.11-0ubuntu3.17 [4,583 kB]
Get:17 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 udev amd64 249.11-0ubuntu3.17 [1,557 kB]
Get:18 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudev1 amd64 249.11-0ubuntu3.17 [76.7 kB]
Get:19 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapparmor1 amd64 3.0.4-2ubuntu2.5 [39.6 kB]
Get:20 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libtasn1-6 amd64 4.18.0-4ubuntu0.2 [43.6 kB]
Get:21 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgnutls30 amd64 3.7.3-4ubuntu1.7 [967 kB]
Get:22 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssl3 amd64 3.0.2-0ubuntu1.21 [1,905 kB]
Get:23 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10 amd64 3.10.12-1~22.04.13 [1,949 kB]
Get:24 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10 amd64 3.10.12-1~22.04.13 [508 kB]
Get:25 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-stdlib amd64 3.10.12-1~22.04.13 [1,850 kB]
Get:26 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10-minimal amd64 3.10.12-1~22.04.13 [2,272 kB]
Get:27 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-minimal amd64 3.10.12-1~22.04.13 [815 kB]
Get:28 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsqlite3-0 amd64 3.37.2-2ubuntu0.5 [643 kB]
Get:29 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-data all 2.72.4-0ubuntu2.8 [5,062 B]
Get:30 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-bin amd64 2.72.4-0ubuntu2.8 [80.9 kB]
Get:31 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-0 amd64 2.72.4-0ubuntu2.8 [1,467 kB]
Get:32 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxml2 amd64 2.9.13+dfsg-1ubuntu0.11 [765 kB]
Get:33 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 open-vm-tools amd64 2:12.3.5-3~ubuntu0.22.04.3 [747 kB]
Get:34 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-client amd64 2.2.27-3ubuntu2.5 [62.7 kB]
Get:35 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dirmngr amd64 2.2.27-3ubuntu2.5 [293 kB]
Get:36 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-server amd64 2.2.27-3ubuntu2.5 [57.6 kB]
Get:37 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-utils amd64 2.2.27-3ubuntu2.5 [309 kB]
Get:38 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-agent amd64 2.2.27-3ubuntu2.5 [209 kB]
Get:39 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg amd64 2.2.27-3ubuntu2.5 [519 kB]
Get:40 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgconf amd64 2.2.27-3ubuntu2.5 [94.3 kB]
Get:41 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-l10n all 2.2.27-3ubuntu2.5 [54.5 kB]
Get:42 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg all 2.2.27-3ubuntu2.5 [315 kB]
Get:43 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgsm amd64 2.2.27-3ubuntu2.5 [197 kB]
Get:44 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgv amd64 2.2.27-3ubuntu2.5 [137 kB]
Get:45 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 distro-info-data all 0.52ubuntu0.11 [5,444 B]
Get:46 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-ping amd64 3:20211215-1ubuntu0.1 [43.0 kB]
Get:47 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 locales all 2.35-0ubuntu3.12 [4,248 kB]
Get:48 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.21 [1,184 kB]
Get:49 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python-apt-common all 2.4.0ubuntu4.1 [14.7 kB]
Get:50 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apt amd64 2.4.0ubuntu4.1 [164 kB]
Get:51 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client-l10n amd64 37.1ubuntu0~22.04 [20.7 kB]
Get:52 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client amd64 37.1ubuntu0~22.04 [238 kB]
Get:53 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-advantage-tools all 37.1ubuntu0~22.04 [10.9 kB]
Get:54 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apparmor amd64 3.0.4-2ubuntu2.5 [599 kB]
Get:55 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-dnsutils amd64 1:9.18.39-0ubuntu0.22.04.2 [158 kB]
Get:56 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-host amd64 1:9.18.39-0ubuntu0.22.04.2 [52.5 kB]
Get:57 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-libs amd64 1:9.18.39-0ubuntu0.22.04.2 [1,262 kB]
Get:58 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-tracepath amd64 3:20211215-1ubuntu0.1 [14.2 kB]
Get:59 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpng16-16 amd64 1.6.37-3ubuntu0.3 [192 kB]
Get:60 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 powermgmt-base all 1.36ubuntu0.22.04.1 [7,736 B]
Get:61 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-problem-report all 2.20.11-0ubuntu82.10 [11.4 kB]
Get:62 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apport all 2.20.11-0ubuntu82.10 [89.0 kB]
Get:63 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apport all 2.20.11-0ubuntu82.10 [135 kB]
Get:64 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf0 amd64 2.38-4ubuntu2.12 [103 kB]
Get:65 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf-nobfd0 amd64 2.38-4ubuntu2.12 [108 kB]
Get:66 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-x86-64-linux-gnu amd64 2.38-4ubuntu2.12 [2,324 kB]
Get:67 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libbinutils amd64 2.38-4ubuntu2.12 [663 kB]
Get:68 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils amd64 2.38-4ubuntu2.12 [3,184 B]
Get:69 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-common amd64 2.38-4ubuntu2.12 [223 kB]
Get:70 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssh-4 amd64 0.9.6-2ubuntu0.22.04.5 [187 kB]
Get:71 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.21 [194 kB]
Get:72 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.21 [290 kB]
Get:73 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl3-gnutls amd64 7.81.0-1ubuntu1.21 [284 kB]
Get:74 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git-man all 1:2.34.1-1ubuntu1.15 [955 kB]
Get:75 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git amd64 1:2.34.1-1ubuntu1.15 [3,166 kB]
Get:76 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 klibc-utils amd64 2.0.10-4ubuntu0.2 [100.0 kB]
Get:77 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libklibc amd64 2.0.10-4ubuntu0.2 [46.0 kB]
Get:78 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 landscape-common amd64 23.02-0ubuntu1~22.04.7 [88.9 kB]
Get:79 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsodium23 amd64 1.0.18-1ubuntu0.22.04.1 [164 kB]
Get:80 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudisks2-0 amd64 2.9.4-1ubuntu2.3 [167 kB]
Get:81 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxslt1.1 amd64 1.1.34-4ubuntu0.22.04.5 [165 kB]
Get:82 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-164 all 5.15.0-164.174 [12.4 MB]
Get:83 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-164-generic amd64 5.15.0-164.174 [2,828 kB]
Get:84 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-modules-5.15.0-164-generic amd64 5.15.0-164.174 [22.7 MB]
Get:85 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-5.15.0-164-generic amd64 5.15.0-164.174 [11.6 MB]
Get:86 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-virtual amd64 5.15.0.164.159 [1,656 B]
Get:87 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-virtual amd64 5.15.0.164.159 [2,432 B]
Get:88 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-virtual amd64 5.15.0.164.159 [1,634 B]
Get:89 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-generic amd64 5.15.0.164.159 [2,334 B]
Get:90 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 needrestart all 3.5-5ubuntu2.5 [45.5 kB]
Get:91 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-attr all 21.2.0-1ubuntu1 [43.9 kB]
Get:92 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-pyasn1 all 0.4.8-1ubuntu0.1 [51.9 kB]
Get:93 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-urllib3 all 1.26.5-1~exp1ubuntu0.6 [98.7 kB]
Get:94 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 screen amd64 4.9.0-1ubuntu0.1 [672 kB]
Get:95 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 snapd amd64 2.73+ubuntu22.04 [32.3 MB]
Get:96 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 sosreport amd64 4.9.2-0ubuntu0~22.04.1 [367 kB]
Get:97 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-hwe-hwdb all 249.11.6 [3,668 B]
Get:98 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 cloud-init all 25.2-0ubuntu1~22.04.1 [586 kB]
Fetched 140 MB in 38s (3,667 kB/s)
Extracting templates from packages: 100%
Preconfiguring packages ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../dpkg_1.21.1ubuntu2.6_amd64.deb ...
Unpacking dpkg (1.21.1ubuntu2.6) over (1.21.1ubuntu2.3) ...
Setting up dpkg (1.21.1ubuntu2.6) ...
dpkg-db-backup.service is a disabled or a static unit not running, not starting it.
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libperl5.34_5.34.0-3ubuntu1.5_amd64.deb ...
Unpacking libperl5.34:amd64 (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...
Preparing to unpack .../perl_5.34.0-3ubuntu1.5_amd64.deb ...
Unpacking perl (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...
Preparing to unpack .../perl-base_5.34.0-3ubuntu1.5_amd64.deb ...
Unpacking perl-base (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...
Setting up perl-base (5.34.0-3ubuntu1.5) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../perl-modules-5.34_5.34.0-3ubuntu1.5_all.deb ...
Unpacking perl-modules-5.34 (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...
Preparing to unpack .../gcc-12-base_12.3.0-1ubuntu1~22.04.2_amd64.deb ...
Unpacking gcc-12-base:amd64 (12.3.0-1ubuntu1~22.04.2) over (12.3.0-1ubuntu1~22.04) ...
Setting up gcc-12-base:amd64 (12.3.0-1ubuntu1~22.04.2) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libgcc-s1_12.3.0-1ubuntu1~22.04.2_amd64.deb ...
Unpacking libgcc-s1:amd64 (12.3.0-1ubuntu1~22.04.2) over (12.3.0-1ubuntu1~22.04) ...
Setting up libgcc-s1:amd64 (12.3.0-1ubuntu1~22.04.2) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libstdc++6_12.3.0-1ubuntu1~22.04.2_amd64.deb ...
Unpacking libstdc++6:amd64 (12.3.0-1ubuntu1~22.04.2) over (12.3.0-1ubuntu1~22.04) ...
Setting up libstdc++6:amd64 (12.3.0-1ubuntu1~22.04.2) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libc6_2.35-0ubuntu3.12_amd64.deb ...
Unpacking libc6:amd64 (2.35-0ubuntu3.12) over (2.35-0ubuntu3.10) ...
Setting up libc6:amd64 (2.35-0ubuntu3.12) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libc-bin_2.35-0ubuntu3.12_amd64.deb ...
Unpacking libc-bin (2.35-0ubuntu3.12) over (2.35-0ubuntu3.10) ...
Setting up libc-bin (2.35-0ubuntu3.12) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libnss-systemd_249.11-0ubuntu3.17_amd64.deb ...
Unpacking libnss-systemd:amd64 (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Preparing to unpack .../libsystemd0_249.11-0ubuntu3.17_amd64.deb ...
Unpacking libsystemd0:amd64 (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Setting up libsystemd0:amd64 (249.11-0ubuntu3.17) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../0-systemd-timesyncd_249.11-0ubuntu3.17_amd64.deb ...
Unpacking systemd-timesyncd (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Preparing to unpack .../1-systemd-sysv_249.11-0ubuntu3.17_amd64.deb ...
Unpacking systemd-sysv (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Preparing to unpack .../2-libpam-systemd_249.11-0ubuntu3.17_amd64.deb ...
Unpacking libpam-systemd:amd64 (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Preparing to unpack .../3-systemd_249.11-0ubuntu3.17_amd64.deb ...
Unpacking systemd (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Preparing to unpack .../4-udev_249.11-0ubuntu3.17_amd64.deb ...
Unpacking udev (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Preparing to unpack .../5-libudev1_249.11-0ubuntu3.17_amd64.deb ...
Unpacking libudev1:amd64 (249.11-0ubuntu3.17) over (249.11-0ubuntu3.16) ...
Setting up libudev1:amd64 (249.11-0ubuntu3.17) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libapparmor1_3.0.4-2ubuntu2.5_amd64.deb ...
Unpacking libapparmor1:amd64 (3.0.4-2ubuntu2.5) over (3.0.4-2ubuntu2.4) ...
Preparing to unpack .../libtasn1-6_4.18.0-4ubuntu0.2_amd64.deb ...
Unpacking libtasn1-6:amd64 (4.18.0-4ubuntu0.2) over (4.18.0-4ubuntu0.1) ...
Setting up libtasn1-6:amd64 (4.18.0-4ubuntu0.2) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libgnutls30_3.7.3-4ubuntu1.7_amd64.deb ...
Unpacking libgnutls30:amd64 (3.7.3-4ubuntu1.7) over (3.7.3-4ubuntu1.6) ...
Setting up libgnutls30:amd64 (3.7.3-4ubuntu1.7) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libssl3_3.0.2-0ubuntu1.21_amd64.deb ...
Unpacking libssl3:amd64 (3.0.2-0ubuntu1.21) over (3.0.2-0ubuntu1.19) ...
Setting up libssl3:amd64 (3.0.2-0ubuntu1.21) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../00-libpython3.10_3.10.12-1~22.04.13_amd64.deb ...
Unpacking libpython3.10:amd64 (3.10.12-1~22.04.13) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../01-python3.10_3.10.12-1~22.04.13_amd64.deb ...
Unpacking python3.10 (3.10.12-1~22.04.13) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../02-libpython3.10-stdlib_3.10.12-1~22.04.13_amd64.deb ...
Unpacking libpython3.10-stdlib:amd64 (3.10.12-1~22.04.13) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../03-python3.10-minimal_3.10.12-1~22.04.13_amd64.deb ...
Unpacking python3.10-minimal (3.10.12-1~22.04.13) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../04-libpython3.10-minimal_3.10.12-1~22.04.13_amd64.deb ...
Unpacking libpython3.10-minimal:amd64 (3.10.12-1~22.04.13) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../05-libsqlite3-0_3.37.2-2ubuntu0.5_amd64.deb ...
Unpacking libsqlite3-0:amd64 (3.37.2-2ubuntu0.5) over (3.37.2-2ubuntu0.4) ...
Preparing to unpack .../06-libglib2.0-data_2.72.4-0ubuntu2.8_all.deb ...
Unpacking libglib2.0-data (2.72.4-0ubuntu2.8) over (2.72.4-0ubuntu2.5) ...
Preparing to unpack .../07-libglib2.0-bin_2.72.4-0ubuntu2.8_amd64.deb ...
Unpacking libglib2.0-bin (2.72.4-0ubuntu2.8) over (2.72.4-0ubuntu2.5) ...
Preparing to unpack .../08-libglib2.0-0_2.72.4-0ubuntu2.8_amd64.deb ...
Unpacking libglib2.0-0:amd64 (2.72.4-0ubuntu2.8) over (2.72.4-0ubuntu2.5) ...
Preparing to unpack .../09-libxml2_2.9.13+dfsg-1ubuntu0.11_amd64.deb ...
Unpacking libxml2:amd64 (2.9.13+dfsg-1ubuntu0.11) over (2.9.13+dfsg-1ubuntu0.7) ...
Preparing to unpack .../10-open-vm-tools_2%3a12.3.5-3~ubuntu0.22.04.3_amd64.deb ...
Unpacking open-vm-tools (2:12.3.5-3~ubuntu0.22.04.3) over (2:12.3.5-3~ubuntu0.22.04.2) ...
Preparing to unpack .../11-gpg-wks-client_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpg-wks-client (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../12-dirmngr_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking dirmngr (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../13-gpg-wks-server_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpg-wks-server (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../14-gnupg-utils_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gnupg-utils (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../15-gpg-agent_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpg-agent (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../16-gpg_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpg (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../17-gpgconf_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpgconf (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../18-gnupg-l10n_2.2.27-3ubuntu2.5_all.deb ...
Unpacking gnupg-l10n (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../19-gnupg_2.2.27-3ubuntu2.5_all.deb ...
Unpacking gnupg (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../20-gpgsm_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpgsm (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../21-gpgv_2.2.27-3ubuntu2.5_amd64.deb ...
Unpacking gpgv (2.2.27-3ubuntu2.5) over (2.2.27-3ubuntu2.3) ...
Setting up gpgv (2.2.27-3ubuntu2.5) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../00-distro-info-data_0.52ubuntu0.11_all.deb ...
Unpacking distro-info-data (0.52ubuntu0.11) over (0.52ubuntu0.9) ...
Preparing to unpack .../01-iputils-ping_3%3a20211215-1ubuntu0.1_amd64.deb ...
Unpacking iputils-ping (3:20211215-1ubuntu0.1) over (3:20211215-1) ...
Preparing to unpack .../02-locales_2.35-0ubuntu3.12_all.deb ...
Unpacking locales (2.35-0ubuntu3.12) over (2.35-0ubuntu3.10) ...
Preparing to unpack .../03-openssl_3.0.2-0ubuntu1.21_amd64.deb ...
Unpacking openssl (3.0.2-0ubuntu1.21) over (3.0.2-0ubuntu1.19) ...
Preparing to unpack .../04-python-apt-common_2.4.0ubuntu4.1_all.deb ...
Unpacking python-apt-common (2.4.0ubuntu4.1) over (2.4.0ubuntu4) ...
Preparing to unpack .../05-python3-apt_2.4.0ubuntu4.1_amd64.deb ...
Unpacking python3-apt (2.4.0ubuntu4.1) over (2.4.0ubuntu4) ...
Preparing to unpack .../06-ubuntu-pro-client-l10n_37.1ubuntu0~22.04_amd64.deb ...
Unpacking ubuntu-pro-client-l10n (37.1ubuntu0~22.04) over (35.1ubuntu0~22.04) ...
Preparing to unpack .../07-ubuntu-pro-client_37.1ubuntu0~22.04_amd64.deb ...
Unpacking ubuntu-pro-client (37.1ubuntu0~22.04) over (35.1ubuntu0~22.04) ...
Preparing to unpack .../08-ubuntu-advantage-tools_37.1ubuntu0~22.04_all.deb ...
Unpacking ubuntu-advantage-tools (37.1ubuntu0~22.04) over (35.1ubuntu0~22.04) ...
Preparing to unpack .../09-apparmor_3.0.4-2ubuntu2.5_amd64.deb ...
Unpacking apparmor (3.0.4-2ubuntu2.5) over (3.0.4-2ubuntu2.4) ...
Preparing to unpack .../10-bind9-dnsutils_1%3a9.18.39-0ubuntu0.22.04.2_amd64.deb ...
Unpacking bind9-dnsutils (1:9.18.39-0ubuntu0.22.04.2) over (1:9.18.30-0ubuntu0.22.04.2) ...
Preparing to unpack .../11-bind9-host_1%3a9.18.39-0ubuntu0.22.04.2_amd64.deb ...
Unpacking bind9-host (1:9.18.39-0ubuntu0.22.04.2) over (1:9.18.30-0ubuntu0.22.04.2) ...
Preparing to unpack .../12-bind9-libs_1%3a9.18.39-0ubuntu0.22.04.2_amd64.deb ...
Unpacking bind9-libs:amd64 (1:9.18.39-0ubuntu0.22.04.2) over (1:9.18.30-0ubuntu0.22.04.2) ...
Preparing to unpack .../13-iputils-tracepath_3%3a20211215-1ubuntu0.1_amd64.deb ...
Unpacking iputils-tracepath (3:20211215-1ubuntu0.1) over (3:20211215-1) ...
Preparing to unpack .../14-libpng16-16_1.6.37-3ubuntu0.3_amd64.deb ...
Unpacking libpng16-16:amd64 (1.6.37-3ubuntu0.3) over (1.6.37-3build5) ...
Preparing to unpack .../15-powermgmt-base_1.36ubuntu0.22.04.1_all.deb ...
Unpacking powermgmt-base (1.36ubuntu0.22.04.1) over (1.36) ...
Preparing to unpack .../16-python3-problem-report_2.20.11-0ubuntu82.10_all.deb ...
Unpacking python3-problem-report (2.20.11-0ubuntu82.10) over (2.20.11-0ubuntu82.8) ...
Preparing to unpack .../17-python3-apport_2.20.11-0ubuntu82.10_all.deb ...
Unpacking python3-apport (2.20.11-0ubuntu82.10) over (2.20.11-0ubuntu82.8) ...
Preparing to unpack .../18-apport_2.20.11-0ubuntu82.10_all.deb ...
Unpacking apport (2.20.11-0ubuntu82.10) over (2.20.11-0ubuntu82.8) ...
Preparing to unpack .../19-libctf0_2.38-4ubuntu2.12_amd64.deb ...
Unpacking libctf0:amd64 (2.38-4ubuntu2.12) over (2.38-4ubuntu2.8) ...
Preparing to unpack .../20-libctf-nobfd0_2.38-4ubuntu2.12_amd64.deb ...
Unpacking libctf-nobfd0:amd64 (2.38-4ubuntu2.12) over (2.38-4ubuntu2.8) ...
Preparing to unpack .../21-binutils-x86-64-linux-gnu_2.38-4ubuntu2.12_amd64.deb ...
Unpacking binutils-x86-64-linux-gnu (2.38-4ubuntu2.12) over (2.38-4ubuntu2.8) ...
Preparing to unpack .../22-libbinutils_2.38-4ubuntu2.12_amd64.deb ...
Unpacking libbinutils:amd64 (2.38-4ubuntu2.12) over (2.38-4ubuntu2.8) ...
Preparing to unpack .../23-binutils_2.38-4ubuntu2.12_amd64.deb ...
Unpacking binutils (2.38-4ubuntu2.12) over (2.38-4ubuntu2.8) ...
Preparing to unpack .../24-binutils-common_2.38-4ubuntu2.12_amd64.deb ...
Unpacking binutils-common:amd64 (2.38-4ubuntu2.12) over (2.38-4ubuntu2.8) ...
Preparing to unpack .../25-libssh-4_0.9.6-2ubuntu0.22.04.5_amd64.deb ...
Unpacking libssh-4:amd64 (0.9.6-2ubuntu0.22.04.5) over (0.9.6-2ubuntu0.22.04.3) ...
Preparing to unpack .../26-curl_7.81.0-1ubuntu1.21_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.21) over (7.81.0-1ubuntu1.20) ...
Preparing to unpack .../27-libcurl4_7.81.0-1ubuntu1.21_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.21) over (7.81.0-1ubuntu1.20) ...
Preparing to unpack .../28-libcurl3-gnutls_7.81.0-1ubuntu1.21_amd64.deb ...
Unpacking libcurl3-gnutls:amd64 (7.81.0-1ubuntu1.21) over (7.81.0-1ubuntu1.20) ...
Preparing to unpack .../29-git-man_1%3a2.34.1-1ubuntu1.15_all.deb ...
Unpacking git-man (1:2.34.1-1ubuntu1.15) over (1:2.34.1-1ubuntu1.12) ...
Preparing to unpack .../30-git_1%3a2.34.1-1ubuntu1.15_amd64.deb ...
Unpacking git (1:2.34.1-1ubuntu1.15) over (1:2.34.1-1ubuntu1.12) ...
Preparing to unpack .../31-klibc-utils_2.0.10-4ubuntu0.2_amd64.deb ...
Unpacking klibc-utils (2.0.10-4ubuntu0.2) over (2.0.10-4ubuntu0.1) ...
Preparing to unpack .../32-libklibc_2.0.10-4ubuntu0.2_amd64.deb ...
Unpacking libklibc:amd64 (2.0.10-4ubuntu0.2) over (2.0.10-4ubuntu0.1) ...
Preparing to unpack .../33-landscape-common_23.02-0ubuntu1~22.04.7_amd64.deb ...
Unpacking landscape-common (23.02-0ubuntu1~22.04.7) over (23.02-0ubuntu1~22.04.4) ...
Preparing to unpack .../34-libsodium23_1.0.18-1ubuntu0.22.04.1_amd64.deb ...
Unpacking libsodium23:amd64 (1.0.18-1ubuntu0.22.04.1) over (1.0.18-1build2) ...
Preparing to unpack .../35-libudisks2-0_2.9.4-1ubuntu2.3_amd64.deb ...
Unpacking libudisks2-0:amd64 (2.9.4-1ubuntu2.3) over (2.9.4-1ubuntu2.2) ...
Preparing to unpack .../36-libxslt1.1_1.1.34-4ubuntu0.22.04.5_amd64.deb ...
Unpacking libxslt1.1:amd64 (1.1.34-4ubuntu0.22.04.5) over (1.1.34-4ubuntu0.22.04.4) ...
Selecting previously unselected package linux-headers-5.15.0-164.
Preparing to unpack .../37-linux-headers-5.15.0-164_5.15.0-164.174_all.deb ...
Unpacking linux-headers-5.15.0-164 (5.15.0-164.174) ...
Selecting previously unselected package linux-headers-5.15.0-164-generic.
Preparing to unpack .../38-linux-headers-5.15.0-164-generic_5.15.0-164.174_amd64.deb ...
Unpacking linux-headers-5.15.0-164-generic (5.15.0-164.174) ...
Selecting previously unselected package linux-modules-5.15.0-164-generic.
Preparing to unpack .../39-linux-modules-5.15.0-164-generic_5.15.0-164.174_amd64.deb ...
Unpacking linux-modules-5.15.0-164-generic (5.15.0-164.174) ...
Selecting previously unselected package linux-image-5.15.0-164-generic.
Preparing to unpack .../40-linux-image-5.15.0-164-generic_5.15.0-164.174_amd64.deb ...
Unpacking linux-image-5.15.0-164-generic (5.15.0-164.174) ...
Preparing to unpack .../41-linux-virtual_5.15.0.164.159_amd64.deb ...
Unpacking linux-virtual (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../42-linux-image-virtual_5.15.0.164.159_amd64.deb ...
Unpacking linux-image-virtual (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../43-linux-headers-virtual_5.15.0.164.159_amd64.deb ...
Unpacking linux-headers-virtual (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../44-linux-headers-generic_5.15.0.164.159_amd64.deb ...
Unpacking linux-headers-generic (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../45-needrestart_3.5-5ubuntu2.5_all.deb ...
Unpacking needrestart (3.5-5ubuntu2.5) over (3.5-5ubuntu2.4) ...
Preparing to unpack .../46-python3-attr_21.2.0-1ubuntu1_all.deb ...
Unpacking python3-attr (21.2.0-1ubuntu1) over (21.2.0-1) ...
Preparing to unpack .../47-python3-pyasn1_0.4.8-1ubuntu0.1_all.deb ...
Unpacking python3-pyasn1 (0.4.8-1ubuntu0.1) over (0.4.8-1) ...
Preparing to unpack .../48-python3-urllib3_1.26.5-1~exp1ubuntu0.6_all.deb ...
Unpacking python3-urllib3 (1.26.5-1~exp1ubuntu0.6) over (1.26.5-1~exp1ubuntu0.3) ...
Preparing to unpack .../49-screen_4.9.0-1ubuntu0.1_amd64.deb ...
Unpacking screen (4.9.0-1ubuntu0.1) over (4.9.0-1) ...
Preparing to unpack .../50-snapd_2.73+ubuntu22.04_amd64.deb ...
Unpacking snapd (2.73+ubuntu22.04) over (2.67.1+22.04) ...
Preparing to unpack .../51-sosreport_4.9.2-0ubuntu0~22.04.1_amd64.deb ...
Unpacking sosreport (4.9.2-0ubuntu0~22.04.1) over (4.8.2-0ubuntu0~22.04.2) ...
Preparing to unpack .../52-systemd-hwe-hwdb_249.11.6_all.deb ...
Unpacking systemd-hwe-hwdb (249.11.6) over (249.11.5) ...
Preparing to unpack .../53-cloud-init_25.2-0ubuntu1~22.04.1_all.deb ...
Unpacking cloud-init (25.2-0ubuntu1~22.04.1) over (25.1.2-0ubuntu0~22.04.2) ...
Setting up powermgmt-base (1.36ubuntu0.22.04.1) ...
Setting up python3-attr (21.2.0-1ubuntu1) ...
Setting up libapparmor1:amd64 (3.0.4-2ubuntu2.5) ...
Setting up libsodium23:amd64 (1.0.18-1ubuntu0.22.04.1) ...
Setting up cloud-init (25.2-0ubuntu1~22.04.1) ...
Installing new version of config file /etc/cloud/templates/sources.list.debian.deb822.tmpl ...
Setting up python3-problem-report (2.20.11-0ubuntu82.10) ...
Setting up libglib2.0-0:amd64 (2.72.4-0ubuntu2.8) ...
No schema files found: doing nothing.
Setting up distro-info-data (0.52ubuntu0.11) ...
Setting up libsqlite3-0:amd64 (3.37.2-2ubuntu0.5) ...
Setting up binutils-common:amd64 (2.38-4ubuntu2.12) ...
Setting up libctf-nobfd0:amd64 (2.38-4ubuntu2.12) ...
Setting up screen (4.9.0-1ubuntu0.1) ...
Setting up systemd (249.11-0ubuntu3.17) ...
Setting up perl-modules-5.34 (5.34.0-3ubuntu1.5) ...
Setting up locales (2.35-0ubuntu3.12) ...
Generating locales (this might take a while)...
  en_US.UTF-8... done
Generation complete.
Setting up apparmor (3.0.4-2ubuntu2.5) ...
Installing new version of config file /etc/apparmor.d/abstractions/dri-enumerate ...
Installing new version of config file /etc/apparmor.d/abstractions/opencl-intel ...
Installing new version of config file /etc/apparmor.d/abstractions/opencl-nvidia ...
Installing new version of config file /etc/apparmor.d/abstractions/opencl-pocl ...
Installing new version of config file /etc/apparmor.d/abstractions/vulkan ...
Installing new version of config file /etc/apparmor.d/nvidia_modprobe ...
Installing new version of config file /etc/apparmor.d/tunables/global ...
Reloading AppArmor profiles
Skipping profile in /etc/apparmor.d/disable: usr.sbin.rsyslogd
Setting up libklibc:amd64 (2.0.10-4ubuntu0.2) ...
Setting up libglib2.0-data (2.72.4-0ubuntu2.8) ...
Setting up gnupg-l10n (2.2.27-3ubuntu2.5) ...
Setting up libpng16-16:amd64 (1.6.37-3ubuntu0.3) ...
Setting up systemd-timesyncd (249.11-0ubuntu3.17) ...
Setting up udev (249.11-0ubuntu3.17) ...
Setting up libpython3.10-minimal:amd64 (3.10.12-1~22.04.13) ...
Setting up libssh-4:amd64 (0.9.6-2ubuntu0.22.04.5) ...
Setting up sosreport (4.9.2-0ubuntu0~22.04.1) ...
Installing new version of config file /etc/sos/sos.conf ...
Setting up python3-urllib3 (1.26.5-1~exp1ubuntu0.6) ...
Setting up systemd-hwe-hwdb (249.11.6) ...
Setting up python-apt-common (2.4.0ubuntu4.1) ...
Setting up gpgconf (2.2.27-3ubuntu2.5) ...
Setting up python3-pyasn1 (0.4.8-1ubuntu0.1) ...
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.21) ...
Setting up git-man (1:2.34.1-1ubuntu1.15) ...
Setting up curl (7.81.0-1ubuntu1.21) ...
Setting up libbinutils:amd64 (2.38-4ubuntu2.12) ...
Setting up klibc-utils (2.0.10-4ubuntu0.2) ...
Setting up openssl (3.0.2-0ubuntu1.21) ...
Setting up iputils-ping (3:20211215-1ubuntu0.1) ...
Setting up libxml2:amd64 (2.9.13+dfsg-1ubuntu0.11) ...
Setting up gpg (2.2.27-3ubuntu2.5) ...
Setting up linux-headers-5.15.0-164 (5.15.0-164.174) ...
Setting up iputils-tracepath (3:20211215-1ubuntu0.1) ...
Setting up libudisks2-0:amd64 (2.9.4-1ubuntu2.3) ...
Setting up gnupg-utils (2.2.27-3ubuntu2.5) ...
Setting up libctf0:amd64 (2.38-4ubuntu2.12) ...
Setting up snapd (2.73+ubuntu22.04) ...
Installing new version of config file /etc/apparmor.d/usr.lib.snapd.snap-confine.real ...
Installing new version of config file /etc/profile.d/apps-bin-path.sh ...
snapd.failure.service is a disabled or a static unit not running, not starting it.
snapd.gpio-chardev-setup.target is a disabled or a static unit not running, not starting it.
snapd.snap-repair.service is a disabled or a static unit not running, not starting it.
Setting up systemd-sysv (249.11-0ubuntu3.17) ...
Setting up libperl5.34:amd64 (5.34.0-3ubuntu1.5) ...
Setting up gpg-agent (2.2.27-3ubuntu2.5) ...
Setting up bind9-libs:amd64 (1:9.18.39-0ubuntu0.22.04.2) ...
Setting up python3-apt (2.4.0ubuntu4.1) ...
Setting up gpgsm (2.2.27-3ubuntu2.5) ...
Setting up linux-headers-5.15.0-164-generic (5.15.0-164.174) ...
Setting up libglib2.0-bin (2.72.4-0ubuntu2.8) ...
Setting up libnss-systemd:amd64 (249.11-0ubuntu3.17) ...
Setting up libcurl3-gnutls:amd64 (7.81.0-1ubuntu1.21) ...
Setting up linux-headers-generic (5.15.0.164.159) ...
Setting up landscape-common (23.02-0ubuntu1~22.04.7) ...
Setting up python3.10-minimal (3.10.12-1~22.04.13) ...
Setting up python3-apport (2.20.11-0ubuntu82.10) ...
Setting up libpython3.10-stdlib:amd64 (3.10.12-1~22.04.13) ...
Setting up dirmngr (2.2.27-3ubuntu2.5) ...
Setting up perl (5.34.0-3ubuntu1.5) ...
Setting up git (1:2.34.1-1ubuntu1.15) ...
Setting up gpg-wks-server (2.2.27-3ubuntu2.5) ...
Setting up open-vm-tools (2:12.3.5-3~ubuntu0.22.04.3) ...
Setting up libxslt1.1:amd64 (1.1.34-4ubuntu0.22.04.5) ...
Setting up libpam-systemd:amd64 (249.11-0ubuntu3.17) ...
Setting up bind9-host (1:9.18.39-0ubuntu0.22.04.2) ...
Setting up ubuntu-pro-client (37.1ubuntu0~22.04) ...
Installing new version of config file /etc/apparmor.d/ubuntu_pro_apt_news ...
Installing new version of config file /etc/apparmor.d/ubuntu_pro_esm_cache ...
Setting up binutils-x86-64-linux-gnu (2.38-4ubuntu2.12) ...
Setting up ubuntu-pro-client-l10n (37.1ubuntu0~22.04) ...
Setting up libpython3.10:amd64 (3.10.12-1~22.04.13) ...
Setting up python3.10 (3.10.12-1~22.04.13) ...
Setting up linux-headers-virtual (5.15.0.164.159) ...
Setting up gpg-wks-client (2.2.27-3ubuntu2.5) ...
Setting up binutils (2.38-4ubuntu2.12) ...
Setting up apport (2.20.11-0ubuntu82.10) ...
apport-autoreport.service is a disabled or a static unit, not starting it.
Setting up gnupg (2.2.27-3ubuntu2.5) ...
Setting up ubuntu-advantage-tools (37.1ubuntu0~22.04) ...
Setting up bind9-dnsutils (1:9.18.39-0ubuntu0.22.04.2) ...
Setting up needrestart (3.5-5ubuntu2.5) ...
Setting up linux-image-5.15.0-164-generic (5.15.0-164.174) ...
I: /boot/vmlinuz is now a symlink to vmlinuz-5.15.0-164-generic
I: /boot/initrd.img is now a symlink to initrd.img-5.15.0-164-generic
Setting up linux-image-virtual (5.15.0.164.159) ...
Setting up linux-modules-5.15.0-164-generic (5.15.0-164.174) ...
Setting up linux-virtual (5.15.0.164.159) ...
Processing triggers for dbus (1.12.20-2ubuntu4.1) ...
Processing triggers for install-info (6.8-4build1) ...
Processing triggers for initramfs-tools (0.140ubuntu13.5) ...
update-initramfs: Generating /boot/initrd.img-5.15.0-143-generic
Processing triggers for libc-bin (2.35-0ubuntu3.12) ...
Processing triggers for rsyslog (8.2112.0-2ubuntu2.2) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for linux-image-5.15.0-164-generic (5.15.0-164.174) ...
/etc/kernel/postinst.d/initramfs-tools:
update-initramfs: Generating /boot/initrd.img-5.15.0-164-generic
/etc/kernel/postinst.d/zz-update-grub:
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/50-cloudimg-settings.cfg'
Sourcing file `/etc/default/grub.d/init-select.cfg'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-5.15.0-164-generic
Found initrd image: /boot/initrd.img-5.15.0-164-generic
Found linux image: /boot/vmlinuz-5.15.0-143-generic
Found initrd image: /boot/initrd.img-5.15.0-143-generic
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
done
Scanning processes...
Scanning candidates...
Scanning linux images...

Restarting services...
 systemctl restart cron.service irqbalance.service multipathd.service packagekit.service polkit.service serial-getty@ttyS0.service ssh.service
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
Fetched 647 kB in 3s (193 kB/s)
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
ubuntu@gelani-mon-1:~$ sudo systemctl enable --now chrony && chronyc tracking
Synchronizing state of chrony.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable chrony
Reference ID    : 67BA76D9 (103.186.118.217)
Stratum         : 3
Ref time (UTC)  : Wed Jan 28 05:07:30 2026
System time     : 0.000000018 seconds slow of NTP time
Last offset     : +0.000197174 seconds
RMS offset      : 0.000197174 seconds
Frequency       : 110.042 ppm slow
Residual freq   : +119.526 ppm
Skew            : 1000000.000 ppm
Root delay      : 0.142862663 seconds
Root dispersion : 34.749912262 seconds
Update interval : 1.9 seconds
Leap status     : Normal
ubuntu@gelani-mon-1:~$ sudo swapoff -a &&  sudo sed -i.bak '/\sswap\s/ s/^/#/' /etc/fstab && free -h | grep -i swap
Swap:             0B          0B          0B
ubuntu@gelani-mon-1:~$ echo "== $(hostname) ==";
ip -br a | grep -E 'UP|UNKNOWN' | head -n 2;
chronyc tracking | head -n 5;
free -h | grep -i swap
== gelani-mon-1 ==
lo               UNKNOWN        127.0.0.1/8 ::1/128
ens3             UP             192.168.95.19/24 metric 100 fe80::f816:3eff:fea9:81d4/64
Reference ID    : 67BA76D9 (103.186.118.217)
Stratum         : 3
Ref time (UTC)  : Wed Jan 28 05:12:53 2026
System time     : 0.004271227 seconds fast of NTP time
Last offset     : +0.004329045 seconds
Swap:             0B          0B          0B
ubuntu@gelani-mon-1:~$ hostname; ip -4 -br a; chronyc tracking | head; free -h | grep -i swap
gelani-mon-1
lo               UNKNOWN        127.0.0.1/8
ens3             UP             192.168.95.19/24 metric 100
Reference ID    : 67BA76D9 (103.186.118.217)
Stratum         : 3
Ref time (UTC)  : Wed Jan 28 05:13:58 2026
System time     : 0.004078400 seconds fast of NTP time
Last offset     : +0.000190583 seconds
RMS offset      : 0.006070967 seconds
Frequency       : 7.857 ppm slow
Residual freq   : +0.128 ppm
Skew            : 8.789 ppm
Root delay      : 0.146669805 seconds
Swap:             0B          0B          0B
ubuntu@gelani-mon-1:~$

ubuntu@gelani-mon-1:~$ sudo ufw status
Status: inactive
ubuntu@gelani-mon-1:~$


ubuntu@gelani-mon-1:~$ sudo reboot
Connection to 192.168.95.19 closed by remote host.
Connection to 192.168.95.19 closed.
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.19
ubuntu@192.168.95.19's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Jan 28 05:49:11 UTC 2026

  System load:  0.73              Processes:             104
  Usage of /:   5.9% of 38.58GB   Users logged in:       0
  Memory usage: 5%                IPv4 address for ens3: 192.168.95.19
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Wed Jan 28 04:51:21 2026 from 192.168.95.86
ubuntu@gelani-mon-1:~$ hostname && uptime && systemctl is-active chrony &&  free -h | grep -i swap
gelani-mon-1
 05:51:03 up 2 min,  1 user,  load average: 0.10, 0.15, 0.07
active
Swap:             0B          0B          0B
ubuntu@gelani-mon-1:~$


ubuntu@gelani-mon-1:~$ for h in gelani-mon-1 gelani-mon-2 gelani-mon-3 gelani-osd-1 gelani-osd-2; do
  echo "== $h ==";
  ping -c 1 $h >/dev/null && echo OK || echo FAIL;
done
== gelani-mon-1 ==
OK
== gelani-mon-2 ==
OK
== gelani-mon-3 ==
OK
== gelani-osd-1 ==
OK
== gelani-osd-2 ==
OK
ubuntu@gelani-mon-1:~$ sudo apt update && sudo apt install -y cephadm
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Fetched 384 kB in 3s (120 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  bridge-utils containerd dns-root-data dnsmasq-base docker.io pigz runc ubuntu-fan
Suggested packages:
  ifupdown aufs-tools cgroupfs-mount | cgroup-lite debootstrap docker-buildx docker-compose-v2 docker-doc rinse
  zfs-fuse | zfsutils
The following NEW packages will be installed:
  bridge-utils cephadm containerd dns-root-data dnsmasq-base docker.io pigz runc ubuntu-fan
0 upgraded, 9 newly installed, 0 to remove and 0 not upgraded.
Need to get 76.4 MB of archives.
After this operation, 289 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 pigz amd64 2.6-1 [63.6 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 bridge-utils amd64 1.7-1ubuntu3 [34.4 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 cephadm amd64 17.2.9-0ubuntu0.22.04.1 [93.9 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 runc amd64 1.3.3-0ubuntu1~22.04.3 [8,857 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 containerd amd64 1.7.28-0ubuntu1~22.04.1 [38.5 MB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dns-root-data all 2024071801~ubuntu0.22.04.1 [6,132 B]
Get:7 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dnsmasq-base amd64 2.90-0ubuntu0.22.04.1 [374 kB]
Get:8 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 docker.io amd64 28.2.2-0ubuntu1~22.04.1 [28.4 MB]
Get:9 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 ubuntu-fan all 0.12.16 [35.2 kB]
Fetched 76.4 MB in 7s (11.0 MB/s)
Preconfiguring packages ...
Selecting previously unselected package pigz.
(Reading database ... 94256 files and directories currently installed.)
Preparing to unpack .../0-pigz_2.6-1_amd64.deb ...
Unpacking pigz (2.6-1) ...
Selecting previously unselected package bridge-utils.
Preparing to unpack .../1-bridge-utils_1.7-1ubuntu3_amd64.deb ...
Unpacking bridge-utils (1.7-1ubuntu3) ...
Selecting previously unselected package cephadm.
Preparing to unpack .../2-cephadm_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking cephadm (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package runc.
Preparing to unpack .../3-runc_1.3.3-0ubuntu1~22.04.3_amd64.deb ...
Unpacking runc (1.3.3-0ubuntu1~22.04.3) ...
Selecting previously unselected package containerd.
Preparing to unpack .../4-containerd_1.7.28-0ubuntu1~22.04.1_amd64.deb ...
Unpacking containerd (1.7.28-0ubuntu1~22.04.1) ...
Selecting previously unselected package dns-root-data.
Preparing to unpack .../5-dns-root-data_2024071801~ubuntu0.22.04.1_all.deb ...
Unpacking dns-root-data (2024071801~ubuntu0.22.04.1) ...
Selecting previously unselected package dnsmasq-base.
Preparing to unpack .../6-dnsmasq-base_2.90-0ubuntu0.22.04.1_amd64.deb ...
Unpacking dnsmasq-base (2.90-0ubuntu0.22.04.1) ...
Selecting previously unselected package docker.io.
Preparing to unpack .../7-docker.io_28.2.2-0ubuntu1~22.04.1_amd64.deb ...
Unpacking docker.io (28.2.2-0ubuntu1~22.04.1) ...
Selecting previously unselected package ubuntu-fan.
Preparing to unpack .../8-ubuntu-fan_0.12.16_all.deb ...
Unpacking ubuntu-fan (0.12.16) ...
Setting up cephadm (17.2.9-0ubuntu0.22.04.1) ...
Adding system user cephadm....done
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
ubuntu@gelani-mon-1:~$ cephadm version
ERROR: cephadm should be run as root
ubuntu@gelani-mon-1:~$ sudo cephadm version
^CTraceback (most recent call last):
  File "/usr/sbin/cephadm", line 9930, in <module>
    main()
  File "/usr/sbin/cephadm", line 9918, in main
    r = ctx.func(ctx)
  File "/usr/sbin/cephadm", line 2224, in _infer_image
    return func(ctx)
  File "/usr/sbin/cephadm", line 4795, in command_version
    out, err, ret = call(ctx, c.run_cmd(), desc=c.entrypoint)
  File "/usr/sbin/cephadm", line 1863, in call
    stdout, stderr, returncode = async_run(run_with_timeout())
  File "/usr/lib/python3.10/asyncio/runners.py", line 44, in run
    return loop.run_until_complete(main)
  File "/usr/lib/python3.10/asyncio/base_events.py", line 636, in run_until_complete
    self.run_forever()
  File "/usr/lib/python3.10/asyncio/base_events.py", line 603, in run_forever
    self._run_once()
  File "/usr/lib/python3.10/asyncio/base_events.py", line 1871, in _run_once
    event_list = self._selector.select(timeout)
  File "/usr/lib/python3.10/selectors.py", line 469, in select
    fd_event_list = self._selector.poll(timeout, max_ev)
KeyboardInterrupt
Exception ignored in: <function BaseSubprocessTransport.__del__ at 0x7fdcecb465f0>
Traceback (most recent call last):
  File "/usr/lib/python3.10/asyncio/base_subprocess.py", line 126, in __del__
  File "/usr/lib/python3.10/asyncio/base_subprocess.py", line 104, in close
  File "/usr/lib/python3.10/asyncio/unix_events.py", line 547, in close
  File "/usr/lib/python3.10/asyncio/unix_events.py", line 571, in _close
  File "/usr/lib/python3.10/asyncio/base_events.py", line 753, in call_soon
  File "/usr/lib/python3.10/asyncio/base_events.py", line 515, in _check_closed
RuntimeError: Event loop is closed

ubuntu@gelani-mon-1:~$ sudo cephadm version
ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)
ubuntu@gelani-mon-1:~$ sudo mkdir -p /etc/ceph
ubuntu@gelani-mon-1:~$ sudo chmod 755 /etc/ceph
ubuntu@gelani-mon-1:~$ sudo cephadm bootstrap \
  --mon-ip 192.168.95.19 \
  --cluster-network 192.168.95.0/24 \
  --ssh-user ubuntu \
  --initial-dashboard-user admin \
  --initial-dashboard-password 'Ceph@123'
Verifying ssh connectivity using standard pubkey authentication ...
Adding key to ubuntu@localhost authorized_keys...
Verifying podman|docker is present...
Verifying lvm2 is present...
Verifying time synchronization is in place...
Unit chrony.service is enabled and running
Repeating the final host check...
docker (/usr/bin/docker) is present
systemctl is present
lvcreate is present
Unit chrony.service is enabled and running
Host looks OK
Cluster fsid: a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Verifying IP 192.168.95.19 port 3300 ...
Verifying IP 192.168.95.19 port 6789 ...
Mon IP `192.168.95.19` is in CIDR network `192.168.95.0/24`
Mon IP `192.168.95.19` is in CIDR network `192.168.95.0/24`
Mon IP `192.168.95.19` is in CIDR network `192.168.95.1/32`
Mon IP `192.168.95.19` is in CIDR network `192.168.95.1/32`
Mon IP `192.168.95.19` is in CIDR network `192.168.95.2/32`
Mon IP `192.168.95.19` is in CIDR network `192.168.95.2/32`
Pulling container image quay.io/ceph/ceph:v17...
Ceph version: ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)
Extracting ceph user uid/gid from container image...
Creating initial keys...
Creating initial monmap...
Creating mon...
Waiting for mon to start...
Waiting for mon...
mon is available
Assimilating anything we can from ceph.conf...
Generating new minimal ceph.conf...
Restarting the monitor...
Setting public_network to 192.168.95.0/24,192.168.95.1/32,192.168.95.2/32 in mon config section
Setting cluster_network to 192.168.95.0/24
Wrote config to /etc/ceph/ceph.conf
Wrote keyring to /etc/ceph/ceph.client.admin.keyring
Creating mgr...
Verifying port 0.0.0.0:9283 ...
Verifying port 0.0.0.0:8765 ...
Verifying port 0.0.0.0:8443 ...
Waiting for mgr to start...
Waiting for mgr...
mgr not available, waiting (1/15)...
mgr not available, waiting (2/15)...
mgr not available, waiting (3/15)...
mgr is available
Enabling cephadm module...
Waiting for the mgr to restart...
Waiting for mgr epoch 5...
mgr epoch 5 is available
Setting orchestrator backend to cephadm...
Generating ssh key...
Wrote public SSH key to /etc/ceph/ceph.pub
Adding key to ubuntu@localhost authorized_keys...
Adding host gelani-mon-1...
Deploying mon service with default placement...
Deploying mgr service with default placement...
Deploying crash service with default placement...
Deploying prometheus service with default placement...
Deploying grafana service with default placement...
Deploying node-exporter service with default placement...
Deploying alertmanager service with default placement...
Enabling the dashboard module...
Waiting for the mgr to restart...
Waiting for mgr epoch 9...
mgr epoch 9 is available
Generating a dashboard self-signed certificate...
Creating initial admin user...
Fetching dashboard port number...
Ceph Dashboard is now available at:

             URL: https://gelani-mon-1:8443/
            User: admin
        Password: Ceph@123

Enabling client.admin keyring and conf on hosts with "admin" label
Saving cluster configuration to /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/config directory
Enabling autotune for osd_memory_target
You can access the Ceph CLI as following in case of multi-cluster or non-default config:

        sudo /usr/sbin/cephadm shell --fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e -c /etc/ceph/ceph.conf -k /etc/ceph/ceph.client.admin.keyring

Or, if you are only running a single cluster on this host:

        sudo /usr/sbin/cephadm shell

Please consider enabling telemetry to help improve Ceph:

        ceph telemetry on

For more information see:

        https://docs.ceph.com/docs/master/mgr/telemetry/

Bootstrap complete.
ubuntu@gelani-mon-1:~$



ubuntu@gelani-mon-1:~$ source /etc/profile.d/cephadm.sh
-bash: /etc/profile.d/cephadm.sh: No such file or directory
ubuntu@gelani-mon-1:~$ ceph -s
Command 'ceph' not found, but can be installed with:
sudo snap install microceph    # version 18.2.4+snapc9f2b08f92, or
sudo apt  install ceph-common  # version 17.2.9-0ubuntu0.22.04.1
See 'snap info microceph' for additional versions.
ubuntu@gelani-mon-1:~$ sudo cephadm shell -- ceph -s
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 1 daemons, quorum gelani-mon-1 (age 3m)
    mgr: gelani-mon-1.gzltah(active, since 23s)
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ sudo chmod 755 /etc/ceph^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ sudo cephadm shell -- ceph -s
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 1 daemons, quorum gelani-mon-1 (age 7m)
    mgr: gelani-mon-1.gzltah(active, since 4m)
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

ubuntu@gelani-mon-1:~$ sudo cephadm shell -- ceph orch status
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
Backend: cephadm
Available: Yes
Paused: No
ubuntu@gelani-mon-1:~$ sudo cephadm shell -- ceph orch host ls
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
HOST          ADDR           LABELS  STATUS
gelani-mon-1  192.168.95.19  _admin
1 hosts in cluster
ubuntu@gelani-mon-1:~$ sudo apt update
Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Fetched 255 kB in 2s (106 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
ubuntu@gelani-mon-1:~$ sudo apt install -y ceph-common
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  ibverbs-providers libbabeltrace1 libboost-context1.74.0 libboost-filesystem1.74.0 libboost-iostreams1.74.0 libboost-program-options1.74.0 libboost-thread1.74.0 libcephfs2 libdaxctl1 libgoogle-perftools4 libibverbs1 liblua5.3-0
  libndctl6 libnl-route-3-200 liboath0 libpmem1 libpmemobj1 librabbitmq4 librados2 libradosstriper1 librbd1 librdmacm1 libsnappy1v5 libtcmalloc-minimal4 python3-ceph-argparse python3-ceph-common python3-cephfs python3-prettytable
  python3-rados python3-rbd python3-wcwidth
Suggested packages:
  ceph ceph-mds
The following NEW packages will be installed:
  ceph-common ibverbs-providers libbabeltrace1 libboost-context1.74.0 libboost-filesystem1.74.0 libboost-iostreams1.74.0 libboost-program-options1.74.0 libboost-thread1.74.0 libcephfs2 libdaxctl1 libgoogle-perftools4 libibverbs1
  liblua5.3-0 libndctl6 libnl-route-3-200 liboath0 libpmem1 libpmemobj1 librabbitmq4 librados2 libradosstriper1 librbd1 librdmacm1 libsnappy1v5 libtcmalloc-minimal4 python3-ceph-argparse python3-ceph-common python3-cephfs
  python3-prettytable python3-rados python3-rbd python3-wcwidth
0 upgraded, 32 newly installed, 0 to remove and 0 not upgraded.
Need to get 35.6 MB of archives.
After this operation, 142 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libboost-iostreams1.74.0 amd64 1.74.0-14ubuntu3 [245 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libboost-thread1.74.0 amd64 1.74.0-14ubuntu3 [262 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libnl-route-3-200 amd64 3.5.0-0.1 [180 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libibverbs1 amd64 39.0-1 [69.3 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 librdmacm1 amd64 39.0-1 [71.2 kB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 librados2 amd64 17.2.9-0ubuntu0.22.04.1 [3,607 kB]
Get:7 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libdaxctl1 amd64 72.1-1 [19.8 kB]
Get:8 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libndctl6 amd64 72.1-1 [57.7 kB]
Get:9 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libpmem1 amd64 1.11.1-3build1 [81.4 kB]
Get:10 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libpmemobj1 amd64 1.11.1-3build1 [124 kB]
Get:11 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 librbd1 amd64 17.2.9-0ubuntu0.22.04.1 [3,557 kB]
Get:12 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-ceph-argparse amd64 17.2.9-0ubuntu0.22.04.1 [34.3 kB]
Get:13 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-ceph-common all 17.2.9-0ubuntu0.22.04.1 [61.2 kB]
Get:14 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcephfs2 amd64 17.2.9-0ubuntu0.22.04.1 [752 kB]
Get:15 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-rados amd64 17.2.9-0ubuntu0.22.04.1 [355 kB]
Get:16 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-cephfs amd64 17.2.9-0ubuntu0.22.04.1 [174 kB]
Get:17 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 python3-wcwidth all 0.2.5+dfsg1-1 [21.9 kB]
Get:18 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 python3-prettytable all 2.5.0-2 [31.3 kB]
Get:19 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-rbd amd64 17.2.9-0ubuntu0.22.04.1 [326 kB]
Get:20 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libbabeltrace1 amd64 1.5.8-2build1 [160 kB]
Get:21 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libboost-context1.74.0 amd64 1.74.0-14ubuntu3 [223 kB]
Get:22 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libboost-filesystem1.74.0 amd64 1.74.0-14ubuntu3 [264 kB]
Get:23 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libboost-program-options1.74.0 amd64 1.74.0-14ubuntu3 [311 kB]
Get:24 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libtcmalloc-minimal4 amd64 2.9.1-0ubuntu3 [98.2 kB]
Get:25 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libgoogle-perftools4 amd64 2.9.1-0ubuntu3 [212 kB]
Get:26 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 liblua5.3-0 amd64 5.3.6-1build1 [140 kB]
Get:27 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 liboath0 amd64 2.6.7-3ubuntu0.1 [41.3 kB]
Get:28 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 librabbitmq4 amd64 0.10.0-1ubuntu2 [39.3 kB]
Get:29 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libradosstriper1 amd64 17.2.9-0ubuntu0.22.04.1 [492 kB]
Get:30 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libsnappy1v5 amd64 1.1.8-1build3 [17.5 kB]
Get:31 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ceph-common amd64 17.2.9-0ubuntu0.22.04.1 [23.2 MB]
Get:32 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 ibverbs-providers amd64 39.0-1 [341 kB]
Fetched 35.6 MB in 31s (1,149 kB/s)
Extracting templates from packages: 100%
Selecting previously unselected package libboost-iostreams1.74.0:amd64.
(Reading database ... 94628 files and directories currently installed.)
Preparing to unpack .../00-libboost-iostreams1.74.0_1.74.0-14ubuntu3_amd64.deb ...
Unpacking libboost-iostreams1.74.0:amd64 (1.74.0-14ubuntu3) ...
Selecting previously unselected package libboost-thread1.74.0:amd64.
Preparing to unpack .../01-libboost-thread1.74.0_1.74.0-14ubuntu3_amd64.deb ...
Unpacking libboost-thread1.74.0:amd64 (1.74.0-14ubuntu3) ...
Selecting previously unselected package libnl-route-3-200:amd64.
Preparing to unpack .../02-libnl-route-3-200_3.5.0-0.1_amd64.deb ...
Unpacking libnl-route-3-200:amd64 (3.5.0-0.1) ...
Selecting previously unselected package libibverbs1:amd64.
Preparing to unpack .../03-libibverbs1_39.0-1_amd64.deb ...
Unpacking libibverbs1:amd64 (39.0-1) ...
Selecting previously unselected package librdmacm1:amd64.
Preparing to unpack .../04-librdmacm1_39.0-1_amd64.deb ...
Unpacking librdmacm1:amd64 (39.0-1) ...
Selecting previously unselected package librados2.
Preparing to unpack .../05-librados2_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking librados2 (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package libdaxctl1:amd64.
Preparing to unpack .../06-libdaxctl1_72.1-1_amd64.deb ...
Unpacking libdaxctl1:amd64 (72.1-1) ...
Selecting previously unselected package libndctl6:amd64.
Preparing to unpack .../07-libndctl6_72.1-1_amd64.deb ...
Unpacking libndctl6:amd64 (72.1-1) ...
Selecting previously unselected package libpmem1:amd64.
Preparing to unpack .../08-libpmem1_1.11.1-3build1_amd64.deb ...
Unpacking libpmem1:amd64 (1.11.1-3build1) ...
Selecting previously unselected package libpmemobj1:amd64.
Preparing to unpack .../09-libpmemobj1_1.11.1-3build1_amd64.deb ...
Unpacking libpmemobj1:amd64 (1.11.1-3build1) ...
Selecting previously unselected package librbd1.
Preparing to unpack .../10-librbd1_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking librbd1 (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package python3-ceph-argparse.
Preparing to unpack .../11-python3-ceph-argparse_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking python3-ceph-argparse (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package python3-ceph-common.
Preparing to unpack .../12-python3-ceph-common_17.2.9-0ubuntu0.22.04.1_all.deb ...
Unpacking python3-ceph-common (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package libcephfs2.
Preparing to unpack .../13-libcephfs2_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking libcephfs2 (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package python3-rados.
Preparing to unpack .../14-python3-rados_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking python3-rados (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package python3-cephfs.
Preparing to unpack .../15-python3-cephfs_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking python3-cephfs (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package python3-wcwidth.
Preparing to unpack .../16-python3-wcwidth_0.2.5+dfsg1-1_all.deb ...
Unpacking python3-wcwidth (0.2.5+dfsg1-1) ...
Selecting previously unselected package python3-prettytable.
Preparing to unpack .../17-python3-prettytable_2.5.0-2_all.deb ...
Unpacking python3-prettytable (2.5.0-2) ...
Selecting previously unselected package python3-rbd.
Preparing to unpack .../18-python3-rbd_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking python3-rbd (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package libbabeltrace1:amd64.
Preparing to unpack .../19-libbabeltrace1_1.5.8-2build1_amd64.deb ...
Unpacking libbabeltrace1:amd64 (1.5.8-2build1) ...
Selecting previously unselected package libboost-context1.74.0:amd64.
Preparing to unpack .../20-libboost-context1.74.0_1.74.0-14ubuntu3_amd64.deb ...
Unpacking libboost-context1.74.0:amd64 (1.74.0-14ubuntu3) ...
Selecting previously unselected package libboost-filesystem1.74.0:amd64.
Preparing to unpack .../21-libboost-filesystem1.74.0_1.74.0-14ubuntu3_amd64.deb ...
Unpacking libboost-filesystem1.74.0:amd64 (1.74.0-14ubuntu3) ...
Selecting previously unselected package libboost-program-options1.74.0:amd64.
Preparing to unpack .../22-libboost-program-options1.74.0_1.74.0-14ubuntu3_amd64.deb ...
Unpacking libboost-program-options1.74.0:amd64 (1.74.0-14ubuntu3) ...
Selecting previously unselected package libtcmalloc-minimal4:amd64.
Preparing to unpack .../23-libtcmalloc-minimal4_2.9.1-0ubuntu3_amd64.deb ...
Unpacking libtcmalloc-minimal4:amd64 (2.9.1-0ubuntu3) ...
Selecting previously unselected package libgoogle-perftools4:amd64.
Preparing to unpack .../24-libgoogle-perftools4_2.9.1-0ubuntu3_amd64.deb ...
Unpacking libgoogle-perftools4:amd64 (2.9.1-0ubuntu3) ...
Selecting previously unselected package liblua5.3-0:amd64.
Preparing to unpack .../25-liblua5.3-0_5.3.6-1build1_amd64.deb ...
Unpacking liblua5.3-0:amd64 (5.3.6-1build1) ...
Selecting previously unselected package liboath0:amd64.
Preparing to unpack .../26-liboath0_2.6.7-3ubuntu0.1_amd64.deb ...
Unpacking liboath0:amd64 (2.6.7-3ubuntu0.1) ...
Selecting previously unselected package librabbitmq4:amd64.
Preparing to unpack .../27-librabbitmq4_0.10.0-1ubuntu2_amd64.deb ...
Unpacking librabbitmq4:amd64 (0.10.0-1ubuntu2) ...
Selecting previously unselected package libradosstriper1.
Preparing to unpack .../28-libradosstriper1_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking libradosstriper1 (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package libsnappy1v5:amd64.
Preparing to unpack .../29-libsnappy1v5_1.1.8-1build3_amd64.deb ...
Unpacking libsnappy1v5:amd64 (1.1.8-1build3) ...
Selecting previously unselected package ceph-common.
Preparing to unpack .../30-ceph-common_17.2.9-0ubuntu0.22.04.1_amd64.deb ...
Unpacking ceph-common (17.2.9-0ubuntu0.22.04.1) ...
Selecting previously unselected package ibverbs-providers:amd64.
Preparing to unpack .../31-ibverbs-providers_39.0-1_amd64.deb ...
Unpacking ibverbs-providers:amd64 (39.0-1) ...
Setting up librabbitmq4:amd64 (0.10.0-1ubuntu2) ...
Setting up liboath0:amd64 (2.6.7-3ubuntu0.1) ...
Setting up libboost-iostreams1.74.0:amd64 (1.74.0-14ubuntu3) ...
Setting up libboost-program-options1.74.0:amd64 (1.74.0-14ubuntu3) ...
Setting up libtcmalloc-minimal4:amd64 (2.9.1-0ubuntu3) ...
Setting up python3-ceph-argparse (17.2.9-0ubuntu0.22.04.1) ...
Setting up libboost-filesystem1.74.0:amd64 (1.74.0-14ubuntu3) ...
Setting up libsnappy1v5:amd64 (1.1.8-1build3) ...
Setting up libnl-route-3-200:amd64 (3.5.0-0.1) ...
Setting up python3-wcwidth (0.2.5+dfsg1-1) ...
Setting up python3-ceph-common (17.2.9-0ubuntu0.22.04.1) ...
Setting up libboost-context1.74.0:amd64 (1.74.0-14ubuntu3) ...
Setting up libdaxctl1:amd64 (72.1-1) ...
Setting up libbabeltrace1:amd64 (1.5.8-2build1) ...
Setting up liblua5.3-0:amd64 (5.3.6-1build1) ...
Setting up libndctl6:amd64 (72.1-1) ...
Setting up python3-prettytable (2.5.0-2) ...
Setting up libpmem1:amd64 (1.11.1-3build1) ...
Setting up libgoogle-perftools4:amd64 (2.9.1-0ubuntu3) ...
Setting up libboost-thread1.74.0:amd64 (1.74.0-14ubuntu3) ...
Setting up libibverbs1:amd64 (39.0-1) ...
Setting up ibverbs-providers:amd64 (39.0-1) ...
Setting up libpmemobj1:amd64 (1.11.1-3build1) ...
Setting up librdmacm1:amd64 (39.0-1) ...
Setting up librados2 (17.2.9-0ubuntu0.22.04.1) ...
Setting up libcephfs2 (17.2.9-0ubuntu0.22.04.1) ...
Setting up libradosstriper1 (17.2.9-0ubuntu0.22.04.1) ...
Setting up librbd1 (17.2.9-0ubuntu0.22.04.1) ...
Setting up python3-rados (17.2.9-0ubuntu0.22.04.1) ...
Setting up python3-rbd (17.2.9-0ubuntu0.22.04.1) ...
Setting up python3-cephfs (17.2.9-0ubuntu0.22.04.1) ...
Setting up ceph-common (17.2.9-0ubuntu0.22.04.1) ...
Adding group ceph....done
Adding system user ceph....done
Setting system user ceph properties....done
Fixing /var/run/ceph ownership....done
Created symlink /etc/systemd/system/multi-user.target.wants/rbdmap.service → /lib/systemd/system/rbdmap.service.
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.12) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@gelani-mon-1:~$ sudo cephadm shell -- ceph -s
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 1 daemons, quorum gelani-mon-1 (age 12m)
    mgr: gelani-mon-1.gzltah(active, since 9m)
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

ubuntu@gelani-mon-1:~$ sudo cephadm shell -- ceph orch status
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
Backend: cephadm
Available: Yes
Paused: No
ubuntu@gelani-mon-1:~$


ubuntu@gelani-mon-1:~$ source /etc/profile.d/cephadm.sh
-bash: /etc/profile.d/cephadm.sh: No such file or directory
ubuntu@gelani-mon-1:~$ ceph -s
2026-01-28T06:18:41.590+0000 7fa7c8c75640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-01-28T06:18:41.590+0000 7fa7c8c75640 -1 AuthRegistry(0x7fa7c40638e8) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-01-28T06:18:41.590+0000 7fa7c8c75640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-01-28T06:18:41.590+0000 7fa7c8c75640 -1 AuthRegistry(0x7fa7c8c73f80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-01-28T06:18:41.590+0000 7fa7c259c640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-01-28T06:18:41.590+0000 7fa7c8c75640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 13] RADOS permission denied (error connecting to the cluster)
ubuntu@gelani-mon-1:~$ ceph orch status
2026-01-28T06:19:01.219+0000 7f43009e0640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-01-28T06:19:01.219+0000 7f43009e0640 -1 AuthRegistry(0x7f42fc063d38) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-01-28T06:19:01.219+0000 7f43009e0640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-01-28T06:19:01.219+0000 7f43009e0640 -1 AuthRegistry(0x7f43009def80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-01-28T06:19:01.219+0000 7f42fa59c640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-01-28T06:19:01.219+0000 7f43009e0640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 13] RADOS permission denied (error connecting to the cluster)
ubuntu@gelani-mon-1:~$ sudo ceph orch status
Backend: cephadm
Available: Yes
Paused: No
ubuntu@gelani-mon-1:~$ sudo ceph orch status
Backend: cephadm
Available: Yes
Paused: No
ubuntu@gelani-mon-1:~$ sudoceph -s
sudoceph: command not found
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 1 daemons, quorum gelani-mon-1 (age 18m)
    mgr: gelani-mon-1.gzltah(active, since 15m)
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

ubuntu@gelani-mon-1:~$ sudo source /etc/profile.d/cephadm.sh
sudo: source: command not found
ubuntu@gelani-mon-1:~$ sudo ceph orch status
Backend: cephadm
Available: Yes
Paused: No
ubuntu@gelani-mon-1:~$ ceph orch host add gelani-mon-2 192.168.95.240
2026-01-28T06:20:19.255+0000 7f2c80e02640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-01-28T06:20:19.255+0000 7f2c80e02640 -1 AuthRegistry(0x7f2c7c063d38) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-01-28T06:20:19.255+0000 7f2c80e02640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-01-28T06:20:19.255+0000 7f2c80e02640 -1 AuthRegistry(0x7f2c80e00f80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-01-28T06:20:19.255+0000 7f2c7a59c640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-01-28T06:20:19.255+0000 7f2c80e02640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 13] RADOS permission denied (error connecting to the cluster)
ubuntu@gelani-mon-1:~$ sudo ceph orch host add gelani-mon-2 192.168.95.240
Error EINVAL: Failed to connect to gelani-mon-2 (192.168.95.240). Permission denied
Log: Opening SSH connection to 192.168.95.240, port 22
[conn=1] Connected to SSH server at 192.168.95.240, port 22
[conn=1]   Local address: 192.168.95.19, port 58380
[conn=1]   Peer address: 192.168.95.240, port 22
[conn=1] Beginning auth for user ubuntu
[conn=1] Auth failed for user ubuntu
[conn=1] Connection failure: Permission denied
[conn=1] Aborting connection

ubuntu@gelani-mon-1:~$ sudo usermod -aG ceph ubuntu
sudo chgrp -R ceph /etc/ceph
sudo chmod 750 /etc/ceph
sudo chmod 640 /etc/ceph/ceph.client.admin.keyring /etc/ceph/ceph.conf
newgrp ceph
ubuntu@gelani-mon-1:~$ sudo cat /etc/ceph/ceph.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDIY+S1RBeTGW84TOOfuyebyasCrrM4xVKbQsJKOMHIEfuoaIz+wTGioRcMRQ8hT6k+5+KNXz5NPejvZvTbNCjDMpiq1VpHVfr0SDo+CoEPMw0vh1dB8+piD1aR0brWnABwf6geRFHjOW1CZTuAOteZmQ4Qk9/ebwKfNbNIrLHtIirRx+UdwboZMUX8nJaxtQqXV9jMMa5saHPtGlx8auf4MWTn/iWvk7/oYn5/ITq+mqwRFlDstT0UmomhamjhdMJbnt/LBfynHTzs4g2SFjbjf4UGzrPR15n2kCwT1ZBkjD2rde7d9pZedWfdXprOHEtLqf4SjTyJS6pC3Og+fw2TQkb31jJGl5ukM5guvrFJRu2JAW29kX4WLcSoYRnLD+WJiBVh73KXa9hFnnD5bza12xxZ0GHsLTIw7EwHyFNQbj45SlPgV5fdwSnpQkSbgc0mHLnairXYVSgzR/s38Wq0280VIq7dVU4JYvrbWK3dfrbstHgFzOyqrjD62GRKvos= ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e
ubuntu@gelani-mon-1:~$ sudo ssh-copy-id -f -i /etc/ceph/ceph.pub ubuntu@192.168.95.240
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/etc/ceph/ceph.pub"
The authenticity of host '192.168.95.240 (192.168.95.240)' can't be established.
ED25519 key fingerprint is SHA256:HWtujphkpVJhcfZiHxoqQWmlHpcN/MV0Q8eiyBd3C9k.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ubuntu@192.168.95.240's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ubuntu@192.168.95.240'"
and check to make sure that only the key(s) you wanted were added.

ubuntu@gelani-mon-1:~$ sudo ssh-copy-id -f -i /etc/ceph/ceph.pub ubuntu@192.168.95.221
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/etc/ceph/ceph.pub"
The authenticity of host '192.168.95.221 (192.168.95.221)' can't be established.
ED25519 key fingerprint is SHA256:EnKscBVxvr221rdA7vsECKEWl6EKtNCf292oBwQ9lEk.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ubuntu@192.168.95.221's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ubuntu@192.168.95.221'"
and check to make sure that only the key(s) you wanted were added.

ubuntu@gelani-mon-1:~$ sudo ssh-copy-id -f -i /etc/ceph/ceph.pub ubuntu@192.168.95.105
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/etc/ceph/ceph.pub"
The authenticity of host '192.168.95.105 (192.168.95.105)' can't be established.
ED25519 key fingerprint is SHA256:V7CQPP16EpqpemwyZZDQqXldmMkh5xSvXEVnHh6z+fM.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ubuntu@192.168.95.105's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ubuntu@192.168.95.105'"
and check to make sure that only the key(s) you wanted were added.

ubuntu@gelani-mon-1:~$ sudo ssh-copy-id -f -i /etc/ceph/ceph.pub ubuntu@192.168.95.250
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/etc/ceph/ceph.pub"
The authenticity of host '192.168.95.250 (192.168.95.250)' can't be established.
ED25519 key fingerprint is SHA256:syV95L64mHmIBxi947Laqj3XeY3Wg1kDTA7teRfvhgQ.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
ubuntu@192.168.95.250's password:
Permission denied, please try again.
ubuntu@192.168.95.250's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'ubuntu@192.168.95.250'"
and check to make sure that only the key(s) you wanted were added.

ubuntu@gelani-mon-1:~$ sudo ssh -i /etc/ceph/ceph.key ubuntu@192.168.95.240 "hostname"
Warning: Identity file /etc/ceph/ceph.key not accessible: No such file or directory.
ubuntu@192.168.95.240's password:
gelani-mon-2
ubuntu@gelani-mon-1:~$ sudo ceph orch host add gelani-mon-2 192.168.95.240
sudo ceph orch host add gelani-mon-3 192.168.95.221
sudo ceph orch host add gelani-osd-1 192.168.95.105
sudo ceph orch host add gelani-osd-2 192.168.95.250
Error EINVAL: check-host failed:
systemctl is present
lvcreate is present
Unit chrony.service is enabled and running
Hostname "gelani-mon-2" matches what is expected.
ERROR: No container engine binary found (podman or docker). Try run `apt/dnf/yum/zypper install <container engine>`
Error EINVAL: check-host failed:
systemctl is present
lvcreate is present
Unit chrony.service is enabled and running
Hostname "gelani-mon-3" matches what is expected.
ERROR: No container engine binary found (podman or docker). Try run `apt/dnf/yum/zypper install <container engine>`
Error EINVAL: check-host failed:
systemctl is present
lvcreate is present
Unit chrony.service is enabled and running
Hostname "gelani-osd-1" matches what is expected.
ERROR: No container engine binary found (podman or docker). Try run `apt/dnf/yum/zypper install <container engine>`
Error EINVAL: check-host failed:
systemctl is present
lvcreate is present
Unit chrony.service is enabled and running
Hostname "gelani-osd-2" matches what is expected.
ERROR: No container engine binary found (podman or docker). Try run `apt/dnf/yum/zypper install <container engine>`
ubuntu@gelani-mon-1:~$ sudo ceph orch host ls
HOST          ADDR           LABELS  STATUS
gelani-mon-1  192.168.95.19  _admin
1 hosts in cluster
ubuntu@gelani-mon-1:~$ sudo ssh ubuntu@192.168.95.240 "hostname"
ubuntu@192.168.95.240's password:
gelani-mon-2
ubuntu@gelani-mon-1:~$ sudo ssh ubuntu@192.168.95.221 "hostname"
ubuntu@192.168.95.221's password:
gelani-mon-3
ubuntu@gelani-mon-1:~$ sudo ssh ubuntu@192.168.95.105 "hostname
>
> ^C
ubuntu@gelani-mon-1:~$ sudo ssh ubuntu@192.168.95.105 "hostname"
ubuntu@192.168.95.105's password:
gelani-osd-1
ubuntu@gelani-mon-1:~$ sudo ssh ubuntu@192.168.95.250 "hostname"
ubuntu@192.168.95.250's password:
gelani-osd-2
ubuntu@gelani-mon-1:~$ sudo ceph orch host add gelani-mon-2 192.168.95.240
Added host 'gelani-mon-2' with addr '192.168.95.240'
ubuntu@gelani-mon-1:~$ sudo ceph orch host add gelani-mon-3 192.168.95.221
sudo ceph orch host add gelani-osd-1 192.168.95.105
sudo ceph orch host add gelani-osd-2 192.168.95.250
Added host 'gelani-mon-3' with addr '192.168.95.221'
Added host 'gelani-osd-1' with addr '192.168.95.105'
Added host 'gelani-osd-2' with addr '192.168.95.250'
ubuntu@gelani-mon-1:~$ sudo ceph orch host ls
HOST          ADDR            LABELS  STATUS
gelani-mon-1  192.168.95.19   _admin
gelani-mon-2  192.168.95.240
gelani-mon-3  192.168.95.221
gelani-osd-1  192.168.95.105
gelani-osd-2  192.168.95.250
5 hosts in cluster
ubuntu@gelani-mon-1:~$ sudo ceph orch host ls
HOST          ADDR            LABELS  STATUS
gelani-mon-1  192.168.95.19   _admin
gelani-mon-2  192.168.95.240
gelani-mon-3  192.168.95.221
gelani-osd-1  192.168.95.105
gelani-osd-2  192.168.95.250
5 hosts in cluster
ubuntu@gelani-mon-1:~$ ceph orch host add gelani-mon-2 192.168.95.240
ceph orch host add gelani-mon-3 192.168.95.221
Added host 'gelani-mon-2' with addr '192.168.95.240'
Added host 'gelani-mon-3' with addr '192.168.95.221'
ubuntu@gelani-mon-1:~$ ceph orch host add gelani-osd-1 192.168.95.105
ceph orch host add gelani-osd-2 192.168.95.250
Added host 'gelani-osd-1' with addr '192.168.95.105'
Added host 'gelani-osd-2' with addr '192.168.95.250'
ubuntu@gelani-mon-1:~$ ceph orch host ls
HOST          ADDR            LABELS  STATUS
gelani-mon-1  192.168.95.19   _admin
gelani-mon-2  192.168.95.240
gelani-mon-3  192.168.95.221
gelani-osd-1  192.168.95.105
gelani-osd-2  192.168.95.250
5 hosts in cluster
ubuntu@gelani-mon-1:~$ ceph orch apply mon --placement="gelani-mon-1,gelani-mon-2,gelani-mon-3"
Scheduled mon update...
ubuntu@gelani-mon-1:~$ ceph mon dump
epoch 7
fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
last_changed 2026-01-28T06:41:59.850603+0000
created 2026-01-28T06:00:40.050010+0000
min_mon_release 17 (quincy)
election_strategy: 1
0: [v2:192.168.95.19:3300/0,v1:192.168.95.19:6789/0] mon.gelani-mon-1
1: [v2:192.168.95.240:3300/0,v1:192.168.95.240:6789/0] mon.gelani-mon-2
2: [v2:192.168.95.221:3300/0,v1:192.168.95.221:6789/0] mon.gelani-mon-3
dumped monmap epoch 7
ubuntu@gelani-mon-1:~$ ceph orch apply mgr --placement="gelani-mon-1,gelani-mon-2,gelani-mon-3"
Scheduled mgr update...
ubuntu@gelani-mon-1:~$ ceph mgr stat
{
    "epoch": 18,
    "available": true,
    "active_name": "gelani-mon-1.gzltah",
    "num_standby": 1
}
ubuntu@gelani-mon-1:~$ ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 17s)
    mgr: gelani-mon-1.gzltah(active, since 38m), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

ubuntu@gelani-mon-1:~$ ceph -s
ceph orch host ls
ceph mon stat
ceph mgr stat
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 2m)
    mgr: gelani-mon-1.gzltah(active, since 41m), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

HOST          ADDR            LABELS  STATUS
gelani-mon-1  192.168.95.19   _admin
gelani-mon-2  192.168.95.240
gelani-mon-3  192.168.95.221
gelani-osd-1  192.168.95.105
gelani-osd-2  192.168.95.250
5 hosts in cluster
e7: 3 mons at {gelani-mon-1=[v2:192.168.95.19:3300/0,v1:192.168.95.19:6789/0],gelani-mon-2=[v2:192.168.95.240:3300/0,v1:192.168.95.240:6789/0],gelani-mon-3=[v2:192.168.95.221:3300/0,v1:192.168.95.221:6789/0]} removed_ranks: {2} disallowed_leaders: {}, election epoch 30, leader 0 gelani-mon-1, quorum 0,1,2 gelani-mon-1,gelani-mon-2,gelani-mon-3
{
    "epoch": 19,
    "available": true,
    "active_name": "gelani-mon-1.gzltah",
    "num_standby": 2
}
ubuntu@gelani-mon-1:~$ sudo ceph -s
sudo ceph mon stat
sudo ceph mgr stat
sudo ceph orch ps --daemon_type mon
sudo ceph orch ps --daemon_type mgr
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            OSD count 0 < osd_pool_default_size 3

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 10m)
    mgr: gelani-mon-1.gzltah(active, since 48m), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 0 osds: 0 up, 0 in

  data:
    pools:   0 pools, 0 pgs
    objects: 0 objects, 0 B
    usage:   0 B used, 0 B / 0 B avail
    pgs:

e7: 3 mons at {gelani-mon-1=[v2:192.168.95.19:3300/0,v1:192.168.95.19:6789/0],gelani-mon-2=[v2:192.168.95.240:3300/0,v1:192.168.95.240:6789/0],gelani-mon-3=[v2:192.168.95.221:3300/0,v1:192.168.95.221:6789/0]} removed_ranks: {2} disallowed_leaders: {}, election epoch 30, leader 0 gelani-mon-1, quorum 0,1,2 gelani-mon-1,gelani-mon-2,gelani-mon-3
{
    "epoch": 19,
    "available": true,
    "active_name": "gelani-mon-1.gzltah",
    "num_standby": 2
}
NAME              HOST          PORTS  STATUS         REFRESHED  AGE  MEM USE  MEM LIM  VERSION  IMAGE ID      CONTAINER ID
mon.gelani-mon-1  gelani-mon-1         running (51m)     8m ago  51m    51.0M    2048M  17.2.8   259b35566514  42ffb7d67262
mon.gelani-mon-2  gelani-mon-2         running (14m)    86s ago  14m    37.4M    2048M  17.2.8   259b35566514  5c4aa7f85d65
mon.gelani-mon-3  gelani-mon-3         running (13m)     9m ago  13m    28.8M    2048M  17.2.8   259b35566514  1abee4089ea6
NAME                     HOST          PORTS             STATUS         REFRESHED  AGE  MEM USE  MEM LIM  VERSION  IMAGE ID      CONTAINER ID
mgr.gelani-mon-1.gzltah  gelani-mon-1  *:9283,8765,8443  running (51m)     8m ago  51m     451M        -  17.2.8   259b35566514  504af1640bd6
mgr.gelani-mon-2.qkfion  gelani-mon-2  *:8443,9283       running (14m)    87s ago  14m     389M        -  17.2.8   259b35566514  d3054ea2d4a9
mgr.gelani-mon-3.scuoto  gelani-mon-3  *:8443,9283       running (9m)      9m ago   9m     217M        -  17.2.8   259b35566514  af0ec19488b6
ubuntu@gelani-mon-1:~$


ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 42m)
    mgr: gelani-mon-1.gzltah(active, since 80m), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 5m), 6 in (since 5m)

  data:
    pools:   1 pools, 1 pgs
    objects: 2 objects, 449 KiB
    usage:   2.9 GiB used, 177 GiB / 180 GiB avail
    pgs:     2/6 objects degraded (33.333%)
             1 active+undersized+degraded

ubuntu@gelani-mon-1:~$ sudo ceph -s
sudo ceph health detail
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 42m)
    mgr: gelani-mon-1.gzltah(active, since 81m), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 5m), 6 in (since 6m)

  data:
    pools:   1 pools, 1 pgs
    objects: 2 objects, 449 KiB
    usage:   2.9 GiB used, 177 GiB / 180 GiB avail
    pgs:     2/6 objects degraded (33.333%)
             1 active+undersized+degraded

HEALTH_WARN Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized
[WRN] PG_DEGRADED: Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized
    pg 1.0 is stuck undersized for 5m, current state active+undersized+degraded, last acting [1,0]
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 114m)
    mgr: gelani-mon-1.gzltah(active, since 2h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 77m), 6 in (since 77m)

  data:
    pools:   1 pools, 1 pgs
    objects: 2 objects, 449 KiB
    usage:   2.9 GiB used, 177 GiB / 180 GiB avail
    pgs:     2/6 objects degraded (33.333%)
             1 active+undersized+degraded

ubuntu@gelani-mon-1:~$ sudo ceph -s
sudo ceph health detail
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 114m)
    mgr: gelani-mon-1.gzltah(active, since 2h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 77m), 6 in (since 78m)

  data:
    pools:   1 pools, 1 pgs
    objects: 2 objects, 449 KiB
    usage:   2.9 GiB used, 177 GiB / 180 GiB avail
    pgs:     2/6 objects degraded (33.333%)
             1 active+undersized+degraded

HEALTH_WARN Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized
[WRN] PG_DEGRADED: Degraded data redundancy: 2/6 objects degraded (33.333%), 1 pg degraded, 1 pg undersized
    pg 1.0 is stuck undersized for 77m, current state active+undersized+degraded, last acting [1,0]
ubuntu@gelani-mon-1:~$ sudo ceph osd stat
sudo ceph pg stat
sudo ceph df
sudo ceph osd df
6 osds: 6 up (since 78m), 6 in (since 78m); epoch: e20
1 pgs: 1 active+undersized+degraded; 449 KiB data, 2.9 GiB used, 177 GiB / 180 GiB avail; 2/6 objects degraded (33.333%)
--- RAW STORAGE ---
CLASS     SIZE    AVAIL     USED  RAW USED  %RAW USED
hdd    180 GiB  177 GiB  2.9 GiB   2.9 GiB       1.60
TOTAL  180 GiB  177 GiB  2.9 GiB   2.9 GiB       1.60

--- POOLS ---
POOL  ID  PGS   STORED  OBJECTS     USED  %USED  MAX AVAIL
.mgr   1    1  449 KiB        2  904 KiB      0     83 GiB
ID  CLASS  WEIGHT   REWEIGHT  SIZE     RAW USE  DATA     OMAP    META     AVAIL    %USE  VAR   PGS  STATUS
 0    hdd  0.02930   1.00000   30 GiB  291 MiB  632 KiB   1 KiB  290 MiB   30 GiB  0.95  0.59    1      up
 2    hdd  0.02930   1.00000   30 GiB  290 MiB  180 KiB   1 KiB  290 MiB   30 GiB  0.95  0.59    0      up
 4    hdd  0.02930   1.00000   30 GiB  690 MiB  180 KiB   1 KiB  290 MiB   29 GiB  2.25  1.41    0      up
 1    hdd  0.02930   1.00000   30 GiB  291 MiB  632 KiB   1 KiB  290 MiB   30 GiB  0.95  0.59    1      up
 3    hdd  0.02930   1.00000   30 GiB  690 MiB  180 KiB   1 KiB  290 MiB   29 GiB  2.25  1.41    0      up
 5    hdd  0.02930   1.00000   30 GiB  690 MiB  180 KiB   1 KiB  290 MiB   29 GiB  2.25  1.41    0      up
                       TOTAL  180 GiB  2.9 GiB  1.9 MiB  10 KiB  1.7 GiB  177 GiB  1.60
MIN/MAX VAR: 0.59/1.41  STDDEV: 0.65
ubuntu@gelani-mon-1:~$
ubuntu@gelani-mon-1:~$ sudo ceph osd pool get .mgr size
size: 3
ubuntu@gelani-mon-1:~$ sudo ceph osd pool get .mgr size
size: 3
ubuntu@gelani-mon-1:~$ sudo ceph osd pool get .mgr size 2
Invalid command: unused arguments: ['2']
osd pool get <pool> <var:size|min_size|pg_num|pgp_num|crush_rule|hashpspool|nodelete|nopgchange|nosizechange|write_fadvise_dontneed|noscrub|nodeep-scrub|hit_set_type|hit_set_period|hit_set_count|hit_set_fpp|use_gmt_hitset|target_max_objects|target_max_bytes|cache_target_dirty_ratio|cache_target_dirty_high_ratio|cache_target_full_ratio|cache_min_flush_age|cache_min_evict_age|erasure_code_profile|min_read_recency_for_promote|all|min_write_recency_for_promote|fast_read|hit_set_grade_decay_rate|hit_set_search_last_n|scrub_min_interval|scrub_max_interval|deep_scrub_interval|recovery_priority|recovery_op_priority|scrub_priority|compression_mode|compression_algorithm|compression_required_ratio|compression_max_blob_size|compression_min_blob_size|csum_type|csum_min_block|csum_max_block|allow_ec_overwrites|fingerprint_algorithm|pg_autoscale_mode|pg_autoscale_bias|pg_num_min|pg_num_max|target_size_bytes|target_size_ratio|dedup_tier|dedup_chunk_algorithm|dedup_cdc_chunk_size|eio|bulk> :  get pool parameter <var>
Error EINVAL: invalid command
ubuntu@gelani-mon-1:~$ sudo ceph osd pool set .mgr size 2
set pool 1 size to 2
ubuntu@gelani-mon-1:~$ sudo ceph osd pool set .mgr min_size 1
set pool 1 min_size to 1
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 118m)
    mgr: gelani-mon-1.gzltah(active, since 2h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 81m), 6 in (since 82m)

  data:
    pools:   1 pools, 1 pgs
    objects: 2 objects, 449 KiB
    usage:   1.7 GiB used, 178 GiB / 180 GiB avail
    pgs:     1 active+clean

ubuntu@gelani-mon-1:~$ sudo ceph health detail
HEALTH_OK
ubuntu@gelani-mon-1:~$

ubuntu@gelani-mon-1:~$ sudo ceph osd pool create volume 32
pool 'volume' created
ubuntu@gelani-mon-1:~$ sudo ceph osd pool create images 16
pool 'images' created
ubuntu@gelani-mon-1:~$ sudo osd pool create vms 32
sudo: osd: command not found
ubuntu@gelani-mon-1:~$ sudo ceph osd pool create vms 32
pool 'vms' created
ubuntu@gelani-mon-1:~$ sudo ceph osd pool create backups 16
pool 'backups' created
ubuntu@gelani-mon-1:~$ for p in volumes images vms backups; do
  sudo ceph osd pool set $p size 2
  sudo ceph osd pool set $p min_size 1
done
Error ENOENT: unrecognized pool 'volumes'
Error ENOENT: unrecognized pool 'volumes'
set pool 3 size to 2
set pool 3 min_size to 1
set pool 4 size to 2
set pool 4 min_size to 1
set pool 5 size to 2
set pool 5 min_size to 1
ubuntu@gelani-mon-1:~$ for p in volumes images vms backups; do
  sudo ceph osd pool application enable $p rbd
done
Error ENOENT: unrecognized pool 'volumes'
enabled application 'rbd' on pool 'images'
enabled application 'rbd' on pool 'vms'
enabled application 'rbd' on pool 'backups'
ubuntu@gelani-mon-1:~$ sudo ceph osd pool ls
.mgr
volume
images
vms
backups
ubuntu@gelani-mon-1:~$ sudo ceph osd pool set volume size 2
sudo ceph osd pool set volume min_size 1
set pool 2 size to 2
set pool 2 min_size to 1
ubuntu@gelani-mon-1:~$ sudo ceph osd pool application enable volume rbd
enabled application 'rbd' on pool 'volume'
ubuntu@gelani-mon-1:~$ sudo rbd pool init volume
sudo rbd pool init images
sudo rbd pool init vms
sudo rbd pool init backups
ubuntu@gelani-mon-1:~$ sudo ceph osd pool ls
.mgr
volume
images
vms
backups
ubuntu@gelani-mon-1:~$ sudo ceph osd pool application get volumes
Error ENOENT: unrecognized pool 'volumes'
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 2h)
    mgr: gelani-mon-1.gzltah(active, since 2h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 88m), 6 in (since 88m)

  data:
    pools:   5 pools, 97 pgs
    objects: 10 objects, 449 KiB
    usage:   1.7 GiB used, 178 GiB / 180 GiB avail
    pgs:     97 active+clean

ubuntu@gelani-mon-1:~$ sudo ceph osd pool application get volume
{
    "rbd": {}
}
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ sudo ceph osd pool application get volumes
Error ENOENT: unrecognized pool 'volumes'
ubuntu@gelani-mon-1:~$ sudo ceph osd pool application get volume
{
    "rbd": {}
}
ubuntu@gelani-mon-1:~$ sudo ceph osd pool ls detail
pool 1 '.mgr' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 1 pgp_num 1 autoscale_mode on last_change 23 flags hashpspool stripe_width 0 pg_num_max 32 pg_num_min 1 application mgr
pool 2 'volume' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 50 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 3 'images' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 53 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 4 'vms' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 56 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 5 'backups' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 59 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd

ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 2h)
    mgr: gelani-mon-1.gzltah(active, since 2h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 89m), 6 in (since 89m)

  data:
    pools:   5 pools, 97 pgs
    objects: 10 objects, 449 KiB
    usage:   1.7 GiB used, 178 GiB / 180 GiB avail
    pgs:     97 active+clean

ubuntu@gelani-mon-1:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:a9:81:d4 brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.95.19/24 metric 100 brd 192.168.95.255 scope global dynamic ens3
       valid_lft 32254sec preferred_lft 32254sec
    inet6 fe80::f816:3eff:fea9:81d4/64 scope link
       valid_lft forever preferred_lft forever
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default
    link/ether da:22:38:be:09:30 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
       valid_lft forever preferred_lft forever
ubuntu@gelani-mon-1:~$




```







































