```
ubuntu@nextcloud:~$ sudo apt update && sudo apt upgrade -y
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [2892 kB]
Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:6 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en [416 kB]
Get:7 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [14.0 kB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages [4867 kB]
Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages [14.1 MB]
Get:10 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en [913 kB]
Get:11 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 c-n-f Metadata [652 B]
Get:12 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1007 kB]
Get:13 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [221 kB]
Get:14 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata [22.3 kB]
Get:15 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages [50.5 kB]
Get:16 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en [10.2 kB]
Get:17 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata [376 B]
Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe Translation-en [5652 kB]
Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata [286 kB]
Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages [217 kB]
Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en [112 kB]
Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata [8372 B]
Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [3157 kB]
Get:24 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en [484 kB]
Get:25 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [19.0 kB]
Get:26 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages [5044 kB]
Get:27 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en [944 kB]
Get:28 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata [640 B]
Get:29 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1245 kB]
Get:30 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [310 kB]
Get:31 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata [30.0 kB]
Get:32 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages [57.6 kB]
Get:33 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en [13.2 kB]
Get:34 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata [600 B]
Get:35 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages [69.4 kB]
Get:36 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en [11.5 kB]
Get:37 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata [412 B]
Get:38 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata [116 B]
Get:39 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages [30.1 kB]
Get:40 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en [16.6 kB]
Get:41 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata [672 B]
Get:42 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata [116 B]
Fetched 42.6 MB in 7s (5807 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
87 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following NEW packages will be installed:
  linux-headers-5.15.0-164 linux-headers-5.15.0-164-generic linux-image-5.15.0-164-generic linux-modules-5.15.0-164-generic
The following packages will be upgraded:
  apparmor apport bind9-dnsutils bind9-host bind9-libs binutils binutils-common binutils-x86-64-linux-gnu cloud-init curl dirmngr distro-info-data dpkg gcc-12-base git git-man gnupg gnupg-l10n gnupg-utils
  gpg gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm gpgv iputils-ping iputils-tracepath landscape-common libapparmor1 libbinutils libc-bin libc6 libctf-nobfd0 libctf0 libcurl3-gnutls libcurl4
  libgcc-s1 libglib2.0-0 libglib2.0-bin libglib2.0-data libgnutls30 libnss-systemd libpam-systemd libperl5.34 libpng16-16 libpython3.10 libpython3.10-minimal libpython3.10-stdlib libsqlite3-0 libssh-4
  libssl3 libstdc++6 libsystemd0 libudev1 libudisks2-0 libxml2 linux-headers-generic linux-headers-virtual linux-image-virtual linux-virtual locales needrestart open-vm-tools openssl perl perl-base
  perl-modules-5.34 powermgmt-base python-apt-common python3-apport python3-apt python3-attr python3-problem-report python3-urllib3 python3.10 python3.10-minimal snapd sosreport systemd systemd-hwe-hwdb
  systemd-sysv systemd-timesyncd ubuntu-advantage-tools ubuntu-pro-client ubuntu-pro-client-l10n udev
87 upgraded, 4 newly installed, 0 to remove and 0 not upgraded.
62 standard LTS security updates
Need to get 138 MB of archives.
After this operation, 243 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dpkg amd64 1.21.1ubuntu2.6 [1239 kB]
Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libperl5.34 amd64 5.34.0-3ubuntu1.5 [4797 kB]
Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl amd64 5.34.0-3ubuntu1.5 [232 kB]
Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-base amd64 5.34.0-3ubuntu1.5 [1761 kB]
Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-modules-5.34 all 5.34.0-3ubuntu1.5 [2977 kB]
Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gcc-12-base amd64 12.3.0-1ubuntu1~22.04.2 [20.6 kB]
Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgcc-s1 amd64 12.3.0-1ubuntu1~22.04.2 [53.9 kB]
Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libstdc++6 amd64 12.3.0-1ubuntu1~22.04.2 [699 kB]
Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc6 amd64 2.35-0ubuntu3.11 [3235 kB]
Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc-bin amd64 2.35-0ubuntu3.11 [706 kB]
Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnss-systemd amd64 249.11-0ubuntu3.17 [133 kB]
Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsystemd0 amd64 249.11-0ubuntu3.17 [317 kB]
Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-timesyncd amd64 249.11-0ubuntu3.17 [31.2 kB]
Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-sysv amd64 249.11-0ubuntu3.17 [10.5 kB]
Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpam-systemd amd64 249.11-0ubuntu3.17 [203 kB]
Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd amd64 249.11-0ubuntu3.17 [4583 kB]
Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 udev amd64 249.11-0ubuntu3.17 [1557 kB]
Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudev1 amd64 249.11-0ubuntu3.17 [76.7 kB]
Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapparmor1 amd64 3.0.4-2ubuntu2.5 [39.6 kB]
Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgnutls30 amd64 3.7.3-4ubuntu1.7 [967 kB]
Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssl3 amd64 3.0.2-0ubuntu1.20 [1905 kB]
Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10 amd64 3.10.12-1~22.04.12 [1949 kB]
Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10 amd64 3.10.12-1~22.04.12 [508 kB]
Get:24 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-stdlib amd64 3.10.12-1~22.04.12 [1849 kB]
Get:25 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10-minimal amd64 3.10.12-1~22.04.12 [2268 kB]
Get:26 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-minimal amd64 3.10.12-1~22.04.12 [815 kB]
Get:27 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsqlite3-0 amd64 3.37.2-2ubuntu0.5 [643 kB]
Get:28 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-data all 2.72.4-0ubuntu2.6 [4698 B]
Get:29 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-bin amd64 2.72.4-0ubuntu2.6 [80.9 kB]
Get:30 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-0 amd64 2.72.4-0ubuntu2.6 [1467 kB]
Get:31 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxml2 amd64 2.9.13+dfsg-1ubuntu0.10 [764 kB]
Get:32 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 open-vm-tools amd64 2:12.3.5-3~ubuntu0.22.04.3 [747 kB]
Get:33 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-client amd64 2.2.27-3ubuntu2.4 [62.7 kB]
Get:34 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dirmngr amd64 2.2.27-3ubuntu2.4 [293 kB]
Get:35 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-server amd64 2.2.27-3ubuntu2.4 [57.5 kB]
Get:36 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-utils amd64 2.2.27-3ubuntu2.4 [309 kB]
Get:37 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-agent amd64 2.2.27-3ubuntu2.4 [209 kB]
Get:38 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg amd64 2.2.27-3ubuntu2.4 [518 kB]
Get:39 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgconf amd64 2.2.27-3ubuntu2.4 [94.5 kB]
Get:40 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-l10n all 2.2.27-3ubuntu2.4 [54.7 kB]
Get:41 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg all 2.2.27-3ubuntu2.4 [315 kB]
Get:42 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgsm amd64 2.2.27-3ubuntu2.4 [197 kB]
Get:43 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgv amd64 2.2.27-3ubuntu2.4 [137 kB]
Get:44 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 distro-info-data all 0.52ubuntu0.11 [5444 B]
Get:45 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-ping amd64 3:20211215-1ubuntu0.1 [43.0 kB]
Get:46 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 locales all 2.35-0ubuntu3.11 [4247 kB]
Get:47 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.20 [1185 kB]
Get:48 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python-apt-common all 2.4.0ubuntu4.1 [14.7 kB]
Get:49 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apt amd64 2.4.0ubuntu4.1 [164 kB]
Get:50 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client-l10n amd64 37.1ubuntu0~22.04 [20.7 kB]
Get:51 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client amd64 37.1ubuntu0~22.04 [238 kB]
Get:52 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-advantage-tools all 37.1ubuntu0~22.04 [10.9 kB]
Get:53 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apparmor amd64 3.0.4-2ubuntu2.5 [599 kB]
Get:54 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-dnsutils amd64 1:9.18.39-0ubuntu0.22.04.2 [158 kB]
Get:55 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-host amd64 1:9.18.39-0ubuntu0.22.04.2 [52.5 kB]
Get:56 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-libs amd64 1:9.18.39-0ubuntu0.22.04.2 [1262 kB]
Get:57 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-tracepath amd64 3:20211215-1ubuntu0.1 [14.2 kB]
Get:58 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpng16-16 amd64 1.6.37-3ubuntu0.1 [191 kB]
Get:59 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 powermgmt-base all 1.36ubuntu0.22.04.1 [7736 B]
Get:60 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-problem-report all 2.20.11-0ubuntu82.10 [11.4 kB]
Get:61 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apport all 2.20.11-0ubuntu82.10 [89.0 kB]
Get:62 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apport all 2.20.11-0ubuntu82.10 [135 kB]
Get:63 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf0 amd64 2.38-4ubuntu2.12 [103 kB]
Get:64 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf-nobfd0 amd64 2.38-4ubuntu2.12 [108 kB]
Get:65 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-x86-64-linux-gnu amd64 2.38-4ubuntu2.12 [2324 kB]
Get:66 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libbinutils amd64 2.38-4ubuntu2.12 [663 kB]
Get:67 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils amd64 2.38-4ubuntu2.12 [3184 B]
Get:68 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-common amd64 2.38-4ubuntu2.12 [223 kB]
Get:69 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssh-4 amd64 0.9.6-2ubuntu0.22.04.5 [187 kB]
Get:70 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.21 [194 kB]
Get:71 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.21 [290 kB]
Get:72 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl3-gnutls amd64 7.81.0-1ubuntu1.21 [284 kB]
Get:73 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git-man all 1:2.34.1-1ubuntu1.15 [955 kB]
Get:74 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git amd64 1:2.34.1-1ubuntu1.15 [3166 kB]
Get:75 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 landscape-common amd64 23.02-0ubuntu1~22.04.7 [88.9 kB]
Get:76 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudisks2-0 amd64 2.9.4-1ubuntu2.3 [167 kB]
Get:77 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-164 all 5.15.0-164.174 [12.4 MB]
Get:78 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-164-generic amd64 5.15.0-164.174 [2828 kB]
Get:79 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-modules-5.15.0-164-generic amd64 5.15.0-164.174 [22.7 MB]
Get:80 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-5.15.0-164-generic amd64 5.15.0-164.174 [11.6 MB]
Get:81 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-virtual amd64 5.15.0.164.159 [1656 B]
Get:82 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-virtual amd64 5.15.0.164.159 [2432 B]
Get:83 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-virtual amd64 5.15.0.164.159 [1634 B]
Get:84 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-generic amd64 5.15.0.164.159 [2334 B]
Get:85 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 needrestart all 3.5-5ubuntu2.5 [45.5 kB]
Get:86 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-attr all 21.2.0-1ubuntu1 [43.9 kB]
Get:87 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-urllib3 all 1.26.5-1~exp1ubuntu0.4 [98.6 kB]
Get:88 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 snapd amd64 2.72+ubuntu22.04 [31.8 MB]
Get:89 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 sosreport amd64 4.9.2-0ubuntu0~22.04.1 [367 kB]
Get:90 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-hwe-hwdb all 249.11.6 [3668 B]
Get:91 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 cloud-init all 25.2-0ubuntu1~22.04.1 [586 kB]
Fetched 138 MB in 18s (7626 kB/s)
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
Preparing to unpack .../libc6_2.35-0ubuntu3.11_amd64.deb ...
Unpacking libc6:amd64 (2.35-0ubuntu3.11) over (2.35-0ubuntu3.10) ...
Setting up libc6:amd64 (2.35-0ubuntu3.11) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libc-bin_2.35-0ubuntu3.11_amd64.deb ...
Unpacking libc-bin (2.35-0ubuntu3.11) over (2.35-0ubuntu3.10) ...
Setting up libc-bin (2.35-0ubuntu3.11) ...
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
Preparing to unpack .../libgnutls30_3.7.3-4ubuntu1.7_amd64.deb ...
Unpacking libgnutls30:amd64 (3.7.3-4ubuntu1.7) over (3.7.3-4ubuntu1.6) ...
Setting up libgnutls30:amd64 (3.7.3-4ubuntu1.7) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../libssl3_3.0.2-0ubuntu1.20_amd64.deb ...
Unpacking libssl3:amd64 (3.0.2-0ubuntu1.20) over (3.0.2-0ubuntu1.19) ...
Setting up libssl3:amd64 (3.0.2-0ubuntu1.20) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../00-libpython3.10_3.10.12-1~22.04.12_amd64.deb ...
Unpacking libpython3.10:amd64 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../01-python3.10_3.10.12-1~22.04.12_amd64.deb ...
Unpacking python3.10 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../02-libpython3.10-stdlib_3.10.12-1~22.04.12_amd64.deb ...
Unpacking libpython3.10-stdlib:amd64 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../03-python3.10-minimal_3.10.12-1~22.04.12_amd64.deb ...
Unpacking python3.10-minimal (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../04-libpython3.10-minimal_3.10.12-1~22.04.12_amd64.deb ...
Unpacking libpython3.10-minimal:amd64 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...
Preparing to unpack .../05-libsqlite3-0_3.37.2-2ubuntu0.5_amd64.deb ...
Unpacking libsqlite3-0:amd64 (3.37.2-2ubuntu0.5) over (3.37.2-2ubuntu0.4) ...
Preparing to unpack .../06-libglib2.0-data_2.72.4-0ubuntu2.6_all.deb ...
Unpacking libglib2.0-data (2.72.4-0ubuntu2.6) over (2.72.4-0ubuntu2.5) ...
Preparing to unpack .../07-libglib2.0-bin_2.72.4-0ubuntu2.6_amd64.deb ...
Unpacking libglib2.0-bin (2.72.4-0ubuntu2.6) over (2.72.4-0ubuntu2.5) ...
Preparing to unpack .../08-libglib2.0-0_2.72.4-0ubuntu2.6_amd64.deb ...
Unpacking libglib2.0-0:amd64 (2.72.4-0ubuntu2.6) over (2.72.4-0ubuntu2.5) ...
Preparing to unpack .../09-libxml2_2.9.13+dfsg-1ubuntu0.10_amd64.deb ...
Unpacking libxml2:amd64 (2.9.13+dfsg-1ubuntu0.10) over (2.9.13+dfsg-1ubuntu0.7) ...
Preparing to unpack .../10-open-vm-tools_2%3a12.3.5-3~ubuntu0.22.04.3_amd64.deb ...
Unpacking open-vm-tools (2:12.3.5-3~ubuntu0.22.04.3) over (2:12.3.5-3~ubuntu0.22.04.2) ...
Preparing to unpack .../11-gpg-wks-client_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpg-wks-client (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../12-dirmngr_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking dirmngr (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../13-gpg-wks-server_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpg-wks-server (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../14-gnupg-utils_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gnupg-utils (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../15-gpg-agent_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpg-agent (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../16-gpg_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpg (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../17-gpgconf_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpgconf (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../18-gnupg-l10n_2.2.27-3ubuntu2.4_all.deb ...
Unpacking gnupg-l10n (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../19-gnupg_2.2.27-3ubuntu2.4_all.deb ...
Unpacking gnupg (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../20-gpgsm_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpgsm (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Preparing to unpack .../21-gpgv_2.2.27-3ubuntu2.4_amd64.deb ...
Unpacking gpgv (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...
Setting up gpgv (2.2.27-3ubuntu2.4) ...
(Reading database ... 64592 files and directories currently installed.)
Preparing to unpack .../00-distro-info-data_0.52ubuntu0.11_all.deb ...
Unpacking distro-info-data (0.52ubuntu0.11) over (0.52ubuntu0.9) ...
Preparing to unpack .../01-iputils-ping_3%3a20211215-1ubuntu0.1_amd64.deb ...
Unpacking iputils-ping (3:20211215-1ubuntu0.1) over (3:20211215-1) ...
Preparing to unpack .../02-locales_2.35-0ubuntu3.11_all.deb ...
Unpacking locales (2.35-0ubuntu3.11) over (2.35-0ubuntu3.10) ...
Preparing to unpack .../03-openssl_3.0.2-0ubuntu1.20_amd64.deb ...
Unpacking openssl (3.0.2-0ubuntu1.20) over (3.0.2-0ubuntu1.19) ...
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
Preparing to unpack .../14-libpng16-16_1.6.37-3ubuntu0.1_amd64.deb ...
Unpacking libpng16-16:amd64 (1.6.37-3ubuntu0.1) over (1.6.37-3build5) ...
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
Preparing to unpack .../31-landscape-common_23.02-0ubuntu1~22.04.7_amd64.deb ...
Unpacking landscape-common (23.02-0ubuntu1~22.04.7) over (23.02-0ubuntu1~22.04.4) ...
Preparing to unpack .../32-libudisks2-0_2.9.4-1ubuntu2.3_amd64.deb ...
Unpacking libudisks2-0:amd64 (2.9.4-1ubuntu2.3) over (2.9.4-1ubuntu2.2) ...
Selecting previously unselected package linux-headers-5.15.0-164.
Preparing to unpack .../33-linux-headers-5.15.0-164_5.15.0-164.174_all.deb ...
Unpacking linux-headers-5.15.0-164 (5.15.0-164.174) ...
Selecting previously unselected package linux-headers-5.15.0-164-generic.
Preparing to unpack .../34-linux-headers-5.15.0-164-generic_5.15.0-164.174_amd64.deb ...
Unpacking linux-headers-5.15.0-164-generic (5.15.0-164.174) ...
Selecting previously unselected package linux-modules-5.15.0-164-generic.
Preparing to unpack .../35-linux-modules-5.15.0-164-generic_5.15.0-164.174_amd64.deb ...
Unpacking linux-modules-5.15.0-164-generic (5.15.0-164.174) ...
Selecting previously unselected package linux-image-5.15.0-164-generic.
Preparing to unpack .../36-linux-image-5.15.0-164-generic_5.15.0-164.174_amd64.deb ...
Unpacking linux-image-5.15.0-164-generic (5.15.0-164.174) ...
Preparing to unpack .../37-linux-virtual_5.15.0.164.159_amd64.deb ...
Unpacking linux-virtual (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../38-linux-image-virtual_5.15.0.164.159_amd64.deb ...
Unpacking linux-image-virtual (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../39-linux-headers-virtual_5.15.0.164.159_amd64.deb ...
Unpacking linux-headers-virtual (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../40-linux-headers-generic_5.15.0.164.159_amd64.deb ...
Unpacking linux-headers-generic (5.15.0.164.159) over (5.15.0.143.138) ...
Preparing to unpack .../41-needrestart_3.5-5ubuntu2.5_all.deb ...
Unpacking needrestart (3.5-5ubuntu2.5) over (3.5-5ubuntu2.4) ...
Preparing to unpack .../42-python3-attr_21.2.0-1ubuntu1_all.deb ...
Unpacking python3-attr (21.2.0-1ubuntu1) over (21.2.0-1) ...
Preparing to unpack .../43-python3-urllib3_1.26.5-1~exp1ubuntu0.4_all.deb ...
Unpacking python3-urllib3 (1.26.5-1~exp1ubuntu0.4) over (1.26.5-1~exp1ubuntu0.3) ...
Preparing to unpack .../44-snapd_2.72+ubuntu22.04_amd64.deb ...
Unpacking snapd (2.72+ubuntu22.04) over (2.67.1+22.04) ...
Preparing to unpack .../45-sosreport_4.9.2-0ubuntu0~22.04.1_amd64.deb ...
Unpacking sosreport (4.9.2-0ubuntu0~22.04.1) over (4.8.2-0ubuntu0~22.04.2) ...
Preparing to unpack .../46-systemd-hwe-hwdb_249.11.6_all.deb ...
Unpacking systemd-hwe-hwdb (249.11.6) over (249.11.5) ...
Preparing to unpack .../47-cloud-init_25.2-0ubuntu1~22.04.1_all.deb ...
Unpacking cloud-init (25.2-0ubuntu1~22.04.1) over (25.1.2-0ubuntu0~22.04.2) ...
Setting up powermgmt-base (1.36ubuntu0.22.04.1) ...
Setting up python3-attr (21.2.0-1ubuntu1) ...
Setting up libapparmor1:amd64 (3.0.4-2ubuntu2.5) ...
Setting up cloud-init (25.2-0ubuntu1~22.04.1) ...
Installing new version of config file /etc/cloud/templates/sources.list.debian.deb822.tmpl ...
Setting up python3-problem-report (2.20.11-0ubuntu82.10) ...
Setting up libglib2.0-0:amd64 (2.72.4-0ubuntu2.6) ...
No schema files found: doing nothing.
Setting up distro-info-data (0.52ubuntu0.11) ...
Setting up libsqlite3-0:amd64 (3.37.2-2ubuntu0.5) ...
Setting up binutils-common:amd64 (2.38-4ubuntu2.12) ...
Setting up libctf-nobfd0:amd64 (2.38-4ubuntu2.12) ...
Setting up systemd (249.11-0ubuntu3.17) ...
Setting up perl-modules-5.34 (5.34.0-3ubuntu1.5) ...
Setting up locales (2.35-0ubuntu3.11) ...
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
Setting up libglib2.0-data (2.72.4-0ubuntu2.6) ...
Setting up gnupg-l10n (2.2.27-3ubuntu2.4) ...
Setting up libpng16-16:amd64 (1.6.37-3ubuntu0.1) ...
Setting up systemd-timesyncd (249.11-0ubuntu3.17) ...
Setting up udev (249.11-0ubuntu3.17) ...
Setting up libpython3.10-minimal:amd64 (3.10.12-1~22.04.12) ...
Setting up libssh-4:amd64 (0.9.6-2ubuntu0.22.04.5) ...
Setting up sosreport (4.9.2-0ubuntu0~22.04.1) ...
Installing new version of config file /etc/sos/sos.conf ...
Setting up python3-urllib3 (1.26.5-1~exp1ubuntu0.4) ...
Setting up systemd-hwe-hwdb (249.11.6) ...
Setting up python-apt-common (2.4.0ubuntu4.1) ...
Setting up gpgconf (2.2.27-3ubuntu2.4) ...
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.21) ...
Setting up git-man (1:2.34.1-1ubuntu1.15) ...
Setting up curl (7.81.0-1ubuntu1.21) ...
Setting up libbinutils:amd64 (2.38-4ubuntu2.12) ...
Setting up openssl (3.0.2-0ubuntu1.20) ...
Setting up iputils-ping (3:20211215-1ubuntu0.1) ...
Setting up libxml2:amd64 (2.9.13+dfsg-1ubuntu0.10) ...
Setting up gpg (2.2.27-3ubuntu2.4) ...
Setting up linux-headers-5.15.0-164 (5.15.0-164.174) ...
Setting up iputils-tracepath (3:20211215-1ubuntu0.1) ...
Setting up libudisks2-0:amd64 (2.9.4-1ubuntu2.3) ...
Setting up gnupg-utils (2.2.27-3ubuntu2.4) ...
Setting up libctf0:amd64 (2.38-4ubuntu2.12) ...
Setting up snapd (2.72+ubuntu22.04) ...
Installing new version of config file /etc/apparmor.d/usr.lib.snapd.snap-confine.real ...
snapd.failure.service is a disabled or a static unit not running, not starting it.
snapd.gpio-chardev-setup.target is a disabled or a static unit not running, not starting it.
snapd.snap-repair.service is a disabled or a static unit not running, not starting it.
Setting up systemd-sysv (249.11-0ubuntu3.17) ...
Setting up libperl5.34:amd64 (5.34.0-3ubuntu1.5) ...
Setting up gpg-agent (2.2.27-3ubuntu2.4) ...
Setting up bind9-libs:amd64 (1:9.18.39-0ubuntu0.22.04.2) ...
Setting up python3-apt (2.4.0ubuntu4.1) ...
Setting up gpgsm (2.2.27-3ubuntu2.4) ...
Setting up linux-headers-5.15.0-164-generic (5.15.0-164.174) ...
Setting up libglib2.0-bin (2.72.4-0ubuntu2.6) ...
Setting up libnss-systemd:amd64 (249.11-0ubuntu3.17) ...
Setting up libcurl3-gnutls:amd64 (7.81.0-1ubuntu1.21) ...
Setting up linux-headers-generic (5.15.0.164.159) ...
Setting up landscape-common (23.02-0ubuntu1~22.04.7) ...
Setting up python3.10-minimal (3.10.12-1~22.04.12) ...
Setting up python3-apport (2.20.11-0ubuntu82.10) ...
Setting up libpython3.10-stdlib:amd64 (3.10.12-1~22.04.12) ...
Setting up dirmngr (2.2.27-3ubuntu2.4) ...
Setting up perl (5.34.0-3ubuntu1.5) ...
Setting up git (1:2.34.1-1ubuntu1.15) ...
Setting up gpg-wks-server (2.2.27-3ubuntu2.4) ...
Setting up open-vm-tools (2:12.3.5-3~ubuntu0.22.04.3) ...
Setting up libpam-systemd:amd64 (249.11-0ubuntu3.17) ...
Setting up bind9-host (1:9.18.39-0ubuntu0.22.04.2) ...
Setting up ubuntu-pro-client (37.1ubuntu0~22.04) ...
Installing new version of config file /etc/apparmor.d/ubuntu_pro_apt_news ...
Installing new version of config file /etc/apparmor.d/ubuntu_pro_esm_cache ...
Setting up binutils-x86-64-linux-gnu (2.38-4ubuntu2.12) ...
Setting up ubuntu-pro-client-l10n (37.1ubuntu0~22.04) ...
Setting up libpython3.10:amd64 (3.10.12-1~22.04.12) ...
Setting up python3.10 (3.10.12-1~22.04.12) ...
Setting up linux-headers-virtual (5.15.0.164.159) ...
Setting up gpg-wks-client (2.2.27-3ubuntu2.4) ...
Setting up binutils (2.38-4ubuntu2.12) ...
Setting up apport (2.20.11-0ubuntu82.10) ...
apport-autoreport.service is a disabled or a static unit, not starting it.
Setting up gnupg (2.2.27-3ubuntu2.4) ...
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
Processing triggers for libc-bin (2.35-0ubuntu3.11) ...
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
ubuntu@nextcloud:~$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0     7:0    0 63.8M  1 loop /snap/core20/2599
loop1     7:1    0 89.4M  1 loop /snap/lxd/31333
loop2     7:2    0 50.9M  1 loop /snap/snapd/24718
vda     252:0    0   30G  0 disk
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0  100G  0 disk
ubuntu@nextcloud:~$ sudo fdisk /dev/vdb

Welcome to fdisk (util-linux 2.37.2).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
Created a new DOS disklabel with disk identifier 0x5fb1d1fb.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-209715199, default 2048):
Last sector, +/-sectors or +/-size{K,M,G,T,P} (2048-209715199, default 209715199):

Created a new partition 1 of type 'Linux' and of size 100 GiB.

Command (m for help): w
The partition table has been altered.
Calling ioctl() to re-read partition table.
Syncing disks.

ubuntu@nextcloud:~$ lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0     7:0    0 63.8M  1 loop /snap/core20/2599
loop1     7:1    0 89.4M  1 loop /snap/lxd/31333
loop2     7:2    0 50.9M  1 loop /snap/snapd/24718
vda     252:0    0   30G  0 disk
├─vda1  252:1    0 29.9G  0 part /
├─vda14 252:14   0    4M  0 part
└─vda15 252:15   0  106M  0 part /boot/efi
vdb     252:16   0  100G  0 disk
└─vdb1  252:17   0  100G  0 part
ubuntu@nextcloud:~$ sudo mkfs.ext4 /dev/vdb1
mke2fs 1.46.5 (30-Dec-2021)
Discarding device blocks: done
Creating filesystem with 26214144 4k blocks and 6553600 inodes
Filesystem UUID: 09cf77bd-64f2-4007-b55b-03a91e63f237
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208,
        4096000, 7962624, 11239424, 20480000, 23887872

Allocating group tables: done
Writing inode tables: done
Creating journal (131072 blocks): done
Writing superblocks and filesystem accounting information: done

ubuntu@nextcloud:~$ mkdir /mnt/nextcloud-data
mkdir: cannot create directory ‘/mnt/nextcloud-data’: Permission denied
ubuntu@nextcloud:~$ sudo mkdir /mnt/nextcloud-data
ubuntu@nextcloud:~$ sudo mount /dev/vdb1 /mnt/nextcloud-data
ubuntu@nextcloud:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           794M  1.1M  793M   1% /run
/dev/vda1        29G  2.1G   27G   8% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/vda15      105M  6.1M   99M   6% /boot/efi
tmpfs           794M  4.0K  794M   1% /run/user/1000
/dev/vdb1        98G   24K   93G   1% /mnt/nextcloud-data
ubuntu@nextcloud:~$ sudo blkid /dev/vbd1
ubuntu@nextcloud:~$ sudo blkid /mnt/nextcloud-data/vbd1
ubuntu@nextcloud:~$ sudo blkid /dev/vdb1
/dev/vdb1: UUID="09cf77bd-64f2-4007-b55b-03a91e63f237" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="5fb1d1fb-01"
ubuntu@nextcloud:~$ sudo nano /etc/fstab
ubuntu@nextcloud:~$ sudo nano /etc/fstab
ubuntu@nextcloud:~$ cat /etc/fstab
LABEL=cloudimg-rootfs   /        ext4   discard,errors=remount-ro       0 1
LABEL=UEFI      /boot/efi       vfat    umask=0077      0 1
UUID="09cf77bd-64f2-4007-b55b-03a91e63f237" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="5fb1d1fb-01"  /mnt/data  ext4  defaults,nofail  0  2
ubuntu@nextcloud:~$ sudo nano /etc/fstab
ubuntu@nextcloud:~$ sudo umount /mnt/nextcloud-data
ubuntu@nextcloud:~$ sudo mount -a
ubuntu@nextcloud:~$ df -h
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           794M  1.1M  793M   1% /run
/dev/vda1        29G  2.1G   27G   8% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/vda15      105M  6.1M   99M   6% /boot/efi
tmpfs           794M  4.0K  794M   1% /run/user/1000
/dev/vdb1        98G   24K   93G   1% /mnt/nextcloud-data
ubuntu@nextcloud:~$ sudo reboot
Connection to 192.168.90.28 closed by remote host.
Connection to 192.168.90.28 closed.
emaduzzaman@KAZI-EMADUZZAMAN-2700:~/scripts$
emaduzzaman@KAZI-EMADUZZAMAN-2700:~/scripts$ ssh ubuntu@192.168.90.28
ubuntu@192.168.90.28's password:
Permission denied, please try again.
ubuntu@192.168.90.28's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Dec 15 06:52:12 UTC 2025

  System load:  0.31              Processes:             121
  Usage of /:   7.2% of 28.89GB   Users logged in:       0
  Memory usage: 2%                IPv4 address for ens3: 192.168.90.28
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Dec 15 06:38:11 2025 from 192.168.90.20
ubuntu@nextcloud:~$ cd /etc/netpaln
-bash: cd: /etc/netpaln: No such file or directory
ubuntu@nextcloud:~$ cd /etc
ubuntu@nextcloud:/etc$ ls
PackageKit              ca-certificates.conf.dpkg-old  depmod.d      gss              landscape       lsb-release     needrestart             passwd-     rc6.d         ssh                ubuntu-advantage
X11                     cloud                          dhcp          hdparm.conf      ld.so.cache     lvm             netconfig               perl        rcS.d         ssl                ucf.conf
adduser.conf            console-setup                  dpkg          host.conf        ld.so.conf      machine-id      netplan                 pm          resolv.conf   subgid             udev
alternatives            cron.d                         e2scrub.conf  hostname         ld.so.conf.d    magic           network                 polkit-1    rmt           subgid-            ufw
apparmor                cron.daily                     ec2_version   hosts            ldap            magic.mime      networkd-dispatcher     pollinate   rpc           subuid             update-manager
apparmor.d              cron.hourly                    environment   hosts.allow      legal           manpath.config  networks                profile     rsyslog.conf  subuid-            update-motd.d
apport                  cron.monthly                   ethertypes    hosts.deny       libaudit.conf   mdadm           newt                    profile.d   rsyslog.d     sudo.conf          update-notifier
apt                     cron.weekly                    fstab         init.d           libblockdev     mime.types      nftables.conf           protocols   screenrc      sudo_logsrvd.conf  usb_modeswitch.conf
bash.bashrc             crontab                        fuse.conf     initramfs-tools  libnl-3         mke2fs.conf     nsswitch.conf           python3     security      sudoers            usb_modeswitch.d
bash_completion         cryptsetup-initramfs           gai.conf      inputrc          locale.alias    modprobe.d      opt                     python3.10  selinux       sudoers.d          vim
bash_completion.d       crypttab                       groff         iproute2         locale.gen      modules         os-release              rc0.d       services      sysctl.conf        vmware-tools
bindresvport.blacklist  dbus-1                         group         iscsi            localtime       modules-load.d  overlayroot.conf        rc1.d       shadow        sysctl.d           vtrgb
binfmt.d                debconf.conf                   group-        issue            logcheck        mtab            overlayroot.local.conf  rc2.d       shadow-       systemd            wgetrc
byobu                   debian_version                 grub.d        issue.net        login.defs      multipath       pam.conf                rc3.d       shells        terminfo           xattr.conf
ca-certificates         default                        gshadow       kernel           logrotate.conf  multipath.conf  pam.d                   rc4.d       skel          timezone           xdg
ca-certificates.conf    deluser.conf                   gshadow-      kernel-img.conf  logrotate.d     nanorc          passwd                  rc5.d       sos           tmpfiles.d         zsh_command_not_found
ubuntu@nextcloud:/etc$ cd net
netplan/             network/             networkd-dispatcher/
ubuntu@nextcloud:/etc$ cd net
netplan/             network/             networkd-dispatcher/
ubuntu@nextcloud:/etc$ cd netplan
ubuntu@nextcloud:/etc/netplan$ ls
50-cloud-init.yaml
ubuntu@nextcloud:/etc/netplan$ nano 50-cloud-init.yaml
ubuntu@nextcloud:/etc/netplan$ sudo bash
root@nextcloud:/etc/netplan# nano 50-cloud-init.yaml
root@nextcloud:/etc/netplan# cat 50-cloud-init.yaml
# This file is generated from information provided by the datasource.  Changes
# to it will not persist across an instance reboot.  To disable cloud-init's
# network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    version: 2
    ethernets:
        ens3:
            dhcp4: true
            match:
                macaddress: fa:16:3e:8b:65:64
            mtu: 8942
            set-name: ens3
root@nextcloud:/etc/netplan# nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
root@nextcloud:/etc/netplan# cat /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
network: {config: disabled}
root@nextcloud:/etc/netplan# nano 01-netcfg.yaml
root@nextcloud:/etc/netplan# ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:8b:65:64 brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.90.28/27 metric 100 brd 192.168.90.31 scope global dynamic ens3
       valid_lft 41645sec preferred_lft 41645sec
    inet6 fe80::f816:3eff:fe8b:6564/64 scope link
       valid_lft forever preferred_lft forever
root@nextcloud:/etc/netplan# nano 01-netcfg.yaml
root@nextcloud:/etc/netplan# cat 01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      addresses: [192.168.90.28/27]
      routes:
        - to: default
          via: 192.168.90.1
      nameservers:
        addresses: [127.0.0.1, 8.8.8.8]
      match:
        macaddress: fa:16:3e:8b:65:64
      mtu: 8942
root@nextcloud:/etc/netplan# sudo chmod 600 /etc/netplan/01-netcfg.yaml
root@nextcloud:/etc/netplan# sudo rm /etc/netplan/50-cloud-init.yaml
root@nextcloud:/etc/netplan# sudo systemctl disable systemd-networkd-wait-online
Removed /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service.
root@nextcloud:/etc/netplan# sudo netplan apply
WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.
root@nextcloud:/etc/netplan# ping -c 3 192.168.20.1
PING 192.168.20.1 (192.168.20.1) 56(84) bytes of data.
64 bytes from 192.168.20.1: icmp_seq=1 ttl=254 time=2.28 ms
64 bytes from 192.168.20.1: icmp_seq=2 ttl=254 time=0.621 ms
^C
--- 192.168.20.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 0.621/1.448/2.276/0.827 ms
root@nextcloud:/etc/netplan# ping -c 3 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=117 time=27.1 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=117 time=25.3 ms
^C
--- 8.8.8.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1001ms
rtt min/avg/max/mdev = 25.282/26.209/27.136/0.927 ms
root@nextcloud:/etc/netplan#
  inflating: nextcloud/apps/text/js/sankeyDiagram-TZEHDZUN-DvY1hMpe.chunk.mjs.map
  inflating: nextcloud/apps/text/js/hsp-DeZdr--c.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ada.js-Z72Do3-a.chunk.mjs.map
  inflating: nextcloud/apps/text/js/sqf.js-Bv9iP7oy.chunk.mjs.license
  inflating: nextcloud/apps/text/js/logger-CoS2pszN.chunk.mjs
  inflating: nextcloud/apps/text/js/ruby-YpQ4qM9g.chunk.mjs.license
  inflating: nextcloud/apps/text/js/stateDiagram-v2-4FDKWEC3-aZxBNAlF.chunk.mjs
  inflating: nextcloud/apps/text/js/xml-BqIpx4LW.chunk.mjs.license
  inflating: nextcloud/apps/text/js/taggerscript-CPFMK9fI.chunk.mjs.license
  inflating: nextcloud/apps/text/js/inform7-DeItVXsR.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vala-Dn170-jK.chunk.mjs
  inflating: nextcloud/apps/text/js/groovy-WpKw9JPP.chunk.mjs.license
  inflating: nextcloud/apps/text/js/timeline-definition-IT6M3QCI-Bh6MVZmf.chunk.mjs
  inflating: nextcloud/apps/text/js/pf-O9ec4gBl.chunk.mjs
  inflating: nextcloud/apps/text/js/makefile.js-A4odkqiA.chunk.mjs
  inflating: nextcloud/apps/text/js/cpp-DusQN-Ng.chunk.mjs
  inflating: nextcloud/apps/text/js/handlebars.js-oGQQD2VV.chunk.mjs
  inflating: nextcloud/apps/text/js/stan-1kxlC_Si.chunk.mjs.map
  inflating: nextcloud/apps/text/js/diagram-PSM6KHXK-Cx6oO2Gq.chunk.mjs.map
  inflating: nextcloud/apps/text/js/css-e0fxqhX5.chunk.mjs.license
  inflating: nextcloud/apps/text/js/swift.js-DpqOp1YQ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/processing.js-CfzcqgkO.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scheme.js-COePqrlu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/timeline-definition-IT6M3QCI-Bh6MVZmf.chunk.mjs.license
  inflating: nextcloud/apps/text/js/arcade-BvLLFPJv.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dns-FKrEFTv1.chunk.mjs.map
  inflating: nextcloud/apps/text/js/kotlin-XY4rV-Ao.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mercury.js-CT2jPzo_.chunk.mjs
  inflating: nextcloud/apps/text/js/pony.js-95UbQ2lh.chunk.mjs.license
  inflating: nextcloud/apps/text/js/arduino-Y4MbT-Zm.chunk.mjs.license
  inflating: nextcloud/apps/text/js/jboss-cli.js-tkvnCAOb.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sql-BZ_DDjIp.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scala.js-0bCuhK7z.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mipsasm-Dd0BtO8T.chunk.mjs
  inflating: nextcloud/apps/text/js/ini-DIAAyXzB.chunk.mjs
  inflating: nextcloud/apps/text/js/x86asm-BXgEvW-J.chunk.mjs
  inflating: nextcloud/apps/text/js/sas-Bf_dOfdj.chunk.mjs.license
  inflating: nextcloud/apps/text/js/xml-xhkNIy7U.chunk.mjs
  inflating: nextcloud/apps/text/js/pieDiagram-ADFJNKIX-Bq5fAxWz.chunk.mjs
  inflating: nextcloud/apps/text/js/asciidoc.js-D_ODG42F.chunk.mjs.license
  inflating: nextcloud/apps/text/js/oxygene-UBowKGXF.chunk.mjs.license
  inflating: nextcloud/apps/text/js/python-BNoD8RQJ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/zephir.js-Nwo5Efm8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/processing-eRah6_3b.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cos-CD_FctOC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/clojure-repl-Dlkv8lxl.chunk.mjs.map
  inflating: nextcloud/apps/text/js/julia-C62ubGTH.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stylus.js-kvL3m8g0.chunk.mjs
  inflating: nextcloud/apps/text/js/_baseUniq-pf37y4On.chunk.mjs
  inflating: nextcloud/apps/text/js/pieDiagram-ADFJNKIX-Bq5fAxWz.chunk.mjs.map
  inflating: nextcloud/apps/text/js/fix-DL2dsXYj.chunk.mjs.license
  inflating: nextcloud/apps/text/js/roboconf.js-B6woiGlM.chunk.mjs.license
  inflating: nextcloud/apps/text/js/autoit.js-CMivO6bG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/index-BsHmGXxZ.chunk.mjs
  inflating: nextcloud/apps/text/js/capnproto.js-Dxjnljqk.chunk.mjs
  inflating: nextcloud/apps/text/js/python-repl.js-CHaNa5JZ.chunk.mjs
  inflating: nextcloud/apps/text/js/mindmap-definition-VGOIOE7T-CeUItXNX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ocaml-Lke8W5fZ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/x86asm-DoBGGQHD.chunk.mjs
  inflating: nextcloud/apps/text/js/applescript.js-CLxyjB8J.chunk.mjs.license
  inflating: nextcloud/apps/text/js/oxygene.js-LHAEsq7O.chunk.mjs.license
  inflating: nextcloud/apps/text/js/classDiagram-2ON5EDUG-D_UU8pQx.chunk.mjs
  inflating: nextcloud/apps/text/js/fix.js-3FI90EDz.chunk.mjs
  inflating: nextcloud/apps/text/js/livescript-C8nDtg3Y.chunk.mjs.map
  inflating: nextcloud/apps/text/js/reasonml-CVVuNviy.chunk.mjs
  inflating: nextcloud/apps/text/js/index-Dl858C8_.chunk.mjs.license
  inflating: nextcloud/apps/text/js/django.js-CZBZXAIA.chunk.mjs
  inflating: nextcloud/apps/text/js/diagram-QEK2KX5R-BJPdpF6D.chunk.mjs.license
  inflating: nextcloud/apps/text/js/asciidoc-C5tglQJX.chunk.mjs
  inflating: nextcloud/apps/text/js/axapta.js-BYhhAwqM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vala.js-_SuzZ2Ga.chunk.mjs.map
  inflating: nextcloud/apps/text/js/django-la5rzxnI.chunk.mjs
  inflating: nextcloud/apps/text/js/cose-bilkent-S5V4N54A-CYsBAjQW.chunk.mjs.map
  inflating: nextcloud/apps/text/js/reasonml-CVVuNviy.chunk.mjs.license
  inflating: nextcloud/apps/text/js/wasm.js-CXjtio2K.chunk.mjs.license
  inflating: nextcloud/apps/text/js/awk-Bdt0v-Gr.chunk.mjs
  inflating: nextcloud/apps/text/js/stata-BjLWyHBj.chunk.mjs
  inflating: nextcloud/apps/text/js/angelscript.js-dc2YekQz.chunk.mjs.map
  inflating: nextcloud/apps/text/js/livecodeserver-WU_wnUq8.chunk.mjs
  inflating: nextcloud/apps/text/js/livecodeserver-CmQ7dMCR.chunk.mjs
  inflating: nextcloud/apps/text/js/glsl.js-pyOD2tGI.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gradle-DjA8oGha.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nim-BSFHMXbr.chunk.mjs.map
  inflating: nextcloud/apps/text/js/asciidoc-DIsA2zmg.chunk.mjs.map
  inflating: nextcloud/apps/text/js/x86asm-DoBGGQHD.chunk.mjs.license
  inflating: nextcloud/apps/text/js/maxima-BOm0yN9O.chunk.mjs.map
  inflating: nextcloud/apps/text/js/armasm-BSj171P2.chunk.mjs.map
  inflating: nextcloud/apps/text/js/makefile-B-S9j5GT.chunk.mjs.license
  inflating: nextcloud/apps/text/js/swift-Dj6OBavv.chunk.mjs.license
  inflating: nextcloud/apps/text/js/c.js-B7PR-wDt.chunk.mjs
  inflating: nextcloud/apps/text/js/mipsasm.js-DKWbn5S7.chunk.mjs.map
  inflating: nextcloud/apps/text/js/django-CAPxHEU0.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ceylon.js-QwPGGO9V.chunk.mjs
  inflating: nextcloud/apps/text/js/routeros.js-Drzsymon.chunk.mjs
  inflating: nextcloud/apps/text/js/dns-CQmaQ7Oo.chunk.mjs
  inflating: nextcloud/apps/text/js/bash.js-DQk70VCu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/erlang.js-8zDaDp9h.chunk.mjs.map
  inflating: nextcloud/apps/text/js/kotlin.js-DC4bWEWO.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gauss.js-DXXKCpT5.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ini-DIAAyXzB.chunk.mjs.map
  inflating: nextcloud/apps/text/js/d.js-8ElBF_yt.chunk.mjs.map
  inflating: nextcloud/apps/text/js/wren-ChGFDRxM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mel-BKEdQ-Ac.chunk.mjs
  inflating: nextcloud/apps/text/js/dsconfig-NmC0RLif.chunk.mjs.license
  inflating: nextcloud/apps/text/js/apache-DatNiJsa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/routeros-DO8SL_FC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/dart-jxg-AWAB.chunk.mjs.map
  inflating: nextcloud/apps/text/js/hsp.js-BiVd_0tx.chunk.mjs.license
  inflating: nextcloud/apps/text/js/rsl-Bnc_UKMa.chunk.mjs.license
  inflating: nextcloud/apps/text/js/step21-w0UNhAoV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/coffeescript-CI1lgLTi.chunk.mjs
  inflating: nextcloud/apps/text/js/apache.js-RdONElAI.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vbscript-BxKAAhko.chunk.mjs
  inflating: nextcloud/apps/text/js/dsconfig.js-M1--aIG8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/django.js-CZBZXAIA.chunk.mjs.license
  inflating: nextcloud/apps/text/js/oxygene-Qu5elBgI.chunk.mjs.license
  inflating: nextcloud/apps/text/js/prolog-CXI90EJ8.chunk.mjs.map
  inflating: nextcloud/apps/text/js/properties-CxTAPmqa.chunk.mjs.license
  inflating: nextcloud/apps/text/js/go.js-PCxRXsGs.chunk.mjs.license
  inflating: nextcloud/apps/text/js/php-LkOD2WJL.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mel-BKEdQ-Ac.chunk.mjs.map
  inflating: nextcloud/apps/text/js/arcade-DuzF06PQ.chunk.mjs
  inflating: nextcloud/apps/text/js/accesslog.js-BI1vLRVz.chunk.mjs.license
  inflating: nextcloud/apps/text/js/smalltalk-mkyJ42eT.chunk.mjs.map
  inflating: nextcloud/apps/text/js/abnf.js-BGeyXh1e.chunk.mjs
  inflating: nextcloud/apps/text/js/lisp.js-D8V2UNCu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/typescript-DM77Z_hN.chunk.mjs.map
  inflating: nextcloud/apps/text/js/clone-DchRqQR-.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sas-DbkrWWgS.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mel.js-BJARXddV.chunk.mjs
  inflating: nextcloud/apps/text/js/pgsql-ClU8Qxc8.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lsl-DmcCa2FM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/smali.js-Dwnjt441.chunk.mjs.license
  inflating: nextcloud/apps/text/js/golo.js-Bknbsezy.chunk.mjs.map
  inflating: nextcloud/apps/text/js/php.js-CWJjUB7_.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sas-DbkrWWgS.chunk.mjs.map
  inflating: nextcloud/apps/text/js/graphql.js-Bu41216v.chunk.mjs.map
  inflating: nextcloud/apps/text/js/perl-BhGqtLVD.chunk.mjs.map
  inflating: nextcloud/apps/text/js/flowDiagram-NV44I4VS-CQQSZMfU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/brainfuck.js-B0hfthH2.chunk.mjs.map
  inflating: nextcloud/apps/text/js/d-BGFu59ZU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/leaf-DfTGz3CY.chunk.mjs.license
  inflating: nextcloud/apps/text/js/c-Cqyrzypw.chunk.mjs.license
  inflating: nextcloud/apps/text/js/reasonml.js-BYRGVSYf.chunk.mjs
  inflating: nextcloud/apps/text/js/nestedtext-CpCoOu38.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ebnf.js-BKuqKTfP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/yaml-98Prrxe1.chunk.mjs.license
  inflating: nextcloud/apps/text/js/parser3-DVPYGTb5.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mindmap-definition-VGOIOE7T-CeUItXNX.chunk.mjs
  inflating: nextcloud/apps/text/js/nestedtext-BLtW7-3w.chunk.mjs
  inflating: nextcloud/apps/text/js/xquery-DQj27pVC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cmake-CcMHFDIE.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csharp-B1N37g95.chunk.mjs
  inflating: nextcloud/apps/text/js/dns.js-CAP_v0vE.chunk.mjs
  inflating: nextcloud/apps/text/js/subunit-BEE3eHCn.chunk.mjs.map
  inflating: nextcloud/apps/text/js/java.js-Cm0YksBh.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dockerfile-BouQFsj7.chunk.mjs
  inflating: nextcloud/apps/text/js/vim.js-BU6HJJA1.chunk.mjs.license
  inflating: nextcloud/apps/text/js/RichWorkspace-DJbyRXWV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/flix-DzVTc753.chunk.mjs.license
  inflating: nextcloud/apps/text/js/pf.js-CveVoctB.chunk.mjs.map
  inflating: nextcloud/apps/text/js/flix-DzVTc753.chunk.mjs
  inflating: nextcloud/apps/text/js/stan-DKIRHWGa.chunk.mjs
  inflating: nextcloud/apps/text/js/1c-BVSEBkLc.chunk.mjs
  inflating: nextcloud/apps/text/js/prolog-CXI90EJ8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/tp.js-C0N3ee9j.chunk.mjs.map
  inflating: nextcloud/apps/text/js/_basePickBy-Dy1ViJhr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/dns-FKrEFTv1.chunk.mjs
  inflating: nextcloud/apps/text/js/moonscript-CA5kE2fH.chunk.mjs
  inflating: nextcloud/apps/text/js/rsl-ZJRM7WOW.chunk.mjs
  inflating: nextcloud/apps/text/js/xml.js-D-e-YvF9.chunk.mjs
  inflating: nextcloud/apps/text/js/csharp-DVj23eoz.chunk.mjs
  inflating: nextcloud/apps/text/js/julia.js-fDnjpxGu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/elm.js-D7HPbtc6.chunk.mjs.license
  inflating: nextcloud/apps/text/js/coq.js-NUOtWFbZ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/autoit-TaGBUO9K.chunk.mjs.map
  inflating: nextcloud/apps/text/js/json.js-BtUUvhz_.chunk.mjs.license
  inflating: nextcloud/apps/text/js/latex.js-DqPapLM0.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mermaid.core-DrJfu-9d.chunk.mjs
  inflating: nextcloud/apps/text/js/accesslog-CZB_1O7R.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scheme-BWpoRo0R.chunk.mjs
  inflating: nextcloud/apps/text/js/coffeescript-BPozQeaX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/erlang-CTgWIaMO.chunk.mjs
  inflating: nextcloud/apps/text/js/gams-BtBQWyzE.chunk.mjs.map
  inflating: nextcloud/apps/text/js/pgsql-ClU8Qxc8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/protobuf-BPm8poq3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/erlang-Dg020I5V.chunk.mjs.license
  inflating: nextcloud/apps/text/js/json-XlEqPaRc.chunk.mjs.map
  inflating: nextcloud/apps/text/js/node-repl-JO7aJFVW.chunk.mjs
  inflating: nextcloud/apps/text/js/journeyDiagram-XKPGCS4Q-D480t8MU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/python-CL0JCNVD.chunk.mjs
  inflating: nextcloud/apps/text/js/vala-DD5qOFMy.chunk.mjs
  inflating: nextcloud/apps/text/js/parser3.js-BvZGN2no.chunk.mjs
  inflating: nextcloud/apps/text/js/java.js-Cm0YksBh.chunk.mjs.license
  inflating: nextcloud/apps/text/js/properties.js-lD0cWzk_.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ocaml-C5bJ_q9D.chunk.mjs
  inflating: nextcloud/apps/text/js/inform7.js-hUPrfGrl.chunk.mjs.license
  inflating: nextcloud/apps/text/js/monkey.js-BcEKxkZj.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ocaml.js-CW_Ct5H7.chunk.mjs.license
  inflating: nextcloud/apps/text/js/dust-ByylHqAL.chunk.mjs.map
  inflating: nextcloud/apps/text/js/1c.js-ZvO3NOVM.chunk.mjs.license
  inflating: nextcloud/apps/text/js/cmake-DMK2Ihm0.chunk.mjs.license
  inflating: nextcloud/apps/text/js/avrasm-Ba2EQvoc.chunk.mjs.license
  inflating: nextcloud/apps/text/js/xml.js-D-e-YvF9.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ada-CQRlsOlE.chunk.mjs
  inflating: nextcloud/apps/text/js/profile-C47WUd2L.chunk.mjs
  inflating: nextcloud/apps/text/js/parser3-DVPYGTb5.chunk.mjs
  inflating: nextcloud/apps/text/js/mojolicious-D_ow4Pss.chunk.mjs.map
  inflating: nextcloud/apps/text/js/coq-CdXPaJfU.chunk.mjs
  inflating: nextcloud/apps/text/js/capnproto-Dp9VulVG.chunk.mjs
  inflating: nextcloud/apps/text/js/katex-DGORuje8.chunk.mjs
  inflating: nextcloud/apps/text/js/vim-DKRd6xO_.chunk.mjs
  inflating: nextcloud/apps/text/js/monkey.js-BcEKxkZj.chunk.mjs.map
  inflating: nextcloud/apps/text/js/twig-BzPPb7ya.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-FMBD7UC4-Dznk2lEa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dav-CQDyL7M_-DQpu_A9F.chunk.mjs.map
  inflating: nextcloud/apps/text/js/javascript-C0pLETdN.chunk.mjs
  inflating: nextcloud/apps/text/js/dav-CQDyL7M_-DQpu_A9F.chunk.mjs
  inflating: nextcloud/apps/text/js/less-CSIcveyt.chunk.mjs.map
  inflating: nextcloud/apps/text/js/qml.js-Cgt3qMi4.chunk.mjs.map
  inflating: nextcloud/apps/text/js/llvm-Cdn5jWaT.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sankeyDiagram-TZEHDZUN-DvY1hMpe.chunk.mjs.license
  inflating: nextcloud/apps/text/js/subunit-BEE3eHCn.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mojolicious.js-DcobsBEq.chunk.mjs.map
  inflating: nextcloud/apps/text/js/clone-DchRqQR-.chunk.mjs
  inflating: nextcloud/apps/text/js/django.js-CZBZXAIA.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gradle-DjA8oGha.chunk.mjs.map
  inflating: nextcloud/apps/text/js/json.js-BtUUvhz_.chunk.mjs.map
  inflating: nextcloud/apps/text/js/haml.js-pZpCYOvY.chunk.mjs
  inflating: nextcloud/apps/text/js/node-repl.js-Dkek2XA7.chunk.mjs.license
  inflating: nextcloud/apps/text/js/1c.js-ZvO3NOVM.chunk.mjs
  inflating: nextcloud/apps/text/js/vbscript-BxKAAhko.chunk.mjs.map
  inflating: nextcloud/apps/text/js/irpf90-B9E239RO.chunk.mjs.license
  inflating: nextcloud/apps/text/js/wren-BZVNvx73.chunk.mjs.license
  inflating: nextcloud/apps/text/js/http-DqCoYMCZ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/less-CSIcveyt.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scilab-YAX5mRLt.chunk.mjs.license
  inflating: nextcloud/apps/text/js/arduino-C7qpkpMf.chunk.mjs.map
  inflating: nextcloud/apps/text/js/NcCheckboxRadioSwitch-DAPHFb0L-BMVa4UgQ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vala-Dn170-jK.chunk.mjs.license
  inflating: nextcloud/apps/text/js/FilesSettings-YsAsOxdr.chunk.mjs.map
  inflating: nextcloud/apps/text/js/layout-BWDX90aa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csp.js-BaWYawVw.chunk.mjs
  inflating: nextcloud/apps/text/js/ada-B180OuNO.chunk.mjs.license
  inflating: nextcloud/apps/text/js/rsl-ZJRM7WOW.chunk.mjs.license
  inflating: nextcloud/apps/text/js/PublicFilesEditor-BaJBDLUk.chunk.mjs.license
  inflating: nextcloud/apps/text/js/openscad-Cqz-DqP2.chunk.mjs.license
  inflating: nextcloud/apps/text/js/step21-w0UNhAoV.chunk.mjs
  inflating: nextcloud/apps/text/js/journeyDiagram-XKPGCS4Q-D480t8MU.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vbscript-html-By_Qjuh1.chunk.mjs.license
  inflating: nextcloud/apps/text/js/protobuf-BPm8poq3.chunk.mjs
  inflating: nextcloud/apps/text/js/dns-CQmaQ7Oo.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stan.js-CPvA_Gra.chunk.mjs.map
  inflating: nextcloud/apps/text/js/accesslog-CZB_1O7R.chunk.mjs
  inflating: nextcloud/apps/text/js/mermaid.core-DrJfu-9d.chunk.mjs.map
  inflating: nextcloud/apps/text/js/d-CVMQHPru.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vhdl.js-BcQGYUqx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ocaml.js-CW_Ct5H7.chunk.mjs.map
  inflating: nextcloud/apps/text/js/arcade-DuzF06PQ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/smali--sC3bS_F.chunk.mjs.license
  inflating: nextcloud/apps/text/js/jboss-cli-BG8yWkzE.chunk.mjs
  inflating: nextcloud/apps/text/js/handlebars-D0ilPrxy.chunk.mjs.license
  inflating: nextcloud/apps/text/js/tcl-Di_hFKOx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crmsh-Cu5rIRU0.chunk.mjs.license
  inflating: nextcloud/apps/text/js/1c-BVSEBkLc.chunk.mjs.license
  inflating: nextcloud/apps/text/js/wren.js-DDdzo7Z0.chunk.mjs.map
  inflating: nextcloud/apps/text/js/pgsql-C_5LO55d.chunk.mjs.map
  inflating: nextcloud/apps/text/js/puppet-CNur8-ny.chunk.mjs
  inflating: nextcloud/apps/text/js/haml-B5uPL4eS.chunk.mjs
  inflating: nextcloud/apps/text/js/classDiagram-v2-WZHVMYZB-D_UU8pQx.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nsis.js-2qlvRaAC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sqf-l5F8M2Sq.chunk.mjs.map
  inflating: nextcloud/apps/text/js/yaml.js-DcvbppBp.chunk.mjs
  inflating: nextcloud/apps/text/js/actionscript.js-CWcqROhf.chunk.mjs.map
  inflating: nextcloud/apps/text/js/irpf90-BU-Fpmje.chunk.mjs.license
  inflating: nextcloud/apps/text/js/properties-q8asBERA.chunk.mjs.map
  inflating: nextcloud/apps/text/js/text-init.mjs.map
  inflating: nextcloud/apps/text/js/isbl-BynO-CzR.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ganttDiagram-LVOFAZNH-zWAjY9sg.chunk.mjs.license
  inflating: nextcloud/apps/text/js/puppet.js-TVuCXAse.chunk.mjs.map
  inflating: nextcloud/apps/text/js/haskell-BfZ-q3wZ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/twig-Ckn6dcK_.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lua-BQjZcCxG.chunk.mjs.license
  inflating: nextcloud/apps/text/js/fortran-BY2IpvbP.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scheme-DXu_jpb4.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lisp.js-D8V2UNCu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/x86asm.js-CP5-AhZT.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dns-FKrEFTv1.chunk.mjs.license
  inflating: nextcloud/apps/text/js/arcade-DuzF06PQ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/roboconf.js-B6woiGlM.chunk.mjs
  inflating: nextcloud/apps/text/js/capnproto-Dp9VulVG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/java-ozs8AKCQ.chunk.mjs
  inflating: nextcloud/apps/text/js/ViewerComponent-DS0QbC7p.chunk.mjs
  inflating: nextcloud/apps/text/js/defaultLocale-0_YM-Ssk.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stateDiagram-FKZM4ZOC-Cr_u45MQ.chunk.mjs
  inflating: nextcloud/apps/text/js/haskell-CbHKckgW.chunk.mjs.license
  inflating: nextcloud/apps/text/js/javascript-C0pLETdN.chunk.mjs.map
  inflating: nextcloud/apps/text/js/graphql.js-Bu41216v.chunk.mjs
  inflating: nextcloud/apps/text/js/golo.js-Bknbsezy.chunk.mjs
  inflating: nextcloud/apps/text/js/less.js-U5cW0pHE.chunk.mjs.license
  inflating: nextcloud/apps/text/js/clean-DnxC-PeC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/Editor-BRjzGCQi.chunk.mjs
  inflating: nextcloud/apps/text/js/kotlin-B5db_4gd.chunk.mjs.license
  inflating: nextcloud/apps/text/js/NcCheckboxRadioSwitch-DAPHFb0L-BMVa4UgQ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/text-viewer.mjs.license
  inflating: nextcloud/apps/text/js/sas.js-wgNvNWGS.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mipsasm-Dd0BtO8T.chunk.mjs.map
  inflating: nextcloud/apps/text/js/swift-PdH-gS-1.chunk.mjs
  inflating: nextcloud/apps/text/js/go-uDcKc56N.chunk.mjs.license
  inflating: nextcloud/apps/text/js/haml.js-pZpCYOvY.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vbscript-html-DsT8N8D3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/erlang-CTgWIaMO.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csharp-B1N37g95.chunk.mjs.license
  inflating: nextcloud/apps/text/js/haml-B5uPL4eS.chunk.mjs.license
  inflating: nextcloud/apps/text/js/javascript.js-D082tMVf.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gherkin-DUTDqKu5.chunk.mjs.map
  inflating: nextcloud/apps/text/js/Editor-BRjzGCQi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/makefile.js-A4odkqiA.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ceylon-Kz6Rziws.chunk.mjs
  inflating: nextcloud/apps/text/js/brainfuck-jyY6sS_W.chunk.mjs
  inflating: nextcloud/apps/text/js/r.js-QC59nTDx.chunk.mjs
  inflating: nextcloud/apps/text/js/index-hTwX2gcC-TY8YV1bJ.chunk.mjs
  inflating: nextcloud/apps/text/js/text-init.mjs.license
  inflating: nextcloud/apps/text/js/nix.js-C38o3eEx.chunk.mjs
  inflating: nextcloud/apps/text/js/clojure-repl-Dlkv8lxl.chunk.mjs
  inflating: nextcloud/apps/text/js/xquery-3br9Zoak.chunk.mjs
  inflating: nextcloud/apps/text/js/arduino.js-D_87iyER.chunk.mjs
  inflating: nextcloud/apps/text/js/vbscript-html.js-DL2Anf2X.chunk.mjs.license
  inflating: nextcloud/apps/text/js/erlang-repl-i_kSpUx1.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scilab-C_G9RUa3.chunk.mjs.license
  inflating: nextcloud/apps/text/js/angelscript-Cal_ODgk.chunk.mjs
  inflating: nextcloud/apps/text/js/csharp.js-CdmcTAgP.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nix.js-C38o3eEx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/processing-DzM4Jjbp.chunk.mjs
  inflating: nextcloud/apps/text/js/aspectj.js-BQONTbY3.chunk.mjs
  inflating: nextcloud/apps/text/js/vim-CS0ghoWE.chunk.mjs
  inflating: nextcloud/apps/text/js/django-CAPxHEU0.chunk.mjs.license
  inflating: nextcloud/apps/text/js/dagre-6UL2VRFP-CrfzukFL.chunk.mjs
  inflating: nextcloud/apps/text/js/tp.js-C0N3ee9j.chunk.mjs.license
  inflating: nextcloud/apps/text/js/FilesSettings-YsAsOxdr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/dagre-6UL2VRFP-CrfzukFL.chunk.mjs.map
  inflating: nextcloud/apps/text/js/rib.js-B-3OPMAm.chunk.mjs
  inflating: nextcloud/apps/text/js/openscad-DVHbi54P.chunk.mjs
  inflating: nextcloud/apps/text/js/mercury-pohIQdZG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/tcl-Di_hFKOx.chunk.mjs
  inflating: nextcloud/apps/text/js/dsconfig-CnYwPbl7.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gcode-gy9gWLEK.chunk.mjs
  inflating: nextcloud/apps/text/js/profile.js-CrfRbQtd.chunk.mjs
  inflating: nextcloud/apps/text/js/python-repl-CkDa0QZa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/haxe-DgINMd2B.chunk.mjs.license
  inflating: nextcloud/apps/text/js/xquery-3br9Zoak.chunk.mjs.license
  inflating: nextcloud/apps/text/js/erb-BILCHXvw.chunk.mjs.license
  inflating: nextcloud/apps/text/js/armasm.js-DJQ-tPBi.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gherkin-C25XR7j3.chunk.mjs.license
  inflating: nextcloud/apps/text/js/clean.js-em0hHxHF.chunk.mjs.license
  inflating: nextcloud/apps/text/js/r-noDSfqGU.chunk.mjs
  inflating: nextcloud/apps/text/js/stateDiagram-v2-4FDKWEC3-aZxBNAlF.chunk.mjs.map
  inflating: nextcloud/apps/text/js/arc-BudVcyNJ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/BaseReader-CEyXn00Z.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csharp-B1N37g95.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mathematica.js-BD3ea-Eo.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ruby.js-BTZeQOQR.chunk.mjs.map
  inflating: nextcloud/apps/text/js/python-CL0JCNVD.chunk.mjs.license
  inflating: nextcloud/apps/text/js/twig-BzPPb7ya.chunk.mjs
  inflating: nextcloud/apps/text/js/maxima-Bl8CEyFG.chunk.mjs
  inflating: nextcloud/apps/text/js/coffeescript-BPozQeaX.chunk.mjs.license
  inflating: nextcloud/apps/text/js/erlang-Dg020I5V.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dos-CUjF6R0P.chunk.mjs
  inflating: nextcloud/apps/text/js/stylus.js-kvL3m8g0.chunk.mjs.license
  inflating: nextcloud/apps/text/js/monkey-C5AMYAw1.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cal-BAtT5uz5.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crmsh-Cu5rIRU0.chunk.mjs
  inflating: nextcloud/apps/text/js/objectivec-COoBB3T9.chunk.mjs.license
  inflating: nextcloud/apps/text/js/jboss-cli-DeiFPnDo.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sequenceDiagram-WL72ISMW-Bw41u-KD.chunk.mjs.license
  inflating: nextcloud/apps/text/js/thrift-Cy4orVKi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/n1ql.js-CCLW-RYm.chunk.mjs
  inflating: nextcloud/apps/text/js/aspectj-DYrhguaG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nginx-hPyzOfrr.chunk.mjs.map
  inflating: nextcloud/apps/text/js/flix.js-BT2QBHeA.chunk.mjs.map
  inflating: nextcloud/apps/text/js/classDiagram-v2-WZHVMYZB-D_UU8pQx.chunk.mjs
  inflating: nextcloud/apps/text/js/makefile-B-S9j5GT.chunk.mjs
  inflating: nextcloud/apps/text/js/clojure-repl.js-B5f1lKJl.chunk.mjs.license
  inflating: nextcloud/apps/text/js/properties-q8asBERA.chunk.mjs
  inflating: nextcloud/apps/text/js/lasso-CXJApZlN.chunk.mjs.license
  inflating: nextcloud/apps/text/js/golo-C5O1bb65.chunk.mjs.map
  inflating: nextcloud/apps/text/js/RichTextReader-CRQfFvOS.chunk.mjs
  inflating: nextcloud/apps/text/js/profile.js-CrfRbQtd.chunk.mjs.map
  inflating: nextcloud/apps/text/js/clojure-D1y0daqf.chunk.mjs.license
  inflating: nextcloud/apps/text/js/protobuf-BV65UhFf.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crystal-Cmf8b52W.chunk.mjs.license
  inflating: nextcloud/apps/text/js/stateDiagram-FKZM4ZOC-Cr_u45MQ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dockerfile-SCZRoPS9.chunk.mjs
  inflating: nextcloud/apps/text/js/r.js-QC59nTDx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/php-template.js-BAaJQq3h.chunk.mjs.map
  inflating: nextcloud/apps/text/js/xl.js-DHXsSR3X.chunk.mjs
  inflating: nextcloud/apps/text/js/ruleslanguage-D_ChJjaX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nestedtext.js-CDcwXSh6.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crystal-Cmf8b52W.chunk.mjs.map
  inflating: nextcloud/apps/text/js/apache-BNUej9Qu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/brainfuck-jyY6sS_W.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vbscript-CrBpBxTE.chunk.mjs.license
  inflating: nextcloud/apps/text/js/lisp-BVeNUQ1F.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nim.js-DccGNIvA.chunk.mjs
  inflating: nextcloud/apps/text/js/scilab.js-BDwTa6-w.chunk.mjs.license
  inflating: nextcloud/apps/text/js/wren-ChGFDRxM.chunk.mjs.license
  inflating: nextcloud/apps/text/js/aspectj.js-BQONTbY3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/delphi-BJz4yBab.chunk.mjs
  inflating: nextcloud/apps/text/js/mercury-pohIQdZG.chunk.mjs.license
  inflating: nextcloud/apps/text/js/fsharp-DVfzW2cv.chunk.mjs.map
  inflating: nextcloud/apps/text/js/irpf90-B9E239RO.chunk.mjs
  inflating: nextcloud/apps/text/js/llvm-hNYq9g5U.chunk.mjs.license
  inflating: nextcloud/apps/text/js/clojure.js-CMnDIS73.chunk.mjs.map
  inflating: nextcloud/apps/text/js/thrift-DbJnbZ3Q.chunk.mjs
  inflating: nextcloud/apps/text/js/hy--R4Ig2PS.chunk.mjs.license
  inflating: nextcloud/apps/text/js/RichTextReader-CRQfFvOS.chunk.mjs.license
  inflating: nextcloud/apps/text/js/awk.js-8zVfqZxq.chunk.mjs
  inflating: nextcloud/apps/text/js/arcade-BvLLFPJv.chunk.mjs
  inflating: nextcloud/apps/text/js/blockDiagram-VD42YOAC-B7M-Hooy.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-DI55MBZ5-B8lZYe9s.chunk.mjs
  inflating: nextcloud/apps/text/js/layout-BWDX90aa.chunk.mjs
  inflating: nextcloud/apps/text/js/profile-C47WUd2L.chunk.mjs.license
  inflating: nextcloud/apps/text/js/bnf.js-DnqdtJmx.chunk.mjs.license
  inflating: nextcloud/apps/text/js/elixir-NgzVXv4Z.chunk.mjs.license
  inflating: nextcloud/apps/text/js/xl-CwsKSdsO.chunk.mjs
  inflating: nextcloud/apps/text/js/csp-RBirCoGX.chunk.mjs
  inflating: nextcloud/apps/text/js/node-repl-JO7aJFVW.chunk.mjs.map
  inflating: nextcloud/apps/text/js/n1ql-C05f_oLP.chunk.mjs.license
  inflating: nextcloud/apps/text/js/chunk-4BX2VUAB-CXxCl32T.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gradle.js-CJLLRhm9.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stan-DKIRHWGa.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sql-BZ_DDjIp.chunk.mjs
  inflating: nextcloud/apps/text/js/python-CL0JCNVD.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vbscript-html-By_Qjuh1.chunk.mjs
  inflating: nextcloud/apps/text/js/plaintext-CyNGerFk.chunk.mjs
  inflating: nextcloud/apps/text/js/sqf-l5F8M2Sq.chunk.mjs.license
  inflating: nextcloud/apps/text/js/node-repl-JO7aJFVW.chunk.mjs.license
  inflating: nextcloud/apps/text/js/wasm-BfKMiaeH.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dos-CUjF6R0P.chunk.mjs.license
  inflating: nextcloud/apps/text/js/glsl-CcHbKhf0.chunk.mjs
  inflating: nextcloud/apps/text/js/vhdl-rg1XqZoD.chunk.mjs.license
  inflating: nextcloud/apps/text/js/groovy-g4urvE88.chunk.mjs
  inflating: nextcloud/apps/text/js/http.js-D-pyl9Qs.chunk.mjs.license
  inflating: nextcloud/apps/text/js/http-DqCoYMCZ.chunk.mjs
  inflating: nextcloud/apps/text/js/gitGraphDiagram-NY62KEGX-CoAlzKsu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/r-61VABXwB.chunk.mjs
  inflating: nextcloud/apps/text/js/erlang-repl-i_kSpUx1.chunk.mjs.license
  inflating: nextcloud/apps/text/js/subunit-SO0CM6SU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/leaf-x6AR_yRr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/capnproto-Cr_e5d-w.chunk.mjs.license
  inflating: nextcloud/apps/text/js/kanban-definition-3W4ZIXB7-DT07df9K.chunk.mjs
  inflating: nextcloud/apps/text/js/oxygene-UBowKGXF.chunk.mjs.map
  inflating: nextcloud/apps/text/js/excel-BGcxma0I.chunk.mjs
  inflating: nextcloud/apps/text/js/dockerfile-BouQFsj7.chunk.mjs.map
  inflating: nextcloud/apps/text/js/protobuf-BPm8poq3.chunk.mjs.license
  inflating: nextcloud/apps/text/js/handlebars-BlNE1M5C.chunk.mjs.map
  inflating: nextcloud/apps/text/js/haskell-BfZ-q3wZ.chunk.mjs
  inflating: nextcloud/apps/text/js/MediaHandler.provider-CTjO6aKX.chunk.mjs
  inflating: nextcloud/apps/text/js/crmsh-B1wTOCfV.chunk.mjs
  inflating: nextcloud/apps/text/js/bash-D2Y5opc-.chunk.mjs.map
  inflating: nextcloud/apps/text/js/llvm-hNYq9g5U.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lsl.js-C5_Urcte.chunk.mjs
  inflating: nextcloud/apps/text/js/node-repl-CRMPy_Tl.chunk.mjs.license
  inflating: nextcloud/apps/text/js/python.js-Bbf7mALc.chunk.mjs
  inflating: nextcloud/apps/text/js/shell.js-0VGN75k0.chunk.mjs.license
  inflating: nextcloud/apps/text/js/routeros-BdmC340C.chunk.mjs.map
  inflating: nextcloud/apps/text/js/isbl-BynO-CzR.chunk.mjs.license
  inflating: nextcloud/apps/text/js/avrasm.js-DISUTpKD.chunk.mjs.license
  inflating: nextcloud/apps/text/js/autohotkey.js-BzPnjZ94.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scilab-YAX5mRLt.chunk.mjs.map
  inflating: nextcloud/apps/text/js/coffeescript.js-ZPD4z55G.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ceylon-B8hd3new.chunk.mjs.license
  inflating: nextcloud/apps/text/js/cytoscape.esm-jrxdzse9.chunk.mjs
  inflating: nextcloud/apps/text/js/defaultLocale-0_YM-Ssk.chunk.mjs
  inflating: nextcloud/apps/text/js/nim-BSFHMXbr.chunk.mjs
  inflating: nextcloud/apps/text/js/stata.js-C_1-oVwI.chunk.mjs.license
  inflating: nextcloud/apps/text/js/php-template-BrTni4U6.chunk.mjs
  inflating: nextcloud/apps/text/js/openscad.js-Bz48Nbl7.chunk.mjs.map
  inflating: nextcloud/apps/text/js/actionscript-CgCtblwr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/yaml-BZ6rJN3K.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ldif-ChnD9TNd.chunk.mjs.map
  inflating: nextcloud/apps/text/js/puppet-CNur8-ny.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vbscript-CrBpBxTE.chunk.mjs.map
  inflating: nextcloud/apps/text/js/_basePickBy-Dy1ViJhr.chunk.mjs
  inflating: nextcloud/apps/text/js/fortran.js-DkAfZXpx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/coq-CdXPaJfU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/lisp-DSMzHnIR.chunk.mjs.license
  inflating: nextcloud/apps/text/js/groovy.js-CL5s0tbB.chunk.mjs.map
  inflating: nextcloud/apps/text/js/applescript-B3Su22VP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/step21.js-BMhmdzJq.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gcode-gy9gWLEK.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nginx-hPyzOfrr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/chunk-TZMSLE5B-BwTc4sf8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/kanban-definition-3W4ZIXB7-DT07df9K.chunk.mjs.license
  inflating: nextcloud/apps/text/js/logger-CoS2pszN.chunk.mjs.license
  inflating: nextcloud/apps/text/js/excel-BGcxma0I.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stylus-DWR-qgWC.chunk.mjs
  inflating: nextcloud/apps/text/js/roboconf.js-B6woiGlM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/graphql-CIDXcmFz.chunk.mjs
  inflating: nextcloud/apps/text/js/rsl.js-B_5lwwsT.chunk.mjs.map
  inflating: nextcloud/apps/text/js/monkey-CgcNy3pp.chunk.mjs.map
  inflating: nextcloud/apps/text/js/MediaHandler.provider-CTjO6aKX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/treemap-KMMF4GRG-BHT9xVli.chunk.mjs.license
  inflating: nextcloud/apps/text/js/awk.js-8zVfqZxq.chunk.mjs.map
  inflating: nextcloud/apps/text/js/rust-CHfneMIM.chunk.mjs.license
  inflating: nextcloud/apps/text/js/roboconf-Ddwcfgqq.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mel.js-BJARXddV.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gradle-a80sVPaF.chunk.mjs.license
  inflating: nextcloud/apps/text/js/plaintext-CyNGerFk.chunk.mjs.map
  inflating: nextcloud/apps/text/js/clean-DnxC-PeC.chunk.mjs
  inflating: nextcloud/apps/text/js/stylus-DWR-qgWC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/pf-ClpsTjGR.chunk.mjs
  inflating: nextcloud/apps/text/js/stateDiagram-FKZM4ZOC-Cr_u45MQ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/coffeescript-BPozQeaX.chunk.mjs
  inflating: nextcloud/apps/text/js/http-DqCoYMCZ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/inform7-BHBaZqtY.chunk.mjs.license
  inflating: nextcloud/apps/text/js/index-CRQM6PVi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/diagram-S2PKOQOG-Cq6r2uXt.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vala-Dn170-jK.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nsis-Cl3qveJ-.chunk.mjs.license
  inflating: nextcloud/apps/text/js/avrasm-9CfSNvuY.chunk.mjs.map
  inflating: nextcloud/apps/text/js/MenuBar-aZwqxDEv.chunk.mjs.map
  inflating: nextcloud/apps/text/js/armasm-B7RMNLpU.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mermaid.core-DrJfu-9d.chunk.mjs.license
  inflating: nextcloud/apps/text/js/hy-DkKBd9R8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/clean-DnxC-PeC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/zephir-DxiT9-8Y.chunk.mjs
  inflating: nextcloud/apps/text/js/openscad.js-Bz48Nbl7.chunk.mjs.license
  inflating: nextcloud/apps/text/js/dockerfile.js-CiDyagoA.chunk.mjs.map
  inflating: nextcloud/apps/text/js/capnproto-Dp9VulVG.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scss-BAKQTVkN.chunk.mjs.license
  inflating: nextcloud/apps/text/js/csp-RBirCoGX.chunk.mjs.license
  inflating: nextcloud/apps/text/js/clean-PGhjrUpb.chunk.mjs
  inflating: nextcloud/apps/text/js/shell.js-0VGN75k0.chunk.mjs
  inflating: nextcloud/apps/text/js/index-hTwX2gcC-TY8YV1bJ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/classDiagram-2ON5EDUG-D_UU8pQx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/bash-DrXxOfkH.chunk.mjs
  inflating: nextcloud/apps/text/js/cos.js-mv5-bUBi.chunk.mjs.license
  inflating: nextcloud/apps/text/js/tap-CtEKa09I.chunk.mjs.map
  inflating: nextcloud/apps/text/js/prolog.js-DRvXNW2T.chunk.mjs.license
  inflating: nextcloud/apps/text/js/reasonml-CVVuNviy.chunk.mjs.map
  inflating: nextcloud/apps/text/js/autohotkey-Drm9cZeh.chunk.mjs.map
  inflating: nextcloud/apps/text/js/qml-WVoaqOMb.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-TZMSLE5B-BwTc4sf8.chunk.mjs
  inflating: nextcloud/apps/text/js/RichWorkspace-DJbyRXWV.chunk.mjs.license
  inflating: nextcloud/apps/text/js/capnproto-Cr_e5d-w.chunk.mjs
  inflating: nextcloud/apps/text/js/julia-repl.js-BMvLPE-s.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lasso-CHWo4wwJ.chunk.mjs
  inflating: nextcloud/apps/text/js/jboss-cli.js-tkvnCAOb.chunk.mjs
  inflating: nextcloud/apps/text/js/graphql-CtafLyBX.chunk.mjs
  inflating: nextcloud/apps/text/js/q-BGfaasPs.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vim-CS0ghoWE.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ruleslanguage.js-sZ4O1q0x.chunk.mjs.license
  inflating: nextcloud/apps/text/js/sequenceDiagram-WL72ISMW-Bw41u-KD.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dsconfig-NmC0RLif.chunk.mjs
  inflating: nextcloud/apps/text/js/latex-CieJSPgB.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ganttDiagram-LVOFAZNH-zWAjY9sg.chunk.mjs
  inflating: nextcloud/apps/text/js/pgsql-C_5LO55d.chunk.mjs.license
  inflating: nextcloud/apps/text/js/bnf.js-DnqdtJmx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/leaf-x6AR_yRr.chunk.mjs
  inflating: nextcloud/apps/text/js/autoit-B1CswtbC.chunk.mjs
  inflating: nextcloud/apps/text/js/lisp.js-D8V2UNCu.chunk.mjs
  inflating: nextcloud/apps/text/js/bash.js-DQk70VCu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/wasm-C3gwLvZu.chunk.mjs
  inflating: nextcloud/apps/text/js/dust-d8UXf66K.chunk.mjs
  inflating: nextcloud/apps/text/js/nim-DXr35NqW.chunk.mjs.map
  inflating: nextcloud/apps/text/js/coq.js-NUOtWFbZ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/flowDiagram-NV44I4VS-CQQSZMfU.chunk.mjs
  inflating: nextcloud/apps/text/js/erlang.js-8zDaDp9h.chunk.mjs.license
  inflating: nextcloud/apps/text/js/basic-DmGfHAMJ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ada-B180OuNO.chunk.mjs
  inflating: nextcloud/apps/text/js/ruby.js-BTZeQOQR.chunk.mjs
  inflating: nextcloud/apps/text/js/gherkin.js-DNkWSSdm.chunk.mjs
  inflating: nextcloud/apps/text/js/files--k339mQ3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/text-public.mjs.license
  inflating: nextcloud/apps/text/js/dockerfile-BouQFsj7.chunk.mjs.license
  inflating: nextcloud/apps/text/js/swift-PdH-gS-1.chunk.mjs.map
  inflating: nextcloud/apps/text/js/diff.js-DEYwu5Co.chunk.mjs
  inflating: nextcloud/apps/text/js/ebnf-DIO2jk9D.chunk.mjs.map
  inflating: nextcloud/apps/text/js/shell-Cm-x7wmr.chunk.mjs
  inflating: nextcloud/apps/text/js/mipsasm-Dh5-C345.chunk.mjs.map
  inflating: nextcloud/apps/text/js/roboconf-DaQpg-yK.chunk.mjs
  inflating: nextcloud/apps/text/js/quadrantDiagram-AYHSOK5B-CWmAAv97.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nim-BSFHMXbr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/csharp.js-CdmcTAgP.chunk.mjs
  inflating: nextcloud/apps/text/js/angelscript-BUTDZ7mP.chunk.mjs.license
  inflating: nextcloud/apps/text/js/chunk-DI55MBZ5-B8lZYe9s.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gml.js-BXmLcSH9.chunk.mjs.map
  inflating: nextcloud/apps/text/js/xl-CwsKSdsO.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ruleslanguage-D_ChJjaX.chunk.mjs.license
  inflating: nextcloud/apps/text/js/openscad-Cqz-DqP2.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mojolicious-D_ow4Pss.chunk.mjs
  inflating: nextcloud/apps/text/js/prolog.js-DRvXNW2T.chunk.mjs
  inflating: nextcloud/apps/text/js/julia-repl.js-BMvLPE-s.chunk.mjs
  inflating: nextcloud/apps/text/js/coffeescript-CI1lgLTi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scala-DtrwTQbq.chunk.mjs.license
  inflating: nextcloud/apps/text/js/coq-DdIF9Dqn.chunk.mjs
  inflating: nextcloud/apps/text/js/requirementDiagram-UZGBJVZJ-B00t-0jP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/bash-DrXxOfkH.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cos.js-mv5-bUBi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/step21-CIMRsLOS.chunk.mjs
  inflating: nextcloud/apps/text/js/gherkin.js-DNkWSSdm.chunk.mjs.license
  inflating: nextcloud/apps/text/js/awk-Bdt0v-Gr.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mathematica-DfCv73he.chunk.mjs.map
  inflating: nextcloud/apps/text/js/puppet-Q9o52uST.chunk.mjs
  inflating: nextcloud/apps/text/js/applescript-Dktc-0-m.chunk.mjs.license
  inflating: nextcloud/apps/text/js/d-CVMQHPru.chunk.mjs.map
  inflating: nextcloud/apps/text/js/_plugin-vue2_normalizer-wd1ZAbRr.chunk.mjs.map
  inflating: nextcloud/apps/text/js/sql-BsGrcmvH.chunk.mjs
  inflating: nextcloud/apps/text/js/nsis.js-2qlvRaAC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scheme.js-COePqrlu.chunk.mjs
  inflating: nextcloud/apps/text/js/hsp-CR51VVim.chunk.mjs
  inflating: nextcloud/apps/text/js/crystal.js-DJe1cejk.chunk.mjs
  inflating: nextcloud/apps/text/js/routeros.js-Drzsymon.chunk.mjs.license
  inflating: nextcloud/apps/text/js/accesslog.js-BI1vLRVz.chunk.mjs.map
  inflating: nextcloud/apps/text/js/less-BI2KJkNt.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gml-DSdvv6II.chunk.mjs.license
  inflating: nextcloud/apps/text/js/fix.js-3FI90EDz.chunk.mjs.map
  inflating: nextcloud/apps/text/js/subunit.js-CLmQh2S3.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gams.js-ekSz0qIz.chunk.mjs.license
  inflating: nextcloud/apps/text/js/armasm-BSj171P2.chunk.mjs
  inflating: nextcloud/apps/text/js/capnproto-Cr_e5d-w.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-DI55MBZ5-B8lZYe9s.chunk.mjs.map
  inflating: nextcloud/apps/text/js/text-public.mjs.map
  inflating: nextcloud/apps/text/js/gherkin-DUTDqKu5.chunk.mjs.license
  inflating: nextcloud/apps/text/js/csp-B7uIb9xV.chunk.mjs
  inflating: nextcloud/apps/text/js/chunk-4BX2VUAB-CXxCl32T.chunk.mjs
  inflating: nextcloud/apps/text/js/armasm.js-DJQ-tPBi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/PlainTextReader-DQnA_-uv.chunk.mjs.license
  inflating: nextcloud/apps/text/js/livecodeserver-WU_wnUq8.chunk.mjs.map
  inflating: nextcloud/apps/text/js/swift-PdH-gS-1.chunk.mjs.license
  inflating: nextcloud/apps/text/js/elixir.js-CaNM_Xij.chunk.mjs.map
  inflating: nextcloud/apps/text/js/aspectj-D5jAbgmz.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scala.js-0bCuhK7z.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gml-BDQhSQRT.chunk.mjs.map
  inflating: nextcloud/apps/text/js/autoit-B1CswtbC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/SessionList-CEjn9R56.chunk.mjs
  inflating: nextcloud/apps/text/js/plaintext-itmLAr2Y.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lua-DXERfzNY.chunk.mjs.map
  inflating: nextcloud/apps/text/js/elm.js-D7HPbtc6.chunk.mjs
  inflating: nextcloud/apps/text/js/elm-D5Vw2Lwi.chunk.mjs
  inflating: nextcloud/apps/text/js/javascript-Kl1KRBDZ.chunk.mjs
  inflating: nextcloud/apps/text/js/clean.js-em0hHxHF.chunk.mjs.map
  inflating: nextcloud/apps/text/js/maxima-Bl8CEyFG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/applescript-Dktc-0-m.chunk.mjs
  inflating: nextcloud/apps/text/js/dsconfig-CnYwPbl7.chunk.mjs
  inflating: nextcloud/apps/text/js/zephir.js-Nwo5Efm8.chunk.mjs
  inflating: nextcloud/apps/text/js/actionscript-BANlK8K7.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ocaml-Lke8W5fZ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/Editor.singleton-BX-M5W3F.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lua-BQjZcCxG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/purebasic.js-CVBnh3Bi.chunk.mjs
  inflating: nextcloud/apps/text/js/sml.js-ukB8AuLe.chunk.mjs
  inflating: nextcloud/apps/text/js/smalltalk-bWzQNAdg.chunk.mjs
  inflating: nextcloud/apps/text/js/cpp-C_ghzwI2.chunk.mjs.map
  inflating: nextcloud/apps/text/js/julia-repl-dCvWNpGT.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dos.js-C4vEZB-l.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cmake.js-DzZ9vwXQ.chunk.mjs
  inflating: nextcloud/apps/text/js/markdown-Bn23LrdL.chunk.mjs.license
  inflating: nextcloud/apps/text/js/rust-CHfneMIM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stata-D8hD5UcC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/golo-C5O1bb65.chunk.mjs.license
  inflating: nextcloud/apps/text/js/php-template.js-BAaJQq3h.chunk.mjs.license
  inflating: nextcloud/apps/text/js/Editor.singleton-BX-M5W3F.chunk.mjs.license
  inflating: nextcloud/apps/text/js/avrasm-9CfSNvuY.chunk.mjs.license
  inflating: nextcloud/apps/text/js/pony-Bp3cMKRf.chunk.mjs.license
  inflating: nextcloud/apps/text/js/katex-DGORuje8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/hy.js-B6qxPHxZ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/makefile-C_xzPPu6.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dos-ByiaI_kN.chunk.mjs.license
  inflating: nextcloud/apps/text/js/profile-CjndWZOg.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nix-DDHFhCQH.chunk.mjs.map
  inflating: nextcloud/apps/text/js/text-text.mjs
  inflating: nextcloud/apps/text/js/bnf-C1qq1N49.chunk.mjs.map
  inflating: nextcloud/apps/text/js/haxe.js-KYCwyCwg.chunk.mjs.license
  inflating: nextcloud/apps/text/js/Reader-D3OfgjyM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/xml-xhkNIy7U.chunk.mjs.map
  inflating: nextcloud/apps/text/js/tp-vGKXVnKU.chunk.mjs.map
  inflating: nextcloud/apps/text/js/pgsql-C_5LO55d.chunk.mjs
  inflating: nextcloud/apps/text/js/bash-D2Y5opc-.chunk.mjs
  inflating: nextcloud/apps/text/js/jboss-cli-DeiFPnDo.chunk.mjs.map
  inflating: nextcloud/apps/text/js/smalltalk.js-CiS3T_cO.chunk.mjs.license
  inflating: nextcloud/apps/text/js/NcLoadingIcon-ZJnsd-es.chunk.mjs.map
  inflating: nextcloud/apps/text/js/fsharp-rOerrI3H.chunk.mjs
  inflating: nextcloud/apps/text/js/nim-DXr35NqW.chunk.mjs
  inflating: nextcloud/apps/text/js/kotlin.js-DC4bWEWO.chunk.mjs
  inflating: nextcloud/apps/text/js/lsl.js-C5_Urcte.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ruleslanguage.js-sZ4O1q0x.chunk.mjs.map
  inflating: nextcloud/apps/text/js/prolog-Du42hbPr.chunk.mjs
  inflating: nextcloud/apps/text/js/flix-dyu6hGwg.chunk.mjs.license
  inflating: nextcloud/apps/text/js/isbl.js-DcVSc0AM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/pony-GQmept-6.chunk.mjs.license
  inflating: nextcloud/apps/text/js/rsl-Bnc_UKMa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/accesslog-cSelwjEo.chunk.mjs.license
  inflating: nextcloud/apps/text/js/cytoscape.esm-jrxdzse9.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ViewerComponent-DS0QbC7p.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mipsasm-Dh5-C345.chunk.mjs
  inflating: nextcloud/apps/text/js/defaultLocale-0_YM-Ssk.chunk.mjs.license
  inflating: nextcloud/apps/text/js/verilog-4Jz-EXGy.chunk.mjs.license
  inflating: nextcloud/apps/text/js/architectureDiagram-VXUJARFQ-bYoXwm-B.chunk.mjs
  inflating: nextcloud/apps/text/js/tcl-Di_hFKOx.chunk.mjs.license
  inflating: nextcloud/apps/text/js/cmake.js-DzZ9vwXQ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dsconfig.js-M1--aIG8.chunk.mjs
  inflating: nextcloud/apps/text/js/moonscript.js-MvK9XZ82.chunk.mjs
  inflating: nextcloud/apps/text/js/smalltalk.js-CiS3T_cO.chunk.mjs
  inflating: nextcloud/apps/text/js/mel.js-BJARXddV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/glsl-DFuaITlO.chunk.mjs
  inflating: nextcloud/apps/text/js/index-CRQM6PVi.chunk.mjs
  inflating: nextcloud/apps/text/js/livescript.js-C3_iwvRh.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mizar.js-BILra5__.chunk.mjs
  inflating: nextcloud/apps/text/js/vhdl.js-BcQGYUqx.chunk.mjs
  inflating: nextcloud/apps/text/js/graph-B8OEd732.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gams.js-ekSz0qIz.chunk.mjs
  inflating: nextcloud/apps/text/js/makefile.js-A4odkqiA.chunk.mjs.license
  inflating: nextcloud/apps/text/js/EditorOutline-DrybdBHq.chunk.mjs
  inflating: nextcloud/apps/text/js/reasonml-CK1pWcKM.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lsl-CImbbEkJ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/matlab-4f3-gLLz.chunk.mjs
  inflating: nextcloud/apps/text/js/rib-C0AnwAuG.chunk.mjs.map
  inflating: nextcloud/apps/text/js/kotlin-XY4rV-Ao.chunk.mjs
  inflating: nextcloud/apps/text/js/livescript.js-C3_iwvRh.chunk.mjs.map
  inflating: nextcloud/apps/text/js/json-CzpZDOLU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/subunit-SO0CM6SU.chunk.mjs
  inflating: nextcloud/apps/text/js/mel-Ds3qbn6d.chunk.mjs
  inflating: nextcloud/apps/text/js/arduino.js-D_87iyER.chunk.mjs.license
  inflating: nextcloud/apps/text/js/moonscript-DZwROcuE.chunk.mjs.license
  inflating: nextcloud/apps/text/js/node-repl.js-Dkek2XA7.chunk.mjs
  inflating: nextcloud/apps/text/js/dns.js-CAP_v0vE.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mercury-CsHRYF3A.chunk.mjs.license
  inflating: nextcloud/apps/text/js/go-uDcKc56N.chunk.mjs
  inflating: nextcloud/apps/text/js/node-repl-CRMPy_Tl.chunk.mjs
  inflating: nextcloud/apps/text/js/perl.js-DRk2ludB.chunk.mjs
  inflating: nextcloud/apps/text/js/vbscript-html.js-DL2Anf2X.chunk.mjs
  inflating: nextcloud/apps/text/js/fortran-BY2IpvbP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/stan-1kxlC_Si.chunk.mjs.license
  inflating: nextcloud/apps/text/js/subunit.js-CLmQh2S3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csharp-DVj23eoz.chunk.mjs.map
  inflating: nextcloud/apps/text/js/sankeyDiagram-TZEHDZUN-DvY1hMpe.chunk.mjs
  inflating: nextcloud/apps/text/js/gitGraphDiagram-NY62KEGX-CoAlzKsu.chunk.mjs
  inflating: nextcloud/apps/text/js/rib-Cf4rn7f_.chunk.mjs.license
  inflating: nextcloud/apps/text/js/elm-D5Vw2Lwi.chunk.mjs.map
  inflating: nextcloud/apps/text/js/python-repl-BtwP6BTX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ada.js-Z72Do3-a.chunk.mjs
  inflating: nextcloud/apps/text/js/vbnet-Bh_HqYkj.chunk.mjs.license
  inflating: nextcloud/apps/text/js/properties-CxTAPmqa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/perl-BhGqtLVD.chunk.mjs
  inflating: nextcloud/apps/text/js/xl-RnMecz-s.chunk.mjs.license
  inflating: nextcloud/apps/text/js/r.js-QC59nTDx.chunk.mjs.license
  inflating: nextcloud/apps/text/js/php.js-CWJjUB7_.chunk.mjs
  inflating: nextcloud/apps/text/js/crystal-CYU8Dwca.chunk.mjs.map
  inflating: nextcloud/apps/text/js/linear-BgvCSYiQ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scala-DqlJWsQi.chunk.mjs.license
  inflating: nextcloud/apps/text/js/routeros-DO8SL_FC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/files--k339mQ3.chunk.mjs.license
  inflating: nextcloud/apps/text/js/markdown-EUG5zOTs.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dos-ByiaI_kN.chunk.mjs
  inflating: nextcloud/apps/text/js/sml-BQqJX6J9.chunk.mjs
  inflating: nextcloud/apps/text/js/axapta-CYm3dFSX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/channel-vPM2QyeB.chunk.mjs
  inflating: nextcloud/apps/text/js/armasm.js-DJQ-tPBi.chunk.mjs
  inflating: nextcloud/apps/text/js/flix.js-BT2QBHeA.chunk.mjs
  inflating: nextcloud/apps/text/js/maxima-BOm0yN9O.chunk.mjs
  inflating: nextcloud/apps/text/js/erlang-Dg020I5V.chunk.mjs
  inflating: nextcloud/apps/text/js/ceylon.js-QwPGGO9V.chunk.mjs.map
  inflating: nextcloud/apps/text/js/python-BNoD8RQJ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/markdown-EUG5zOTs.chunk.mjs
  inflating: nextcloud/apps/text/js/ocaml-C5bJ_q9D.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cal-CtdkHSIM.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vhdl-CCFLoG-d.chunk.mjs
  inflating: nextcloud/apps/text/js/qml-WVoaqOMb.chunk.mjs.license
  inflating: nextcloud/apps/text/js/yaml-BZ6rJN3K.chunk.mjs
  inflating: nextcloud/apps/text/js/groovy-WpKw9JPP.chunk.mjs
  inflating: nextcloud/apps/text/js/step21.js-BMhmdzJq.chunk.mjs
  inflating: nextcloud/apps/text/js/kotlin.js-DC4bWEWO.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lisp-DSMzHnIR.chunk.mjs.map
  inflating: nextcloud/apps/text/js/xl-CwsKSdsO.chunk.mjs.map
  inflating: nextcloud/apps/text/js/livecodeserver.js-BIhyWdEa.chunk.mjs.map
  inflating: nextcloud/apps/text/js/verilog.js-BK3cvir3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/processing-eRah6_3b.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ruleslanguage-D_ChJjaX.chunk.mjs
  inflating: nextcloud/apps/text/js/mathematica-mA_ywU3r.chunk.mjs.license
  inflating: nextcloud/apps/text/js/handlebars-D0ilPrxy.chunk.mjs.map
  inflating: nextcloud/apps/text/js/init-CLzSasj9.chunk.mjs
  inflating: nextcloud/apps/text/js/smali.js-Dwnjt441.chunk.mjs
  inflating: nextcloud/apps/text/js/ordinal-D6YK7yj2.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vim-CS0ghoWE.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ini.js-Fa0Iyssd.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ruleslanguage.js-sZ4O1q0x.chunk.mjs
  inflating: nextcloud/apps/text/js/qml.js-Cgt3qMi4.chunk.mjs
  inflating: nextcloud/apps/text/js/elixir-CJiMqYZc.chunk.mjs.license
  inflating: nextcloud/apps/text/js/c4Diagram-YG6GDRKO-VNRszUox.chunk.mjs.license
  inflating: nextcloud/apps/text/js/text-editor.mjs
  inflating: nextcloud/apps/text/js/livescript-C8nDtg3Y.chunk.mjs.license
  inflating: nextcloud/apps/text/js/arduino-Y4MbT-Zm.chunk.mjs.map
  inflating: nextcloud/apps/text/js/_baseUniq-pf37y4On.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-FMBD7UC4-Dznk2lEa.chunk.mjs
  inflating: nextcloud/apps/text/js/NcLoadingIcon-ZJnsd-es.chunk.mjs.license
  inflating: nextcloud/apps/text/js/c-BqBAm1na.chunk.mjs.map
  inflating: nextcloud/apps/text/js/markdown.js-CX8iBhcu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/css-CtZHrJdG.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gherkin-DUTDqKu5.chunk.mjs
  inflating: nextcloud/apps/text/js/sql-BsGrcmvH.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ldif.js-CJcfqrMu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/_baseUniq-pf37y4On.chunk.mjs.license
  inflating: nextcloud/apps/text/js/java.js-Cm0YksBh.chunk.mjs
  inflating: nextcloud/apps/text/js/excel-DbQ7Zcgj.chunk.mjs
  inflating: nextcloud/apps/text/js/graph-B8OEd732.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gml-DSdvv6II.chunk.mjs.map
  inflating: nextcloud/apps/text/js/latex.js-DqPapLM0.chunk.mjs.map
  inflating: nextcloud/apps/text/js/llvm-Cdn5jWaT.chunk.mjs
  inflating: nextcloud/apps/text/js/abnf-D5lDwC6f.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-55IACEB6-DsirH141.chunk.mjs
  inflating: nextcloud/apps/text/js/llvm-hNYq9g5U.chunk.mjs
  inflating: nextcloud/apps/text/js/brainfuck-BEt8g5zP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/processing.js-CfzcqgkO.chunk.mjs
  inflating: nextcloud/apps/text/js/livecodeserver-WU_wnUq8.chunk.mjs.license
  inflating: nextcloud/apps/text/js/puppet-Q9o52uST.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lsl-CImbbEkJ.chunk.mjs
  inflating: nextcloud/apps/text/js/stata-BjLWyHBj.chunk.mjs.map
  inflating: nextcloud/apps/text/js/roboconf-DaQpg-yK.chunk.mjs.license
  inflating: nextcloud/apps/text/js/graphql-CIDXcmFz.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mercury-CsHRYF3A.chunk.mjs
  inflating: nextcloud/apps/text/js/smalltalk.js-CiS3T_cO.chunk.mjs.map
  inflating: nextcloud/apps/text/js/twig-Ckn6dcK_.chunk.mjs.license
  inflating: nextcloud/apps/text/js/monkey-C5AMYAw1.chunk.mjs
  inflating: nextcloud/apps/text/js/quadrantDiagram-AYHSOK5B-CWmAAv97.chunk.mjs.license
  inflating: nextcloud/apps/text/js/haskell-BfZ-q3wZ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/basic-Ds39LK9K.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vim.js-BU6HJJA1.chunk.mjs
  inflating: nextcloud/apps/text/js/abnf-D5lDwC6f.chunk.mjs
  inflating: nextcloud/apps/text/js/nim.js-DccGNIvA.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vbnet-fylEG-eo.chunk.mjs
  inflating: nextcloud/apps/text/js/ceylon-Kz6Rziws.chunk.mjs.map
  inflating: nextcloud/apps/text/js/less-BI2KJkNt.chunk.mjs.map
  inflating: nextcloud/apps/text/js/autohotkey.js-BzPnjZ94.chunk.mjs
  inflating: nextcloud/apps/text/js/tap-BIsBzAzV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ordinal-D6YK7yj2.chunk.mjs.map
  inflating: nextcloud/apps/text/js/erb.js-BiVtv9DR.chunk.mjs
  inflating: nextcloud/apps/text/js/axapta.js-BYhhAwqM.chunk.mjs
  inflating: nextcloud/apps/text/js/plaintext-CyNGerFk.chunk.mjs.license
  inflating: nextcloud/apps/text/js/tap-BIsBzAzV.chunk.mjs.license
  inflating: nextcloud/apps/text/js/inform7-DeItVXsR.chunk.mjs.license
  inflating: nextcloud/apps/text/js/r-61VABXwB.chunk.mjs.map
  inflating: nextcloud/apps/text/js/python-repl.js-CHaNa5JZ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/flix-dyu6hGwg.chunk.mjs.map
  inflating: nextcloud/apps/text/js/typescript-DQGRcGdZ.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gcode.js-DJ9DEDQq.chunk.mjs
  inflating: nextcloud/apps/text/js/subunit.js-CLmQh2S3.chunk.mjs
  inflating: nextcloud/apps/text/js/clean-PGhjrUpb.chunk.mjs.map
  inflating: nextcloud/apps/text/js/cpp-C_ghzwI2.chunk.mjs
  inflating: nextcloud/apps/text/js/hsp.js-BiVd_0tx.chunk.mjs.map
  inflating: nextcloud/apps/text/js/arduino-Y4MbT-Zm.chunk.mjs
  inflating: nextcloud/apps/text/js/katex-DGORuje8.chunk.mjs.map
  inflating: nextcloud/apps/text/js/pgsql.js-BwrNIkUy.chunk.mjs.license
  inflating: nextcloud/apps/text/js/rib.js-B-3OPMAm.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gams-ja02EC4u.chunk.mjs
  inflating: nextcloud/apps/text/js/rust.js-C__5JwTT.chunk.mjs
  inflating: nextcloud/apps/text/js/lua-DXERfzNY.chunk.mjs
  inflating: nextcloud/apps/text/js/nginx.js--C9lqpUd.chunk.mjs
  inflating: nextcloud/apps/text/js/chunk-B4BG7PRW-BufKqovV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dart-CL8zQ6ub.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-QZHKN3VN-BN6G8Q4W.chunk.mjs
  inflating: nextcloud/apps/text/js/asciidoc-C5tglQJX.chunk.mjs.license
  inflating: nextcloud/apps/text/js/lasso.js-BplIaBhT.chunk.mjs.license
  inflating: nextcloud/apps/text/js/pony-GQmept-6.chunk.mjs
  inflating: nextcloud/apps/text/js/glsl.js-pyOD2tGI.chunk.mjs
  inflating: nextcloud/apps/text/js/livescript--iXc5ZtC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/julia-C62ubGTH.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mercury-CsHRYF3A.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csp-B7uIb9xV.chunk.mjs.license
  inflating: nextcloud/apps/text/js/hsp-DeZdr--c.chunk.mjs.license
  inflating: nextcloud/apps/text/js/fsharp.js-BFP4G32Y.chunk.mjs.map
  inflating: nextcloud/apps/text/js/objectivec-x7Je_z-B.chunk.mjs.map
  inflating: nextcloud/apps/text/js/vhdl-rg1XqZoD.chunk.mjs
  inflating: nextcloud/apps/text/js/thrift-Cy4orVKi.chunk.mjs.license
  inflating: nextcloud/apps/text/js/python-repl-CkDa0QZa.chunk.mjs
  inflating: nextcloud/apps/text/js/_plugin-vue2_normalizer-wd1ZAbRr.chunk.mjs
  inflating: nextcloud/apps/text/js/autoit-B1CswtbC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/makefile-C_xzPPu6.chunk.mjs
  inflating: nextcloud/apps/text/js/perl-DFzkI-iP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/rib-Cf4rn7f_.chunk.mjs
  inflating: nextcloud/apps/text/js/apache.js-RdONElAI.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ocaml-Lke8W5fZ.chunk.mjs
  inflating: nextcloud/apps/text/js/text-files.mjs.license
  inflating: nextcloud/apps/text/js/shell-Cm-x7wmr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scala-DtrwTQbq.chunk.mjs.map
  inflating: nextcloud/apps/text/js/parser3-BjsMwfae.chunk.mjs.license
  inflating: nextcloud/apps/text/js/http-BF-Ug6Y1.chunk.mjs
  inflating: nextcloud/apps/text/js/dos.js-C4vEZB-l.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nix-DDHFhCQH.chunk.mjs.license
  inflating: nextcloud/apps/text/js/verilog-D2PAoRaf.chunk.mjs
  inflating: nextcloud/apps/text/js/markdown-Bn23LrdL.chunk.mjs.map
  inflating: nextcloud/apps/text/js/index-Dl858C8_.chunk.mjs
  inflating: nextcloud/apps/text/js/bash-D2Y5opc-.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gml.js-BXmLcSH9.chunk.mjs.license
  inflating: nextcloud/apps/text/js/basic.js-BuA6jDGX.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gradle-a80sVPaF.chunk.mjs.map
  inflating: nextcloud/apps/text/js/MenuBar-aZwqxDEv.chunk.mjs.license
  inflating: nextcloud/apps/text/js/excel-BGcxma0I.chunk.mjs.license
  inflating: nextcloud/apps/text/js/timeline-definition-IT6M3QCI-Bh6MVZmf.chunk.mjs.map
  inflating: nextcloud/apps/text/js/r-noDSfqGU.chunk.mjs.map
  inflating: nextcloud/apps/text/js/arc-BudVcyNJ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/monkey.js-BcEKxkZj.chunk.mjs
  inflating: nextcloud/apps/text/js/monkey-CgcNy3pp.chunk.mjs.license
  inflating: nextcloud/apps/text/js/channel-vPM2QyeB.chunk.mjs.license
  inflating: nextcloud/apps/text/js/zephir-DxiT9-8Y.chunk.mjs.map
  inflating: nextcloud/apps/text/js/actionscript.js-CWcqROhf.chunk.mjs.license
  inflating: nextcloud/apps/text/js/lua-BQjZcCxG.chunk.mjs
  inflating: nextcloud/apps/text/js/shell-B7E9NY8Y.chunk.mjs.map
  inflating: nextcloud/apps/text/js/moonscript-CA5kE2fH.chunk.mjs.map
  inflating: nextcloud/apps/text/js/php-LkOD2WJL.chunk.mjs.map
  inflating: nextcloud/apps/text/js/axapta-DOdTs_S9.chunk.mjs
  inflating: nextcloud/apps/text/js/latex-BNtmebp-.chunk.mjs.license
  inflating: nextcloud/apps/text/js/parser3.js-BvZGN2no.chunk.mjs.license
  inflating: nextcloud/apps/text/js/php-template-BrTni4U6.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csp-B7uIb9xV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/fsharp-rOerrI3H.chunk.mjs.map
  inflating: nextcloud/apps/text/js/axapta-DOdTs_S9.chunk.mjs.license
  inflating: nextcloud/apps/text/js/erlang-repl-DMmkVkHh.chunk.mjs.license
  inflating: nextcloud/apps/text/js/routeros-DO8SL_FC.chunk.mjs
  inflating: nextcloud/apps/text/js/fortran-Wik3hURo.chunk.mjs
  inflating: nextcloud/apps/text/js/abnf.js-BGeyXh1e.chunk.mjs.license
  inflating: nextcloud/apps/text/js/yaml-98Prrxe1.chunk.mjs.map
  inflating: nextcloud/apps/text/js/css.js-RPfyCpOh.chunk.mjs
  inflating: nextcloud/apps/text/js/prolog-CXI90EJ8.chunk.mjs
  inflating: nextcloud/apps/text/js/fix-DL2dsXYj.chunk.mjs
  inflating: nextcloud/apps/text/js/lua.js-DTUJfi1O.chunk.mjs.license
  inflating: nextcloud/apps/text/js/csp.js-BaWYawVw.chunk.mjs.map
  inflating: nextcloud/apps/text/js/diff-CoHcSCNR.chunk.mjs.map
  inflating: nextcloud/apps/text/js/twig.js-DgtrkMCO.chunk.mjs.map
  inflating: nextcloud/apps/text/js/FilesSettings-YsAsOxdr.chunk.mjs
  inflating: nextcloud/apps/text/js/hy-DkKBd9R8.chunk.mjs
  inflating: nextcloud/apps/text/js/nim-DXr35NqW.chunk.mjs.license
  inflating: nextcloud/apps/text/js/objectivec-COoBB3T9.chunk.mjs.map
  inflating: nextcloud/apps/text/js/groovy.js-CL5s0tbB.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gitGraphDiagram-NY62KEGX-CoAlzKsu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/profile-CjndWZOg.chunk.mjs.license
  inflating: nextcloud/apps/text/js/brainfuck-jyY6sS_W.chunk.mjs.license
  inflating: nextcloud/apps/text/js/delphi-BJz4yBab.chunk.mjs.license
  inflating: nextcloud/apps/text/js/stylus-DWR-qgWC.chunk.mjs.map
  inflating: nextcloud/apps/text/js/csharp.js-CdmcTAgP.chunk.mjs.map
  inflating: nextcloud/apps/text/js/isbl-BynO-CzR.chunk.mjs
  inflating: nextcloud/apps/text/js/wren.js-DDdzo7Z0.chunk.mjs
  inflating: nextcloud/apps/text/js/actionscript-BANlK8K7.chunk.mjs.map
  inflating: nextcloud/apps/text/js/scss.js-Us6pvDX9.chunk.mjs
  inflating: nextcloud/apps/text/js/taggerscript-Dce_vJ3W.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mel-Ds3qbn6d.chunk.mjs.map
  inflating: nextcloud/apps/text/js/RichWorkspace-DJbyRXWV.chunk.mjs
  inflating: nextcloud/apps/text/js/typescript.js-BOnGogbt.chunk.mjs.license
  inflating: nextcloud/apps/text/js/purebasic-Yy9AB4RQ.chunk.mjs
  inflating: nextcloud/apps/text/js/handlebars.js-oGQQD2VV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gherkin-C25XR7j3.chunk.mjs.map
  inflating: nextcloud/apps/text/js/rust-B0DItQ-n.chunk.mjs.map
  inflating: nextcloud/apps/text/js/thrift-DbJnbZ3Q.chunk.mjs.map
  inflating: nextcloud/apps/text/js/perl-DFzkI-iP.chunk.mjs
  inflating: nextcloud/apps/text/js/chunk-B4BG7PRW-BufKqovV.chunk.mjs
  inflating: nextcloud/apps/text/js/smali--sC3bS_F.chunk.mjs.map
  inflating: nextcloud/apps/text/js/q.js-BZa6Ry5-.chunk.mjs
  inflating: nextcloud/apps/text/js/leaf-DfTGz3CY.chunk.mjs
  inflating: nextcloud/apps/text/js/cal.js-yMGoKbFW.chunk.mjs
  inflating: nextcloud/apps/text/js/elixir.js-CaNM_Xij.chunk.mjs
  inflating: nextcloud/apps/text/js/ebnf-DIO2jk9D.chunk.mjs
  inflating: nextcloud/apps/text/js/delphi-Be3ql3j1.chunk.mjs
  inflating: nextcloud/apps/text/js/haskell-CbHKckgW.chunk.mjs
  inflating: nextcloud/apps/text/js/hy-DkKBd9R8.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crmsh-B1wTOCfV.chunk.mjs.map
  inflating: nextcloud/apps/text/js/index-DxwFe63_.chunk.mjs.license
  inflating: nextcloud/apps/text/js/brainfuck-BEt8g5zP.chunk.mjs
  inflating: nextcloud/apps/text/js/prolog.js-DRvXNW2T.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nestedtext-CpCoOu38.chunk.mjs
  inflating: nextcloud/apps/text/js/diagram-PSM6KHXK-Cx6oO2Gq.chunk.mjs.license
  inflating: nextcloud/apps/text/js/parser3.js-BvZGN2no.chunk.mjs.map
  inflating: nextcloud/apps/text/js/hy--R4Ig2PS.chunk.mjs.map
  inflating: nextcloud/apps/text/js/nix-CP5khdaU.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ini-OQSxRyWc.chunk.mjs
  inflating: nextcloud/apps/text/js/php-Bux0QqNQ.chunk.mjs
  inflating: nextcloud/apps/text/js/mathematica-DfCv73he.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gams-BtBQWyzE.chunk.mjs.license
  inflating: nextcloud/apps/text/js/pgsql.js-BwrNIkUy.chunk.mjs.map
  inflating: nextcloud/apps/text/js/rust-B0DItQ-n.chunk.mjs.license
  inflating: nextcloud/apps/text/js/aspectj-D5jAbgmz.chunk.mjs.map
  inflating: nextcloud/apps/text/js/logger-CoS2pszN.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ebnf.js-BKuqKTfP.chunk.mjs
  inflating: nextcloud/apps/text/js/glsl-CcHbKhf0.chunk.mjs.map
  inflating: nextcloud/apps/text/js/elm-D5Vw2Lwi.chunk.mjs.license
  inflating: nextcloud/apps/text/js/diff-CoHcSCNR.chunk.mjs
  inflating: nextcloud/apps/text/js/crmsh.js-yuawTH6q.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ldif-n1n1hjDu.chunk.mjs
  inflating: nextcloud/apps/text/js/awk-Bdt0v-Gr.chunk.mjs.license
  inflating: nextcloud/apps/text/js/1c-CC0wpk6N.chunk.mjs
  inflating: nextcloud/apps/text/js/vbnet.js-Bcxp8s8U.chunk.mjs.license
  inflating: nextcloud/apps/text/js/elixir-NgzVXv4Z.chunk.mjs
  inflating: nextcloud/apps/text/js/gcode-C5dqKupi.chunk.mjs.license
  inflating: nextcloud/apps/text/js/chunk-QN33PNHL-DuzxTV6C.chunk.mjs
  inflating: nextcloud/apps/text/js/xquery.js-D_H7RmjN.chunk.mjs.license
  inflating: nextcloud/apps/text/js/inform7-BHBaZqtY.chunk.mjs
  inflating: nextcloud/apps/text/js/rsl-ZJRM7WOW.chunk.mjs.map
  inflating: nextcloud/apps/text/js/gams-BtBQWyzE.chunk.mjs
  inflating: nextcloud/apps/text/js/actionscript.js-CWcqROhf.chunk.mjs
  inflating: nextcloud/apps/text/js/protobuf.js-ZGNqkBLV.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ldif-n1n1hjDu.chunk.mjs.license
  inflating: nextcloud/apps/text/js/flix-DzVTc753.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crystal-CYU8Dwca.chunk.mjs.license
  inflating: nextcloud/apps/text/js/groovy-g4urvE88.chunk.mjs.license
  inflating: nextcloud/apps/text/js/basic.js-BuA6jDGX.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dart-CL8zQ6ub.chunk.mjs
  inflating: nextcloud/apps/text/js/NcNoteCard-Dz5-u2BY-S2qe9Sjm.chunk.mjs.map
  inflating: nextcloud/apps/text/js/subunit-SO0CM6SU.chunk.mjs.map
  inflating: nextcloud/apps/text/js/shell-B7E9NY8Y.chunk.mjs
  inflating: nextcloud/apps/text/js/text-text.mjs.map
  inflating: nextcloud/apps/text/js/erDiagram-Q2GNP2WA-BTwVii78.chunk.mjs
  inflating: nextcloud/apps/text/js/lsl-DmcCa2FM.chunk.mjs.license
  inflating: nextcloud/apps/text/js/csp.js-BaWYawVw.chunk.mjs.license
  inflating: nextcloud/apps/text/js/lsl-CImbbEkJ.chunk.mjs.license
  inflating: nextcloud/apps/text/js/markdown.js-CX8iBhcu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/pf-ClpsTjGR.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dts.js-BFVnSefd.chunk.mjs.map
  inflating: nextcloud/apps/text/js/clojure-repl.js-B5f1lKJl.chunk.mjs
  inflating: nextcloud/apps/text/js/MarkdownContentEditor-DmNwqD-y.chunk.mjs
  inflating: nextcloud/apps/text/js/vbscript.js-D_Udlwpx.chunk.mjs
  inflating: nextcloud/apps/text/js/gauss-NWhZ3XSA.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scheme.js-COePqrlu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/flix.js-BT2QBHeA.chunk.mjs.license
  inflating: nextcloud/apps/text/js/ebnf-C_sav2Hd.chunk.mjs.license
  inflating: nextcloud/apps/text/js/erDiagram-Q2GNP2WA-BTwVii78.chunk.mjs.license
  inflating: nextcloud/apps/text/js/scheme-BWpoRo0R.chunk.mjs.map
  inflating: nextcloud/apps/text/js/chunk-55IACEB6-DsirH141.chunk.mjs.map
  inflating: nextcloud/apps/text/js/ini.js-Fa0Iyssd.chunk.mjs
  inflating: nextcloud/apps/text/js/julia-repl-dCvWNpGT.chunk.mjs.license
  inflating: nextcloud/apps/text/js/nix-CP5khdaU.chunk.mjs
  inflating: nextcloud/apps/text/js/asciidoc.js-D_ODG42F.chunk.mjs
  inflating: nextcloud/apps/text/js/nestedtext.js-CDcwXSh6.chunk.mjs.license
  inflating: nextcloud/apps/text/js/python.js-Bbf7mALc.chunk.mjs.map
  inflating: nextcloud/apps/text/js/less.js-U5cW0pHE.chunk.mjs
  inflating: nextcloud/apps/text/js/erb-BVs8V3Zl.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mizar-CrO600Np.chunk.mjs.license
  inflating: nextcloud/apps/text/js/c.js-B7PR-wDt.chunk.mjs.map
  inflating: nextcloud/apps/text/js/dart-CL8zQ6ub.chunk.mjs.license
  inflating: nextcloud/apps/text/js/abnf-CinNQjEv.chunk.mjs
  inflating: nextcloud/apps/text/js/text-viewer.mjs.map
  inflating: nextcloud/apps/text/js/powershell-BNU3XntF.chunk.mjs.license
  inflating: nextcloud/apps/text/js/mathematica-mA_ywU3r.chunk.mjs.map
  inflating: nextcloud/apps/text/js/abnf.js-BGeyXh1e.chunk.mjs.map
  inflating: nextcloud/apps/text/js/clojure-repl.js-B5f1lKJl.chunk.mjs.map
  inflating: nextcloud/apps/text/js/purebasic-BjccKPeu.chunk.mjs.map
  inflating: nextcloud/apps/text/js/excel.js-92Gkst0b.chunk.mjs.license
  inflating: nextcloud/apps/text/js/x86asm-BXgEvW-J.chunk.mjs.map
  inflating: nextcloud/apps/text/js/armasm-BSj171P2.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gauss-BpkAKMV9.chunk.mjs.map
  inflating: nextcloud/apps/text/js/sqf-CK85--Qo.chunk.mjs
  inflating: nextcloud/apps/text/js/r-noDSfqGU.chunk.mjs.license
  inflating: nextcloud/apps/text/js/apache.js-RdONElAI.chunk.mjs
  inflating: nextcloud/apps/text/js/gherkin-C25XR7j3.chunk.mjs
  inflating: nextcloud/apps/text/js/dts-hNGU7yIy.chunk.mjs
  inflating: nextcloud/apps/text/js/taggerscript.js-L4hCrem4.chunk.mjs.license
  inflating: nextcloud/apps/text/js/cpp-C_ghzwI2.chunk.mjs.license
  inflating: nextcloud/apps/text/js/infoDiagram-ER5ION4S-CmOpo7wH.chunk.mjs
  inflating: nextcloud/apps/text/js/mojolicious.js-DcobsBEq.chunk.mjs
  inflating: nextcloud/apps/text/js/rust-CHfneMIM.chunk.mjs
  inflating: nextcloud/apps/text/js/autohotkey-Drm9cZeh.chunk.mjs.license
  inflating: nextcloud/apps/text/js/gherkin.js-DNkWSSdm.chunk.mjs.map
  inflating: nextcloud/apps/text/js/livescript--iXc5ZtC.chunk.mjs.license
  inflating: nextcloud/apps/text/js/vhdl-rg1XqZoD.chunk.mjs.map
  inflating: nextcloud/apps/text/js/delphi-BJz4yBab.chunk.mjs.map
  inflating: nextcloud/apps/text/js/mathematica.js-BD3ea-Eo.chunk.mjs.map
  inflating: nextcloud/apps/text/js/crystal.js-DJe1cejk.chunk.mjs.license
  inflating: nextcloud/apps/text/js/yaml.js-DcvbppBp.chunk.mjs.map
  inflating: nextcloud/apps/text/js/sml-CWHTUtO8.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lisp-BVeNUQ1F.chunk.mjs.map
  inflating: nextcloud/apps/text/js/arduino.js-D_87iyER.chunk.mjs.map
  inflating: nextcloud/apps/text/js/lisp-DSMzHnIR.chunk.mjs
  inflating: nextcloud/apps/text/js/stylus-Z8gpkvy-.chunk.mjs.map
  inflating: nextcloud/apps/text/js/index-Dl858C8_.chunk.mjs.map
  inflating: nextcloud/apps/text/js/yaml.js-DcvbppBp.chunk.mjs.license
  inflating: nextcloud/apps/text/js/golo-SRzR33qH.chunk.mjs.license
  inflating: nextcloud/apps/text/js/MarkdownContentEditor-DmNwqD-y.chunk.mjs.map
  inflating: nextcloud/apps/text/js/maxima.js-Dzh2rtZc.chunk.mjs.license
  inflating: nextcloud/apps/text/js/qml-BlTCMw_F.chunk.mjs.license
  inflating: nextcloud/apps/text/js/pony.js-95UbQ2lh.chunk.mjs.map
  inflating: nextcloud/apps/text/js/powershell-8XAoq0mI.chunk.mjs
  inflating: nextcloud/apps/text/js/xquery-DQj27pVC.chunk.mjs
  inflating: nextcloud/apps/text/js/properties-CxTAPmqa.chunk.mjs
  inflating: nextcloud/apps/text/js/nginx-DLue8ieg.chunk.mjs.license
  inflating: nextcloud/apps/text/js/q.js-BZa6Ry5-.chunk.mjs.license
   creating: nextcloud/apps/text/composer/
   creating: nextcloud/apps/text/composer/composer/
  inflating: nextcloud/apps/text/composer/composer/autoload_namespaces.php
  inflating: nextcloud/apps/text/composer/composer/ClassLoader.php
  inflating: nextcloud/apps/text/composer/composer/autoload_real.php
  inflating: nextcloud/apps/text/composer/composer/autoload_classmap.php
  inflating: nextcloud/apps/text/composer/composer/installed.php
  inflating: nextcloud/apps/text/composer/composer/InstalledVersions.php
  inflating: nextcloud/apps/text/composer/composer/autoload_static.php
  inflating: nextcloud/apps/text/composer/composer/LICENSE
  inflating: nextcloud/apps/text/composer/composer/installed.json
  inflating: nextcloud/apps/text/composer/composer/autoload_psr4.php
  inflating: nextcloud/apps/text/composer/composer.lock
  inflating: nextcloud/apps/text/composer/autoload.php
  inflating: nextcloud/apps/text/composer/composer.json
   creating: nextcloud/apps/text/l10n/
  inflating: nextcloud/apps/text/l10n/es_NI.js
  inflating: nextcloud/apps/text/l10n/es_GT.json
  inflating: nextcloud/apps/text/l10n/sr.json
  inflating: nextcloud/apps/text/l10n/sl.json
  inflating: nextcloud/apps/text/l10n/nn_NO.json
  inflating: nextcloud/apps/text/l10n/et_EE.js
  inflating: nextcloud/apps/text/l10n/hr.js
  inflating: nextcloud/apps/text/l10n/es_PE.json
  inflating: nextcloud/apps/text/l10n/zh_TW.json
  inflating: nextcloud/apps/text/l10n/es_419.json
  inflating: nextcloud/apps/text/l10n/ug.json
  inflating: nextcloud/apps/text/l10n/es_SV.json
  inflating: nextcloud/apps/text/l10n/lo.js
  inflating: nextcloud/apps/text/l10n/en_GB.json
  inflating: nextcloud/apps/text/l10n/bg.js
  inflating: nextcloud/apps/text/l10n/es_PA.js
  inflating: nextcloud/apps/text/l10n/es_CR.js
  inflating: nextcloud/apps/text/l10n/sk.json
  inflating: nextcloud/apps/text/l10n/si.json
  inflating: nextcloud/apps/text/l10n/gl.json
  inflating: nextcloud/apps/text/l10n/es_CR.json
  inflating: nextcloud/apps/text/l10n/tr.json
  inflating: nextcloud/apps/text/l10n/ug.js
  inflating: nextcloud/apps/text/l10n/fa.json
  inflating: nextcloud/apps/text/l10n/es_PY.js
  inflating: nextcloud/apps/text/l10n/en_GB.js
  inflating: nextcloud/apps/text/l10n/es_EC.js
  inflating: nextcloud/apps/text/l10n/tr.js
  inflating: nextcloud/apps/text/l10n/es_PY.json
  inflating: nextcloud/apps/text/l10n/vi.js
  inflating: nextcloud/apps/text/l10n/bs.json
  inflating: nextcloud/apps/text/l10n/de.json
  inflating: nextcloud/apps/text/l10n/ka_GE.json
  inflating: nextcloud/apps/text/l10n/sr@latin.json
  inflating: nextcloud/apps/text/l10n/mn.js
  inflating: nextcloud/apps/text/l10n/ka.json
  inflating: nextcloud/apps/text/l10n/oc.json
  inflating: nextcloud/apps/text/l10n/ms_MY.json
  inflating: nextcloud/apps/text/l10n/bn_BD.json
  inflating: nextcloud/apps/text/l10n/es_MX.js
  inflating: nextcloud/apps/text/l10n/km.json
  inflating: nextcloud/apps/text/l10n/lv.js
  inflating: nextcloud/apps/text/l10n/sr.js
  inflating: nextcloud/apps/text/l10n/lt_LT.js
  inflating: nextcloud/apps/text/l10n/nb.js
  inflating: nextcloud/apps/text/l10n/cy_GB.js
  inflating: nextcloud/apps/text/l10n/es_PR.js
  inflating: nextcloud/apps/text/l10n/be.json
  inflating: nextcloud/apps/text/l10n/uk.js
  inflating: nextcloud/apps/text/l10n/mn.json
  inflating: nextcloud/apps/text/l10n/zh_HK.js
  inflating: nextcloud/apps/text/l10n/nn_NO.js
  inflating: nextcloud/apps/text/l10n/ca.js
  inflating: nextcloud/apps/text/l10n/fa.js
  inflating: nextcloud/apps/text/l10n/es_GT.js
  inflating: nextcloud/apps/text/l10n/es.json
  inflating: nextcloud/apps/text/l10n/sv.json
  inflating: nextcloud/apps/text/l10n/ru.json
  inflating: nextcloud/apps/text/l10n/da.json
  inflating: nextcloud/apps/text/l10n/he.json
  inflating: nextcloud/apps/text/l10n/sl.js
  inflating: nextcloud/apps/text/l10n/kab.js
  inflating: nextcloud/apps/text/l10n/es_DO.json
  inflating: nextcloud/apps/text/l10n/ro.js
  inflating: nextcloud/apps/text/l10n/ka.js
  inflating: nextcloud/apps/text/l10n/zh_HK.json
  inflating: nextcloud/apps/text/l10n/es_PA.json
  inflating: nextcloud/apps/text/l10n/es_CO.json
  inflating: nextcloud/apps/text/l10n/de_DE.js
  inflating: nextcloud/apps/text/l10n/it.json
  inflating: nextcloud/apps/text/l10n/mk.js
  inflating: nextcloud/apps/text/l10n/br.json
  inflating: nextcloud/apps/text/l10n/zh_CN.json
  inflating: nextcloud/apps/text/l10n/sc.js
  inflating: nextcloud/apps/text/l10n/gl.js
  inflating: nextcloud/apps/text/l10n/uz.json
  inflating: nextcloud/apps/text/l10n/sr@latin.js
  inflating: nextcloud/apps/text/l10n/es_UY.js
  inflating: nextcloud/apps/text/l10n/ar.json
  inflating: nextcloud/apps/text/l10n/cs.js
  inflating: nextcloud/apps/text/l10n/ta.js
  inflating: nextcloud/apps/text/l10n/es_HN.js
  inflating: nextcloud/apps/text/l10n/af.js
  inflating: nextcloud/apps/text/l10n/cy_GB.json
  inflating: nextcloud/apps/text/l10n/lt_LT.json
  inflating: nextcloud/apps/text/l10n/da.js
  inflating: nextcloud/apps/text/l10n/es_PE.js
  inflating: nextcloud/apps/text/l10n/mk.json
  inflating: nextcloud/apps/text/l10n/sc.json
  inflating: nextcloud/apps/text/l10n/es_HN.json
  inflating: nextcloud/apps/text/l10n/hu.json
  inflating: nextcloud/apps/text/l10n/ko.json
  inflating: nextcloud/apps/text/l10n/sw.js
  inflating: nextcloud/apps/text/l10n/nl.json
  inflating: nextcloud/apps/text/l10n/lv.json
  inflating: nextcloud/apps/text/l10n/cs.json
  inflating: nextcloud/apps/text/l10n/hu.js
  inflating: nextcloud/apps/text/l10n/es_CO.js
  inflating: nextcloud/apps/text/l10n/ja.js
  inflating: nextcloud/apps/text/l10n/az.js
  inflating: nextcloud/apps/text/l10n/hy.json
  inflating: nextcloud/apps/text/l10n/af.json
  inflating: nextcloud/apps/text/l10n/es_NI.json
  inflating: nextcloud/apps/text/l10n/eo.json
  inflating: nextcloud/apps/text/l10n/es_UY.json
  inflating: nextcloud/apps/text/l10n/bs.js
  inflating: nextcloud/apps/text/l10n/is.json
  inflating: nextcloud/apps/text/l10n/az.json
  inflating: nextcloud/apps/text/l10n/an.js
  inflating: nextcloud/apps/text/l10n/ta.json
  inflating: nextcloud/apps/text/l10n/hr.json
  inflating: nextcloud/apps/text/l10n/es_419.js
  inflating: nextcloud/apps/text/l10n/th.json
  inflating: nextcloud/apps/text/l10n/ast.js
  inflating: nextcloud/apps/text/l10n/sk.js
  inflating: nextcloud/apps/text/l10n/lo.json
  inflating: nextcloud/apps/text/l10n/zh_CN.js
  inflating: nextcloud/apps/text/l10n/et_EE.json
  inflating: nextcloud/apps/text/l10n/ka_GE.js
  inflating: nextcloud/apps/text/l10n/bn_BD.js
  inflating: nextcloud/apps/text/l10n/gd.json
  inflating: nextcloud/apps/text/l10n/km.js
  inflating: nextcloud/apps/text/l10n/si.js
  inflating: nextcloud/apps/text/l10n/ms_MY.js
  inflating: nextcloud/apps/text/l10n/kn.js
  inflating: nextcloud/apps/text/l10n/lb.json
  inflating: nextcloud/apps/text/l10n/pt_PT.js
  inflating: nextcloud/apps/text/l10n/de_DE.json
  inflating: nextcloud/apps/text/l10n/oc.js
  inflating: nextcloud/apps/text/l10n/sq.js
  inflating: nextcloud/apps/text/l10n/ia.js
  inflating: nextcloud/apps/text/l10n/th.js
  inflating: nextcloud/apps/text/l10n/pt_BR.js
  inflating: nextcloud/apps/text/l10n/he.js
  inflating: nextcloud/apps/text/l10n/eu.json
  inflating: nextcloud/apps/text/l10n/ga.json
  inflating: nextcloud/apps/text/l10n/hy.js
  inflating: nextcloud/apps/text/l10n/es_AR.json
  inflating: nextcloud/apps/text/l10n/sq.json
  inflating: nextcloud/apps/text/l10n/es_CL.json
  inflating: nextcloud/apps/text/l10n/fr.js
  inflating: nextcloud/apps/text/l10n/fi.json
  inflating: nextcloud/apps/text/l10n/es_PR.json
  inflating: nextcloud/apps/text/l10n/ko.js
  inflating: nextcloud/apps/text/l10n/bg.json
  inflating: nextcloud/apps/text/l10n/eo.js
  inflating: nextcloud/apps/text/l10n/pl.js
  inflating: nextcloud/apps/text/l10n/vi.json
  inflating: nextcloud/apps/text/l10n/id.json
  inflating: nextcloud/apps/text/l10n/nb.json
  inflating: nextcloud/apps/text/l10n/ia.json
  inflating: nextcloud/apps/text/l10n/es_DO.js
  inflating: nextcloud/apps/text/l10n/ar.js
  inflating: nextcloud/apps/text/l10n/pl.json
  inflating: nextcloud/apps/text/l10n/el.json
  inflating: nextcloud/apps/text/l10n/br.js
  inflating: nextcloud/apps/text/l10n/zh_TW.js
  inflating: nextcloud/apps/text/l10n/be.js
  inflating: nextcloud/apps/text/l10n/nl.js
  inflating: nextcloud/apps/text/l10n/es_CL.js
  inflating: nextcloud/apps/text/l10n/es_MX.json
  inflating: nextcloud/apps/text/l10n/el.js
  inflating: nextcloud/apps/text/l10n/kn.json
  inflating: nextcloud/apps/text/l10n/id.js
  inflating: nextcloud/apps/text/l10n/pt_PT.json
  inflating: nextcloud/apps/text/l10n/fr.json
  inflating: nextcloud/apps/text/l10n/sw.json
  inflating: nextcloud/apps/text/l10n/es_EC.json
  inflating: nextcloud/apps/text/l10n/gd.js
  inflating: nextcloud/apps/text/l10n/lb.js
  inflating: nextcloud/apps/text/l10n/ga.js
  inflating: nextcloud/apps/text/l10n/it.js
  inflating: nextcloud/apps/text/l10n/ast.json
  inflating: nextcloud/apps/text/l10n/pt_BR.json
  inflating: nextcloud/apps/text/l10n/es.js
  inflating: nextcloud/apps/text/l10n/de.js
  inflating: nextcloud/apps/text/l10n/ca.json
  inflating: nextcloud/apps/text/l10n/uz.js
  inflating: nextcloud/apps/text/l10n/ja.json
  inflating: nextcloud/apps/text/l10n/eu.js
  inflating: nextcloud/apps/text/l10n/is.js
  inflating: nextcloud/apps/text/l10n/fi.js
  inflating: nextcloud/apps/text/l10n/ru.js
  inflating: nextcloud/apps/text/l10n/sv.js
  inflating: nextcloud/apps/text/l10n/an.json
  inflating: nextcloud/apps/text/l10n/es_AR.js
  inflating: nextcloud/apps/text/l10n/ro.json
  inflating: nextcloud/apps/text/l10n/kab.json
  inflating: nextcloud/apps/text/l10n/es_SV.js
  inflating: nextcloud/apps/text/l10n/uk.json
  inflating: nextcloud/apps/text/prettier.config.js
  inflating: nextcloud/apps/text/composer.lock
   creating: nextcloud/apps/text/img/
  inflating: nextcloud/apps/text/img/app.svg
  inflating: nextcloud/apps/text/img/app.png
  inflating: nextcloud/apps/text/img/app-dark.svg
  inflating: nextcloud/apps/text/img/checkbox-mark.svg
   creating: nextcloud/apps/text/img/screenshots/
  inflating: nextcloud/apps/text/img/screenshots/screenshot3.gif
  inflating: nextcloud/apps/text/img/screenshots/screenshot1.png
  inflating: nextcloud/apps/text/img/screenshots/screenshot2.png
  inflating: nextcloud/apps/text/img/article.svg
  inflating: nextcloud/apps/text/package-lock.json
  inflating: nextcloud/apps/text/REUSE.toml
  inflating: nextcloud/apps/text/cypress.config.mjs
   creating: nextcloud/apps/text/lib/
   creating: nextcloud/apps/text/lib/Db/
  inflating: nextcloud/apps/text/lib/Db/Step.php
  inflating: nextcloud/apps/text/lib/Db/SessionMapper.php
  inflating: nextcloud/apps/text/lib/Db/DocumentMapper.php
  inflating: nextcloud/apps/text/lib/Db/Document.php
  inflating: nextcloud/apps/text/lib/Db/Session.php
  inflating: nextcloud/apps/text/lib/Db/StepMapper.php
   creating: nextcloud/apps/text/lib/Listeners/
  inflating: nextcloud/apps/text/lib/Listeners/BeforeAssistantNotificationListener.php
  inflating: nextcloud/apps/text/lib/Listeners/NodeCopiedListener.php
  inflating: nextcloud/apps/text/lib/Listeners/RegisterDirectEditorEventListener.php
  inflating: nextcloud/apps/text/lib/Listeners/AddMissingIndicesListener.php
  inflating: nextcloud/apps/text/lib/Listeners/LoadEditorListener.php
  inflating: nextcloud/apps/text/lib/Listeners/BeforeNodeDeletedListener.php
  inflating: nextcloud/apps/text/lib/Listeners/BeforeNodeRenamedListener.php
  inflating: nextcloud/apps/text/lib/Listeners/BeforeNodeWrittenListener.php
  inflating: nextcloud/apps/text/lib/Listeners/FilesSharingLoadAdditionalScriptsListener.php
  inflating: nextcloud/apps/text/lib/Listeners/RegisterTemplateCreatorListener.php
  inflating: nextcloud/apps/text/lib/Listeners/LoadViewerListener.php
  inflating: nextcloud/apps/text/lib/Listeners/VersionRestoredListener.php
  inflating: nextcloud/apps/text/lib/Listeners/FilesLoadAdditionalScriptsListener.php
   creating: nextcloud/apps/text/lib/Exception/
  inflating: nextcloud/apps/text/lib/Exception/UploadException.php
  inflating: nextcloud/apps/text/lib/Exception/VersionMismatchException.php
  inflating: nextcloud/apps/text/lib/Exception/InvalidSessionException.php
  inflating: nextcloud/apps/text/lib/Exception/DocumentHasUnsavedChangesException.php
  inflating: nextcloud/apps/text/lib/Exception/DocumentSaveConflictException.php
  inflating: nextcloud/apps/text/lib/Exception/InvalidDocumentBaseVersionEtagException.php
  inflating: nextcloud/apps/text/lib/TextFile.php
   creating: nextcloud/apps/text/lib/DAV/
  inflating: nextcloud/apps/text/lib/DAV/WorkspacePlugin.php
   creating: nextcloud/apps/text/lib/DirectEditing/
  inflating: nextcloud/apps/text/lib/DirectEditing/TextDirectEditor.php
  inflating: nextcloud/apps/text/lib/DirectEditing/TextDocumentCreator.php
   creating: nextcloud/apps/text/lib/Command/
  inflating: nextcloud/apps/text/lib/Command/ResetDocument.php
   creating: nextcloud/apps/text/lib/Service/
  inflating: nextcloud/apps/text/lib/Service/EncodingService.php
  inflating: nextcloud/apps/text/lib/Service/WorkspaceService.php
  inflating: nextcloud/apps/text/lib/Service/DocumentService.php
  inflating: nextcloud/apps/text/lib/Service/NotificationService.php
  inflating: nextcloud/apps/text/lib/Service/SessionService.php
  inflating: nextcloud/apps/text/lib/Service/ConfigService.php
  inflating: nextcloud/apps/text/lib/Service/ApiService.php
  inflating: nextcloud/apps/text/lib/Service/AttachmentService.php
  inflating: nextcloud/apps/text/lib/Service/InitialStateProvider.php
  inflating: nextcloud/apps/text/lib/YjsMessage.php
   creating: nextcloud/apps/text/lib/Migration/
  inflating: nextcloud/apps/text/lib/Migration/Version070000Date20250925110024.php
  inflating: nextcloud/apps/text/lib/Migration/Version030201Date20201116110353.php
  inflating: nextcloud/apps/text/lib/Migration/ResetSessionsBeforeYjs.php
  inflating: nextcloud/apps/text/lib/Migration/Version030701Date20230207131313.php
  inflating: nextcloud/apps/text/lib/Migration/Version030001Date20200402075029.php
  inflating: nextcloud/apps/text/lib/Migration/Version030901Date20231114150437.php
  inflating: nextcloud/apps/text/lib/Migration/Version030201Date20201116123153.php
  inflating: nextcloud/apps/text/lib/Migration/Version030501Date20220202101853.php
  inflating: nextcloud/apps/text/lib/Migration/Version010000Date20190617184535.php
  inflating: nextcloud/apps/text/lib/Migration/Version040100Date20240611165300.php
   creating: nextcloud/apps/text/lib/AppInfo/
  inflating: nextcloud/apps/text/lib/AppInfo/Application.php
   creating: nextcloud/apps/text/lib/Event/
  inflating: nextcloud/apps/text/lib/Event/LoadEditor.php
  inflating: nextcloud/apps/text/lib/Event/MentionEvent.php
   creating: nextcloud/apps/text/lib/Middleware/
  inflating: nextcloud/apps/text/lib/Middleware/SessionMiddleware.php
   creating: nextcloud/apps/text/lib/Middleware/Attribute/
  inflating: nextcloud/apps/text/lib/Middleware/Attribute/RequireDocumentSessionOrUserOrShareToken.php
  inflating: nextcloud/apps/text/lib/Middleware/Attribute/RequireDocumentBaseVersionEtag.php
  inflating: nextcloud/apps/text/lib/Middleware/Attribute/RequireDocumentSession.php
   creating: nextcloud/apps/text/lib/Controller/
  inflating: nextcloud/apps/text/lib/Controller/SessionController.php
  inflating: nextcloud/apps/text/lib/Controller/UserApiController.php
  inflating: nextcloud/apps/text/lib/Controller/TSessionAwareController.php
  inflating: nextcloud/apps/text/lib/Controller/PublicSessionController.php
  inflating: nextcloud/apps/text/lib/Controller/ISessionAwareController.php
  inflating: nextcloud/apps/text/lib/Controller/SettingsController.php
  inflating: nextcloud/apps/text/lib/Controller/NavigationController.php
  inflating: nextcloud/apps/text/lib/Controller/AttachmentController.php
  inflating: nextcloud/apps/text/lib/Controller/WorkspaceController.php
   creating: nextcloud/apps/text/lib/Notification/
  inflating: nextcloud/apps/text/lib/Notification/Notifier.php
   creating: nextcloud/apps/text/lib/Cron/
  inflating: nextcloud/apps/text/lib/Cron/Cleanup.php
  inflating: nextcloud/apps/text/CHANGELOG.md
   creating: nextcloud/apps/text/templates/
  inflating: nextcloud/apps/text/templates/main.php
   creating: nextcloud/apps/text/css/
  inflating: nextcloud/apps/text/css/RichWorkspace-DF75DIQU.chunk.css
 extracting: nextcloud/apps/text/css/text-files.css
  inflating: nextcloud/apps/text/css/text-BrKBJp1J.chunk.css
  inflating: nextcloud/apps/text/css/NcNoteCard-Dz5-u2BY-DSc672TB.chunk.css
  inflating: nextcloud/apps/text/css/SessionList-DddBTVZI.chunk.css
  inflating: nextcloud/apps/text/css/RichTextReader-CMPQ_96l.chunk.css
  inflating: nextcloud/apps/text/css/EditorOutline-CpwrhjT9.chunk.css
  inflating: nextcloud/apps/text/css/NcLoadingIcon-CAC0K4sG.chunk.css
  inflating: nextcloud/apps/text/css/Reader-CzpdJpUj.chunk.css
 extracting: nextcloud/apps/text/css/text-editor.css
  inflating: nextcloud/apps/text/css/BaseReader-DLKIg9lj.chunk.css
  inflating: nextcloud/apps/text/css/Editor-C0q_ky-Z.chunk.css
  inflating: nextcloud/apps/text/css/MenuBar-vlQMjTHZ.chunk.css
  inflating: nextcloud/apps/text/css/ViewerComponent-Co24edKW.chunk.css
  inflating: nextcloud/apps/text/css/text-text.css
  inflating: nextcloud/apps/text/css/NcCheckboxRadioSwitch-DAPHFb0L-35V8jJy1.chunk.css
  inflating: nextcloud/apps/text/css/text-init.css
 extracting: nextcloud/apps/text/css/text-viewer.css
 extracting: nextcloud/apps/text/css/text-public.css
  inflating: nextcloud/apps/text/babel.config.cjs
  inflating: nextcloud/apps/text/composer.json
  inflating: nextcloud/apps/text/package.json
  inflating: nextcloud/apps/text/AUTHORS
  inflating: nextcloud/apps/text/COPYING
   creating: nextcloud/apps/text/LICENSES/
  inflating: nextcloud/apps/text/LICENSES/MIT.txt
  inflating: nextcloud/apps/text/LICENSES/CC0-1.0.txt
  inflating: nextcloud/apps/text/LICENSES/BSD-2-Clause.txt
  inflating: nextcloud/apps/text/LICENSES/GPL-3.0-or-later.txt
  inflating: nextcloud/apps/text/LICENSES/AGPL-3.0-or-later.txt
  inflating: nextcloud/apps/text/LICENSES/MPL-2.0.txt
  inflating: nextcloud/apps/text/LICENSES/BSD-3-Clause.txt
  inflating: nextcloud/apps/text/LICENSES/ISC.txt
  inflating: nextcloud/apps/text/LICENSES/Apache-2.0.txt
   creating: nextcloud/apps/text/appinfo/
  inflating: nextcloud/apps/text/appinfo/info.xml
  inflating: nextcloud/apps/text/appinfo/routes.php
  inflating: nextcloud/apps/text/appinfo/signature.json
   creating: nextcloud/apps/dav/
   creating: nextcloud/apps/dav/composer/
   creating: nextcloud/apps/dav/composer/composer/
  inflating: nextcloud/apps/dav/composer/composer/autoload_namespaces.php
  inflating: nextcloud/apps/dav/composer/composer/ClassLoader.php
  inflating: nextcloud/apps/dav/composer/composer/autoload_real.php
  inflating: nextcloud/apps/dav/composer/composer/autoload_classmap.php
  inflating: nextcloud/apps/dav/composer/composer/installed.php
  inflating: nextcloud/apps/dav/composer/composer/InstalledVersions.php
  inflating: nextcloud/apps/dav/composer/composer/autoload_static.php
  inflating: nextcloud/apps/dav/composer/composer/LICENSE
  inflating: nextcloud/apps/dav/composer/composer/installed.json
  inflating: nextcloud/apps/dav/composer/composer/autoload_psr4.php
  inflating: nextcloud/apps/dav/composer/composer.lock
  inflating: nextcloud/apps/dav/composer/autoload.php
  inflating: nextcloud/apps/dav/composer/composer.json
   creating: nextcloud/apps/dav/l10n/
  inflating: nextcloud/apps/dav/l10n/sr.json
  inflating: nextcloud/apps/dav/l10n/sl.json
  inflating: nextcloud/apps/dav/l10n/et_EE.js
  inflating: nextcloud/apps/dav/l10n/zh_TW.json
  inflating: nextcloud/apps/dav/l10n/ug.json
  inflating: nextcloud/apps/dav/l10n/lo.js
  inflating: nextcloud/apps/dav/l10n/en_GB.json
  inflating: nextcloud/apps/dav/l10n/bg.js
  inflating: nextcloud/apps/dav/l10n/sk.json
  inflating: nextcloud/apps/dav/l10n/gl.json
  inflating: nextcloud/apps/dav/l10n/tr.json
  inflating: nextcloud/apps/dav/l10n/ug.js
  inflating: nextcloud/apps/dav/l10n/fa.json
  inflating: nextcloud/apps/dav/l10n/en_GB.js
  inflating: nextcloud/apps/dav/l10n/es_EC.js
  inflating: nextcloud/apps/dav/l10n/tr.js
  inflating: nextcloud/apps/dav/l10n/de.json
  inflating: nextcloud/apps/dav/l10n/ka.json
  inflating: nextcloud/apps/dav/l10n/es_MX.js
  inflating: nextcloud/apps/dav/l10n/sr.js
  inflating: nextcloud/apps/dav/l10n/nb.js
  inflating: nextcloud/apps/dav/l10n/uk.js
  inflating: nextcloud/apps/dav/l10n/zh_HK.js
  inflating: nextcloud/apps/dav/l10n/ca.js
  inflating: nextcloud/apps/dav/l10n/fa.js
  inflating: nextcloud/apps/dav/l10n/es.json
  inflating: nextcloud/apps/dav/l10n/sv.json
  inflating: nextcloud/apps/dav/l10n/ru.json
  inflating: nextcloud/apps/dav/l10n/da.json
  inflating: nextcloud/apps/dav/l10n/sl.js
  inflating: nextcloud/apps/dav/l10n/ka.js
  inflating: nextcloud/apps/dav/l10n/zh_HK.json
  inflating: nextcloud/apps/dav/l10n/de_DE.js
  inflating: nextcloud/apps/dav/l10n/it.json
  inflating: nextcloud/apps/dav/l10n/mk.js
  inflating: nextcloud/apps/dav/l10n/zh_CN.json
  inflating: nextcloud/apps/dav/l10n/gl.js
  inflating: nextcloud/apps/dav/l10n/ar.json
  inflating: nextcloud/apps/dav/l10n/cs.js
  inflating: nextcloud/apps/dav/l10n/da.js
  inflating: nextcloud/apps/dav/l10n/mk.json
  inflating: nextcloud/apps/dav/l10n/hu.json
  inflating: nextcloud/apps/dav/l10n/ko.json
  inflating: nextcloud/apps/dav/l10n/sw.js
  inflating: nextcloud/apps/dav/l10n/nl.json
  inflating: nextcloud/apps/dav/l10n/cs.json
  inflating: nextcloud/apps/dav/l10n/hu.js
  inflating: nextcloud/apps/dav/l10n/ja.js
  inflating: nextcloud/apps/dav/l10n/is.json
  inflating: nextcloud/apps/dav/l10n/ast.js
  inflating: nextcloud/apps/dav/l10n/sk.js
  inflating: nextcloud/apps/dav/l10n/lo.json
  inflating: nextcloud/apps/dav/l10n/zh_CN.js
  inflating: nextcloud/apps/dav/l10n/et_EE.json
  inflating: nextcloud/apps/dav/l10n/pt_PT.js
  inflating: nextcloud/apps/dav/l10n/de_DE.json
  inflating: nextcloud/apps/dav/l10n/pt_BR.js
  inflating: nextcloud/apps/dav/l10n/eu.json
  inflating: nextcloud/apps/dav/l10n/ga.json
  inflating: nextcloud/apps/dav/l10n/fr.js
  inflating: nextcloud/apps/dav/l10n/ko.js
  inflating: nextcloud/apps/dav/l10n/bg.json
  inflating: nextcloud/apps/dav/l10n/pl.js
  inflating: nextcloud/apps/dav/l10n/nb.json
  inflating: nextcloud/apps/dav/l10n/ar.js
  inflating: nextcloud/apps/dav/l10n/pl.json
  inflating: nextcloud/apps/dav/l10n/el.json
  inflating: nextcloud/apps/dav/l10n/zh_TW.js
  inflating: nextcloud/apps/dav/l10n/nl.js
  inflating: nextcloud/apps/dav/l10n/es_MX.json
  inflating: nextcloud/apps/dav/l10n/el.js
  inflating: nextcloud/apps/dav/l10n/pt_PT.json
  inflating: nextcloud/apps/dav/l10n/fr.json
  inflating: nextcloud/apps/dav/l10n/sw.json
  inflating: nextcloud/apps/dav/l10n/es_EC.json
  inflating: nextcloud/apps/dav/l10n/ga.js
  inflating: nextcloud/apps/dav/l10n/it.js
  inflating: nextcloud/apps/dav/l10n/ast.json
  inflating: nextcloud/apps/dav/l10n/pt_BR.json
  inflating: nextcloud/apps/dav/l10n/es.js
  inflating: nextcloud/apps/dav/l10n/de.js
  inflating: nextcloud/apps/dav/l10n/ca.json
  inflating: nextcloud/apps/dav/l10n/ja.json
  inflating: nextcloud/apps/dav/l10n/eu.js
  inflating: nextcloud/apps/dav/l10n/is.js
  inflating: nextcloud/apps/dav/l10n/ru.js
  inflating: nextcloud/apps/dav/l10n/sv.js
  inflating: nextcloud/apps/dav/l10n/uk.json
   creating: nextcloud/apps/dav/img/
 extracting: nextcloud/apps/dav/img/schedule.svg.license
 extracting: nextcloud/apps/dav/img/calendar.svg.license
  inflating: nextcloud/apps/dav/img/calendar.svg
  inflating: nextcloud/apps/dav/img/schedule.svg
   creating: nextcloud/apps/dav/lib/
   creating: nextcloud/apps/dav/lib/Db/
  inflating: nextcloud/apps/dav/lib/Db/DirectMapper.php
  inflating: nextcloud/apps/dav/lib/Db/Absence.php
  inflating: nextcloud/apps/dav/lib/Db/AbsenceMapper.php
  inflating: nextcloud/apps/dav/lib/Db/PropertyMapper.php
  inflating: nextcloud/apps/dav/lib/Db/Direct.php
  inflating: nextcloud/apps/dav/lib/Db/Property.php
   creating: nextcloud/apps/dav/lib/Listener/
  inflating: nextcloud/apps/dav/lib/Listener/UserEventsListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CardListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CalendarFederationNotificationListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CalendarShareUpdateListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CalendarContactInteractionListener.php
  inflating: nextcloud/apps/dav/lib/Listener/DavAdminSettingsListener.php
  inflating: nextcloud/apps/dav/lib/Listener/SabrePluginAuthInitListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CalendarDeletionDefaultUpdaterListener.php
  inflating: nextcloud/apps/dav/lib/Listener/OutOfOfficeListener.php
  inflating: nextcloud/apps/dav/lib/Listener/AddMissingIndicesListener.php
  inflating: nextcloud/apps/dav/lib/Listener/AddressbookListener.php
  inflating: nextcloud/apps/dav/lib/Listener/UserPreferenceListener.php
  inflating: nextcloud/apps/dav/lib/Listener/ActivityUpdaterListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CalendarPublicationListener.php
  inflating: nextcloud/apps/dav/lib/Listener/SubscriptionListener.php
  inflating: nextcloud/apps/dav/lib/Listener/CalendarObjectReminderUpdaterListener.php
  inflating: nextcloud/apps/dav/lib/Listener/ClearPhotoCacheListener.php
  inflating: nextcloud/apps/dav/lib/Listener/BirthdayListener.php
  inflating: nextcloud/apps/dav/lib/Listener/TrustedServerRemovedListener.php
   creating: nextcloud/apps/dav/lib/UserMigration/
  inflating: nextcloud/apps/dav/lib/UserMigration/CalendarMigratorException.php
  inflating: nextcloud/apps/dav/lib/UserMigration/ContactsMigratorException.php
  inflating: nextcloud/apps/dav/lib/UserMigration/InvalidAddressBookException.php
  inflating: nextcloud/apps/dav/lib/UserMigration/ContactsMigrator.php
  inflating: nextcloud/apps/dav/lib/UserMigration/InvalidCalendarException.php
  inflating: nextcloud/apps/dav/lib/UserMigration/CalendarMigrator.php
   creating: nextcloud/apps/dav/lib/Traits/
  inflating: nextcloud/apps/dav/lib/Traits/PrincipalProxyTrait.php
   creating: nextcloud/apps/dav/lib/Exception/
  inflating: nextcloud/apps/dav/lib/Exception/ExampleEventException.php
  inflating: nextcloud/apps/dav/lib/Exception/ServerMaintenanceMode.php
  inflating: nextcloud/apps/dav/lib/Exception/UnsupportedLimitOnInitialSyncException.php
  inflating: nextcloud/apps/dav/lib/Capabilities.php
   creating: nextcloud/apps/dav/lib/BackgroundJob/
  inflating: nextcloud/apps/dav/lib/BackgroundJob/UserStatusAutomation.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/OutOfOfficeEventDispatcherJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/PruneOutdatedSyncTokensJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/CleanupInvitationTokenJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/FederatedCalendarSyncJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/DeleteOutdatedSchedulingObjects.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/RegisterRegenerateBirthdayCalendars.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/RefreshWebcalJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/CleanupOrphanedChildrenJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/CleanupDirectLinksJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/BuildReminderIndexBackgroundJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/UploadCleanup.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/GenerateBirthdayCalendarBackgroundJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/EventReminderJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/FederatedCalendarPeriodicSyncJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/CalendarRetentionJob.php
  inflating: nextcloud/apps/dav/lib/BackgroundJob/UpdateCalendarResourcesRoomsBackgroundJob.php
   creating: nextcloud/apps/dav/lib/SystemTag/
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagsRelationsCollection.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagsObjectMappingCollection.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagObjectType.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagPlugin.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagsObjectList.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagList.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagsObjectTypeCollection.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagNode.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagsByIdCollection.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagMappingNode.php
  inflating: nextcloud/apps/dav/lib/SystemTag/SystemTagsInUseCollection.php
   creating: nextcloud/apps/dav/lib/Events/
  inflating: nextcloud/apps/dav/lib/Events/CardCreatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/AddressBookUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/SabrePluginAddEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarMovedToTrashEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarRestoredEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarDeletedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarCreatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/BeforeFileDirectDownloadedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarUnpublishedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarPublishedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CardMovedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CachedCalendarObjectDeletedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/AddressBookDeletedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CardDeletedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/SubscriptionUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/SubscriptionCreatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/AddressBookShareUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CardUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/SubscriptionDeletedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/AddressBookCreatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CachedCalendarObjectCreatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CachedCalendarObjectUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/CalendarShareUpdatedEvent.php
  inflating: nextcloud/apps/dav/lib/Events/SabrePluginAuthInitEvent.php
   creating: nextcloud/apps/dav/lib/DAV/
  inflating: nextcloud/apps/dav/lib/DAV/CustomPropertiesBackend.php
   creating: nextcloud/apps/dav/lib/DAV/Sharing/
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/SharingMapper.php
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/IShareable.php
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/Backend.php
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/Plugin.php
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/SharingService.php
   creating: nextcloud/apps/dav/lib/DAV/Sharing/Xml/
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/Xml/Invite.php
  inflating: nextcloud/apps/dav/lib/DAV/Sharing/Xml/ShareRequest.php
  inflating: nextcloud/apps/dav/lib/DAV/RemoteUserPrincipalBackend.php
  inflating: nextcloud/apps/dav/lib/DAV/ViewOnlyPlugin.php
  inflating: nextcloud/apps/dav/lib/DAV/SystemPrincipalBackend.php
  inflating: nextcloud/apps/dav/lib/DAV/GroupPrincipalBackend.php
  inflating: nextcloud/apps/dav/lib/DAV/PublicAuth.php
   creating: nextcloud/apps/dav/lib/Model/
  inflating: nextcloud/apps/dav/lib/Model/ExampleEvent.php
  inflating: nextcloud/apps/dav/lib/RootCollection.php
   creating: nextcloud/apps/dav/lib/Command/
  inflating: nextcloud/apps/dav/lib/Command/SyncSystemAddressBook.php
  inflating: nextcloud/apps/dav/lib/Command/ClearCalendarUnshares.php
  inflating: nextcloud/apps/dav/lib/Command/ListSubscriptions.php
  inflating: nextcloud/apps/dav/lib/Command/ClearContactsPhotoCache.php
  inflating: nextcloud/apps/dav/lib/Command/CreateCalendar.php
  inflating: nextcloud/apps/dav/lib/Command/FixCalendarSyncCommand.php
  inflating: nextcloud/apps/dav/lib/Command/GetAbsenceCommand.php
  inflating: nextcloud/apps/dav/lib/Command/CreateAddressBook.php
  inflating: nextcloud/apps/dav/lib/Command/RetentionCleanupCommand.php
  inflating: nextcloud/apps/dav/lib/Command/CreateSubscription.php
  inflating: nextcloud/apps/dav/lib/Command/ListCalendarShares.php
  inflating: nextcloud/apps/dav/lib/Command/ExportCalendar.php
  inflating: nextcloud/apps/dav/lib/Command/ListAddressbooks.php
  inflating: nextcloud/apps/dav/lib/Command/DeleteCalendar.php
  inflating: nextcloud/apps/dav/lib/Command/SyncBirthdayCalendar.php
  inflating: nextcloud/apps/dav/lib/Command/ImportCalendar.php
  inflating: nextcloud/apps/dav/lib/Command/DeleteSubscription.php
  inflating: nextcloud/apps/dav/lib/Command/SendEventReminders.php
  inflating: nextcloud/apps/dav/lib/Command/ListCalendars.php
  inflating: nextcloud/apps/dav/lib/Command/MoveCalendar.php
  inflating: nextcloud/apps/dav/lib/Command/SetAbsenceCommand.php
  inflating: nextcloud/apps/dav/lib/Command/RemoveInvalidShares.php
   creating: nextcloud/apps/dav/lib/Profiler/
  inflating: nextcloud/apps/dav/lib/Profiler/ProfilerPlugin.php
   creating: nextcloud/apps/dav/lib/Service/
  inflating: nextcloud/apps/dav/lib/Service/ExampleEventService.php
  inflating: nextcloud/apps/dav/lib/Service/AbsenceService.php
  inflating: nextcloud/apps/dav/lib/Service/ExampleContactService.php
  inflating: nextcloud/apps/dav/lib/Service/ASyncService.php
   creating: nextcloud/apps/dav/lib/SetupChecks/
  inflating: nextcloud/apps/dav/lib/SetupChecks/WebdavEndpoint.php
  inflating: nextcloud/apps/dav/lib/SetupChecks/NeedsSystemAddressBookSync.php
   creating: nextcloud/apps/dav/lib/BulkUpload/
  inflating: nextcloud/apps/dav/lib/BulkUpload/BulkUploadPlugin.php
  inflating: nextcloud/apps/dav/lib/BulkUpload/MultipartRequestParser.php
   creating: nextcloud/apps/dav/lib/Migration/
  inflating: nextcloud/apps/dav/lib/Migration/Version1008Date20181105104833.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1004Date20170825134824.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1004Date20170924124212.php
  inflating: nextcloud/apps/dav/lib/Migration/RefreshWebcalJobRegistrar.php
  inflating: nextcloud/apps/dav/lib/Migration/RegisterBuildReminderIndexBackgroundJob.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1004Date20170926103422.php
  inflating: nextcloud/apps/dav/lib/Migration/BuildCalendarSearchIndex.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1016Date20201109085907.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1017Date20210216083742.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1012Date20190808122342.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1004Date20170919104507.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1034Date20250605132605.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1008Date20181105104826.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1030Date20240205103243.php
  inflating: nextcloud/apps/dav/lib/Migration/RegisterUpdateCalendarResourcesRoomBackgroundJob.php
  inflating: nextcloud/apps/dav/lib/Migration/DeleteSchedulingObjects.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1018Date20210312100735.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1034Date20250813093701.php
  inflating: nextcloud/apps/dav/lib/Migration/BuildSocialSearchIndex.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1011Date20190806104428.php
  inflating: nextcloud/apps/dav/lib/Migration/RemoveObjectProperties.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1024Date20211221144219.php
  inflating: nextcloud/apps/dav/lib/Migration/FixBirthdayCalendarComponent.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1029Date20221114151721.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1011Date20190725113607.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1006Date20180628111625.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1027Date20230504122946.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1006Date20180619154313.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1005Date20180413093149.php
  inflating: nextcloud/apps/dav/lib/Migration/BuildCalendarSearchIndexBackgroundJob.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1025Date20240308063933.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1008Date20181105110300.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1008Date20181105112049.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1008Date20181030113700.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1029Date20231004091403.php
  inflating: nextcloud/apps/dav/lib/Migration/BuildSocialSearchIndexBackgroundJob.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1031Date20240610134258.php
  inflating: nextcloud/apps/dav/lib/Migration/RemoveClassifiedEventActivity.php
  inflating: nextcloud/apps/dav/lib/Migration/CalDAVRemoveEmptyValue.php
  inflating: nextcloud/apps/dav/lib/Migration/ChunkCleanup.php
  inflating: nextcloud/apps/dav/lib/Migration/RemoveDeletedUsersCalendarSubscriptions.php
  inflating: nextcloud/apps/dav/lib/Migration/RemoveOrphanEventsAndContacts.php
  inflating: nextcloud/apps/dav/lib/Migration/CreateSystemAddressBookStep.php
  inflating: nextcloud/apps/dav/lib/Migration/RegenerateBirthdayCalendars.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1005Date20180530124431.php
  inflating: nextcloud/apps/dav/lib/Migration/Version1008Date20181114084440.php
   creating: nextcloud/apps/dav/lib/Direct/
  inflating: nextcloud/apps/dav/lib/Direct/DirectFile.php
  inflating: nextcloud/apps/dav/lib/Direct/ServerFactory.php
  inflating: nextcloud/apps/dav/lib/Direct/Server.php
  inflating: nextcloud/apps/dav/lib/Direct/DirectHome.php
  inflating: nextcloud/apps/dav/lib/ServerFactory.php
   creating: nextcloud/apps/dav/lib/CardDAV/
   creating: nextcloud/apps/dav/lib/CardDAV/Sharing/
  inflating: nextcloud/apps/dav/lib/CardDAV/Sharing/Backend.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Sharing/Service.php
   creating: nextcloud/apps/dav/lib/CardDAV/Security/
  inflating: nextcloud/apps/dav/lib/CardDAV/Security/CardDavRateLimitingPlugin.php
  inflating: nextcloud/apps/dav/lib/CardDAV/AddressBook.php
   creating: nextcloud/apps/dav/lib/CardDAV/Activity/
  inflating: nextcloud/apps/dav/lib/CardDAV/Activity/Backend.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Activity/Setting.php
   creating: nextcloud/apps/dav/lib/CardDAV/Activity/Provider/
  inflating: nextcloud/apps/dav/lib/CardDAV/Activity/Provider/Addressbook.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Activity/Provider/Base.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Activity/Provider/Card.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Activity/Filter.php
  inflating: nextcloud/apps/dav/lib/CardDAV/PhotoCache.php
  inflating: nextcloud/apps/dav/lib/CardDAV/ContactsManager.php
  inflating: nextcloud/apps/dav/lib/CardDAV/SystemAddressbook.php
   creating: nextcloud/apps/dav/lib/CardDAV/Validation/
  inflating: nextcloud/apps/dav/lib/CardDAV/Validation/CardDavValidatePlugin.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Plugin.php
  inflating: nextcloud/apps/dav/lib/CardDAV/HasPhotoPlugin.php
  inflating: nextcloud/apps/dav/lib/CardDAV/SyncService.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Card.php
  inflating: nextcloud/apps/dav/lib/CardDAV/CardDavBackend.php
  inflating: nextcloud/apps/dav/lib/CardDAV/AddressBookImpl.php
   creating: nextcloud/apps/dav/lib/CardDAV/Integration/
  inflating: nextcloud/apps/dav/lib/CardDAV/Integration/ExternalAddressBook.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Integration/IAddressBookProvider.php
  inflating: nextcloud/apps/dav/lib/CardDAV/ImageExportPlugin.php
  inflating: nextcloud/apps/dav/lib/CardDAV/UserAddressBooks.php
  inflating: nextcloud/apps/dav/lib/CardDAV/MultiGetExportPlugin.php
   creating: nextcloud/apps/dav/lib/CardDAV/Xml/
  inflating: nextcloud/apps/dav/lib/CardDAV/Xml/Groups.php
  inflating: nextcloud/apps/dav/lib/CardDAV/AddressBookRoot.php
  inflating: nextcloud/apps/dav/lib/CardDAV/Converter.php
   creating: nextcloud/apps/dav/lib/Provisioning/
   creating: nextcloud/apps/dav/lib/Provisioning/Apple/
  inflating: nextcloud/apps/dav/lib/Provisioning/Apple/AppleProvisioningPlugin.php
  inflating: nextcloud/apps/dav/lib/Provisioning/Apple/AppleProvisioningNode.php
   creating: nextcloud/apps/dav/lib/CalDAV/
  inflating: nextcloud/apps/dav/lib/CalDAV/TipBroker.php
   creating: nextcloud/apps/dav/lib/CalDAV/FreeBusy/
  inflating: nextcloud/apps/dav/lib/CalDAV/FreeBusy/FreeBusyGenerator.php
   creating: nextcloud/apps/dav/lib/CalDAV/WebcalCaching/
  inflating: nextcloud/apps/dav/lib/CalDAV/WebcalCaching/Plugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/WebcalCaching/Connection.php
  inflating: nextcloud/apps/dav/lib/CalDAV/WebcalCaching/RefreshWebcalService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/EventReader.php
  inflating: nextcloud/apps/dav/lib/CalDAV/TimezoneService.php
   creating: nextcloud/apps/dav/lib/CalDAV/Principal/
  inflating: nextcloud/apps/dav/lib/CalDAV/Principal/Collection.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Principal/User.php
   creating: nextcloud/apps/dav/lib/CalDAV/Sharing/
  inflating: nextcloud/apps/dav/lib/CalDAV/Sharing/Backend.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Sharing/Service.php
  inflating: nextcloud/apps/dav/lib/CalDAV/PublicCalendarRoot.php
   creating: nextcloud/apps/dav/lib/CalDAV/Security/
  inflating: nextcloud/apps/dav/lib/CalDAV/Security/RateLimitingPlugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalDavBackend.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalendarImpl.php
  inflating: nextcloud/apps/dav/lib/CalDAV/RetentionService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/UpcomingEventsService.php
   creating: nextcloud/apps/dav/lib/CalDAV/Export/
  inflating: nextcloud/apps/dav/lib/CalDAV/Export/ExportService.php
   creating: nextcloud/apps/dav/lib/CalDAV/Activity/
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Backend.php
   creating: nextcloud/apps/dav/lib/CalDAV/Activity/Setting/
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Setting/Todo.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Setting/Event.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Setting/Calendar.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Setting/CalDAVSetting.php
   creating: nextcloud/apps/dav/lib/CalDAV/Activity/Provider/
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Provider/Todo.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Provider/Base.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Provider/Event.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Provider/Calendar.php
   creating: nextcloud/apps/dav/lib/CalDAV/Activity/Filter/
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Filter/Todo.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Activity/Filter/Calendar.php
   creating: nextcloud/apps/dav/lib/CalDAV/AppCalendar/
  inflating: nextcloud/apps/dav/lib/CalDAV/AppCalendar/AppCalendarPlugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/AppCalendar/CalendarObject.php
  inflating: nextcloud/apps/dav/lib/CalDAV/AppCalendar/AppCalendar.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalendarManager.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CachedSubscriptionProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalendarObject.php
   creating: nextcloud/apps/dav/lib/CalDAV/Validation/
  inflating: nextcloud/apps/dav/lib/CalDAV/Validation/CalDavValidatePlugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Plugin.php
   creating: nextcloud/apps/dav/lib/CalDAV/Import/
  inflating: nextcloud/apps/dav/lib/CalDAV/Import/TextImporter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Import/ImportService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Import/XmlImporter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CachedSubscriptionObject.php
  inflating: nextcloud/apps/dav/lib/CalDAV/SyncService.php
   creating: nextcloud/apps/dav/lib/CalDAV/Trashbin/
  inflating: nextcloud/apps/dav/lib/CalDAV/Trashbin/RestoreTarget.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Trashbin/TrashbinHome.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Trashbin/Plugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Trashbin/DeletedCalendarObject.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Trashbin/DeletedCalendarObjectsCollection.php
  inflating: nextcloud/apps/dav/lib/CalDAV/IRestorable.php
   creating: nextcloud/apps/dav/lib/CalDAV/BirthdayCalendar/
  inflating: nextcloud/apps/dav/lib/CalDAV/BirthdayCalendar/EnablePlugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalendarProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/EventReaderRRule.php
  inflating: nextcloud/apps/dav/lib/CalDAV/EventReaderRDate.php
   creating: nextcloud/apps/dav/lib/CalDAV/InvitationResponse/
  inflating: nextcloud/apps/dav/lib/CalDAV/InvitationResponse/InvitationResponseServer.php
   creating: nextcloud/apps/dav/lib/CalDAV/Status/
  inflating: nextcloud/apps/dav/lib/CalDAV/Status/StatusService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalendarHome.php
   creating: nextcloud/apps/dav/lib/CalDAV/Integration/
  inflating: nextcloud/apps/dav/lib/CalDAV/Integration/ICalendarProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Integration/ExternalCalendar.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CalendarRoot.php
  inflating: nextcloud/apps/dav/lib/CalDAV/PublicCalendarObject.php
   creating: nextcloud/apps/dav/lib/CalDAV/Auth/
  inflating: nextcloud/apps/dav/lib/CalDAV/Auth/CustomPrincipalPlugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Auth/PublicPrincipalPlugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/BirthdayService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/EmbeddedCalDavServer.php
  inflating: nextcloud/apps/dav/lib/CalDAV/PublicCalendar.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Calendar.php
  inflating: nextcloud/apps/dav/lib/CalDAV/EventComparisonService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/DefaultCalendarValidator.php
  inflating: nextcloud/apps/dav/lib/CalDAV/UpcomingEvent.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CachedSubscription.php
   creating: nextcloud/apps/dav/lib/CalDAV/Federation/
   creating: nextcloud/apps/dav/lib/CalDAV/Federation/Protocol/
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/Protocol/ICalendarFederationProtocol.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/Protocol/CalendarFederationProtocolV1.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/Protocol/CalendarProtocolParseException.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendarMapper.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederationSharingService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/CalendarFederationNotifier.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendarEntity.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/CalendarFederationConfig.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/CalendarFederationProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendarSyncService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendar.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/RemoteUserCalendarHome.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendarFactory.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendarAuth.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Federation/FederatedCalendarImpl.php
   creating: nextcloud/apps/dav/lib/CalDAV/Reminder/
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/Backend.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationTypeDoesNotExistException.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/Notifier.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/INotificationProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProviderManager.php
   creating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProvider/
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProvider/ProviderNotAvailableException.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProvider/AbstractProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProvider/EmailProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProvider/PushProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/NotificationProvider/AudioProvider.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Reminder/ReminderService.php
   creating: nextcloud/apps/dav/lib/CalDAV/Publishing/
  inflating: nextcloud/apps/dav/lib/CalDAV/Publishing/PublishPlugin.php
   creating: nextcloud/apps/dav/lib/CalDAV/Publishing/Xml/
  inflating: nextcloud/apps/dav/lib/CalDAV/Publishing/Xml/Publisher.php
  inflating: nextcloud/apps/dav/lib/CalDAV/CachedSubscriptionImpl.php
   creating: nextcloud/apps/dav/lib/CalDAV/Search/
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/SearchPlugin.php
   creating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/
   creating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Request/
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Request/CalendarSearchReport.php
   creating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/PropFilter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/CompFilter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/ParamFilter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/SearchTermFilter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/LimitFilter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Search/Xml/Filter/OffsetFilter.php
  inflating: nextcloud/apps/dav/lib/CalDAV/SyncServiceResult.php
  inflating: nextcloud/apps/dav/lib/CalDAV/TimeZoneFactory.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Outbox.php
   creating: nextcloud/apps/dav/lib/CalDAV/Schedule/
  inflating: nextcloud/apps/dav/lib/CalDAV/Schedule/IMipService.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Schedule/Plugin.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Schedule/IMipPlugin.php
   creating: nextcloud/apps/dav/lib/CalDAV/ICSExportPlugin/
  inflating: nextcloud/apps/dav/lib/CalDAV/ICSExportPlugin/ICSExportPlugin.php
   creating: nextcloud/apps/dav/lib/CalDAV/Proxy/
  inflating: nextcloud/apps/dav/lib/CalDAV/Proxy/Proxy.php
  inflating: nextcloud/apps/dav/lib/CalDAV/Proxy/ProxyMapper.php
   creating: nextcloud/apps/dav/lib/CalDAV/ResourceBooking/
  inflating: nextcloud/apps/dav/lib/CalDAV/ResourceBooking/AbstractPrincipalBackend.php
  inflating: nextcloud/apps/dav/lib/CalDAV/ResourceBooking/RoomPrincipalBackend.php
  inflating: nextcloud/apps/dav/lib/CalDAV/ResourceBooking/ResourcePrincipalBackend.php
  inflating: nextcloud/apps/dav/lib/ResponseDefinitions.php
   creating: nextcloud/apps/dav/lib/Files/
   creating: nextcloud/apps/dav/lib/Files/Sharing/
  inflating: nextcloud/apps/dav/lib/Files/Sharing/RootCollection.php
  inflating: nextcloud/apps/dav/lib/Files/Sharing/FilesDropPlugin.php
  inflating: nextcloud/apps/dav/lib/Files/Sharing/PublicLinkCheckPlugin.php
  inflating: nextcloud/apps/dav/lib/Files/LazySearchBackend.php
  inflating: nextcloud/apps/dav/lib/Files/RootCollection.php
  inflating: nextcloud/apps/dav/lib/Files/FileSearchBackend.php
  inflating: nextcloud/apps/dav/lib/Files/BrowserErrorPagePlugin.php
  inflating: nextcloud/apps/dav/lib/Files/FilesHome.php
   creating: nextcloud/apps/dav/lib/Storage/
  inflating: nextcloud/apps/dav/lib/Storage/PublicShareWrapper.php
  inflating: nextcloud/apps/dav/lib/Storage/PublicOwnerWrapper.php
   creating: nextcloud/apps/dav/lib/AppInfo/
  inflating: nextcloud/apps/dav/lib/AppInfo/Application.php
  inflating: nextcloud/apps/dav/lib/AppInfo/PluginManager.php
   creating: nextcloud/apps/dav/lib/Settings/
  inflating: nextcloud/apps/dav/lib/Settings/AvailabilitySettings.php
  inflating: nextcloud/apps/dav/lib/Settings/CalDAVSettings.php
   creating: nextcloud/apps/dav/lib/Settings/Admin/
  inflating: nextcloud/apps/dav/lib/Settings/Admin/SystemAddressBookSettings.php
  inflating: nextcloud/apps/dav/lib/Settings/ExampleContentSettings.php
   creating: nextcloud/apps/dav/lib/Comments/
  inflating: nextcloud/apps/dav/lib/Comments/CommentsPlugin.php
  inflating: nextcloud/apps/dav/lib/Comments/EntityCollection.php
  inflating: nextcloud/apps/dav/lib/Comments/RootCollection.php
  inflating: nextcloud/apps/dav/lib/Comments/CommentNode.php
  inflating: nextcloud/apps/dav/lib/Comments/EntityTypeCollection.php
   creating: nextcloud/apps/dav/lib/Upload/
  inflating: nextcloud/apps/dav/lib/Upload/FutureFile.php
  inflating: nextcloud/apps/dav/lib/Upload/AssemblyStream.php
  inflating: nextcloud/apps/dav/lib/Upload/UploadHome.php
  inflating: nextcloud/apps/dav/lib/Upload/UploadFolder.php
  inflating: nextcloud/apps/dav/lib/Upload/UploadAutoMkcolPlugin.php
  inflating: nextcloud/apps/dav/lib/Upload/RootCollection.php
  inflating: nextcloud/apps/dav/lib/Upload/ChunkingV2Plugin.php
  inflating: nextcloud/apps/dav/lib/Upload/ChunkingPlugin.php
  inflating: nextcloud/apps/dav/lib/Upload/CleanupService.php
  inflating: nextcloud/apps/dav/lib/Upload/PartFile.php
  inflating: nextcloud/apps/dav/lib/Upload/UploadFile.php
   creating: nextcloud/apps/dav/lib/Paginate/
  inflating: nextcloud/apps/dav/lib/Paginate/PaginatePlugin.php
  inflating: nextcloud/apps/dav/lib/Paginate/LimitedCopyIterator.php
  inflating: nextcloud/apps/dav/lib/Paginate/PaginateCache.php
   creating: nextcloud/apps/dav/lib/Controller/
  inflating: nextcloud/apps/dav/lib/Controller/DirectController.php
  inflating: nextcloud/apps/dav/lib/Controller/ExampleContentController.php
  inflating: nextcloud/apps/dav/lib/Controller/BirthdayCalendarController.php
  inflating: nextcloud/apps/dav/lib/Controller/OutOfOfficeController.php
  inflating: nextcloud/apps/dav/lib/Controller/UpcomingEventsController.php
  inflating: nextcloud/apps/dav/lib/Controller/InvitationResponseController.php
  inflating: nextcloud/apps/dav/lib/Server.php
   creating: nextcloud/apps/dav/lib/Connector/
  inflating: nextcloud/apps/dav/lib/Connector/LegacyDAVACL.php
  inflating: nextcloud/apps/dav/lib/Connector/LegacyPublicAuth.php
   creating: nextcloud/apps/dav/lib/Connector/Sabre/
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/TagsPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/FilesPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/CachingTree.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/FakeLockerPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/BearerAuth.php
   creating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/TooManyRequests.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/PasswordLoginForbidden.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/UnsupportedMediaType.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/BadGateway.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/Forbidden.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/FileLocked.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/InvalidPath.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Exception/EntityTooLarge.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ObjectTree.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/AnonymousOptionsPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/AppleQuirksPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/CopyEtagHeaderPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Node.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/MtimeSanitizer.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/DavAclPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Principal.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/QuotaPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ChecksumList.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/PropfindCompressionPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/DummyGetResponsePlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/File.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/FilesReportPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Auth.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/RequestIdHeaderPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/SharesPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ZipFolderPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ShareeList.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/TagList.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/BlockLegacyClientPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ServerFactory.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/PropFindMonitorPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/CommentPropertiesPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/MaintenancePlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ChecksumUpdatePlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Directory.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/LockPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/PublicAuth.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/Server.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ShareTypeList.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/ExceptionLoggerPlugin.php
  inflating: nextcloud/apps/dav/lib/Connector/Sabre/PropFindPreloadNotifyPlugin.php
   creating: nextcloud/apps/dav/lib/Search/
  inflating: nextcloud/apps/dav/lib/Search/ContactsSearchProvider.php
  inflating: nextcloud/apps/dav/lib/Search/EventsSearchProvider.php
  inflating: nextcloud/apps/dav/lib/Search/ACalendarSearchProvider.php
  inflating: nextcloud/apps/dav/lib/Search/TasksSearchProvider.php
   creating: nextcloud/apps/dav/lib/ExampleContentFiles/
  inflating: nextcloud/apps/dav/lib/ExampleContentFiles/exampleContact.vcf
   creating: nextcloud/apps/dav/lib/Avatars/
  inflating: nextcloud/apps/dav/lib/Avatars/AvatarHome.php
  inflating: nextcloud/apps/dav/lib/Avatars/RootCollection.php
  inflating: nextcloud/apps/dav/lib/Avatars/AvatarNode.php
  inflating: nextcloud/apps/dav/openapi.json
   creating: nextcloud/apps/dav/templates/
  inflating: nextcloud/apps/dav/templates/settings-personal-availability.php
  inflating: nextcloud/apps/dav/templates/settings-admin-caldav.php
  inflating: nextcloud/apps/dav/templates/settings-example-content.php
  inflating: nextcloud/apps/dav/templates/schedule-response-error.php
  inflating: nextcloud/apps/dav/templates/schedule-response-success.php
  inflating: nextcloud/apps/dav/templates/schedule-response-options.php
   creating: nextcloud/apps/dav/css/
  inflating: nextcloud/apps/dav/css/schedule-response.css
   creating: nextcloud/apps/dav/appinfo/
  inflating: nextcloud/apps/dav/appinfo/info.xml
   creating: nextcloud/apps/dav/appinfo/v1/
  inflating: nextcloud/apps/dav/appinfo/v1/publicwebdav.php
  inflating: nextcloud/apps/dav/appinfo/v1/webdav.php
  inflating: nextcloud/apps/dav/appinfo/v1/carddav.php
  inflating: nextcloud/apps/dav/appinfo/v1/caldav.php
   creating: nextcloud/apps/dav/appinfo/v2/
  inflating: nextcloud/apps/dav/appinfo/v2/remote.php
  inflating: nextcloud/apps/dav/appinfo/v2/publicremote.php
  inflating: nextcloud/apps/dav/appinfo/v2/direct.php
  inflating: nextcloud/apps/dav/appinfo/routes.php
  inflating: nextcloud/apps/dav/appinfo/signature.json
  inflating: nextcloud/apps/dav/openapi.json.license
   creating: nextcloud/apps/activity/
   creating: nextcloud/apps/activity/js/
  inflating: nextcloud/apps/activity/js/preload-helper-B9rAsR6N.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/_commonjsHelpers-Cqwegr3R.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/index-BRcXaucB.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/settings-store-KUD8bQvY.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/_commonjsHelpers-Cqwegr3R.chunk.mjs
  inflating: nextcloud/apps/activity/js/settings-store-KUD8bQvY.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/_plugin-vue_export-helper-CmRM7S2g.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/translation-DoG5ZELJ-CuD-x3A-.chunk.mjs
  inflating: nextcloud/apps/activity/js/index-58N_OV_y.chunk.mjs
  inflating: nextcloud/apps/activity/js/index-BRcXaucB.chunk.mjs
  inflating: nextcloud/apps/activity/js/ActivityTab-B7qiKgFz.chunk.mjs
  inflating: nextcloud/apps/activity/js/activity-adminSettings.mjs
  inflating: nextcloud/apps/activity/js/activity-app.mjs.license
  inflating: nextcloud/apps/activity/js/index-BRcXaucB.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/activity-personalSettings.mjs.map
  inflating: nextcloud/apps/activity/js/_plugin-vue_export-helper-CmRM7S2g.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/activity-personalSettings.mjs.license
  inflating: nextcloud/apps/activity/js/activity-app.mjs.map
  inflating: nextcloud/apps/activity/js/ActivityTab-B7qiKgFz.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/index-58N_OV_y.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/activity-sidebar.mjs.map
  inflating: nextcloud/apps/activity/js/settings-store-KUD8bQvY.chunk.mjs
  inflating: nextcloud/apps/activity/js/index-58N_OV_y.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/api-BRK7NU6o.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/preload-helper-B9rAsR6N.chunk.mjs
  inflating: nextcloud/apps/activity/js/logger-DyuiKUEW.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/api-BRK7NU6o.chunk.mjs
  inflating: nextcloud/apps/activity/js/logger-DyuiKUEW.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/activity-personalSettings.mjs
  inflating: nextcloud/apps/activity/js/ActivityComponent.vue_vue_type_script_setup_true_lang-BXLU2lkV.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/activity-adminSettings.mjs.license
  inflating: nextcloud/apps/activity/js/activity-api.mjs.map
  inflating: nextcloud/apps/activity/js/translation-DoG5ZELJ-CuD-x3A-.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/activity-sidebar.mjs.license
  inflating: nextcloud/apps/activity/js/activity-sidebar.mjs
  inflating: nextcloud/apps/activity/js/activity-adminSettings.mjs.map
  inflating: nextcloud/apps/activity/js/translation-DoG5ZELJ-CuD-x3A-.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/activity-api.mjs.license
  inflating: nextcloud/apps/activity/js/ActivityComponent.vue_vue_type_script_setup_true_lang-BXLU2lkV.chunk.mjs
  inflating: nextcloud/apps/activity/js/_plugin-vue_export-helper-CmRM7S2g.chunk.mjs
  inflating: nextcloud/apps/activity/js/ActivityTab-B7qiKgFz.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/api-BRK7NU6o.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/activity-app.mjs
  inflating: nextcloud/apps/activity/js/preload-helper-B9rAsR6N.chunk.mjs.license
  inflating: nextcloud/apps/activity/js/logger-DyuiKUEW.chunk.mjs
  inflating: nextcloud/apps/activity/js/activity-api.mjs
  inflating: nextcloud/apps/activity/js/ActivityComponent.vue_vue_type_script_setup_true_lang-BXLU2lkV.chunk.mjs.map
  inflating: nextcloud/apps/activity/js/_commonjsHelpers-Cqwegr3R.chunk.mjs.map
  inflating: nextcloud/apps/activity/AUTHORS.md
   creating: nextcloud/apps/activity/l10n/
  inflating: nextcloud/apps/activity/l10n/es_NI.js
  inflating: nextcloud/apps/activity/l10n/es_GT.json
  inflating: nextcloud/apps/activity/l10n/sr.json
  inflating: nextcloud/apps/activity/l10n/sl.json
  inflating: nextcloud/apps/activity/l10n/nn_NO.json
  inflating: nextcloud/apps/activity/l10n/et_EE.js
  inflating: nextcloud/apps/activity/l10n/hr.js
  inflating: nextcloud/apps/activity/l10n/es_PE.json
  inflating: nextcloud/apps/activity/l10n/zh_TW.json
  inflating: nextcloud/apps/activity/l10n/es_419.json
  inflating: nextcloud/apps/activity/l10n/ug.json
  inflating: nextcloud/apps/activity/l10n/es_SV.json
  inflating: nextcloud/apps/activity/l10n/lo.js
  inflating: nextcloud/apps/activity/l10n/en_GB.json
  inflating: nextcloud/apps/activity/l10n/bg.js
  inflating: nextcloud/apps/activity/l10n/hi_IN.js
  inflating: nextcloud/apps/activity/l10n/es_PA.js
  inflating: nextcloud/apps/activity/l10n/es_CR.js
  inflating: nextcloud/apps/activity/l10n/sk.json
  inflating: nextcloud/apps/activity/l10n/si.json
  inflating: nextcloud/apps/activity/l10n/gl.json
  inflating: nextcloud/apps/activity/l10n/es_CR.json
  inflating: nextcloud/apps/activity/l10n/tr.json
  inflating: nextcloud/apps/activity/l10n/ug.js
  inflating: nextcloud/apps/activity/l10n/fa.json
  inflating: nextcloud/apps/activity/l10n/es_PY.js
  inflating: nextcloud/apps/activity/l10n/en_GB.js
  inflating: nextcloud/apps/activity/l10n/ps.json
  inflating: nextcloud/apps/activity/l10n/es_EC.js
  inflating: nextcloud/apps/activity/l10n/tr.js
  inflating: nextcloud/apps/activity/l10n/es_PY.json
  inflating: nextcloud/apps/activity/l10n/vi.js
  inflating: nextcloud/apps/activity/l10n/bs.json
  inflating: nextcloud/apps/activity/l10n/mr.json
  inflating: nextcloud/apps/activity/l10n/de.json
  inflating: nextcloud/apps/activity/l10n/ka_GE.json
  inflating: nextcloud/apps/activity/l10n/sr@latin.json
  inflating: nextcloud/apps/activity/l10n/mn.js
  inflating: nextcloud/apps/activity/l10n/ka.json
  inflating: nextcloud/apps/activity/l10n/oc.json
  inflating: nextcloud/apps/activity/l10n/ms_MY.json
  inflating: nextcloud/apps/activity/l10n/bn_BD.json
  inflating: nextcloud/apps/activity/l10n/es_MX.js
  inflating: nextcloud/apps/activity/l10n/km.json
  inflating: nextcloud/apps/activity/l10n/lv.js
  inflating: nextcloud/apps/activity/l10n/sr.js
  inflating: nextcloud/apps/activity/l10n/lt_LT.js
  inflating: nextcloud/apps/activity/l10n/nb.js
  inflating: nextcloud/apps/activity/l10n/my.json
  inflating: nextcloud/apps/activity/l10n/cy_GB.js
  inflating: nextcloud/apps/activity/l10n/es_PR.js
  inflating: nextcloud/apps/activity/l10n/be.json
  inflating: nextcloud/apps/activity/l10n/hsb.js
  inflating: nextcloud/apps/activity/l10n/uk.js
  inflating: nextcloud/apps/activity/l10n/mn.json
  inflating: nextcloud/apps/activity/l10n/zh_HK.js
  inflating: nextcloud/apps/activity/l10n/nn_NO.js
  inflating: nextcloud/apps/activity/l10n/ca.js
  inflating: nextcloud/apps/activity/l10n/mr.js
  inflating: nextcloud/apps/activity/l10n/fa.js
  inflating: nextcloud/apps/activity/l10n/es_GT.js
  inflating: nextcloud/apps/activity/l10n/es.json
  inflating: nextcloud/apps/activity/l10n/sv.json
  inflating: nextcloud/apps/activity/l10n/ru.json
  inflating: nextcloud/apps/activity/l10n/da.json
  inflating: nextcloud/apps/activity/l10n/he.json
  inflating: nextcloud/apps/activity/l10n/sl.js
  inflating: nextcloud/apps/activity/l10n/kab.js
  inflating: nextcloud/apps/activity/l10n/es_DO.json
  inflating: nextcloud/apps/activity/l10n/ro.js
  inflating: nextcloud/apps/activity/l10n/ka.js
  inflating: nextcloud/apps/activity/l10n/zh_HK.json
  inflating: nextcloud/apps/activity/l10n/es_PA.json
  inflating: nextcloud/apps/activity/l10n/es_CO.json
  inflating: nextcloud/apps/activity/l10n/de_DE.js
  inflating: nextcloud/apps/activity/l10n/it.json
  inflating: nextcloud/apps/activity/l10n/mk.js
  inflating: nextcloud/apps/activity/l10n/br.json
  inflating: nextcloud/apps/activity/l10n/zh_CN.json
  inflating: nextcloud/apps/activity/l10n/my.js
  inflating: nextcloud/apps/activity/l10n/sc.js
  inflating: nextcloud/apps/activity/l10n/gl.js
  inflating: nextcloud/apps/activity/l10n/uz.json
  inflating: nextcloud/apps/activity/l10n/sr@latin.js
  inflating: nextcloud/apps/activity/l10n/es_UY.js
  inflating: nextcloud/apps/activity/l10n/ar.json
  inflating: nextcloud/apps/activity/l10n/cs.js
  inflating: nextcloud/apps/activity/l10n/ta.js
  inflating: nextcloud/apps/activity/l10n/es_HN.js
  inflating: nextcloud/apps/activity/l10n/af.js
  inflating: nextcloud/apps/activity/l10n/cy_GB.json
  inflating: nextcloud/apps/activity/l10n/hsb.json
  inflating: nextcloud/apps/activity/l10n/lt_LT.json
  inflating: nextcloud/apps/activity/l10n/da.js
  inflating: nextcloud/apps/activity/l10n/es_PE.js
  inflating: nextcloud/apps/activity/l10n/mk.json
  inflating: nextcloud/apps/activity/l10n/sc.json
  inflating: nextcloud/apps/activity/l10n/es_HN.json
  inflating: nextcloud/apps/activity/l10n/hu.json
  inflating: nextcloud/apps/activity/l10n/ko.json
  inflating: nextcloud/apps/activity/l10n/sw.js
  inflating: nextcloud/apps/activity/l10n/nl.json
  inflating: nextcloud/apps/activity/l10n/lv.json
  inflating: nextcloud/apps/activity/l10n/cs.json
  inflating: nextcloud/apps/activity/l10n/hu.js
  inflating: nextcloud/apps/activity/l10n/es_CO.js
  inflating: nextcloud/apps/activity/l10n/ja.js
  inflating: nextcloud/apps/activity/l10n/az.js
  inflating: nextcloud/apps/activity/l10n/hy.json
  inflating: nextcloud/apps/activity/l10n/af.json
  inflating: nextcloud/apps/activity/l10n/es_NI.json
  inflating: nextcloud/apps/activity/l10n/eo.json
  inflating: nextcloud/apps/activity/l10n/es_UY.json
  inflating: nextcloud/apps/activity/l10n/bs.js
  inflating: nextcloud/apps/activity/l10n/is.json
  inflating: nextcloud/apps/activity/l10n/az.json
  inflating: nextcloud/apps/activity/l10n/an.js
  inflating: nextcloud/apps/activity/l10n/fo.json
  inflating: nextcloud/apps/activity/l10n/ta.json
 extracting: nextcloud/apps/activity/l10n/no-php
  inflating: nextcloud/apps/activity/l10n/hr.json
  inflating: nextcloud/apps/activity/l10n/es_419.js
  inflating: nextcloud/apps/activity/l10n/th.json
  inflating: nextcloud/apps/activity/l10n/ast.js
  inflating: nextcloud/apps/activity/l10n/sk.js
  inflating: nextcloud/apps/activity/l10n/lo.json
  inflating: nextcloud/apps/activity/l10n/zh_CN.js
  inflating: nextcloud/apps/activity/l10n/et_EE.json
  inflating: nextcloud/apps/activity/l10n/ka_GE.js
  inflating: nextcloud/apps/activity/l10n/bn_BD.js
  inflating: nextcloud/apps/activity/l10n/fo.js
  inflating: nextcloud/apps/activity/l10n/gd.json
  inflating: nextcloud/apps/activity/l10n/km.js
  inflating: nextcloud/apps/activity/l10n/si.js
  inflating: nextcloud/apps/activity/l10n/ms_MY.js
  inflating: nextcloud/apps/activity/l10n/kn.js
  inflating: nextcloud/apps/activity/l10n/lb.json
  inflating: nextcloud/apps/activity/l10n/pt_PT.js
  inflating: nextcloud/apps/activity/l10n/de_DE.json
  inflating: nextcloud/apps/activity/l10n/oc.js
  inflating: nextcloud/apps/activity/l10n/sq.js
  inflating: nextcloud/apps/activity/l10n/ia.js
  inflating: nextcloud/apps/activity/l10n/th.js
  inflating: nextcloud/apps/activity/l10n/pt_BR.js
  inflating: nextcloud/apps/activity/l10n/he.js
  inflating: nextcloud/apps/activity/l10n/eu.json
  inflating: nextcloud/apps/activity/l10n/tk.json
  inflating: nextcloud/apps/activity/l10n/ga.json
  inflating: nextcloud/apps/activity/l10n/ne.json
  inflating: nextcloud/apps/activity/l10n/hy.js
  inflating: nextcloud/apps/activity/l10n/es_AR.json
  inflating: nextcloud/apps/activity/l10n/sq.json
  inflating: nextcloud/apps/activity/l10n/es_CL.json
  inflating: nextcloud/apps/activity/l10n/fr.js
  inflating: nextcloud/apps/activity/l10n/fi.json
  inflating: nextcloud/apps/activity/l10n/es_PR.json
  inflating: nextcloud/apps/activity/l10n/ko.js
  inflating: nextcloud/apps/activity/l10n/bg.json
  inflating: nextcloud/apps/activity/l10n/eo.js
  inflating: nextcloud/apps/activity/l10n/pl.js
  inflating: nextcloud/apps/activity/l10n/vi.json
  inflating: nextcloud/apps/activity/l10n/id.json
  inflating: nextcloud/apps/activity/l10n/nb.json
  inflating: nextcloud/apps/activity/l10n/ia.json
  inflating: nextcloud/apps/activity/l10n/es_DO.js
  inflating: nextcloud/apps/activity/l10n/ar.js
  inflating: nextcloud/apps/activity/l10n/pl.json
  inflating: nextcloud/apps/activity/l10n/el.json
  inflating: nextcloud/apps/activity/l10n/br.js
  inflating: nextcloud/apps/activity/l10n/zh_TW.js
  inflating: nextcloud/apps/activity/l10n/be.js
  inflating: nextcloud/apps/activity/l10n/nl.js
  inflating: nextcloud/apps/activity/l10n/es_CL.js
  inflating: nextcloud/apps/activity/l10n/es_MX.json
  inflating: nextcloud/apps/activity/l10n/el.js
  inflating: nextcloud/apps/activity/l10n/kn.json
  inflating: nextcloud/apps/activity/l10n/id.js
  inflating: nextcloud/apps/activity/l10n/hi_IN.json
  inflating: nextcloud/apps/activity/l10n/pt_PT.json
  inflating: nextcloud/apps/activity/l10n/fr.json
  inflating: nextcloud/apps/activity/l10n/sw.json
  inflating: nextcloud/apps/activity/l10n/es_EC.json
  inflating: nextcloud/apps/activity/l10n/gd.js
  inflating: nextcloud/apps/activity/l10n/lb.js
  inflating: nextcloud/apps/activity/l10n/ga.js
  inflating: nextcloud/apps/activity/l10n/it.js
  inflating: nextcloud/apps/activity/l10n/ast.json
  inflating: nextcloud/apps/activity/l10n/pt_BR.json
  inflating: nextcloud/apps/activity/l10n/ps.js
  inflating: nextcloud/apps/activity/l10n/es.js
  inflating: nextcloud/apps/activity/l10n/de.js
  inflating: nextcloud/apps/activity/l10n/ca.json
  inflating: nextcloud/apps/activity/l10n/uz.js
  inflating: nextcloud/apps/activity/l10n/ja.json
  inflating: nextcloud/apps/activity/l10n/eu.js
  inflating: nextcloud/apps/activity/l10n/is.js
  inflating: nextcloud/apps/activity/l10n/fi.js
  inflating: nextcloud/apps/activity/l10n/ru.js
  inflating: nextcloud/apps/activity/l10n/sv.js
  inflating: nextcloud/apps/activity/l10n/ne.js
  inflating: nextcloud/apps/activity/l10n/an.json
  inflating: nextcloud/apps/activity/l10n/es_AR.js
  inflating: nextcloud/apps/activity/l10n/ro.json
  inflating: nextcloud/apps/activity/l10n/kab.json
  inflating: nextcloud/apps/activity/l10n/es_SV.js
  inflating: nextcloud/apps/activity/l10n/uk.json
  inflating: nextcloud/apps/activity/l10n/tk.js
  inflating: nextcloud/apps/activity/composer.lock
   creating: nextcloud/apps/activity/img/
  inflating: nextcloud/apps/activity/img/delete-color.svg
  inflating: nextcloud/apps/activity/img/activity-dark.svg
  inflating: nextcloud/apps/activity/img/add-color.svg
  inflating: nextcloud/apps/activity/img/notifications-dark.svg
  inflating: nextcloud/apps/activity/img/activity.svg
  inflating: nextcloud/apps/activity/img/change.svg
  inflating: nextcloud/apps/activity/package-lock.json
  inflating: nextcloud/apps/activity/REUSE.toml
   creating: nextcloud/apps/activity/lib/
  inflating: nextcloud/apps/activity/lib/Consumer.php
  inflating: nextcloud/apps/activity/lib/MailQueueHandler.php
   creating: nextcloud/apps/activity/lib/Listener/
  inflating: nextcloud/apps/activity/lib/Listener/UserDeleted.php
  inflating: nextcloud/apps/activity/lib/Listener/LoadSidebarScripts.php
  inflating: nextcloud/apps/activity/lib/Listener/ShareEventListener.php
  inflating: nextcloud/apps/activity/lib/Listener/SetUserDefaults.php
  inflating: nextcloud/apps/activity/lib/NotificationGenerator.php
   creating: nextcloud/apps/activity/lib/Exception/
  inflating: nextcloud/apps/activity/lib/Exception/InvalidFilterException.php
  inflating: nextcloud/apps/activity/lib/Capabilities.php
  inflating: nextcloud/apps/activity/lib/CurrentUser.php
   creating: nextcloud/apps/activity/lib/Dashboard/
  inflating: nextcloud/apps/activity/lib/Dashboard/ActivityWidget.php
   creating: nextcloud/apps/activity/lib/BackgroundJob/
  inflating: nextcloud/apps/activity/lib/BackgroundJob/RemoveFormerActivitySettings.php
  inflating: nextcloud/apps/activity/lib/BackgroundJob/DigestMail.php
  inflating: nextcloud/apps/activity/lib/BackgroundJob/RemoteActivity.php
  inflating: nextcloud/apps/activity/lib/BackgroundJob/ExpireActivities.php
  inflating: nextcloud/apps/activity/lib/BackgroundJob/EmailNotification.php
  inflating: nextcloud/apps/activity/lib/Data.php
   creating: nextcloud/apps/activity/lib/Command/
  inflating: nextcloud/apps/activity/lib/Command/SendEmails.php
  inflating: nextcloud/apps/activity/lib/UserSettings.php
  inflating: nextcloud/apps/activity/lib/FilesHooksStatic.php
  inflating: nextcloud/apps/activity/lib/GroupHelperDisabled.php
   creating: nextcloud/apps/activity/lib/Extension/
  inflating: nextcloud/apps/activity/lib/Extension/Files.php
  inflating: nextcloud/apps/activity/lib/Extension/Files_Sharing.php
  inflating: nextcloud/apps/activity/lib/FilesHooks.php
   creating: nextcloud/apps/activity/lib/Migration/
  inflating: nextcloud/apps/activity/lib/Migration/Version2011Date20201006132544.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2011Date20201006132546.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2006Date20170919095939.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2006Date20170808155040.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2007Date20181107114613.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2011Date20201207091915.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2006Date20170808154933.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2008Date20181011095117.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2011Date20201006132547.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2010Date20190416112817.php
  inflating: nextcloud/apps/activity/lib/Migration/Version2011Date20201006132545.php
   creating: nextcloud/apps/activity/lib/AppInfo/
  inflating: nextcloud/apps/activity/lib/AppInfo/Application.php
   creating: nextcloud/apps/activity/lib/Settings/
  inflating: nextcloud/apps/activity/lib/Settings/PersonalSection.php
  inflating: nextcloud/apps/activity/lib/Settings/Personal.php
  inflating: nextcloud/apps/activity/lib/Settings/Admin.php
  inflating: nextcloud/apps/activity/lib/Settings/AdminSection.php
  inflating: nextcloud/apps/activity/lib/DigestSender.php
   creating: nextcloud/apps/activity/lib/Filter/
  inflating: nextcloud/apps/activity/lib/Filter/SelfFilter.php
  inflating: nextcloud/apps/activity/lib/Filter/ByFilter.php
  inflating: nextcloud/apps/activity/lib/Filter/AllFilter.php
   creating: nextcloud/apps/activity/lib/Event/
  inflating: nextcloud/apps/activity/lib/Event/LoadAdditionalScriptsEvent.php
   creating: nextcloud/apps/activity/lib/Controller/
  inflating: nextcloud/apps/activity/lib/Controller/APIv2Controller.php
  inflating: nextcloud/apps/activity/lib/Controller/APIv1Controller.php
  inflating: nextcloud/apps/activity/lib/Controller/RemoteActivityController.php
  inflating: nextcloud/apps/activity/lib/Controller/SettingsController.php
  inflating: nextcloud/apps/activity/lib/Controller/ActivitiesController.php
  inflating: nextcloud/apps/activity/lib/Controller/FeedController.php
  inflating: nextcloud/apps/activity/lib/ViewInfoCache.php
  inflating: nextcloud/apps/activity/lib/GroupHelper.php
   creating: nextcloud/apps/activity/docs/
  inflating: nextcloud/apps/activity/docs/endpoint-v2.md
  inflating: nextcloud/apps/activity/docs/setting.md
  inflating: nextcloud/apps/activity/docs/create.md
  inflating: nextcloud/apps/activity/docs/filter.md
  inflating: nextcloud/apps/activity/docs/provider.md
   creating: nextcloud/apps/activity/templates/
  inflating: nextcloud/apps/activity/templates/stream.body.php
   creating: nextcloud/apps/activity/templates/settings/
  inflating: nextcloud/apps/activity/templates/settings/admin.php
  inflating: nextcloud/apps/activity/templates/settings/personal.php
  inflating: nextcloud/apps/activity/templates/app-main.php
  inflating: nextcloud/apps/activity/templates/rss.php
  inflating: nextcloud/apps/activity/templates/stream.app.navigation.php
   creating: nextcloud/apps/activity/css/
  inflating: nextcloud/apps/activity/css/style.css
  inflating: nextcloud/apps/activity/composer.json
  inflating: nextcloud/apps/activity/package.json
  inflating: nextcloud/apps/activity/eslint.config.js
   creating: nextcloud/apps/activity/vendor-bin/
   creating: nextcloud/apps/activity/vendor-bin/cs-fixer/
  inflating: nextcloud/apps/activity/vendor-bin/cs-fixer/composer.lock
  inflating: nextcloud/apps/activity/vendor-bin/cs-fixer/composer.json
   creating: nextcloud/apps/activity/vendor-bin/phpunit/
  inflating: nextcloud/apps/activity/vendor-bin/phpunit/composer.lock
  inflating: nextcloud/apps/activity/vendor-bin/phpunit/composer.json
   creating: nextcloud/apps/activity/vendor-bin/psalm/
  inflating: nextcloud/apps/activity/vendor-bin/psalm/composer.lock
  inflating: nextcloud/apps/activity/vendor-bin/psalm/composer.json
   creating: nextcloud/apps/activity/LICENSES/
  inflating: nextcloud/apps/activity/LICENSES/MIT.txt
  inflating: nextcloud/apps/activity/LICENSES/CC0-1.0.txt
  inflating: nextcloud/apps/activity/LICENSES/AGPL-3.0-only.txt
  inflating: nextcloud/apps/activity/LICENSES/GPL-3.0-or-later.txt
  inflating: nextcloud/apps/activity/LICENSES/AGPL-3.0-or-later.txt
  inflating: nextcloud/apps/activity/LICENSES/MPL-2.0.txt
  inflating: nextcloud/apps/activity/LICENSES/BSD-3-Clause.txt
  inflating: nextcloud/apps/activity/LICENSES/ISC.txt
  inflating: nextcloud/apps/activity/LICENSES/Apache-2.0.txt
   creating: nextcloud/apps/activity/appinfo/
  inflating: nextcloud/apps/activity/appinfo/info.xml
  inflating: nextcloud/apps/activity/appinfo/routes.php
  inflating: nextcloud/apps/activity/appinfo/signature.json
   creating: nextcloud/apps/updatenotification/
   creating: nextcloud/apps/updatenotification/composer/
   creating: nextcloud/apps/updatenotification/composer/composer/
  inflating: nextcloud/apps/updatenotification/composer/composer/autoload_namespaces.php
  inflating: nextcloud/apps/updatenotification/composer/composer/ClassLoader.php
  inflating: nextcloud/apps/updatenotification/composer/composer/autoload_real.php
  inflating: nextcloud/apps/updatenotification/composer/composer/autoload_classmap.php
  inflating: nextcloud/apps/updatenotification/composer/composer/installed.php
  inflating: nextcloud/apps/updatenotification/composer/composer/InstalledVersions.php
  inflating: nextcloud/apps/updatenotification/composer/composer/autoload_static.php
  inflating: nextcloud/apps/updatenotification/composer/composer/LICENSE
  inflating: nextcloud/apps/updatenotification/composer/composer/installed.json
  inflating: nextcloud/apps/updatenotification/composer/composer/autoload_psr4.php
  inflating: nextcloud/apps/updatenotification/composer/composer.lock
  inflating: nextcloud/apps/updatenotification/composer/autoload.php
  inflating: nextcloud/apps/updatenotification/composer/composer.json
   creating: nextcloud/apps/updatenotification/l10n/
  inflating: nextcloud/apps/updatenotification/l10n/sr.json
  inflating: nextcloud/apps/updatenotification/l10n/sl.json
  inflating: nextcloud/apps/updatenotification/l10n/et_EE.js
  inflating: nextcloud/apps/updatenotification/l10n/hr.js
  inflating: nextcloud/apps/updatenotification/l10n/zh_TW.json
  inflating: nextcloud/apps/updatenotification/l10n/ug.json
  inflating: nextcloud/apps/updatenotification/l10n/lo.js
  inflating: nextcloud/apps/updatenotification/l10n/en_GB.json
  inflating: nextcloud/apps/updatenotification/l10n/bg.js
  inflating: nextcloud/apps/updatenotification/l10n/sk.json
  inflating: nextcloud/apps/updatenotification/l10n/gl.json
  inflating: nextcloud/apps/updatenotification/l10n/tr.json
  inflating: nextcloud/apps/updatenotification/l10n/ug.js
  inflating: nextcloud/apps/updatenotification/l10n/fa.json
  inflating: nextcloud/apps/updatenotification/l10n/en_GB.js
  inflating: nextcloud/apps/updatenotification/l10n/es_EC.js
  inflating: nextcloud/apps/updatenotification/l10n/tr.js
  inflating: nextcloud/apps/updatenotification/l10n/de.json
  inflating: nextcloud/apps/updatenotification/l10n/ka.json
  inflating: nextcloud/apps/updatenotification/l10n/es_MX.js
  inflating: nextcloud/apps/updatenotification/l10n/sr.js
  inflating: nextcloud/apps/updatenotification/l10n/lt_LT.js
  inflating: nextcloud/apps/updatenotification/l10n/nb.js
  inflating: nextcloud/apps/updatenotification/l10n/uk.js
  inflating: nextcloud/apps/updatenotification/l10n/zh_HK.js
  inflating: nextcloud/apps/updatenotification/l10n/ca.js
  inflating: nextcloud/apps/updatenotification/l10n/fa.js
  inflating: nextcloud/apps/updatenotification/l10n/es.json
  inflating: nextcloud/apps/updatenotification/l10n/sv.json
  inflating: nextcloud/apps/updatenotification/l10n/ru.json
  inflating: nextcloud/apps/updatenotification/l10n/da.json
  inflating: nextcloud/apps/updatenotification/l10n/sl.js
  inflating: nextcloud/apps/updatenotification/l10n/ka.js
  inflating: nextcloud/apps/updatenotification/l10n/zh_HK.json
  inflating: nextcloud/apps/updatenotification/l10n/de_DE.js
  inflating: nextcloud/apps/updatenotification/l10n/it.json
  inflating: nextcloud/apps/updatenotification/l10n/mk.js
  inflating: nextcloud/apps/updatenotification/l10n/zh_CN.json
  inflating: nextcloud/apps/updatenotification/l10n/sc.js
  inflating: nextcloud/apps/updatenotification/l10n/gl.js
  inflating: nextcloud/apps/updatenotification/l10n/ar.json
  inflating: nextcloud/apps/updatenotification/l10n/cs.js
  inflating: nextcloud/apps/updatenotification/l10n/lt_LT.json
  inflating: nextcloud/apps/updatenotification/l10n/da.js
  inflating: nextcloud/apps/updatenotification/l10n/mk.json
  inflating: nextcloud/apps/updatenotification/l10n/sc.json
  inflating: nextcloud/apps/updatenotification/l10n/hu.json
  inflating: nextcloud/apps/updatenotification/l10n/ko.json
  inflating: nextcloud/apps/updatenotification/l10n/sw.js
  inflating: nextcloud/apps/updatenotification/l10n/nl.json
  inflating: nextcloud/apps/updatenotification/l10n/cs.json
  inflating: nextcloud/apps/updatenotification/l10n/hu.js
  inflating: nextcloud/apps/updatenotification/l10n/ja.js
  inflating: nextcloud/apps/updatenotification/l10n/is.json
  inflating: nextcloud/apps/updatenotification/l10n/hr.json
  inflating: nextcloud/apps/updatenotification/l10n/ast.js
  inflating: nextcloud/apps/updatenotification/l10n/sk.js
  inflating: nextcloud/apps/updatenotification/l10n/lo.json
  inflating: nextcloud/apps/updatenotification/l10n/zh_CN.js
  inflating: nextcloud/apps/updatenotification/l10n/et_EE.json
  inflating: nextcloud/apps/updatenotification/l10n/de_DE.json
  inflating: nextcloud/apps/updatenotification/l10n/pt_BR.js
  inflating: nextcloud/apps/updatenotification/l10n/eu.json
  inflating: nextcloud/apps/updatenotification/l10n/ga.json
  inflating: nextcloud/apps/updatenotification/l10n/es_AR.json
  inflating: nextcloud/apps/updatenotification/l10n/fr.js
  inflating: nextcloud/apps/updatenotification/l10n/fi.json
  inflating: nextcloud/apps/updatenotification/l10n/ko.js
  inflating: nextcloud/apps/updatenotification/l10n/bg.json
  inflating: nextcloud/apps/updatenotification/l10n/pl.js
  inflating: nextcloud/apps/updatenotification/l10n/nb.json
  inflating: nextcloud/apps/updatenotification/l10n/ar.js
  inflating: nextcloud/apps/updatenotification/l10n/pl.json
  inflating: nextcloud/apps/updatenotification/l10n/el.json
  inflating: nextcloud/apps/updatenotification/l10n/zh_TW.js
  inflating: nextcloud/apps/updatenotification/l10n/nl.js
  inflating: nextcloud/apps/updatenotification/l10n/es_MX.json
  inflating: nextcloud/apps/updatenotification/l10n/el.js
  inflating: nextcloud/apps/updatenotification/l10n/fr.json
  inflating: nextcloud/apps/updatenotification/l10n/sw.json
  inflating: nextcloud/apps/updatenotification/l10n/es_EC.json
  inflating: nextcloud/apps/updatenotification/l10n/ga.js
  inflating: nextcloud/apps/updatenotification/l10n/it.js
  inflating: nextcloud/apps/updatenotification/l10n/ast.json
  inflating: nextcloud/apps/updatenotification/l10n/pt_BR.json
  inflating: nextcloud/apps/updatenotification/l10n/es.js
  inflating: nextcloud/apps/updatenotification/l10n/de.js
  inflating: nextcloud/apps/updatenotification/l10n/ca.json
  inflating: nextcloud/apps/updatenotification/l10n/ja.json
  inflating: nextcloud/apps/updatenotification/l10n/eu.js
  inflating: nextcloud/apps/updatenotification/l10n/is.js
  inflating: nextcloud/apps/updatenotification/l10n/fi.js
  inflating: nextcloud/apps/updatenotification/l10n/ru.js
  inflating: nextcloud/apps/updatenotification/l10n/sv.js
  inflating: nextcloud/apps/updatenotification/l10n/es_AR.js
  inflating: nextcloud/apps/updatenotification/l10n/uk.json
   creating: nextcloud/apps/updatenotification/img/
  inflating: nextcloud/apps/updatenotification/img/app.svg
  inflating: nextcloud/apps/updatenotification/img/notification.svg
   creating: nextcloud/apps/updatenotification/lib/
   creating: nextcloud/apps/updatenotification/lib/Listener/
  inflating: nextcloud/apps/updatenotification/lib/Listener/AppUpdateEventListener.php
  inflating: nextcloud/apps/updatenotification/lib/Listener/BeforeTemplateRenderedEventListener.php
  inflating: nextcloud/apps/updatenotification/lib/UpdateChecker.php
   creating: nextcloud/apps/updatenotification/lib/BackgroundJob/
  inflating: nextcloud/apps/updatenotification/lib/BackgroundJob/UpdateAvailableNotifications.php
  inflating: nextcloud/apps/updatenotification/lib/BackgroundJob/ResetToken.php
  inflating: nextcloud/apps/updatenotification/lib/BackgroundJob/AppUpdatedNotifications.php
   creating: nextcloud/apps/updatenotification/lib/Command/
  inflating: nextcloud/apps/updatenotification/lib/Command/Check.php
  inflating: nextcloud/apps/updatenotification/lib/Manager.php
  inflating: nextcloud/apps/updatenotification/lib/ResponseDefinitions.php
   creating: nextcloud/apps/updatenotification/lib/AppInfo/
  inflating: nextcloud/apps/updatenotification/lib/AppInfo/Application.php
   creating: nextcloud/apps/updatenotification/lib/Settings/
  inflating: nextcloud/apps/updatenotification/lib/Settings/Admin.php
   creating: nextcloud/apps/updatenotification/lib/Controller/
  inflating: nextcloud/apps/updatenotification/lib/Controller/AdminController.php
  inflating: nextcloud/apps/updatenotification/lib/Controller/APIController.php
  inflating: nextcloud/apps/updatenotification/lib/Controller/ChangelogController.php
   creating: nextcloud/apps/updatenotification/lib/Notification/
  inflating: nextcloud/apps/updatenotification/lib/Notification/Notifier.php
  inflating: nextcloud/apps/updatenotification/lib/Notification/AppUpdateNotifier.php
  inflating: nextcloud/apps/updatenotification/openapi.json
   creating: nextcloud/apps/updatenotification/templates/
  inflating: nextcloud/apps/updatenotification/templates/admin.php
  inflating: nextcloud/apps/updatenotification/templates/empty.php
   creating: nextcloud/apps/updatenotification/appinfo/
  inflating: nextcloud/apps/updatenotification/appinfo/info.xml
  inflating: nextcloud/apps/updatenotification/appinfo/routes.php
  inflating: nextcloud/apps/updatenotification/appinfo/signature.json
  inflating: nextcloud/apps/updatenotification/openapi.json.license
   creating: nextcloud/apps/files_reminders/
   creating: nextcloud/apps/files_reminders/composer/
   creating: nextcloud/apps/files_reminders/composer/composer/
  inflating: nextcloud/apps/files_reminders/composer/composer/autoload_namespaces.php
  inflating: nextcloud/apps/files_reminders/composer/composer/ClassLoader.php
  inflating: nextcloud/apps/files_reminders/composer/composer/autoload_real.php
  inflating: nextcloud/apps/files_reminders/composer/composer/autoload_classmap.php
  inflating: nextcloud/apps/files_reminders/composer/composer/installed.php
  inflating: nextcloud/apps/files_reminders/composer/composer/InstalledVersions.php
  inflating: nextcloud/apps/files_reminders/composer/composer/autoload_static.php
  inflating: nextcloud/apps/files_reminders/composer/composer/LICENSE
  inflating: nextcloud/apps/files_reminders/composer/composer/installed.json
  inflating: nextcloud/apps/files_reminders/composer/composer/autoload_psr4.php
  inflating: nextcloud/apps/files_reminders/composer/composer.lock
  inflating: nextcloud/apps/files_reminders/composer/autoload.php
  inflating: nextcloud/apps/files_reminders/composer/composer.json
   creating: nextcloud/apps/files_reminders/l10n/
  inflating: nextcloud/apps/files_reminders/l10n/sr.json
  inflating: nextcloud/apps/files_reminders/l10n/et_EE.js
  inflating: nextcloud/apps/files_reminders/l10n/zh_TW.json
  inflating: nextcloud/apps/files_reminders/l10n/ug.json
  inflating: nextcloud/apps/files_reminders/l10n/lo.js
  inflating: nextcloud/apps/files_reminders/l10n/en_GB.json
  inflating: nextcloud/apps/files_reminders/l10n/sk.json
  inflating: nextcloud/apps/files_reminders/l10n/gl.json
  inflating: nextcloud/apps/files_reminders/l10n/tr.json
  inflating: nextcloud/apps/files_reminders/l10n/ug.js
  inflating: nextcloud/apps/files_reminders/l10n/en_GB.js
  inflating: nextcloud/apps/files_reminders/l10n/tr.js
  inflating: nextcloud/apps/files_reminders/l10n/de.json
  inflating: nextcloud/apps/files_reminders/l10n/sr.js
  inflating: nextcloud/apps/files_reminders/l10n/lt_LT.js
  inflating: nextcloud/apps/files_reminders/l10n/nb.js
  inflating: nextcloud/apps/files_reminders/l10n/uk.js
  inflating: nextcloud/apps/files_reminders/l10n/zh_HK.js
  inflating: nextcloud/apps/files_reminders/l10n/es.json
  inflating: nextcloud/apps/files_reminders/l10n/sv.json
  inflating: nextcloud/apps/files_reminders/l10n/ru.json
  inflating: nextcloud/apps/files_reminders/l10n/da.json
  inflating: nextcloud/apps/files_reminders/l10n/ro.js
  inflating: nextcloud/apps/files_reminders/l10n/zh_HK.json
  inflating: nextcloud/apps/files_reminders/l10n/de_DE.js
  inflating: nextcloud/apps/files_reminders/l10n/it.json
  inflating: nextcloud/apps/files_reminders/l10n/mk.js
  inflating: nextcloud/apps/files_reminders/l10n/zh_CN.json
  inflating: nextcloud/apps/files_reminders/l10n/gl.js
  inflating: nextcloud/apps/files_reminders/l10n/ar.json
  inflating: nextcloud/apps/files_reminders/l10n/cs.js
  inflating: nextcloud/apps/files_reminders/l10n/lt_LT.json
  inflating: nextcloud/apps/files_reminders/l10n/da.js
  inflating: nextcloud/apps/files_reminders/l10n/mk.json
  inflating: nextcloud/apps/files_reminders/l10n/hu.json
  inflating: nextcloud/apps/files_reminders/l10n/ko.json
  inflating: nextcloud/apps/files_reminders/l10n/sw.js
  inflating: nextcloud/apps/files_reminders/l10n/cs.json
  inflating: nextcloud/apps/files_reminders/l10n/hu.js
  inflating: nextcloud/apps/files_reminders/l10n/ja.js
  inflating: nextcloud/apps/files_reminders/l10n/sk.js
  inflating: nextcloud/apps/files_reminders/l10n/lo.json
  inflating: nextcloud/apps/files_reminders/l10n/zh_CN.js
  inflating: nextcloud/apps/files_reminders/l10n/et_EE.json
  inflating: nextcloud/apps/files_reminders/l10n/de_DE.json
  inflating: nextcloud/apps/files_reminders/l10n/pt_BR.js
  inflating: nextcloud/apps/files_reminders/l10n/ga.json
  inflating: nextcloud/apps/files_reminders/l10n/fr.js
  inflating: nextcloud/apps/files_reminders/l10n/fi.json
  inflating: nextcloud/apps/files_reminders/l10n/ko.js
  inflating: nextcloud/apps/files_reminders/l10n/pl.js
  inflating: nextcloud/apps/files_reminders/l10n/nb.json
  inflating: nextcloud/apps/files_reminders/l10n/ar.js
  inflating: nextcloud/apps/files_reminders/l10n/pl.json
  inflating: nextcloud/apps/files_reminders/l10n/el.json
  inflating: nextcloud/apps/files_reminders/l10n/zh_TW.js
  inflating: nextcloud/apps/files_reminders/l10n/el.js
  inflating: nextcloud/apps/files_reminders/l10n/fr.json
  inflating: nextcloud/apps/files_reminders/l10n/sw.json
  inflating: nextcloud/apps/files_reminders/l10n/ga.js
  inflating: nextcloud/apps/files_reminders/l10n/it.js
  inflating: nextcloud/apps/files_reminders/l10n/pt_BR.json
  inflating: nextcloud/apps/files_reminders/l10n/es.js
  inflating: nextcloud/apps/files_reminders/l10n/de.js
  inflating: nextcloud/apps/files_reminders/l10n/ja.json
  inflating: nextcloud/apps/files_reminders/l10n/fi.js
  inflating: nextcloud/apps/files_reminders/l10n/ru.js
  inflating: nextcloud/apps/files_reminders/l10n/sv.js
  inflating: nextcloud/apps/files_reminders/l10n/ro.json
  inflating: nextcloud/apps/files_reminders/l10n/uk.json
   creating: nextcloud/apps/files_reminders/img/
  inflating: nextcloud/apps/files_reminders/img/app.svg
  inflating: nextcloud/apps/files_reminders/img/app-dark.svg
   creating: nextcloud/apps/files_reminders/lib/
   creating: nextcloud/apps/files_reminders/lib/Db/
  inflating: nextcloud/apps/files_reminders/lib/Db/ReminderMapper.php
  inflating: nextcloud/apps/files_reminders/lib/Db/Reminder.php
   creating: nextcloud/apps/files_reminders/lib/Listener/
  inflating: nextcloud/apps/files_reminders/lib/Listener/NodeDeletedListener.php
  inflating: nextcloud/apps/files_reminders/lib/Listener/LoadAdditionalScriptsListener.php
  inflating: nextcloud/apps/files_reminders/lib/Listener/UserDeletedListener.php
  inflating: nextcloud/apps/files_reminders/lib/Listener/SabrePluginAddListener.php
   creating: nextcloud/apps/files_reminders/lib/Exception/
  inflating: nextcloud/apps/files_reminders/lib/Exception/UserNotFoundException.php
  inflating: nextcloud/apps/files_reminders/lib/Exception/ReminderNotFoundException.php
  inflating: nextcloud/apps/files_reminders/lib/Exception/NodeNotFoundException.php
   creating: nextcloud/apps/files_reminders/lib/Dav/
  inflating: nextcloud/apps/files_reminders/lib/Dav/PropFindPlugin.php
   creating: nextcloud/apps/files_reminders/lib/BackgroundJob/
  inflating: nextcloud/apps/files_reminders/lib/BackgroundJob/ScheduledNotifications.php
  inflating: nextcloud/apps/files_reminders/lib/BackgroundJob/CleanUpReminders.php
   creating: nextcloud/apps/files_reminders/lib/Model/
  inflating: nextcloud/apps/files_reminders/lib/Model/RichReminder.php
   creating: nextcloud/apps/files_reminders/lib/Command/
  inflating: nextcloud/apps/files_reminders/lib/Command/ListCommand.php
   creating: nextcloud/apps/files_reminders/lib/Service/
  inflating: nextcloud/apps/files_reminders/lib/Service/ReminderService.php
   creating: nextcloud/apps/files_reminders/lib/SetupChecks/
  inflating: nextcloud/apps/files_reminders/lib/SetupChecks/NeedNotificationsApp.php
   creating: nextcloud/apps/files_reminders/lib/Migration/
  inflating: nextcloud/apps/files_reminders/lib/Migration/Version10000Date20230725162149.php
   creating: nextcloud/apps/files_reminders/lib/AppInfo/
  inflating: nextcloud/apps/files_reminders/lib/AppInfo/Application.php
   creating: nextcloud/apps/files_reminders/lib/Controller/
  inflating: nextcloud/apps/files_reminders/lib/Controller/ApiController.php
   creating: nextcloud/apps/files_reminders/lib/Notification/
  inflating: nextcloud/apps/files_reminders/lib/Notification/Notifier.php
  inflating: nextcloud/apps/files_reminders/openapi.json
   creating: nextcloud/apps/files_reminders/appinfo/
  inflating: nextcloud/apps/files_reminders/appinfo/info.xml
  inflating: nextcloud/apps/files_reminders/appinfo/routes.php
  inflating: nextcloud/apps/files_reminders/appinfo/signature.json
  inflating: nextcloud/apps/files_reminders/openapi.json.license
   creating: nextcloud/apps/dashboard/
   creating: nextcloud/apps/dashboard/composer/
   creating: nextcloud/apps/dashboard/composer/composer/
  inflating: nextcloud/apps/dashboard/composer/composer/autoload_namespaces.php
  inflating: nextcloud/apps/dashboard/composer/composer/ClassLoader.php
  inflating: nextcloud/apps/dashboard/composer/composer/autoload_real.php
  inflating: nextcloud/apps/dashboard/composer/composer/autoload_classmap.php
  inflating: nextcloud/apps/dashboard/composer/composer/installed.php
  inflating: nextcloud/apps/dashboard/composer/composer/InstalledVersions.php
  inflating: nextcloud/apps/dashboard/composer/composer/autoload_static.php
  inflating: nextcloud/apps/dashboard/composer/composer/LICENSE
  inflating: nextcloud/apps/dashboard/composer/composer/installed.json
  inflating: nextcloud/apps/dashboard/composer/composer/autoload_psr4.php
  inflating: nextcloud/apps/dashboard/composer/composer.lock
  inflating: nextcloud/apps/dashboard/composer/autoload.php
  inflating: nextcloud/apps/dashboard/composer/composer.json
   creating: nextcloud/apps/dashboard/l10n/
  inflating: nextcloud/apps/dashboard/l10n/sr.json
  inflating: nextcloud/apps/dashboard/l10n/sl.json
  inflating: nextcloud/apps/dashboard/l10n/et_EE.js
  inflating: nextcloud/apps/dashboard/l10n/hr.js
  inflating: nextcloud/apps/dashboard/l10n/zh_TW.json
  inflating: nextcloud/apps/dashboard/l10n/ug.json
  inflating: nextcloud/apps/dashboard/l10n/en_GB.json
  inflating: nextcloud/apps/dashboard/l10n/bg.js
  inflating: nextcloud/apps/dashboard/l10n/sk.json
  inflating: nextcloud/apps/dashboard/l10n/gl.json
  inflating: nextcloud/apps/dashboard/l10n/tr.json
  inflating: nextcloud/apps/dashboard/l10n/ug.js
  inflating: nextcloud/apps/dashboard/l10n/fa.json
  inflating: nextcloud/apps/dashboard/l10n/en_GB.js
  inflating: nextcloud/apps/dashboard/l10n/es_EC.js
  inflating: nextcloud/apps/dashboard/l10n/tr.js
  inflating: nextcloud/apps/dashboard/l10n/vi.js
  inflating: nextcloud/apps/dashboard/l10n/de.json
  inflating: nextcloud/apps/dashboard/l10n/ka_GE.json
  inflating: nextcloud/apps/dashboard/l10n/oc.json
  inflating: nextcloud/apps/dashboard/l10n/es_MX.js
  inflating: nextcloud/apps/dashboard/l10n/sr.js
  inflating: nextcloud/apps/dashboard/l10n/lt_LT.js
  inflating: nextcloud/apps/dashboard/l10n/nb.js
  inflating: nextcloud/apps/dashboard/l10n/be.json
  inflating: nextcloud/apps/dashboard/l10n/uk.js
  inflating: nextcloud/apps/dashboard/l10n/zh_HK.js
  inflating: nextcloud/apps/dashboard/l10n/ca.js
  inflating: nextcloud/apps/dashboard/l10n/fa.js
  inflating: nextcloud/apps/dashboard/l10n/es.json
  inflating: nextcloud/apps/dashboard/l10n/sv.json
  inflating: nextcloud/apps/dashboard/l10n/ru.json
  inflating: nextcloud/apps/dashboard/l10n/da.json
  inflating: nextcloud/apps/dashboard/l10n/he.json
  inflating: nextcloud/apps/dashboard/l10n/sl.js
  inflating: nextcloud/apps/dashboard/l10n/ro.js
  inflating: nextcloud/apps/dashboard/l10n/zh_HK.json
  inflating: nextcloud/apps/dashboard/l10n/de_DE.js
  inflating: nextcloud/apps/dashboard/l10n/it.json
  inflating: nextcloud/apps/dashboard/l10n/mk.js
  inflating: nextcloud/apps/dashboard/l10n/zh_CN.json
  inflating: nextcloud/apps/dashboard/l10n/sc.js
  inflating: nextcloud/apps/dashboard/l10n/gl.js
  inflating: nextcloud/apps/dashboard/l10n/uz.json
  inflating: nextcloud/apps/dashboard/l10n/ar.json
  inflating: nextcloud/apps/dashboard/l10n/cs.js
  inflating: nextcloud/apps/dashboard/l10n/lt_LT.json
  inflating: nextcloud/apps/dashboard/l10n/da.js
  inflating: nextcloud/apps/dashboard/l10n/mk.json
  inflating: nextcloud/apps/dashboard/l10n/sc.json
  inflating: nextcloud/apps/dashboard/l10n/hu.json
  inflating: nextcloud/apps/dashboard/l10n/ko.json
  inflating: nextcloud/apps/dashboard/l10n/sw.js
  inflating: nextcloud/apps/dashboard/l10n/nl.json
  inflating: nextcloud/apps/dashboard/l10n/cs.json
  inflating: nextcloud/apps/dashboard/l10n/hu.js
  inflating: nextcloud/apps/dashboard/l10n/ja.js
  inflating: nextcloud/apps/dashboard/l10n/is.json
  inflating: nextcloud/apps/dashboard/l10n/hr.json
  inflating: nextcloud/apps/dashboard/l10n/th.json
  inflating: nextcloud/apps/dashboard/l10n/ast.js
  inflating: nextcloud/apps/dashboard/l10n/sk.js
  inflating: nextcloud/apps/dashboard/l10n/zh_CN.js
  inflating: nextcloud/apps/dashboard/l10n/et_EE.json
  inflating: nextcloud/apps/dashboard/l10n/ka_GE.js
  inflating: nextcloud/apps/dashboard/l10n/pt_PT.js
  inflating: nextcloud/apps/dashboard/l10n/de_DE.json
  inflating: nextcloud/apps/dashboard/l10n/oc.js
  inflating: nextcloud/apps/dashboard/l10n/th.js
  inflating: nextcloud/apps/dashboard/l10n/pt_BR.js
  inflating: nextcloud/apps/dashboard/l10n/he.js
  inflating: nextcloud/apps/dashboard/l10n/eu.json
  inflating: nextcloud/apps/dashboard/l10n/ga.json
  inflating: nextcloud/apps/dashboard/l10n/fr.js
  inflating: nextcloud/apps/dashboard/l10n/fi.json
  inflating: nextcloud/apps/dashboard/l10n/ko.js
  inflating: nextcloud/apps/dashboard/l10n/bg.json
  inflating: nextcloud/apps/dashboard/l10n/pl.js
  inflating: nextcloud/apps/dashboard/l10n/vi.json
  inflating: nextcloud/apps/dashboard/l10n/id.json
  inflating: nextcloud/apps/dashboard/l10n/nb.json
  inflating: nextcloud/apps/dashboard/l10n/ar.js
  inflating: nextcloud/apps/dashboard/l10n/pl.json
  inflating: nextcloud/apps/dashboard/l10n/el.json
  inflating: nextcloud/apps/dashboard/l10n/zh_TW.js
  inflating: nextcloud/apps/dashboard/l10n/be.js
  inflating: nextcloud/apps/dashboard/l10n/nl.js
  inflating: nextcloud/apps/dashboard/l10n/es_MX.json
  inflating: nextcloud/apps/dashboard/l10n/el.js
  inflating: nextcloud/apps/dashboard/l10n/id.js
  inflating: nextcloud/apps/dashboard/l10n/pt_PT.json
  inflating: nextcloud/apps/dashboard/l10n/fr.json
  inflating: nextcloud/apps/dashboard/l10n/sw.json
  inflating: nextcloud/apps/dashboard/l10n/es_EC.json
  inflating: nextcloud/apps/dashboard/l10n/ga.js
  inflating: nextcloud/apps/dashboard/l10n/it.js
  inflating: nextcloud/apps/dashboard/l10n/ast.json
  inflating: nextcloud/apps/dashboard/l10n/pt_BR.json
  inflating: nextcloud/apps/dashboard/l10n/es.js
  inflating: nextcloud/apps/dashboard/l10n/de.js
  inflating: nextcloud/apps/dashboard/l10n/ca.json
  inflating: nextcloud/apps/dashboard/l10n/uz.js
  inflating: nextcloud/apps/dashboard/l10n/ja.json
  inflating: nextcloud/apps/dashboard/l10n/eu.js
  inflating: nextcloud/apps/dashboard/l10n/is.js
  inflating: nextcloud/apps/dashboard/l10n/fi.js
  inflating: nextcloud/apps/dashboard/l10n/ru.js
  inflating: nextcloud/apps/dashboard/l10n/sv.js
  inflating: nextcloud/apps/dashboard/l10n/ro.json
  inflating: nextcloud/apps/dashboard/l10n/uk.json
   creating: nextcloud/apps/dashboard/img/
  inflating: nextcloud/apps/dashboard/img/dashboard.svg.license
  inflating: nextcloud/apps/dashboard/img/dashboard.svg
   creating: nextcloud/apps/dashboard/lib/
   creating: nextcloud/apps/dashboard/lib/Service/
  inflating: nextcloud/apps/dashboard/lib/Service/DashboardService.php
  inflating: nextcloud/apps/dashboard/lib/ResponseDefinitions.php
   creating: nextcloud/apps/dashboard/lib/Controller/
  inflating: nextcloud/apps/dashboard/lib/Controller/DashboardApiController.php
  inflating: nextcloud/apps/dashboard/lib/Controller/DashboardController.php
  inflating: nextcloud/apps/dashboard/openapi.json
   creating: nextcloud/apps/dashboard/templates/
  inflating: nextcloud/apps/dashboard/templates/index.php
   creating: nextcloud/apps/dashboard/css/
  inflating: nextcloud/apps/dashboard/css/dashboard.css.map
  inflating: nextcloud/apps/dashboard/css/dashboard.scss
  inflating: nextcloud/apps/dashboard/css/dashboard.css.map.license
  inflating: nextcloud/apps/dashboard/css/dashboard.css
   creating: nextcloud/apps/dashboard/appinfo/
  inflating: nextcloud/apps/dashboard/appinfo/info.xml
  inflating: nextcloud/apps/dashboard/appinfo/signature.json
  inflating: nextcloud/apps/dashboard/openapi.json.license
   creating: nextcloud/apps/survey_client/
   creating: nextcloud/apps/survey_client/js/
  inflating: nextcloud/apps/survey_client/js/admin.js
  inflating: nextcloud/apps/survey_client/AUTHORS.md
   creating: nextcloud/apps/survey_client/l10n/
  inflating: nextcloud/apps/survey_client/l10n/es_NI.js
  inflating: nextcloud/apps/survey_client/l10n/es_GT.json
  inflating: nextcloud/apps/survey_client/l10n/sr.json
  inflating: nextcloud/apps/survey_client/l10n/sl.json
  inflating: nextcloud/apps/survey_client/l10n/et_EE.js
  inflating: nextcloud/apps/survey_client/l10n/hr.js
  inflating: nextcloud/apps/survey_client/l10n/es_PE.json
  inflating: nextcloud/apps/survey_client/l10n/zh_TW.json
  inflating: nextcloud/apps/survey_client/l10n/es_419.json
  inflating: nextcloud/apps/survey_client/l10n/ug.json
  inflating: nextcloud/apps/survey_client/l10n/es_SV.json
  inflating: nextcloud/apps/survey_client/l10n/lo.js
  inflating: nextcloud/apps/survey_client/l10n/en_GB.json
  inflating: nextcloud/apps/survey_client/l10n/bg.js
  inflating: nextcloud/apps/survey_client/l10n/es_PA.js
  inflating: nextcloud/apps/survey_client/l10n/es_CR.js
  inflating: nextcloud/apps/survey_client/l10n/sk.json
  inflating: nextcloud/apps/survey_client/l10n/gl.json
  inflating: nextcloud/apps/survey_client/l10n/es_CR.json
  inflating: nextcloud/apps/survey_client/l10n/tr.json
  inflating: nextcloud/apps/survey_client/l10n/ug.js
  inflating: nextcloud/apps/survey_client/l10n/fa.json
  inflating: nextcloud/apps/survey_client/l10n/es_PY.js
  inflating: nextcloud/apps/survey_client/l10n/en_GB.js
  inflating: nextcloud/apps/survey_client/l10n/es_EC.js
  inflating: nextcloud/apps/survey_client/l10n/tr.js
  inflating: nextcloud/apps/survey_client/l10n/es_PY.json
  inflating: nextcloud/apps/survey_client/l10n/de.json
  inflating: nextcloud/apps/survey_client/l10n/ka_GE.json
  inflating: nextcloud/apps/survey_client/l10n/mn.js
  inflating: nextcloud/apps/survey_client/l10n/ka.json
  inflating: nextcloud/apps/survey_client/l10n/es_MX.js
  inflating: nextcloud/apps/survey_client/l10n/lv.js
  inflating: nextcloud/apps/survey_client/l10n/sr.js
  inflating: nextcloud/apps/survey_client/l10n/lt_LT.js
  inflating: nextcloud/apps/survey_client/l10n/nb.js
  inflating: nextcloud/apps/survey_client/l10n/es_PR.js
  inflating: nextcloud/apps/survey_client/l10n/be.json
  inflating: nextcloud/apps/survey_client/l10n/uk.js
  inflating: nextcloud/apps/survey_client/l10n/mn.json
  inflating: nextcloud/apps/survey_client/l10n/zh_HK.js
  inflating: nextcloud/apps/survey_client/l10n/ca.js
  inflating: nextcloud/apps/survey_client/l10n/fa.js
  inflating: nextcloud/apps/survey_client/l10n/es_GT.js
  inflating: nextcloud/apps/survey_client/l10n/es.json
  inflating: nextcloud/apps/survey_client/l10n/sv.json
  inflating: nextcloud/apps/survey_client/l10n/ru.json
  inflating: nextcloud/apps/survey_client/l10n/da.json
  inflating: nextcloud/apps/survey_client/l10n/he.json
  inflating: nextcloud/apps/survey_client/l10n/sl.js
  inflating: nextcloud/apps/survey_client/l10n/es_DO.json
  inflating: nextcloud/apps/survey_client/l10n/ka.js
  inflating: nextcloud/apps/survey_client/l10n/zh_HK.json
  inflating: nextcloud/apps/survey_client/l10n/es_PA.json
  inflating: nextcloud/apps/survey_client/l10n/es_CO.json
  inflating: nextcloud/apps/survey_client/l10n/de_DE.js
  inflating: nextcloud/apps/survey_client/l10n/it.json
  inflating: nextcloud/apps/survey_client/l10n/mk.js
  inflating: nextcloud/apps/survey_client/l10n/zh_CN.json
  inflating: nextcloud/apps/survey_client/l10n/sc.js
  inflating: nextcloud/apps/survey_client/l10n/gl.js
  inflating: nextcloud/apps/survey_client/l10n/es_UY.js
  inflating: nextcloud/apps/survey_client/l10n/ar.json
  inflating: nextcloud/apps/survey_client/l10n/cs.js
  inflating: nextcloud/apps/survey_client/l10n/es_HN.js
  inflating: nextcloud/apps/survey_client/l10n/lt_LT.json
  inflating: nextcloud/apps/survey_client/l10n/da.js
  inflating: nextcloud/apps/survey_client/l10n/es_PE.js
  inflating: nextcloud/apps/survey_client/l10n/mk.json
  inflating: nextcloud/apps/survey_client/l10n/sc.json
  inflating: nextcloud/apps/survey_client/l10n/es_HN.json
  inflating: nextcloud/apps/survey_client/l10n/hu.json
  inflating: nextcloud/apps/survey_client/l10n/ko.json
  inflating: nextcloud/apps/survey_client/l10n/sw.js
  inflating: nextcloud/apps/survey_client/l10n/nl.json
  inflating: nextcloud/apps/survey_client/l10n/lv.json
  inflating: nextcloud/apps/survey_client/l10n/cs.json
  inflating: nextcloud/apps/survey_client/l10n/hu.js
  inflating: nextcloud/apps/survey_client/l10n/es_CO.js
  inflating: nextcloud/apps/survey_client/l10n/ja.js
  inflating: nextcloud/apps/survey_client/l10n/es_NI.json
  inflating: nextcloud/apps/survey_client/l10n/es_UY.json
  inflating: nextcloud/apps/survey_client/l10n/is.json
  inflating: nextcloud/apps/survey_client/l10n/hr.json
  inflating: nextcloud/apps/survey_client/l10n/es_419.js
  inflating: nextcloud/apps/survey_client/l10n/th.json
  inflating: nextcloud/apps/survey_client/l10n/ast.js
  inflating: nextcloud/apps/survey_client/l10n/sk.js
  inflating: nextcloud/apps/survey_client/l10n/lo.json
  inflating: nextcloud/apps/survey_client/l10n/zh_CN.js
  inflating: nextcloud/apps/survey_client/l10n/et_EE.json
  inflating: nextcloud/apps/survey_client/l10n/ka_GE.js
  inflating: nextcloud/apps/survey_client/l10n/pt_PT.js
  inflating: nextcloud/apps/survey_client/l10n/de_DE.json
  inflating: nextcloud/apps/survey_client/l10n/sq.js
  inflating: nextcloud/apps/survey_client/l10n/th.js
  inflating: nextcloud/apps/survey_client/l10n/pt_BR.js
  inflating: nextcloud/apps/survey_client/l10n/he.js
  inflating: nextcloud/apps/survey_client/l10n/eu.json
  inflating: nextcloud/apps/survey_client/l10n/ga.json
  inflating: nextcloud/apps/survey_client/l10n/es_AR.json
  inflating: nextcloud/apps/survey_client/l10n/sq.json
  inflating: nextcloud/apps/survey_client/l10n/es_CL.json
  inflating: nextcloud/apps/survey_client/l10n/fr.js
  inflating: nextcloud/apps/survey_client/l10n/fi.json
  inflating: nextcloud/apps/survey_client/l10n/es_PR.json
  inflating: nextcloud/apps/survey_client/l10n/ko.js
  inflating: nextcloud/apps/survey_client/l10n/bg.json
  inflating: nextcloud/apps/survey_client/l10n/pl.js
  inflating: nextcloud/apps/survey_client/l10n/nb.json
  inflating: nextcloud/apps/survey_client/l10n/es_DO.js
  inflating: nextcloud/apps/survey_client/l10n/ar.js
  inflating: nextcloud/apps/survey_client/l10n/pl.json
  inflating: nextcloud/apps/survey_client/l10n/el.json
  inflating: nextcloud/apps/survey_client/l10n/zh_TW.js
  inflating: nextcloud/apps/survey_client/l10n/be.js
  inflating: nextcloud/apps/survey_client/l10n/nl.js
  inflating: nextcloud/apps/survey_client/l10n/es_CL.js
  inflating: nextcloud/apps/survey_client/l10n/es_MX.json
  inflating: nextcloud/apps/survey_client/l10n/el.js
  inflating: nextcloud/apps/survey_client/l10n/pt_PT.json
  inflating: nextcloud/apps/survey_client/l10n/fr.json
  inflating: nextcloud/apps/survey_client/l10n/sw.json
  inflating: nextcloud/apps/survey_client/l10n/es_EC.json
  inflating: nextcloud/apps/survey_client/l10n/ga.js
  inflating: nextcloud/apps/survey_client/l10n/it.js
  inflating: nextcloud/apps/survey_client/l10n/ast.json
  inflating: nextcloud/apps/survey_client/l10n/pt_BR.json
  inflating: nextcloud/apps/survey_client/l10n/es.js
  inflating: nextcloud/apps/survey_client/l10n/de.js
  inflating: nextcloud/apps/survey_client/l10n/ca.json
  inflating: nextcloud/apps/survey_client/l10n/ja.json
  inflating: nextcloud/apps/survey_client/l10n/eu.js
  inflating: nextcloud/apps/survey_client/l10n/is.js
  inflating: nextcloud/apps/survey_client/l10n/fi.js
  inflating: nextcloud/apps/survey_client/l10n/ru.js
  inflating: nextcloud/apps/survey_client/l10n/sv.js
  inflating: nextcloud/apps/survey_client/l10n/es_AR.js
  inflating: nextcloud/apps/survey_client/l10n/es_SV.js
  inflating: nextcloud/apps/survey_client/l10n/uk.json
  inflating: nextcloud/apps/survey_client/composer.lock
   creating: nextcloud/apps/survey_client/img/
  inflating: nextcloud/apps/survey_client/img/app.svg
  inflating: nextcloud/apps/survey_client/img/app-dark.svg
  inflating: nextcloud/apps/survey_client/REUSE.toml
   creating: nextcloud/apps/survey_client/lib/
  inflating: nextcloud/apps/survey_client/lib/Collector.php
  inflating: nextcloud/apps/survey_client/lib/Notifier.php
   creating: nextcloud/apps/survey_client/lib/BackgroundJobs/
  inflating: nextcloud/apps/survey_client/lib/BackgroundJobs/MonthlyReport.php
  inflating: nextcloud/apps/survey_client/lib/BackgroundJobs/AdminNotification.php
   creating: nextcloud/apps/survey_client/lib/Migration/
  inflating: nextcloud/apps/survey_client/lib/Migration/SendAdminNotification.php
   creating: nextcloud/apps/survey_client/lib/AppInfo/
  inflating: nextcloud/apps/survey_client/lib/AppInfo/Application.php
   creating: nextcloud/apps/survey_client/lib/Settings/
  inflating: nextcloud/apps/survey_client/lib/Settings/AdminSettings.php
  inflating: nextcloud/apps/survey_client/lib/Settings/AdminSection.php
   creating: nextcloud/apps/survey_client/lib/Categories/
  inflating: nextcloud/apps/survey_client/lib/Categories/Apps.php
  inflating: nextcloud/apps/survey_client/lib/Categories/ICategory.php
  inflating: nextcloud/apps/survey_client/lib/Categories/Stats.php
  inflating: nextcloud/apps/survey_client/lib/Categories/Database.php
  inflating: nextcloud/apps/survey_client/lib/Categories/Encryption.php
  inflating: nextcloud/apps/survey_client/lib/Categories/Php.php
  inflating: nextcloud/apps/survey_client/lib/Categories/Server.php
  inflating: nextcloud/apps/survey_client/lib/Categories/FilesSharing.php
   creating: nextcloud/apps/survey_client/lib/Controller/
  inflating: nextcloud/apps/survey_client/lib/Controller/EndpointController.php
   creating: nextcloud/apps/survey_client/templates/
  inflating: nextcloud/apps/survey_client/templates/admin.php
   creating: nextcloud/apps/survey_client/css/
  inflating: nextcloud/apps/survey_client/css/admin.css
  inflating: nextcloud/apps/survey_client/composer.json
  inflating: nextcloud/apps/survey_client/COPYING
   creating: nextcloud/apps/survey_client/LICENSES/
  inflating: nextcloud/apps/survey_client/LICENSES/MIT.txt
  inflating: nextcloud/apps/survey_client/LICENSES/CC0-1.0.txt
  inflating: nextcloud/apps/survey_client/LICENSES/AGPL-3.0-only.txt
  inflating: nextcloud/apps/survey_client/LICENSES/AGPL-3.0-or-later.txt
  inflating: nextcloud/apps/survey_client/LICENSES/Apache-2.0.txt
   creating: nextcloud/apps/survey_client/appinfo/
  inflating: nextcloud/apps/survey_client/appinfo/info.xml
  inflating: nextcloud/apps/survey_client/appinfo/routes.php
  inflating: nextcloud/apps/survey_client/appinfo/signature.json
   creating: nextcloud/apps/oauth2/
   creating: nextcloud/apps/oauth2/composer/
   creating: nextcloud/apps/oauth2/composer/composer/
  inflating: nextcloud/apps/oauth2/composer/composer/autoload_namespaces.php
  inflating: nextcloud/apps/oauth2/composer/composer/ClassLoader.php
  inflating: nextcloud/apps/oauth2/composer/composer/autoload_real.php
  inflating: nextcloud/apps/oauth2/composer/composer/autoload_classmap.php
  inflating: nextcloud/apps/oauth2/composer/composer/installed.php
  inflating: nextcloud/apps/oauth2/composer/composer/InstalledVersions.php
  inflating: nextcloud/apps/oauth2/composer/composer/autoload_static.php
  inflating: nextcloud/apps/oauth2/composer/composer/LICENSE
  inflating: nextcloud/apps/oauth2/composer/composer/installed.json
  inflating: nextcloud/apps/oauth2/composer/composer/autoload_psr4.php
  inflating: nextcloud/apps/oauth2/composer/composer.lock
  inflating: nextcloud/apps/oauth2/composer/autoload.php
  inflating: nextcloud/apps/oauth2/composer/composer.json
   creating: nextcloud/apps/oauth2/l10n/
  inflating: nextcloud/apps/oauth2/l10n/es_GT.json
  inflating: nextcloud/apps/oauth2/l10n/sr.json
  inflating: nextcloud/apps/oauth2/l10n/sl.json
  inflating: nextcloud/apps/oauth2/l10n/et_EE.js
  inflating: nextcloud/apps/oauth2/l10n/hr.js
  inflating: nextcloud/apps/oauth2/l10n/zh_TW.json
  inflating: nextcloud/apps/oauth2/l10n/ug.json
  inflating: nextcloud/apps/oauth2/l10n/es_SV.json
  inflating: nextcloud/apps/oauth2/l10n/lo.js
  inflating: nextcloud/apps/oauth2/l10n/en_GB.json
  inflating: nextcloud/apps/oauth2/l10n/bg.js
  inflating: nextcloud/apps/oauth2/l10n/es_CR.js
  inflating: nextcloud/apps/oauth2/l10n/sk.json
  inflating: nextcloud/apps/oauth2/l10n/si.json
  inflating: nextcloud/apps/oauth2/l10n/gl.json
  inflating: nextcloud/apps/oauth2/l10n/es_CR.json
  inflating: nextcloud/apps/oauth2/l10n/tr.json
  inflating: nextcloud/apps/oauth2/l10n/ug.js
  inflating: nextcloud/apps/oauth2/l10n/fa.json
  inflating: nextcloud/apps/oauth2/l10n/en_GB.js
  inflating: nextcloud/apps/oauth2/l10n/es_EC.js
  inflating: nextcloud/apps/oauth2/l10n/tr.js
  inflating: nextcloud/apps/oauth2/l10n/vi.js
  inflating: nextcloud/apps/oauth2/l10n/de.json
  inflating: nextcloud/apps/oauth2/l10n/ka_GE.json
  inflating: nextcloud/apps/oauth2/l10n/ka.json
  inflating: nextcloud/apps/oauth2/l10n/oc.json
  inflating: nextcloud/apps/oauth2/l10n/es_MX.js
  inflating: nextcloud/apps/oauth2/l10n/lv.js
  inflating: nextcloud/apps/oauth2/l10n/sr.js
  inflating: nextcloud/apps/oauth2/l10n/lt_LT.js
  inflating: nextcloud/apps/oauth2/l10n/nb.js
  inflating: nextcloud/apps/oauth2/l10n/be.json
  inflating: nextcloud/apps/oauth2/l10n/uk.js
  inflating: nextcloud/apps/oauth2/l10n/zh_HK.js
  inflating: nextcloud/apps/oauth2/l10n/ca.js
  inflating: nextcloud/apps/oauth2/l10n/fa.js
  inflating: nextcloud/apps/oauth2/l10n/es_GT.js
  inflating: nextcloud/apps/oauth2/l10n/es.json
  inflating: nextcloud/apps/oauth2/l10n/sv.json
  inflating: nextcloud/apps/oauth2/l10n/ru.json
  inflating: nextcloud/apps/oauth2/l10n/da.json
  inflating: nextcloud/apps/oauth2/l10n/he.json
  inflating: nextcloud/apps/oauth2/l10n/sl.js
  inflating: nextcloud/apps/oauth2/l10n/es_DO.json
  inflating: nextcloud/apps/oauth2/l10n/ka.js
  inflating: nextcloud/apps/oauth2/l10n/zh_HK.json
  inflating: nextcloud/apps/oauth2/l10n/es_CO.json
  inflating: nextcloud/apps/oauth2/l10n/de_DE.js
  inflating: nextcloud/apps/oauth2/l10n/it.json
  inflating: nextcloud/apps/oauth2/l10n/mk.js
  inflating: nextcloud/apps/oauth2/l10n/br.json
  inflating: nextcloud/apps/oauth2/l10n/zh_CN.json
  inflating: nextcloud/apps/oauth2/l10n/sc.js
  inflating: nextcloud/apps/oauth2/l10n/gl.js
  inflating: nextcloud/apps/oauth2/l10n/ar.json
  inflating: nextcloud/apps/oauth2/l10n/cs.js
  inflating: nextcloud/apps/oauth2/l10n/lt_LT.json
  inflating: nextcloud/apps/oauth2/l10n/da.js
  inflating: nextcloud/apps/oauth2/l10n/mk.json
  inflating: nextcloud/apps/oauth2/l10n/sc.json
  inflating: nextcloud/apps/oauth2/l10n/hu.json
  inflating: nextcloud/apps/oauth2/l10n/ko.json
  inflating: nextcloud/apps/oauth2/l10n/sw.js
  inflating: nextcloud/apps/oauth2/l10n/nl.json
  inflating: nextcloud/apps/oauth2/l10n/lv.json
  inflating: nextcloud/apps/oauth2/l10n/cs.json
  inflating: nextcloud/apps/oauth2/l10n/hu.js
  inflating: nextcloud/apps/oauth2/l10n/es_CO.js
  inflating: nextcloud/apps/oauth2/l10n/ja.js
  inflating: nextcloud/apps/oauth2/l10n/is.json
  inflating: nextcloud/apps/oauth2/l10n/hr.json
  inflating: nextcloud/apps/oauth2/l10n/ast.js
  inflating: nextcloud/apps/oauth2/l10n/sk.js
  inflating: nextcloud/apps/oauth2/l10n/lo.json
  inflating: nextcloud/apps/oauth2/l10n/zh_CN.js
  inflating: nextcloud/apps/oauth2/l10n/et_EE.json
  inflating: nextcloud/apps/oauth2/l10n/ka_GE.js
  inflating: nextcloud/apps/oauth2/l10n/si.js
  inflating: nextcloud/apps/oauth2/l10n/pt_PT.js
  inflating: nextcloud/apps/oauth2/l10n/de_DE.json
  inflating: nextcloud/apps/oauth2/l10n/oc.js
  inflating: nextcloud/apps/oauth2/l10n/sq.js
  inflating: nextcloud/apps/oauth2/l10n/pt_BR.js
  inflating: nextcloud/apps/oauth2/l10n/he.js
  inflating: nextcloud/apps/oauth2/l10n/eu.json
  inflating: nextcloud/apps/oauth2/l10n/ga.json
  inflating: nextcloud/apps/oauth2/l10n/es_AR.json
  inflating: nextcloud/apps/oauth2/l10n/sq.json
  inflating: nextcloud/apps/oauth2/l10n/es_CL.json
  inflating: nextcloud/apps/oauth2/l10n/fr.js
  inflating: nextcloud/apps/oauth2/l10n/fi.json
  inflating: nextcloud/apps/oauth2/l10n/ko.js
  inflating: nextcloud/apps/oauth2/l10n/bg.json
  inflating: nextcloud/apps/oauth2/l10n/pl.js
  inflating: nextcloud/apps/oauth2/l10n/vi.json
  inflating: nextcloud/apps/oauth2/l10n/nb.json
  inflating: nextcloud/apps/oauth2/l10n/es_DO.js
  inflating: nextcloud/apps/oauth2/l10n/ar.js
  inflating: nextcloud/apps/oauth2/l10n/pl.json
  inflating: nextcloud/apps/oauth2/l10n/el.json
  inflating: nextcloud/apps/oauth2/l10n/br.js
  inflating: nextcloud/apps/oauth2/l10n/zh_TW.js
  inflating: nextcloud/apps/oauth2/l10n/be.js
  inflating: nextcloud/apps/oauth2/l10n/nl.js
  inflating: nextcloud/apps/oauth2/l10n/es_CL.js
  inflating: nextcloud/apps/oauth2/l10n/es_MX.json
  inflating: nextcloud/apps/oauth2/l10n/el.js
  inflating: nextcloud/apps/oauth2/l10n/pt_PT.json
  inflating: nextcloud/apps/oauth2/l10n/fr.json
  inflating: nextcloud/apps/oauth2/l10n/sw.json
  inflating: nextcloud/apps/oauth2/l10n/es_EC.json
  inflating: nextcloud/apps/oauth2/l10n/ga.js
  inflating: nextcloud/apps/oauth2/l10n/it.js
  inflating: nextcloud/apps/oauth2/l10n/ast.json
  inflating: nextcloud/apps/oauth2/l10n/pt_BR.json
  inflating: nextcloud/apps/oauth2/l10n/es.js
  inflating: nextcloud/apps/oauth2/l10n/de.js
  inflating: nextcloud/apps/oauth2/l10n/ca.json
  inflating: nextcloud/apps/oauth2/l10n/ja.json
  inflating: nextcloud/apps/oauth2/l10n/eu.js
  inflating: nextcloud/apps/oauth2/l10n/is.js
  inflating: nextcloud/apps/oauth2/l10n/fi.js
  inflating: nextcloud/apps/oauth2/l10n/ru.js
  inflating: nextcloud/apps/oauth2/l10n/sv.js
  inflating: nextcloud/apps/oauth2/l10n/es_AR.js
  inflating: nextcloud/apps/oauth2/l10n/es_SV.js
  inflating: nextcloud/apps/oauth2/l10n/uk.json
   creating: nextcloud/apps/oauth2/lib/
   creating: nextcloud/apps/oauth2/lib/Db/
  inflating: nextcloud/apps/oauth2/lib/Db/ClientMapper.php
  inflating: nextcloud/apps/oauth2/lib/Db/AccessToken.php
  inflating: nextcloud/apps/oauth2/lib/Db/Client.php
  inflating: nextcloud/apps/oauth2/lib/Db/AccessTokenMapper.php
   creating: nextcloud/apps/oauth2/lib/BackgroundJob/
  inflating: nextcloud/apps/oauth2/lib/BackgroundJob/CleanupExpiredAuthorizationCode.php
   creating: nextcloud/apps/oauth2/lib/Command/
  inflating: nextcloud/apps/oauth2/lib/Command/ImportLegacyOcClient.php
   creating: nextcloud/apps/oauth2/lib/Migration/
  inflating: nextcloud/apps/oauth2/lib/Migration/Version010402Date20190107124745.php
  inflating: nextcloud/apps/oauth2/lib/Migration/Version011603Date20230620111039.php
  inflating: nextcloud/apps/oauth2/lib/Migration/Version011602Date20230613160650.php
  inflating: nextcloud/apps/oauth2/lib/Migration/Version011601Date20230522143227.php
  inflating: nextcloud/apps/oauth2/lib/Migration/SetTokenExpiration.php
  inflating: nextcloud/apps/oauth2/lib/Migration/Version011901Date20240829164356.php
  inflating: nextcloud/apps/oauth2/lib/Migration/Version010401Date20181207190718.php
   creating: nextcloud/apps/oauth2/lib/Settings/
  inflating: nextcloud/apps/oauth2/lib/Settings/Admin.php
   creating: nextcloud/apps/oauth2/lib/Controller/
  inflating: nextcloud/apps/oauth2/lib/Controller/LoginRedirectorController.php
  inflating: nextcloud/apps/oauth2/lib/Controller/OauthApiController.php
  inflating: nextcloud/apps/oauth2/lib/Controller/SettingsController.php
   creating: nextcloud/apps/oauth2/lib/Exceptions/
  inflating: nextcloud/apps/oauth2/lib/Exceptions/ClientNotFoundException.php
  inflating: nextcloud/apps/oauth2/lib/Exceptions/AccessTokenNotFoundException.php
  inflating: nextcloud/apps/oauth2/openapi.json
   creating: nextcloud/apps/oauth2/templates/
  inflating: nextcloud/apps/oauth2/templates/admin.php
   creating: nextcloud/apps/oauth2/appinfo/
  inflating: nextcloud/apps/oauth2/appinfo/info.xml
  inflating: nextcloud/apps/oauth2/appinfo/routes.php
  inflating: nextcloud/apps/oauth2/appinfo/signature.json
  inflating: nextcloud/apps/oauth2/openapi.json.license
   creating: nextcloud/apps/files_downloadlimit/
   creating: nextcloud/apps/files_downloadlimit/js/
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-public.mjs.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-main.mjs.map.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-main.mjs.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-admin.mjs
  inflating: nextcloud/apps/files_downloadlimit/js/logger-NonNsq4V.chunk.mjs.license
  inflating: nextcloud/apps/files_downloadlimit/js/logger-NonNsq4V.chunk.mjs
  inflating: nextcloud/apps/files_downloadlimit/js/_plugin-vue2_normalizer-KVSkBM2L.chunk.mjs.map
  inflating: nextcloud/apps/files_downloadlimit/js/_plugin-vue2_normalizer-KVSkBM2L.chunk.mjs.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-main.mjs
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-public.mjs
  inflating: nextcloud/apps/files_downloadlimit/js/_plugin-vue2_normalizer-KVSkBM2L.chunk.mjs.map.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-admin.mjs.map.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-public.mjs.map
  inflating: nextcloud/apps/files_downloadlimit/js/_plugin-vue2_normalizer-KVSkBM2L.chunk.mjs
  inflating: nextcloud/apps/files_downloadlimit/js/logger-NonNsq4V.chunk.mjs.map
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-admin.mjs.map
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-admin.mjs.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-main.mjs.map
  inflating: nextcloud/apps/files_downloadlimit/js/logger-NonNsq4V.chunk.mjs.map.license
  inflating: nextcloud/apps/files_downloadlimit/js/files_downloadlimit-public.mjs.map.license
  inflating: nextcloud/apps/files_downloadlimit/AUTHORS.md
   creating: nextcloud/apps/files_downloadlimit/l10n/
  inflating: nextcloud/apps/files_downloadlimit/l10n/sr.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sl.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/et_EE.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/hr.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/zh_TW.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ug.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/lo.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/en_GB.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/bg.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/sk.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/gl.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/tr.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ug.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/fa.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/en_GB.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/es_EC.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/tr.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/de.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/oc.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/lv.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/sr.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/lt_LT.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/nb.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/uk.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/zh_HK.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ca.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/fa.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/es.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sv.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ru.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/da.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sl.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ro.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/zh_HK.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/es_CO.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/de_DE.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/it.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/mk.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/zh_CN.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sc.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/gl.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/uz.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ar.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/cs.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/lt_LT.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/da.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/mk.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sc.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/hu.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ko.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sw.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/nl.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/lv.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/cs.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/hu.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/es_CO.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ja.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/is.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/hr.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ast.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/sk.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/lo.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/zh_CN.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/et_EE.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/pt_PT.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/de_DE.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/oc.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/pt_BR.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/eu.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ga.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/fr.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/fi.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ko.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/bg.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/pl.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/id.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/nb.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ar.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/pl.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/el.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/zh_TW.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/nl.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/el.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/id.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/pt_PT.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/fr.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/sw.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/es_EC.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/ga.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/it.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ast.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/pt_BR.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/es.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/de.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ca.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/uz.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ja.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/eu.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/is.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/fi.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ru.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/sv.js
  inflating: nextcloud/apps/files_downloadlimit/l10n/ro.json
  inflating: nextcloud/apps/files_downloadlimit/l10n/uk.json
  inflating: nextcloud/apps/files_downloadlimit/composer.lock
  inflating: nextcloud/apps/files_downloadlimit/package-lock.json
  inflating: nextcloud/apps/files_downloadlimit/REUSE.toml
   creating: nextcloud/apps/files_downloadlimit/lib/
   creating: nextcloud/apps/files_downloadlimit/lib/Db/
  inflating: nextcloud/apps/files_downloadlimit/lib/Db/LimitMapper.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Db/Limit.php
   creating: nextcloud/apps/files_downloadlimit/lib/Listener/
  inflating: nextcloud/apps/files_downloadlimit/lib/Listener/ShareLinkAccessedListener.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Listener/LoadSidebarListener.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Listener/BeforeTemplateRenderedListener.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Listener/SabrePluginAddListener.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Listener/BeforeNodeReadListener.php
   creating: nextcloud/apps/files_downloadlimit/lib/Dav/
  inflating: nextcloud/apps/files_downloadlimit/lib/Dav/PropFindPlugin.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Capabilities.php
   creating: nextcloud/apps/files_downloadlimit/lib/Migration/
  inflating: nextcloud/apps/files_downloadlimit/lib/Migration/Version000000Date20210910094923.php
  inflating: nextcloud/apps/files_downloadlimit/lib/LimitList.php
   creating: nextcloud/apps/files_downloadlimit/lib/AppInfo/
  inflating: nextcloud/apps/files_downloadlimit/lib/AppInfo/Application.php
   creating: nextcloud/apps/files_downloadlimit/lib/Settings/
   creating: nextcloud/apps/files_downloadlimit/lib/Settings/Admin/
  inflating: nextcloud/apps/files_downloadlimit/lib/Settings/Admin/Settings.php
   creating: nextcloud/apps/files_downloadlimit/lib/Controller/
  inflating: nextcloud/apps/files_downloadlimit/lib/Controller/AdminController.php
  inflating: nextcloud/apps/files_downloadlimit/lib/Controller/ApiController.php
   creating: nextcloud/apps/files_downloadlimit/templates/
  inflating: nextcloud/apps/files_downloadlimit/templates/admin.php
   creating: nextcloud/apps/files_downloadlimit/css/
  inflating: nextcloud/apps/files_downloadlimit/css/files_downloadlimit-main.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-DXJN4WBk.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-BhfDiUPQ.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-CU2l9dc-.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-CwKBSsuJ.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/public.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-iq1gkz1B.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-B959hC4T.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-vIxQRmz6.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-D62dRaXv.chunk.css
 extracting: nextcloud/apps/files_downloadlimit/css/files_downloadlimit-public.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-D2lpO7y8.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/files_downloadlimit-_plugin-vue2_normalizer.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-D9iiUdKS.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-DOONTQ29.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-3FDkUgsv.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-B5ga4CVe.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-1TT5q9I8.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-CMpyUOHP.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/public-CxTEUtHk.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-BUyx8J9v.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-D8AXO2P3.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-Cf2K-lpF.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/files_downloadlimit-admin.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-Bq0RCCFR.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/public-zhEz8dws.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-Nq82XZTU.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-C9gKQ6Ah.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue_export-helper-Xyl-K0cr.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-BWB_zmVw.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/_plugin-vue2_normalizer-D-kqUg8q.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/public-C7_-Vvpe.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/main-B-rC9FPb.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/css/admin-JApGFxpb.chunk.css
  inflating: nextcloud/apps/files_downloadlimit/composer.json
  inflating: nextcloud/apps/files_downloadlimit/package.json
  inflating: nextcloud/apps/files_downloadlimit/LICENSE
  inflating: nextcloud/apps/files_downloadlimit/eslint.config.js
   creating: nextcloud/apps/files_downloadlimit/vendor-bin/
   creating: nextcloud/apps/files_downloadlimit/vendor-bin/psalm/
  inflating: nextcloud/apps/files_downloadlimit/vendor-bin/psalm/composer.lock
  inflating: nextcloud/apps/files_downloadlimit/vendor-bin/psalm/composer.json
   creating: nextcloud/apps/files_downloadlimit/LICENSES/
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/MIT.txt
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/CC0-1.0.txt
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/GPL-3.0-or-later.txt
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/AGPL-3.0-or-later.txt
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/MPL-2.0.txt
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/ISC.txt
  inflating: nextcloud/apps/files_downloadlimit/LICENSES/Apache-2.0.txt
   creating: nextcloud/apps/files_downloadlimit/appinfo/
  inflating: nextcloud/apps/files_downloadlimit/appinfo/info.xml
  inflating: nextcloud/apps/files_downloadlimit/appinfo/routes.php
  inflating: nextcloud/apps/files_downloadlimit/appinfo/signature.json
   creating: nextcloud/apps/privacy/
   creating: nextcloud/apps/privacy/js/
  inflating: nextcloud/apps/privacy/js/privacy-node_modules_nextcloud_dialogs_dist_chunks_index-C1azEbgd_mjs.js.map
  inflating: nextcloud/apps/privacy/js/privacy-node_modules_nextcloud_dialogs_dist_chunks_index-C1azEbgd_mjs.js.license
  inflating: nextcloud/apps/privacy/js/privacy-node_modules_nextcloud_dialogs_dist_chunks_index-C1azEbgd_mjs.js
  inflating: nextcloud/apps/privacy/js/privacy-vendors-node_modules_nextcloud_dialogs_dist_chunks_FilePicker-CDU2njOJ_mjs.js.license
  inflating: nextcloud/apps/privacy/js/privacy-vendors-node_modules_nextcloud_dialogs_dist_chunks_FilePicker-CDU2njOJ_mjs.js.map
  inflating: nextcloud/apps/privacy/js/privacy-main.js.map
  inflating: nextcloud/apps/privacy/js/privacy-data_image_svg_xml_3c_21--_20-_20SPDX-FileCopyrightText_202020_20Google_20Inc_20-_20SPDX-Lice-cc29b1.js
  inflating: nextcloud/apps/privacy/js/privacy-main.js
  inflating: nextcloud/apps/privacy/js/privacy-main.js.license
  inflating: nextcloud/apps/privacy/js/privacy-vendors-node_modules_nextcloud_dialogs_dist_chunks_FilePicker-CDU2njOJ_mjs.js
  inflating: nextcloud/apps/privacy/AUTHORS.md
   creating: nextcloud/apps/privacy/l10n/
  inflating: nextcloud/apps/privacy/l10n/sr.json
  inflating: nextcloud/apps/privacy/l10n/sl.json
  inflating: nextcloud/apps/privacy/l10n/nn_NO.json
  inflating: nextcloud/apps/privacy/l10n/et_EE.js
  inflating: nextcloud/apps/privacy/l10n/hr.js
  inflating: nextcloud/apps/privacy/l10n/zh_TW.json
  inflating: nextcloud/apps/privacy/l10n/ug.json
  inflating: nextcloud/apps/privacy/l10n/lo.js
  inflating: nextcloud/apps/privacy/l10n/en_GB.json
  inflating: nextcloud/apps/privacy/l10n/bg.js
  inflating: nextcloud/apps/privacy/l10n/sk.json
  inflating: nextcloud/apps/privacy/l10n/gl.json
  inflating: nextcloud/apps/privacy/l10n/tr.json
  inflating: nextcloud/apps/privacy/l10n/ug.js
  inflating: nextcloud/apps/privacy/l10n/fa.json
  inflating: nextcloud/apps/privacy/l10n/en_GB.js
  inflating: nextcloud/apps/privacy/l10n/es_EC.js
  inflating: nextcloud/apps/privacy/l10n/tr.js
  inflating: nextcloud/apps/privacy/l10n/vi.js
  inflating: nextcloud/apps/privacy/l10n/de.json
  inflating: nextcloud/apps/privacy/l10n/ka.json
  inflating: nextcloud/apps/privacy/l10n/oc.json
  inflating: nextcloud/apps/privacy/l10n/es_MX.js
  inflating: nextcloud/apps/privacy/l10n/lv.js
  inflating: nextcloud/apps/privacy/l10n/sr.js
  inflating: nextcloud/apps/privacy/l10n/lt_LT.js
  inflating: nextcloud/apps/privacy/l10n/nb.js
  inflating: nextcloud/apps/privacy/l10n/be.json
  inflating: nextcloud/apps/privacy/l10n/uk.js
  inflating: nextcloud/apps/privacy/l10n/zh_HK.js
  inflating: nextcloud/apps/privacy/l10n/nn_NO.js
  inflating: nextcloud/apps/privacy/l10n/ca.js
  inflating: nextcloud/apps/privacy/l10n/fa.js
  inflating: nextcloud/apps/privacy/l10n/es.json
  inflating: nextcloud/apps/privacy/l10n/sv.json
  inflating: nextcloud/apps/privacy/l10n/ru.json
  inflating: nextcloud/apps/privacy/l10n/da.json
  inflating: nextcloud/apps/privacy/l10n/he.json
  inflating: nextcloud/apps/privacy/l10n/sl.js
  inflating: nextcloud/apps/privacy/l10n/ro.js
  inflating: nextcloud/apps/privacy/l10n/ka.js
  inflating: nextcloud/apps/privacy/l10n/zh_HK.json
  inflating: nextcloud/apps/privacy/l10n/de_DE.js
  inflating: nextcloud/apps/privacy/l10n/it.json
  inflating: nextcloud/apps/privacy/l10n/mk.js
  inflating: nextcloud/apps/privacy/l10n/br.json
  inflating: nextcloud/apps/privacy/l10n/zh_CN.json
  inflating: nextcloud/apps/privacy/l10n/sc.js
  inflating: nextcloud/apps/privacy/l10n/gl.js
  inflating: nextcloud/apps/privacy/l10n/uz.json
  inflating: nextcloud/apps/privacy/l10n/ar.json
  inflating: nextcloud/apps/privacy/l10n/cs.js
  inflating: nextcloud/apps/privacy/l10n/af.js
  inflating: nextcloud/apps/privacy/l10n/lt_LT.json
  inflating: nextcloud/apps/privacy/l10n/da.js
  inflating: nextcloud/apps/privacy/l10n/mk.json
  inflating: nextcloud/apps/privacy/l10n/sc.json
  inflating: nextcloud/apps/privacy/l10n/hu.json
  inflating: nextcloud/apps/privacy/l10n/ko.json
  inflating: nextcloud/apps/privacy/l10n/sw.js
  inflating: nextcloud/apps/privacy/l10n/nl.json
  inflating: nextcloud/apps/privacy/l10n/lv.json
  inflating: nextcloud/apps/privacy/l10n/cs.json
  inflating: nextcloud/apps/privacy/l10n/hu.js
  inflating: nextcloud/apps/privacy/l10n/ja.js
  inflating: nextcloud/apps/privacy/l10n/af.json
  inflating: nextcloud/apps/privacy/l10n/eo.json
  inflating: nextcloud/apps/privacy/l10n/is.json
  inflating: nextcloud/apps/privacy/l10n/hr.json
  inflating: nextcloud/apps/privacy/l10n/ast.js
  inflating: nextcloud/apps/privacy/l10n/sk.js
  inflating: nextcloud/apps/privacy/l10n/lo.json
  inflating: nextcloud/apps/privacy/l10n/zh_CN.js
  inflating: nextcloud/apps/privacy/l10n/et_EE.json
  inflating: nextcloud/apps/privacy/l10n/pt_PT.js
  inflating: nextcloud/apps/privacy/l10n/de_DE.json
  inflating: nextcloud/apps/privacy/l10n/oc.js
  inflating: nextcloud/apps/privacy/l10n/sq.js
  inflating: nextcloud/apps/privacy/l10n/pt_BR.js
  inflating: nextcloud/apps/privacy/l10n/he.js
  inflating: nextcloud/apps/privacy/l10n/eu.json
  inflating: nextcloud/apps/privacy/l10n/ga.json
  inflating: nextcloud/apps/privacy/l10n/sq.json
  inflating: nextcloud/apps/privacy/l10n/fr.js
  inflating: nextcloud/apps/privacy/l10n/fi.json
  inflating: nextcloud/apps/privacy/l10n/ko.js
  inflating: nextcloud/apps/privacy/l10n/bg.json
  inflating: nextcloud/apps/privacy/l10n/eo.js
  inflating: nextcloud/apps/privacy/l10n/pl.js
  inflating: nextcloud/apps/privacy/l10n/vi.json
  inflating: nextcloud/apps/privacy/l10n/id.json
  inflating: nextcloud/apps/privacy/l10n/nb.json
  inflating: nextcloud/apps/privacy/l10n/ar.js
  inflating: nextcloud/apps/privacy/l10n/pl.json
  inflating: nextcloud/apps/privacy/l10n/el.json
  inflating: nextcloud/apps/privacy/l10n/br.js
  inflating: nextcloud/apps/privacy/l10n/zh_TW.js
  inflating: nextcloud/apps/privacy/l10n/be.js
  inflating: nextcloud/apps/privacy/l10n/nl.js
  inflating: nextcloud/apps/privacy/l10n/es_MX.json
  inflating: nextcloud/apps/privacy/l10n/el.js
  inflating: nextcloud/apps/privacy/l10n/id.js
  inflating: nextcloud/apps/privacy/l10n/pt_PT.json
  inflating: nextcloud/apps/privacy/l10n/fr.json
  inflating: nextcloud/apps/privacy/l10n/sw.json
  inflating: nextcloud/apps/privacy/l10n/es_EC.json
  inflating: nextcloud/apps/privacy/l10n/ga.js
  inflating: nextcloud/apps/privacy/l10n/it.js
  inflating: nextcloud/apps/privacy/l10n/ast.json
  inflating: nextcloud/apps/privacy/l10n/pt_BR.json
  inflating: nextcloud/apps/privacy/l10n/es.js
  inflating: nextcloud/apps/privacy/l10n/de.js
  inflating: nextcloud/apps/privacy/l10n/ca.json
  inflating: nextcloud/apps/privacy/l10n/uz.js
  inflating: nextcloud/apps/privacy/l10n/ja.json
  inflating: nextcloud/apps/privacy/l10n/eu.js
  inflating: nextcloud/apps/privacy/l10n/is.js
  inflating: nextcloud/apps/privacy/l10n/fi.js
  inflating: nextcloud/apps/privacy/l10n/ru.js
  inflating: nextcloud/apps/privacy/l10n/sv.js
  inflating: nextcloud/apps/privacy/l10n/ro.json
  inflating: nextcloud/apps/privacy/l10n/uk.json
  inflating: nextcloud/apps/privacy/composer.lock
   creating: nextcloud/apps/privacy/img/
  inflating: nextcloud/apps/privacy/img/app.svg
  inflating: nextcloud/apps/privacy/img/knowledge.svg
  inflating: nextcloud/apps/privacy/img/freedom.svg
  inflating: nextcloud/apps/privacy/img/app-dark.svg
  inflating: nextcloud/apps/privacy/img/control.svg
  inflating: nextcloud/apps/privacy/package-lock.json
  inflating: nextcloud/apps/privacy/REUSE.toml
   creating: nextcloud/apps/privacy/lib/
   creating: nextcloud/apps/privacy/lib/Migration/
  inflating: nextcloud/apps/privacy/lib/Migration/Version100Date20190217131943.php
   creating: nextcloud/apps/privacy/lib/Settings/
  inflating: nextcloud/apps/privacy/lib/Settings/PrivacySection.php
  inflating: nextcloud/apps/privacy/lib/Settings/MissionSettings.php
  inflating: nextcloud/apps/privacy/lib/Settings/WhoHasAccessSettings.php
  inflating: nextcloud/apps/privacy/lib/Settings/WhereIsYourDataSettings.php
  inflating: nextcloud/apps/privacy/lib/Settings/UserDataManifestoSettings.php
   creating: nextcloud/apps/privacy/lib/Controller/
  inflating: nextcloud/apps/privacy/lib/Controller/AdminController.php
  inflating: nextcloud/apps/privacy/lib/Controller/PersonalController.php
   creating: nextcloud/apps/privacy/templates/
  inflating: nextcloud/apps/privacy/templates/mission.php
  inflating: nextcloud/apps/privacy/templates/where-is-your-data.php
  inflating: nextcloud/apps/privacy/templates/who-has-access.php
  inflating: nextcloud/apps/privacy/templates/user-data-manifesto.php
  inflating: nextcloud/apps/privacy/composer.json
  inflating: nextcloud/apps/privacy/package.json
  inflating: nextcloud/apps/privacy/COPYING
   creating: nextcloud/apps/privacy/LICENSES/
  inflating: nextcloud/apps/privacy/LICENSES/MIT.txt
  inflating: nextcloud/apps/privacy/LICENSES/CC0-1.0.txt
  inflating: nextcloud/apps/privacy/LICENSES/BSD-2-Clause.txt
  inflating: nextcloud/apps/privacy/LICENSES/GPL-3.0-or-later.txt
  inflating: nextcloud/apps/privacy/LICENSES/AGPL-3.0-or-later.txt
  inflating: nextcloud/apps/privacy/LICENSES/MPL-2.0.txt
  inflating: nextcloud/apps/privacy/LICENSES/BSD-3-Clause.txt
  inflating: nextcloud/apps/privacy/LICENSES/ISC.txt
  inflating: nextcloud/apps/privacy/LICENSES/Apache-2.0.txt
   creating: nextcloud/apps/privacy/appinfo/
  inflating: nextcloud/apps/privacy/appinfo/info.xml
  inflating: nextcloud/apps/privacy/appinfo/routes.php
  inflating: nextcloud/apps/privacy/appinfo/signature.json
  inflating: nextcloud/.user.ini
  inflating: nextcloud/public.php
   creating: nextcloud/3rdparty/
   creating: nextcloud/3rdparty/composer/
  inflating: nextcloud/3rdparty/composer/autoload_files.php
  inflating: nextcloud/3rdparty/composer/platform_check.php
  inflating: nextcloud/3rdparty/composer/include_paths.php
  inflating: nextcloud/3rdparty/composer/autoload_namespaces.php
  inflating: nextcloud/3rdparty/composer/ClassLoader.php
  inflating: nextcloud/3rdparty/composer/autoload_real.php
  inflating: nextcloud/3rdparty/composer/autoload_classmap.php
  inflating: nextcloud/3rdparty/composer/installed.php
  inflating: nextcloud/3rdparty/composer/InstalledVersions.php
  inflating: nextcloud/3rdparty/composer/autoload_static.php
  inflating: nextcloud/3rdparty/composer/LICENSE
  inflating: nextcloud/3rdparty/composer/installed.json
  inflating: nextcloud/3rdparty/composer/autoload_psr4.php
   creating: nextcloud/3rdparty/ralouphie/
   creating: nextcloud/3rdparty/ralouphie/getallheaders/
   creating: nextcloud/3rdparty/ralouphie/getallheaders/src/
  inflating: nextcloud/3rdparty/ralouphie/getallheaders/src/getallheaders.php
  inflating: nextcloud/3rdparty/ralouphie/getallheaders/LICENSE
   creating: nextcloud/3rdparty/marc-mabe/
   creating: nextcloud/3rdparty/marc-mabe/php-enum/
   creating: nextcloud/3rdparty/marc-mabe/php-enum/src/
  inflating: nextcloud/3rdparty/marc-mabe/php-enum/src/EnumSet.php
  inflating: nextcloud/3rdparty/marc-mabe/php-enum/src/EnumMap.php
  inflating: nextcloud/3rdparty/marc-mabe/php-enum/src/Enum.php
  inflating: nextcloud/3rdparty/marc-mabe/php-enum/src/EnumSerializableTrait.php
  inflating: nextcloud/3rdparty/marc-mabe/php-enum/LICENSE.txt
   creating: nextcloud/3rdparty/marc-mabe/php-enum/stubs/
  inflating: nextcloud/3rdparty/marc-mabe/php-enum/stubs/Stringable.php
   creating: nextcloud/3rdparty/wapmorgan/
   creating: nextcloud/3rdparty/wapmorgan/mp3info/
   creating: nextcloud/3rdparty/wapmorgan/mp3info/src/
  inflating: nextcloud/3rdparty/wapmorgan/mp3info/src/Mp3Info.php
  inflating: nextcloud/3rdparty/wapmorgan/mp3info/LICENSE
   creating: nextcloud/3rdparty/wapmorgan/mp3info/data/
  inflating: nextcloud/3rdparty/wapmorgan/mp3info/data/bitRateTable.php
  inflating: nextcloud/3rdparty/wapmorgan/mp3info/data/sampleRateTable.php
  inflating: nextcloud/3rdparty/wapmorgan/mp3info/PATCHES.txt
   creating: nextcloud/3rdparty/mexitek/
   creating: nextcloud/3rdparty/mexitek/phpcolors/
   creating: nextcloud/3rdparty/mexitek/phpcolors/src/
   creating: nextcloud/3rdparty/mexitek/phpcolors/src/Mexitek/
   creating: nextcloud/3rdparty/mexitek/phpcolors/src/Mexitek/PHPColors/
  inflating: nextcloud/3rdparty/mexitek/phpcolors/src/Mexitek/PHPColors/Color.php
  inflating: nextcloud/3rdparty/mexitek/phpcolors/LICENSE
   creating: nextcloud/3rdparty/giggsey/
   creating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/
   creating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/MultiFileMetadataSourceImpl.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/CountryCodeToRegionCodeMap.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/ValidationResult.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/ShortNumberInfo.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/NumberFormat.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/NumberParseException.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneNumberDesc.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/MetadataSourceInterface.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneNumberFormat.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/ShortNumberCost.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneNumber.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/RegexBasedMatcher.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneNumberType.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneMetadata.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/Matcher.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneNumberMatch.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/MatcherAPIInterface.php
   creating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_JO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_EH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_RW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_US.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_HR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_HU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_FK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ZM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_UA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_XK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_JP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_FJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_DZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_808.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_HK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_RO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_FI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_DK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_DJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_FO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_OM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ER.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_UA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_RS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_878.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_DJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_FR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_JO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_DZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_XK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_UG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_EG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_HN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ZM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ID.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_YT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_QA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_OM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_888.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ZW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_WF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_RO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_979.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_US.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_FI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_YT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ES.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ET.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_EH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ES.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ST.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_HU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_DM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_HK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_RS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_FM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_UY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_UZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_HT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_DM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_881.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_FK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_882.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_RW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_JE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ER.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_RU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_YE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ME.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_EC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_FR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_UZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_DE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_883.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ZA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_DE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_UG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_UY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_JM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ET.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_WS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_800.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ML.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_HT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_FO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_RE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_FM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ZA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_VI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_HN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_YE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NI.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ID.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_ML.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_EE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_HR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_JE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_FJ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_DO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_DO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_AG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ME.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ZW.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_KG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_QA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_KH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_RE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_JP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_GT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_BG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TD.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CH.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_WF.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_GL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_EC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_LB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_SG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_IS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_EE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_870.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_TZ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_DK.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_PL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_CR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MY.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MX.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_RU.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_LT.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_CL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AO.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_NP.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_PA.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_WS.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_IN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_JM.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_SB.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_MV.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_ST.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_EG.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_BQ.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_AR.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TN.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_VC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_NE.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/PhoneNumberMetadata_MC.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/data/ShortNumberMetadata_TL.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/ShortNumbersRegionCodeSet.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/PhoneNumberUtil.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/CountryCodeSource.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/src/MatchType.php
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/LICENSE.txt
  inflating: nextcloud/3rdparty/giggsey/libphonenumber-for-php-lite/METADATA-VERSION.php
   creating: nextcloud/3rdparty/phpseclib/
   creating: nextcloud/3rdparty/phpseclib/phpseclib/
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/Blowfish.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/Random.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/Base.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/Twofish.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/AES.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/Hash.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/DES.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/RSA.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/Rijndael.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/RC2.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/TripleDES.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Crypt/RC4.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/bootstrap.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/openssl.cnf
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/SSH1.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/SSH2.php
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/SFTP/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/SFTP/Stream.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/SCP.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Net/SFTP.php
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Math/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/Math/BigInteger.php
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/System/
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/System/SSH/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/System/SSH/Agent.php
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/System/SSH/Agent/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/System/SSH/Agent/Identity.php
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/File/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/File/ANSI.php
   creating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/File/ASN1/
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/File/ASN1/Element.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/File/ASN1.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/phpseclib/File/X509.php
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/AUTHORS
  inflating: nextcloud/3rdparty/phpseclib/phpseclib/LICENSE
  inflating: nextcloud/3rdparty/composer.lock
   creating: nextcloud/3rdparty/psr/
   creating: nextcloud/3rdparty/psr/event-dispatcher/
   creating: nextcloud/3rdparty/psr/event-dispatcher/src/
  inflating: nextcloud/3rdparty/psr/event-dispatcher/src/EventDispatcherInterface.php
  inflating: nextcloud/3rdparty/psr/event-dispatcher/src/StoppableEventInterface.php
  inflating: nextcloud/3rdparty/psr/event-dispatcher/src/ListenerProviderInterface.php
  inflating: nextcloud/3rdparty/psr/event-dispatcher/LICENSE
   creating: nextcloud/3rdparty/psr/http-client/
   creating: nextcloud/3rdparty/psr/http-client/src/
  inflating: nextcloud/3rdparty/psr/http-client/src/RequestExceptionInterface.php
  inflating: nextcloud/3rdparty/psr/http-client/src/NetworkExceptionInterface.php
  inflating: nextcloud/3rdparty/psr/http-client/src/ClientInterface.php
  inflating: nextcloud/3rdparty/psr/http-client/src/ClientExceptionInterface.php
  inflating: nextcloud/3rdparty/psr/http-client/LICENSE
   creating: nextcloud/3rdparty/psr/clock/
   creating: nextcloud/3rdparty/psr/clock/src/
  inflating: nextcloud/3rdparty/psr/clock/src/ClockInterface.php
  inflating: nextcloud/3rdparty/psr/clock/LICENSE
   creating: nextcloud/3rdparty/psr/http-message/
   creating: nextcloud/3rdparty/psr/http-message/src/
  inflating: nextcloud/3rdparty/psr/http-message/src/MessageInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/src/ServerRequestInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/src/UriInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/src/RequestInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/src/StreamInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/src/UploadedFileInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/src/ResponseInterface.php
  inflating: nextcloud/3rdparty/psr/http-message/LICENSE
   creating: nextcloud/3rdparty/psr/cache/
   creating: nextcloud/3rdparty/psr/cache/src/
  inflating: nextcloud/3rdparty/psr/cache/src/CacheItemPoolInterface.php
  inflating: nextcloud/3rdparty/psr/cache/src/CacheItemInterface.php
  inflating: nextcloud/3rdparty/psr/cache/src/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/psr/cache/src/CacheException.php
  inflating: nextcloud/3rdparty/psr/cache/LICENSE.txt
   creating: nextcloud/3rdparty/psr/container/
   creating: nextcloud/3rdparty/psr/container/src/
  inflating: nextcloud/3rdparty/psr/container/src/ContainerExceptionInterface.php
  inflating: nextcloud/3rdparty/psr/container/src/ContainerInterface.php
  inflating: nextcloud/3rdparty/psr/container/src/NotFoundExceptionInterface.php
  inflating: nextcloud/3rdparty/psr/container/LICENSE
   creating: nextcloud/3rdparty/psr/log/
   creating: nextcloud/3rdparty/psr/log/src/
  inflating: nextcloud/3rdparty/psr/log/src/LoggerInterface.php
  inflating: nextcloud/3rdparty/psr/log/src/LogLevel.php
  inflating: nextcloud/3rdparty/psr/log/src/NullLogger.php
  inflating: nextcloud/3rdparty/psr/log/src/LoggerAwareInterface.php
  inflating: nextcloud/3rdparty/psr/log/src/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/psr/log/src/AbstractLogger.php
  inflating: nextcloud/3rdparty/psr/log/src/LoggerAwareTrait.php
  inflating: nextcloud/3rdparty/psr/log/src/LoggerTrait.php
  inflating: nextcloud/3rdparty/psr/log/LICENSE
   creating: nextcloud/3rdparty/psr/http-factory/
   creating: nextcloud/3rdparty/psr/http-factory/src/
  inflating: nextcloud/3rdparty/psr/http-factory/src/UriFactoryInterface.php
  inflating: nextcloud/3rdparty/psr/http-factory/src/UploadedFileFactoryInterface.php
  inflating: nextcloud/3rdparty/psr/http-factory/src/StreamFactoryInterface.php
  inflating: nextcloud/3rdparty/psr/http-factory/src/RequestFactoryInterface.php
  inflating: nextcloud/3rdparty/psr/http-factory/src/ServerRequestFactoryInterface.php
  inflating: nextcloud/3rdparty/psr/http-factory/src/ResponseFactoryInterface.php
  inflating: nextcloud/3rdparty/psr/http-factory/LICENSE
   creating: nextcloud/3rdparty/fusonic/
   creating: nextcloud/3rdparty/fusonic/opengraph/
   creating: nextcloud/3rdparty/fusonic/opengraph/src/
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Consumer.php
   creating: nextcloud/3rdparty/fusonic/opengraph/src/Elements/
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Elements/Image.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Elements/Audio.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Elements/Video.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Elements/ElementBase.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Publisher.php
   creating: nextcloud/3rdparty/fusonic/opengraph/src/Objects/
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Objects/Website.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Objects/ObjectBase.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/src/Property.php
  inflating: nextcloud/3rdparty/fusonic/opengraph/LICENSE
   creating: nextcloud/3rdparty/web-auth/
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Counter/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Counter/CounterChecker.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Counter/ThrowExceptionIfInvalid.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/FakeCredentialGenerator.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CertificateChainChecker/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CertificateChainChecker/PhpCertificateChainChecker.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CertificateChainChecker/CertificateChainChecker.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/StringStream.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredential.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorDataLoader.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/WebauthnException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/InvalidCertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/MissingMetadataStatementException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/InvalidAttestationStatementException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/InvalidTrustPathException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/CertificateRevocationListException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/AuthenticatorResponseVerificationException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/AttestationStatementLoadingException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/AttestationStatementVerificationException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/MetadataServiceException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/CertificateChainException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/InvalidDataException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/CounterException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/MetadataStatementException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/UnsupportedFeatureException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/CertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/MetadataStatementLoadingException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/AttestationStatementException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/ExpiredCertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/InvalidUserHandleException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/RevokedCertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Exception/AuthenticationExtensionException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialSourceRepository.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorData.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialOptions.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialCreationOptions.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/SimpleFakeCredentialGenerator.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorSelectionCriteria.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialRpEntity.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialSource.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorAssertionResponseValidator.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/AuthenticationExtensions.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/AuthenticationExtension.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/ExtensionOutputError.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/AuthenticationExtensionsClientInputs.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/AuthenticationExtensionsClientOutputsLoader.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/ExtensionOutputChecker.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/AuthenticationExtensionsClientOutputs.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticationExtensions/ExtensionOutputCheckerHandler.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckUserVerification.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckUserWasPresent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckChallenge.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckCredentialId.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/TopOriginValidator.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckUserHandle.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CeremonyStepManagerFactory.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckHasAttestedCredentialData.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CeremonyStepManager.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckMetadataStatement.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckExtensions.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckAllowedCredentialList.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CeremonyStep.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckAttestationFormatIsKnownAndValid.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckRelyingPartyIdIdHash.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckSignature.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckAlgorithm.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckBackupBitsAreConsistent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckOrigin.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/HostTopOriginValidator.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckClientDataCollectorType.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckCounter.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CeremonyStep/CheckTopOrigin.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Credential.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TrustPath/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TrustPath/TrustPathLoader.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TrustPath/TrustPath.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TrustPath/EmptyTrustPath.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TrustPath/CertificateTrustPath.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TrustPath/EcdaaKeyIdTrustPath.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorAttestationResponseValidator.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialLoader.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CertificateToolbox.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/CollectedClientData.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorResponse.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialRequestOptions.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialEntity.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/U2FPublicKey.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorAssertionResponse.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialDescriptorCollection.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialParameters.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialUserEntity.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/CertificateChainValidationFailed.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/NullEventDispatcher.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/AuthenticatorAttestationResponseValidationSucceededEvent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/AuthenticatorAssertionResponseValidationFailedEvent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/CertificateChainValidationSucceeded.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/BeforeCertificateChainValidation.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/AttestationObjectLoaded.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/AuthenticatorAttestationResponseValidationFailedEvent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/WebauthnEvent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/AuthenticatorAssertionResponseValidationSucceededEvent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/AttestationStatementLoaded.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/MetadataStatementFound.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Event/CanDispatchEvents.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/MetadataStatementRepository.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/InvalidCertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/MissingMetadataStatementException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/CertificateRevocationListException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/MetadataServiceException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/CertificateChainException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/MetadataStatementException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/CertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/MetadataStatementLoadingException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/ExpiredCertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Exception/RevokedCertificateException.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Psr18HttpClient.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/ValueFilter.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/CertificateChain/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/CertificateChain/PhpCertificateChainValidator.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/CertificateChain/CertificateToolbox.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/CertificateChain/CertificateChainValidator.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/InMemoryMetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/JsonMetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/ChainedMetadataServices.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/MetadataBLOBPayloadEntry.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/StringMetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/MetadataBLOBPayload.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/LocalResourceMetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/MetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/FolderResourceMetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/DistantResourceMetadataService.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Service/FidoAllianceCompliantMetadataService.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/AlternativeDescriptions.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/StatusReport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/AuthenticatorStatus.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/EcdaaTrustAnchor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/PatternAccuracyDescriptor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/RgbPaletteEntry.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/MetadataStatement.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/DisplayPNGCharacteristicsDescriptor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/VerificationMethodANDCombinations.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/BiometricStatusReport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/CodeAccuracyDescriptor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/RogueListEntry.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/ExtensionDescriptor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/Version.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/AuthenticatorGetInfo.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/AbstractDescriptor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/VerificationMethodDescriptor.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Statement/BiometricAccuracyDescriptor.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/CertificateChainValidationFailed.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/NullEventDispatcher.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/CertificateChainValidationSucceeded.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/BeforeCertificateChainValidation.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/WebauthnEvent.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/MetadataStatementFound.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Event/CanDispatchEvents.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/CanLogData.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/StatusReportRepository.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Denormalizer/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Denormalizer/MetadataStatementSerializerFactory.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/MetadataService/Denormalizer/ExtensionDescriptorDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AuthenticatorAttestationResponse.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/PublicKeyCredentialDescriptor.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Util/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Util/Base64.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Util/CoseSignatureFixer.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/PackedAttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AndroidSafetyNetAttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/NoneAttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AttestationStatement.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AndroidKeyAttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/FidoU2FAttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AttestationStatementSupportManager.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AttestationObjectLoader.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AttestationObject.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/TPMAttestationStatementSupport.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestationStatement/AppleAttestationStatementSupport.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/ClientDataCollector/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/ClientDataCollector/WebauthnAuthenticationCollector.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/ClientDataCollector/ClientDataCollectorManager.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/ClientDataCollector/ClientDataCollector.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/AttestedCredentialData.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TokenBinding/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TokenBinding/IgnoreTokenBindingHandler.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TokenBinding/TokenBindingHandler.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TokenBinding/TokenBindingNotSupportedHandler.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TokenBinding/SecTokenBindingHandler.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/TokenBinding/TokenBinding.php
   creating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AttestationStatementDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/PublicKeyCredentialDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/PublicKeyCredentialParametersDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/CollectedClientDataDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/PublicKeyCredentialDescriptorNormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AuthenticatorAttestationResponseDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AuthenticationExtensionNormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/PublicKeyCredentialOptionsDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/TrustPathDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AuthenticationExtensionsDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AttestationObjectDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/WebauthnSerializerFactory.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AuthenticatorAssertionResponseDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/VerificationMethodANDCombinationsDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AttestedCredentialDataNormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/ExtensionDescriptorDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/PublicKeyCredentialSourceDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AuthenticatorResponseDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/PublicKeyCredentialUserEntityDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/src/Denormalizer/AuthenticatorDataDenormalizer.php
  inflating: nextcloud/3rdparty/web-auth/webauthn-lib/LICENSE
   creating: nextcloud/3rdparty/web-auth/cose-lib/
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Key/
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Key/Ec2Key.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Key/OkpKey.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Key/RsaKey.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Key/SymmetricKey.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Key/Key.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithms.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/BigInteger.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Hash.php
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/ES384.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/ECSignature.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/ES256.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/ES256K.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/ECDSA.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/ECDSA/ES512.php
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/RS512.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/RS256.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/PSSRSA.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/RS384.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/PS384.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/RSA.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/PS256.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/PS512.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/RSA/RS1.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/Signature.php
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/EdDSA/
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/EdDSA/EdDSA.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/EdDSA/Ed256.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/EdDSA/Ed25519.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Signature/EdDSA/Ed512.php
   creating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/HS256.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/Mac.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/HS256Truncated64.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/HS512.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/Hmac.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Mac/HS384.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Algorithm.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/Manager.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/src/Algorithm/ManagerFactory.php
  inflating: nextcloud/3rdparty/web-auth/cose-lib/LICENSE
   creating: nextcloud/3rdparty/doctrine/
   creating: nextcloud/3rdparty/doctrine/lexer/
   creating: nextcloud/3rdparty/doctrine/lexer/src/
  inflating: nextcloud/3rdparty/doctrine/lexer/src/Token.php
  inflating: nextcloud/3rdparty/doctrine/lexer/src/AbstractLexer.php
  inflating: nextcloud/3rdparty/doctrine/lexer/LICENSE
   creating: nextcloud/3rdparty/doctrine/deprecations/
   creating: nextcloud/3rdparty/doctrine/deprecations/src/
  inflating: nextcloud/3rdparty/doctrine/deprecations/src/Deprecation.php
   creating: nextcloud/3rdparty/doctrine/deprecations/src/PHPUnit/
  inflating: nextcloud/3rdparty/doctrine/deprecations/src/PHPUnit/VerifyDeprecations.php
  inflating: nextcloud/3rdparty/doctrine/deprecations/LICENSE
   creating: nextcloud/3rdparty/doctrine/dbal/
   creating: nextcloud/3rdparty/doctrine/dbal/src/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Tools/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/ConnectionProvider/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/ConnectionProvider/SingleConnectionProvider.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/ConnectionProvider.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/Command/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/Command/CommandCompatibility.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/Command/ReservedWordsCommand.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/Command/RunSqlCommand.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/ConsoleRunner.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/Console/ConnectionNotFound.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Tools/DsnParser.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Cache/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Cache/QueryCacheProfile.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Cache/ArrayResult.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Cache/CacheException.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/TableExistsException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/TransactionRolledBack.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/UniqueConstraintViolationException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/SyntaxErrorException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/DriverException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/NotNullConstraintViolationException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/MalformedDsnException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/DatabaseObjectNotFoundException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/InvalidFieldNameException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/DeadlockException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/ConnectionLost.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/NoKeyValue.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/ConstraintViolationException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/ReadOnlyException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/DatabaseObjectExistsException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/RetryableException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/InvalidLockMode.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/ForeignKeyConstraintViolationException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/ConnectionException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/TableNotFoundException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/LockWaitTimeoutException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/NonUniqueFieldNameException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/ServerException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/DatabaseDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/SchemaDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception/DatabaseRequired.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Events.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/VersionAwarePlatformDriver.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/SQL/
   creating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Parser/
   creating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Parser/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Parser/Exception/RegularExpressionError.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Parser/Visitor.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Parser/Exception.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Parser.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Builder/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Builder/DropSchemaObjectsSQLBuilder.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Builder/CreateSchemaObjectsSQLBuilder.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Builder/DefaultSelectSQLBuilder.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/SQL/Builder/SelectSQLBuilder.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Id/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Id/TableGeneratorSchemaVisitor.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Id/TableGenerator.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/ArrayParameters/
   creating: nextcloud/3rdparty/doctrine/dbal/src/ArrayParameters/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ArrayParameters/Exception/MissingNamedParameter.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ArrayParameters/Exception/MissingPositionalParameter.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ArrayParameters/Exception.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Result.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Types/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/Types.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/ArrayType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/IntegerType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/BigIntType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/VarDateTimeImmutableType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/GuidType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/AsciiStringType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/TextType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/BinaryType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/StringType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/ObjectType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DecimalType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/BlobType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateImmutableType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateTimeImmutableType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/FloatType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/TimeType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateIntervalType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/JsonType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateTimeTzImmutableType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/SmallIntType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/PhpIntegerMappingType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/PhpDateTimeMappingType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/TimeImmutableType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateTimeTzType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/Type.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/ConversionException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/SimpleArrayType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/VarDateTimeType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/TypeRegistry.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/BooleanType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Types/DateTimeType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ParameterType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Connection.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Schema/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Column.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/DefaultSchemaManagerFactory.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/View.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/IndexNameInvalid.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/ColumnAlreadyExists.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/IndexDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/SequenceDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/SequenceAlreadyExists.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/ForeignKeyDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/InvalidTableName.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/TableDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/UnknownColumnOption.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/NamedForeignKeyRequired.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/NamespaceAlreadyExists.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/UniqueConstraintDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/ColumnDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/TableAlreadyExists.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Exception/IndexAlreadyExists.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/OracleSchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/DB2SchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/PostgreSQLSchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/AbstractSchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Comparator.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Index.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/Visitor.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/NamespaceVisitor.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/Graphviz.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/RemoveNamespacedAssets.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/CreateSchemaSqlCollector.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/DropSchemaSqlCollector.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Visitor/AbstractVisitor.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Identifier.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Table.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/AbstractAsset.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Constraint.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/SqliteSchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/ColumnDiff.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/SchemaDiff.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/ForeignKeyConstraint.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Sequence.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/UniqueConstraint.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/LegacySchemaManagerFactory.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/SchemaException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/TableDiff.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/MySQLSchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/SchemaManagerFactory.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/Schema.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/SchemaConfig.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Schema/SQLServerSchemaManager.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ArrayParameterType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ExpandArrayParameters.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL57Platform.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServer/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServer/SQL/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServer/SQL/Builder/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServer/SQL/Builder/SQLServerSelectSQLBuilder.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServer/Comparator.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/DB2Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/PostgreSQL120Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDb1043Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServerPlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLServer2012Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDb110700Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDb1010Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQLPlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/DateIntervalUnit.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL/CollationMetadataProvider.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL/Comparator.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL/CollationMetadataProvider/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL/CollationMetadataProvider/CachingCollationMetadataProvider.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL/CollationMetadataProvider/ConnectionCollationMetadataProvider.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/PostgreSQL100Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/OraclePlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/AbstractMySQLPlatform.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLite/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SQLite/Comparator.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDb1060Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDBPlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDb1052Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/SqlitePlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/PostgreSQL94Platform.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MySQL57Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/SQLiteKeywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/KeywordList.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/SQLServerKeywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/OracleKeywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MySQL80Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/PostgreSQL94Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MariaDBKeywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MySQLKeywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MariaDb102Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/ReservedKeywordsValidator.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/DB2Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/PostgreSQLKeywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/SQLServer2012Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/PostgreSQL100Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MySQL84Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/Keywords/MariaDb117Keywords.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/AbstractPlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/DB2111Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL80Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/PostgreSQLPlatform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/TrimMode.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MySQL84Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Platforms/MariaDb1027Platform.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/TransactionIsolationLevel.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ColumnCase.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/ConnectionException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/DriverManager.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Connections/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Connections/PrimaryReadReplicaConnection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Exception.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Configuration.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/LockMode.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Event/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Event/Listeners/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/Listeners/SQLSessionInit.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/Listeners/SQLiteSessionInit.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/Listeners/OracleSessionInit.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaColumnDefinitionEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/TransactionBeginEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaDropTableEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaCreateTableEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/TransactionEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaAlterTableAddColumnEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaAlterTableChangeColumnEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/ConnectionEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/TransactionRollBackEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaCreateTableColumnEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaIndexDefinitionEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaAlterTableRenameColumnEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaAlterTableRemoveColumnEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/SchemaAlterTableEventArgs.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Event/TransactionCommitEventArgs.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Query/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Query/Expression/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/Expression/CompositeExpression.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/Expression/ExpressionBuilder.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/Limit.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/ForUpdate.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Query/ForUpdate/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/ForUpdate/ConflictResolutionMode.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/QueryException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/QueryBuilder.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query/SelectQuery.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Query.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/ParameterTypeMap.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/Result.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/OCI/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/OCI/Driver.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/SQLSrv/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/SQLSrv/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/SQLSrv/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/SQLSrv/Statement.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/Connection.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/MySQL/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/MySQL/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/PDOConnect.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/SQLite/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/SQLite/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/Exception.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/PDOException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/Statement.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/PgSQL/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PDO/PgSQL/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/ServerInfoAwareConnection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/FetchUtils.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/ConnectionError.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/HostRequired.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/StatementError.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/ConnectionFailed.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/NonStreamResourceUsedAsLargeObject.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/InvalidOption.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/InvalidCharset.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Exception/FailedReadingStreamOffset.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Initializer.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Connection.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Initializer/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Initializer/Charset.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Initializer/Options.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Initializer/Secure.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Mysqli/Statement.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLServerDriver.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Exception/UnknownParameterType.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractException.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractOracleDriver.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/Exception/Error.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLSrv/Statement.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractOracleDriver/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractOracleDriver/EasyConnectString.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Connection.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/ExecutionMode.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/Error.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/SequenceDoesNotExist.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/ConnectionFailed.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/UnknownParameterIndex.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/InvalidConfiguration.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Exception/NonTerminatedStringLiteral.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/ConvertPositionalToNamedPlaceholders.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Middleware/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Middleware/InitializeSession.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/OCI8/Statement.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLServerDriver/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLServerDriver/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLServerDriver/Exception/PortWithoutHost.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLiteDriver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractMySQLDriver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Middleware.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLite3/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLite3/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLite3/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLite3/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLite3/Exception.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/SQLite3/Statement.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Exception.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLiteDriver/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLiteDriver/Middleware/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractSQLiteDriver/Middleware/EnableForeignKeys.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractDB2Driver.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Middleware/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Middleware/AbstractResultMiddleware.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Middleware/AbstractConnectionMiddleware.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Middleware/AbstractDriverMiddleware.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Middleware/AbstractStatementMiddleware.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/OCI/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/OCI/ExceptionConverter.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/SQLSrv/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/SQLSrv/ExceptionConverter.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/MySQL/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/MySQL/ExceptionConverter.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/PostgreSQL/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/PostgreSQL/ExceptionConverter.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/SQLite/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/SQLite/UserDefinedFunctions.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/SQLite/ExceptionConverter.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/ExceptionConverter.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/IBMDB2/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/API/IBMDB2/ExceptionConverter.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/Statement.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/AbstractPostgreSQLDriver.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Exception/UnexpectedValue.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Exception/UnknownParameter.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Exception.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/ConvertParameters.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/PgSQL/Statement.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/
   creating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/ConnectionError.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/Factory.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/StatementError.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/PrepareFailed.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/ConnectionFailed.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/CannotCreateTemporaryFile.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Exception/CannotCopyStreamToStream.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/Statement.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Driver/IBMDB2/DataSourceName.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Statement.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Logging/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/SQLLogger.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/LoggerChain.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/Middleware.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/DebugStack.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Logging/Statement.php
   creating: nextcloud/3rdparty/doctrine/dbal/src/Portability/
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/Result.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/Driver.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/Connection.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/Middleware.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/OptimizeFlags.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/Statement.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/Portability/Converter.php
  inflating: nextcloud/3rdparty/doctrine/dbal/src/FetchMode.php
  inflating: nextcloud/3rdparty/doctrine/dbal/LICENSE
   creating: nextcloud/3rdparty/doctrine/event-manager/
   creating: nextcloud/3rdparty/doctrine/event-manager/src/
  inflating: nextcloud/3rdparty/doctrine/event-manager/src/EventSubscriber.php
  inflating: nextcloud/3rdparty/doctrine/event-manager/src/EventManager.php
  inflating: nextcloud/3rdparty/doctrine/event-manager/src/EventArgs.php
  inflating: nextcloud/3rdparty/doctrine/event-manager/LICENSE
   creating: nextcloud/3rdparty/php-opencloud/
   creating: nextcloud/3rdparty/php-opencloud/openstack/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Image.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Host.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Flavor.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Keypair.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Hypervisor.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/HypervisorStatistic.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/AvailabilityZone.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/QuotaSet.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Limit.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Fault.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Models/Server.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Enum.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Compute/v2/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v3/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v3/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v3/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Models/Volume.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Models/VolumeAttachment.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Models/Snapshot.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Models/VolumeType.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Models/QuotaSet.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/BlockStorage/v2/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Models/Metric.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Models/Resource.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Models/ResourceType.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Metric/v1/Gnocchi/Api.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/OpenStack.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/JsonPatch.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Models/Member.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Models/Image.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Models/Schema.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Images/v2/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/OperatorTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/Operation.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/OperatorInterface.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/ApiInterface.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/Parameter.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/AbstractParams.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Api/AbstractApi.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/JsonPath.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Deletable.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/HasWaiterTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Listable.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/AbstractResource.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Updateable.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Iterator.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/HasMetadata.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Creatable.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/OperatorResource.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Alias.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/Retrievable.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Resource/ResourceInterface.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/JsonSchema/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/JsonSchema/JsonPatch.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/JsonSchema/Schema.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/Utils.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/HandlerStack.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/Serializable.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/Middleware.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/JsonSerializer.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/RequestSerializer.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Transport/HandlerStackFactory.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Service/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Service/ServiceInterface.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Service/Builder.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Service/AbstractService.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/HydratorStrategyTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/ArrayAccessTrait.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Auth/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Auth/Catalog.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Auth/Token.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Auth/AuthHandler.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Auth/IdentityService.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Error/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Error/UserInputError.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Error/BaseError.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Error/Builder.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Error/NotImplementedError.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Common/Error/BadResponseError.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Models/MetadataTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Models/Container.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Models/Account.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Models/StorageObject.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/ObjectStore/v1/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancerMember.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancerStat.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/InterfaceAttachment.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancerHealthMonitor.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancerListener.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancer.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/Network.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/Port.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/Quota.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/Subnet.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancerPool.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Models/LoadBalancerStatus.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Models/GatewayInfo.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Models/FloatingIp.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Models/Router.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Models/FixedIp.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/ParamsTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/ApiTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/ServiceTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/Layer3/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/Models/SecurityGroup.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/Models/SecurityGroupRule.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/ParamsTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/ApiTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/ServiceTrait.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Extensions/SecurityGroups/Api.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Networking/v2/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Catalog.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/ApplicationCredential.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Token.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Group.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Project.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Credential.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Endpoint.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Domain.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Assignment.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/User.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Role.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Models/Policy.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Enum.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Params.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v3/Api.php
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/
   creating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Models/
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Models/Catalog.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Models/Token.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Models/Endpoint.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Models/Entry.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Models/Tenant.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Service.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/src/Identity/v2/Api.php
  inflating: nextcloud/3rdparty/php-opencloud/openstack/LICENSE
   creating: nextcloud/3rdparty/pear/
   creating: nextcloud/3rdparty/pear/archive_tar/
  inflating: nextcloud/3rdparty/pear/archive_tar/package.xml
   creating: nextcloud/3rdparty/pear/archive_tar/Archive/
  inflating: nextcloud/3rdparty/pear/archive_tar/Archive/Tar.php
   creating: nextcloud/3rdparty/pear/pear-core-minimal/
   creating: nextcloud/3rdparty/pear/pear-core-minimal/src/
  inflating: nextcloud/3rdparty/pear/pear-core-minimal/src/System.php
   creating: nextcloud/3rdparty/pear/pear-core-minimal/src/OS/
  inflating: nextcloud/3rdparty/pear/pear-core-minimal/src/OS/Guess.php
   creating: nextcloud/3rdparty/pear/pear-core-minimal/src/PEAR/
  inflating: nextcloud/3rdparty/pear/pear-core-minimal/src/PEAR/ErrorStack.php
  inflating: nextcloud/3rdparty/pear/pear-core-minimal/src/PEAR.php
   creating: nextcloud/3rdparty/pear/pear_exception/
  inflating: nextcloud/3rdparty/pear/pear_exception/LICENSE
   creating: nextcloud/3rdparty/pear/pear_exception/PEAR/
  inflating: nextcloud/3rdparty/pear/pear_exception/PEAR/Exception.php
   creating: nextcloud/3rdparty/pear/console_getopt/
  inflating: nextcloud/3rdparty/pear/console_getopt/package.xml
  inflating: nextcloud/3rdparty/pear/console_getopt/LICENSE
   creating: nextcloud/3rdparty/pear/console_getopt/Console/
  inflating: nextcloud/3rdparty/pear/console_getopt/Console/Getopt.php
   creating: nextcloud/3rdparty/guzzlehttp/
   creating: nextcloud/3rdparty/guzzlehttp/promises/
   creating: nextcloud/3rdparty/guzzlehttp/promises/src/
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/Utils.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/TaskQueue.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/PromisorInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/TaskQueueInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/RejectionException.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/Each.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/EachPromise.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/Coroutine.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/Promise.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/Create.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/Is.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/RejectedPromise.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/FulfilledPromise.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/PromiseInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/AggregateException.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/src/CancellationException.php
  inflating: nextcloud/3rdparty/guzzlehttp/promises/LICENSE
   creating: nextcloud/3rdparty/guzzlehttp/guzzle/
   creating: nextcloud/3rdparty/guzzlehttp/guzzle/src/
   creating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Cookie/
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Cookie/CookieJar.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Cookie/FileCookieJar.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Cookie/SessionCookieJar.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Cookie/SetCookie.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Cookie/CookieJarInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/RetryMiddleware.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/MessageFormatter.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Utils.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/ClientTrait.php
   creating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/ClientException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/TooManyRedirectsException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/GuzzleException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/TransferException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/BadResponseException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/ConnectException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/ServerException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Exception/RequestException.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/functions_include.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Pool.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/HandlerStack.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/BodySummarizerInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/RequestOptions.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/BodySummarizer.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Middleware.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/MessageFormatterInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Client.php
   creating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/Proxy.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/MockHandler.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/CurlHandler.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/EasyHandle.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/CurlFactoryInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/StreamHandler.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/CurlMultiHandler.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/CurlFactory.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/Handler/HeaderProcessor.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/ClientInterface.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/PrepareBodyMiddleware.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/TransferStats.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/RedirectMiddleware.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/src/functions.php
  inflating: nextcloud/3rdparty/guzzlehttp/guzzle/LICENSE
   creating: nextcloud/3rdparty/guzzlehttp/uri-template/
   creating: nextcloud/3rdparty/guzzlehttp/uri-template/src/
  inflating: nextcloud/3rdparty/guzzlehttp/uri-template/src/UriTemplate.php
  inflating: nextcloud/3rdparty/guzzlehttp/uri-template/LICENSE
   creating: nextcloud/3rdparty/guzzlehttp/psr7/
   creating: nextcloud/3rdparty/guzzlehttp/psr7/src/
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Message.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/DroppingStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/MultipartStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Request.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Utils.php
   creating: nextcloud/3rdparty/guzzlehttp/psr7/src/Exception/
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Exception/MalformedUriException.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/UriComparator.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/MessageTrait.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Stream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/FnStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/HttpFactory.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/StreamDecoratorTrait.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/PumpStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/UriResolver.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/CachingStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/StreamWrapper.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Rfc7230.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Response.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/InflateStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/UriNormalizer.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/ServerRequest.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/AppendStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/BufferStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/LimitStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Query.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/LazyOpenStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/NoSeekStream.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/MimeType.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/UploadedFile.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Header.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/src/Uri.php
  inflating: nextcloud/3rdparty/guzzlehttp/psr7/LICENSE
   creating: nextcloud/3rdparty/.patches/
  inflating: nextcloud/3rdparty/.patches/mp3info-fix-incorrect-lookup-for-mpeg-header.patch
  inflating: nextcloud/3rdparty/.patches/mp3info-break-frame-parsing.patch
   creating: nextcloud/3rdparty/bantu/
   creating: nextcloud/3rdparty/bantu/ini-get-wrapper/
   creating: nextcloud/3rdparty/bantu/ini-get-wrapper/src/
  inflating: nextcloud/3rdparty/bantu/ini-get-wrapper/src/IniGetWrapper.php
  inflating: nextcloud/3rdparty/bantu/ini-get-wrapper/LICENSE
   creating: nextcloud/3rdparty/laravel/
   creating: nextcloud/3rdparty/laravel/serializable-closure/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/LICENSE.md
   creating: nextcloud/3rdparty/laravel/serializable-closure/src/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/UnsignedSerializableClosure.php
   creating: nextcloud/3rdparty/laravel/serializable-closure/src/Serializers/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Serializers/Signed.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Serializers/Native.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/SerializableClosure.php
   creating: nextcloud/3rdparty/laravel/serializable-closure/src/Exceptions/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Exceptions/PhpVersionNotSupportedException.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Exceptions/InvalidSignatureException.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Exceptions/MissingSecretKeyException.php
   creating: nextcloud/3rdparty/laravel/serializable-closure/src/Contracts/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Contracts/Serializable.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Contracts/Signer.php
   creating: nextcloud/3rdparty/laravel/serializable-closure/src/Signers/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Signers/Hmac.php
   creating: nextcloud/3rdparty/laravel/serializable-closure/src/Support/
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Support/SelfReference.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Support/ClosureStream.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Support/ClosureScope.php
  inflating: nextcloud/3rdparty/laravel/serializable-closure/src/Support/ReflectionClosure.php
   creating: nextcloud/3rdparty/symfony/
   creating: nextcloud/3rdparty/symfony/polyfill-php82/
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/bootstrap.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/NoDynamicProperties.php
   creating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/
   creating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/SensitiveParameterValue.php
   creating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/CryptoSafeEngine.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/RandomException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/RandomError.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/BrokenRandomEngineError.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/Engine.php
   creating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/Engine/
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/Random/Engine/Secure.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/AllowDynamicProperties.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Resources/stubs/SensitiveParameter.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/SensitiveParameterValue.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Php82.php
   creating: nextcloud/3rdparty/symfony/polyfill-php82/Random/
   creating: nextcloud/3rdparty/symfony/polyfill-php82/Random/Engine/
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/Random/Engine/Secure.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php82/LICENSE
   creating: nextcloud/3rdparty/symfony/translation/
   creating: nextcloud/3rdparty/symfony/translation/Writer/
  inflating: nextcloud/3rdparty/symfony/translation/Writer/TranslationWriterInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Writer/TranslationWriter.php
  inflating: nextcloud/3rdparty/symfony/translation/DataCollectorTranslator.php
   creating: nextcloud/3rdparty/symfony/translation/Extractor/
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/AbstractFileExtractor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/PhpStringTokenParser.php
   creating: nextcloud/3rdparty/symfony/translation/Extractor/Visitor/
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/Visitor/TransMethodVisitor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/Visitor/ConstraintVisitor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/Visitor/TranslatableMessageVisitor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/Visitor/AbstractVisitor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/PhpAstExtractor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/ChainExtractor.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/ExtractorInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Extractor/PhpExtractor.php
  inflating: nextcloud/3rdparty/symfony/translation/MessageCatalogue.php
   creating: nextcloud/3rdparty/symfony/translation/Exception/
  inflating: nextcloud/3rdparty/symfony/translation/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/ProviderException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/InvalidResourceException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/ProviderExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/NotFoundResourceException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/MissingRequiredOptionException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/UnsupportedSchemeException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/LogicException.php
  inflating: nextcloud/3rdparty/symfony/translation/Exception/IncompleteDsnException.php
  inflating: nextcloud/3rdparty/symfony/translation/TranslatableMessage.php
  inflating: nextcloud/3rdparty/symfony/translation/MessageCatalogueInterface.php
   creating: nextcloud/3rdparty/symfony/translation/Reader/
  inflating: nextcloud/3rdparty/symfony/translation/Reader/TranslationReaderInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Reader/TranslationReader.php
  inflating: nextcloud/3rdparty/symfony/translation/TranslatorBag.php
   creating: nextcloud/3rdparty/symfony/translation/Dumper/
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/MoFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/DumperInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/FileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/YamlFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/PoFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/QtFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/JsonFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/XliffFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/PhpFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/IniFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/IcuResFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/Dumper/CsvFileDumper.php
  inflating: nextcloud/3rdparty/symfony/translation/LoggingTranslator.php
  inflating: nextcloud/3rdparty/symfony/translation/MetadataAwareInterface.php
   creating: nextcloud/3rdparty/symfony/translation/Command/
  inflating: nextcloud/3rdparty/symfony/translation/Command/TranslationPushCommand.php
  inflating: nextcloud/3rdparty/symfony/translation/Command/XliffLintCommand.php
  inflating: nextcloud/3rdparty/symfony/translation/Command/TranslationPullCommand.php
  inflating: nextcloud/3rdparty/symfony/translation/Command/TranslationTrait.php
   creating: nextcloud/3rdparty/symfony/translation/DataCollector/
  inflating: nextcloud/3rdparty/symfony/translation/DataCollector/TranslationDataCollector.php
   creating: nextcloud/3rdparty/symfony/translation/Resources/
   creating: nextcloud/3rdparty/symfony/translation/Resources/schemas/
  inflating: nextcloud/3rdparty/symfony/translation/Resources/schemas/xliff-core-1.2-transitional.xsd
  inflating: nextcloud/3rdparty/symfony/translation/Resources/schemas/xml.xsd
  inflating: nextcloud/3rdparty/symfony/translation/Resources/schemas/xliff-core-2.0.xsd
   creating: nextcloud/3rdparty/symfony/translation/Resources/data/
  inflating: nextcloud/3rdparty/symfony/translation/Resources/data/parents.json
  inflating: nextcloud/3rdparty/symfony/translation/Resources/functions.php
  inflating: nextcloud/3rdparty/symfony/translation/IdentityTranslator.php
   creating: nextcloud/3rdparty/symfony/translation/Provider/
  inflating: nextcloud/3rdparty/symfony/translation/Provider/NullProvider.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/FilteringProvider.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/ProviderInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/AbstractProviderFactory.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/ProviderFactoryInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/Dsn.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/TranslationProviderCollection.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/TranslationProviderCollectionFactory.php
  inflating: nextcloud/3rdparty/symfony/translation/Provider/NullProviderFactory.php
  inflating: nextcloud/3rdparty/symfony/translation/TranslatorBagInterface.php
   creating: nextcloud/3rdparty/symfony/translation/Loader/
  inflating: nextcloud/3rdparty/symfony/translation/Loader/IniFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/IcuDatFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/CsvFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/JsonFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/LoaderInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/ArrayLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/YamlFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/PoFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/MoFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/FileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/PhpFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/IcuResFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/QtFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/Loader/XliffFileLoader.php
  inflating: nextcloud/3rdparty/symfony/translation/LICENSE
  inflating: nextcloud/3rdparty/symfony/translation/Translator.php
  inflating: nextcloud/3rdparty/symfony/translation/CatalogueMetadataAwareInterface.php
   creating: nextcloud/3rdparty/symfony/translation/Util/
  inflating: nextcloud/3rdparty/symfony/translation/Util/XliffUtils.php
  inflating: nextcloud/3rdparty/symfony/translation/Util/ArrayConverter.php
   creating: nextcloud/3rdparty/symfony/translation/Formatter/
  inflating: nextcloud/3rdparty/symfony/translation/Formatter/MessageFormatter.php
  inflating: nextcloud/3rdparty/symfony/translation/Formatter/IntlFormatterInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Formatter/MessageFormatterInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Formatter/IntlFormatter.php
  inflating: nextcloud/3rdparty/symfony/translation/PseudoLocalizationTranslator.php
  inflating: nextcloud/3rdparty/symfony/translation/LocaleSwitcher.php
   creating: nextcloud/3rdparty/symfony/translation/DependencyInjection/
  inflating: nextcloud/3rdparty/symfony/translation/DependencyInjection/TranslatorPathsPass.php
  inflating: nextcloud/3rdparty/symfony/translation/DependencyInjection/TranslationDumperPass.php
  inflating: nextcloud/3rdparty/symfony/translation/DependencyInjection/DataCollectorTranslatorPass.php
  inflating: nextcloud/3rdparty/symfony/translation/DependencyInjection/TranslationExtractorPass.php
  inflating: nextcloud/3rdparty/symfony/translation/DependencyInjection/LoggingTranslatorPass.php
  inflating: nextcloud/3rdparty/symfony/translation/DependencyInjection/TranslatorPass.php
   creating: nextcloud/3rdparty/symfony/translation/Catalogue/
  inflating: nextcloud/3rdparty/symfony/translation/Catalogue/TargetOperation.php
  inflating: nextcloud/3rdparty/symfony/translation/Catalogue/MergeOperation.php
  inflating: nextcloud/3rdparty/symfony/translation/Catalogue/OperationInterface.php
  inflating: nextcloud/3rdparty/symfony/translation/Catalogue/AbstractOperation.php
   creating: nextcloud/3rdparty/symfony/event-dispatcher/
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/EventSubscriberInterface.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/ImmutableEventDispatcher.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/EventDispatcher.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/EventDispatcherInterface.php
   creating: nextcloud/3rdparty/symfony/event-dispatcher/Attribute/
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/Attribute/AsEventListener.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/LICENSE
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/GenericEvent.php
   creating: nextcloud/3rdparty/symfony/event-dispatcher/DependencyInjection/
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/DependencyInjection/AddEventAliasesPass.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/DependencyInjection/RegisterListenersPass.php
   creating: nextcloud/3rdparty/symfony/event-dispatcher/Debug/
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/Debug/WrappedListener.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher/Debug/TraceableEventDispatcher.php
   creating: nextcloud/3rdparty/symfony/polyfill-uuid/
  inflating: nextcloud/3rdparty/symfony/polyfill-uuid/bootstrap.php
  inflating: nextcloud/3rdparty/symfony/polyfill-uuid/Uuid.php
  inflating: nextcloud/3rdparty/symfony/polyfill-uuid/bootstrap80.php
  inflating: nextcloud/3rdparty/symfony/polyfill-uuid/LICENSE
   creating: nextcloud/3rdparty/symfony/css-selector/
   creating: nextcloud/3rdparty/symfony/css-selector/Parser/
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Token.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Reader.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/TokenStream.php
   creating: nextcloud/3rdparty/symfony/css-selector/Parser/Shortcut/
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Shortcut/ElementParser.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Shortcut/EmptyStringParser.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Shortcut/ClassParser.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Shortcut/HashParser.php
   creating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/HandlerInterface.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/NumberHandler.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/StringHandler.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/HashHandler.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/WhitespaceHandler.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/IdentifierHandler.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Handler/CommentHandler.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Parser.php
   creating: nextcloud/3rdparty/symfony/css-selector/Parser/Tokenizer/
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Tokenizer/Tokenizer.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Tokenizer/TokenizerPatterns.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/Tokenizer/TokenizerEscaping.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Parser/ParserInterface.php
   creating: nextcloud/3rdparty/symfony/css-selector/Node/
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/NodeInterface.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/ClassNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/SelectorNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/PseudoNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/HashNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/NegationNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/Specificity.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/FunctionNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/ElementNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/AttributeNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/AbstractNode.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Node/CombinedSelectorNode.php
   creating: nextcloud/3rdparty/symfony/css-selector/Exception/
  inflating: nextcloud/3rdparty/symfony/css-selector/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Exception/SyntaxErrorException.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Exception/ExpressionErrorException.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Exception/ParseException.php
  inflating: nextcloud/3rdparty/symfony/css-selector/Exception/InternalErrorException.php
  inflating: nextcloud/3rdparty/symfony/css-selector/CssSelectorConverter.php
  inflating: nextcloud/3rdparty/symfony/css-selector/LICENSE
   creating: nextcloud/3rdparty/symfony/css-selector/XPath/
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/TranslatorInterface.php
   creating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/HtmlExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/NodeExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/PseudoClassExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/FunctionExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/CombinationExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/AttributeMatchingExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/ExtensionInterface.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Extension/AbstractExtension.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/Translator.php
  inflating: nextcloud/3rdparty/symfony/css-selector/XPath/XPathExpr.php
   creating: nextcloud/3rdparty/symfony/http-foundation/
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcherInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/UrlHelper.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/IpUtils.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/ServerBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Request.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Exception/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/JsonException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/SuspiciousOperationException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/RequestExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/BadRequestException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/ConflictingHeadersException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/SessionNotFoundException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Exception/UnexpectedValueException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/UriSigner.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/HeaderBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/JsonResponse.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/ChainRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/ResponseHeaderBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestStack.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/BinaryFileResponse.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/StreamedResponse.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/AcceptHeaderItem.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/InputBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RedirectResponse.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Response.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/ExpressionRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/ParameterBag.php
   creating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/HostRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/IpsRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/AttributesRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/MethodRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/ExpressionRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/IsJsonRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/PortRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/SchemeRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher/PathRequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/StreamedJsonResponse.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Cookie.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RequestMatcher.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/HeaderUtils.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Session/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/SessionUtils.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/SessionFactory.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Session/Flash/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Flash/FlashBagInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Flash/FlashBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Flash/AutoExpireFlashBag.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Session/Attribute/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Attribute/AttributeBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Attribute/AttributeBagInterface.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/MetadataBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/MockArraySessionStorage.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/MockFileSessionStorage.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/NativeSessionStorage.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/PhpBridgeSessionStorage.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/NativeSessionStorageFactory.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/SessionStorageInterface.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/MarshallingSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/PdoSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/SessionHandlerFactory.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/RedisSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/IdentityMarshaller.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/AbstractSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/MongoDbSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/StrictSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/NullSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/NativeFileSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/MemcachedSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Handler/MigratingSessionHandler.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/PhpBridgeSessionStorageFactory.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/SessionStorageFactoryInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/MockFileSessionStorageFactory.php
   creating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Proxy/
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Proxy/SessionHandlerProxy.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Storage/Proxy/AbstractProxy.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/SessionInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/Session.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/SessionFactoryInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/FlashBagAwareSessionInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/SessionBagInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/Session/SessionBagProxy.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/LICENSE
   creating: nextcloud/3rdparty/symfony/http-foundation/RateLimiter/
  inflating: nextcloud/3rdparty/symfony/http-foundation/RateLimiter/AbstractRequestRateLimiter.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RateLimiter/RequestRateLimiterInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/RateLimiter/PeekableRequestRateLimiterInterface.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/FileBag.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/AcceptHeader.php
   creating: nextcloud/3rdparty/symfony/http-foundation/File/
   creating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/UploadException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/NoFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/CannotWriteFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/AccessDeniedException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/ExtensionFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/FileNotFoundException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/UnexpectedTypeException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/FormSizeFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/IniSizeFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/NoTmpDirFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/PartialFileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Exception/FileException.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/Stream.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/File.php
  inflating: nextcloud/3rdparty/symfony/http-foundation/File/UploadedFile.php
   creating: nextcloud/3rdparty/symfony/polyfill-intl-idn/
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/bootstrap.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Idn.php
   creating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/
   creating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/disallowed_STD3_mapped.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/disallowed.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/virama.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/DisallowedRanges.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/deviation.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/ignored.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/mapped.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/Regex.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Resources/unidata/disallowed_STD3_valid.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/bootstrap80.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/LICENSE
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-idn/Info.php
   creating: nextcloud/3rdparty/symfony/polyfill-php83/
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/bootstrap.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Php83.php
   creating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/
   creating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateRangeError.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateObjectError.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/SQLite3Exception.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateError.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateMalformedIntervalStringException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/Override.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateInvalidTimeZoneException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateMalformedStringException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateMalformedPeriodStringException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateInvalidOperationException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/Resources/stubs/DateException.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/LICENSE
  inflating: nextcloud/3rdparty/symfony/polyfill-php83/bootstrap81.php
   creating: nextcloud/3rdparty/symfony/process/
  inflating: nextcloud/3rdparty/symfony/process/ProcessUtils.php
   creating: nextcloud/3rdparty/symfony/process/Exception/
  inflating: nextcloud/3rdparty/symfony/process/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/ProcessTimedOutException.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/RunProcessFailedException.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/LogicException.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/ProcessSignaledException.php
  inflating: nextcloud/3rdparty/symfony/process/Exception/ProcessFailedException.php
   creating: nextcloud/3rdparty/symfony/process/Pipes/
  inflating: nextcloud/3rdparty/symfony/process/Pipes/WindowsPipes.php
  inflating: nextcloud/3rdparty/symfony/process/Pipes/PipesInterface.php
  inflating: nextcloud/3rdparty/symfony/process/Pipes/UnixPipes.php
  inflating: nextcloud/3rdparty/symfony/process/Pipes/AbstractPipes.php
  inflating: nextcloud/3rdparty/symfony/process/ExecutableFinder.php
   creating: nextcloud/3rdparty/symfony/process/Messenger/
  inflating: nextcloud/3rdparty/symfony/process/Messenger/RunProcessContext.php
  inflating: nextcloud/3rdparty/symfony/process/Messenger/RunProcessMessageHandler.php
  inflating: nextcloud/3rdparty/symfony/process/Messenger/RunProcessMessage.php
  inflating: nextcloud/3rdparty/symfony/process/PhpExecutableFinder.php
  inflating: nextcloud/3rdparty/symfony/process/InputStream.php
  inflating: nextcloud/3rdparty/symfony/process/PhpProcess.php
  inflating: nextcloud/3rdparty/symfony/process/PhpSubprocess.php
  inflating: nextcloud/3rdparty/symfony/process/LICENSE
  inflating: nextcloud/3rdparty/symfony/process/Process.php
   creating: nextcloud/3rdparty/symfony/event-dispatcher-contracts/
  inflating: nextcloud/3rdparty/symfony/event-dispatcher-contracts/EventDispatcherInterface.php
  inflating: nextcloud/3rdparty/symfony/event-dispatcher-contracts/LICENSE
  inflating: nextcloud/3rdparty/symfony/event-dispatcher-contracts/Event.php
   creating: nextcloud/3rdparty/symfony/mailer/
   creating: nextcloud/3rdparty/symfony/mailer/Exception/
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/HttpTransportException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/UnexpectedResponseException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/TransportException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/TransportExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/UnsupportedSchemeException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/LogicException.php
  inflating: nextcloud/3rdparty/symfony/mailer/Exception/IncompleteDsnException.php
   creating: nextcloud/3rdparty/symfony/mailer/Header/
  inflating: nextcloud/3rdparty/symfony/mailer/Header/TagHeader.php
  inflating: nextcloud/3rdparty/symfony/mailer/Header/MetadataHeader.php
  inflating: nextcloud/3rdparty/symfony/mailer/Envelope.php
   creating: nextcloud/3rdparty/symfony/mailer/Messenger/
  inflating: nextcloud/3rdparty/symfony/mailer/Messenger/SendEmailMessage.php
  inflating: nextcloud/3rdparty/symfony/mailer/Messenger/MessageHandler.php
  inflating: nextcloud/3rdparty/symfony/mailer/MailerInterface.php
   creating: nextcloud/3rdparty/symfony/mailer/Command/
  inflating: nextcloud/3rdparty/symfony/mailer/Command/MailerTestCommand.php
   creating: nextcloud/3rdparty/symfony/mailer/Transport/
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/AbstractHttpTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/RoundRobinTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/NativeTransportFactory.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/AbstractTransportFactory.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Dsn.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/NullTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/TransportInterface.php
   creating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/EsmtpTransportFactory.php
   creating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Stream/
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Stream/SocketStream.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Stream/AbstractStream.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Stream/ProcessStream.php
   creating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Auth/
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Auth/PlainAuthenticator.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Auth/XOAuth2Authenticator.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Auth/CramMd5Authenticator.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Auth/LoginAuthenticator.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/Auth/AuthenticatorInterface.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/EsmtpTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Smtp/SmtpTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/SendmailTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/SendmailTransportFactory.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/AbstractTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/NullTransportFactory.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/FailoverTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/TransportFactoryInterface.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/AbstractApiTransport.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport/Transports.php
  inflating: nextcloud/3rdparty/symfony/mailer/Mailer.php
  inflating: nextcloud/3rdparty/symfony/mailer/Transport.php
   creating: nextcloud/3rdparty/symfony/mailer/DataCollector/
  inflating: nextcloud/3rdparty/symfony/mailer/DataCollector/MessageDataCollector.php
  inflating: nextcloud/3rdparty/symfony/mailer/DelayedEnvelope.php
  inflating: nextcloud/3rdparty/symfony/mailer/LICENSE
   creating: nextcloud/3rdparty/symfony/mailer/EventListener/
  inflating: nextcloud/3rdparty/symfony/mailer/EventListener/MessengerTransportListener.php
  inflating: nextcloud/3rdparty/symfony/mailer/EventListener/MessageListener.php
  inflating: nextcloud/3rdparty/symfony/mailer/EventListener/EnvelopeListener.php
  inflating: nextcloud/3rdparty/symfony/mailer/EventListener/MessageLoggerListener.php
  inflating: nextcloud/3rdparty/symfony/mailer/SentMessage.php
   creating: nextcloud/3rdparty/symfony/mailer/Event/
  inflating: nextcloud/3rdparty/symfony/mailer/Event/SentMessageEvent.php
  inflating: nextcloud/3rdparty/symfony/mailer/Event/MessageEvent.php
  inflating: nextcloud/3rdparty/symfony/mailer/Event/FailedMessageEvent.php
  inflating: nextcloud/3rdparty/symfony/mailer/Event/MessageEvents.php
   creating: nextcloud/3rdparty/symfony/translation-contracts/
  inflating: nextcloud/3rdparty/symfony/translation-contracts/TranslatorInterface.php
  inflating: nextcloud/3rdparty/symfony/translation-contracts/LocaleAwareInterface.php
  inflating: nextcloud/3rdparty/symfony/translation-contracts/LICENSE
  inflating: nextcloud/3rdparty/symfony/translation-contracts/TranslatorTrait.php
  inflating: nextcloud/3rdparty/symfony/translation-contracts/TranslatableInterface.php
   creating: nextcloud/3rdparty/symfony/dom-crawler/
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Form.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Link.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Image.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Crawler.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/FormFieldRegistry.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/AbstractUriElement.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/UriResolver.php
   creating: nextcloud/3rdparty/symfony/dom-crawler/Field/
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Field/FileFormField.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Field/InputFormField.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Field/TextareaFormField.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Field/FormField.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/Field/ChoiceFormField.php
  inflating: nextcloud/3rdparty/symfony/dom-crawler/LICENSE
   creating: nextcloud/3rdparty/symfony/deprecation-contracts/
  inflating: nextcloud/3rdparty/symfony/deprecation-contracts/function.php
  inflating: nextcloud/3rdparty/symfony/deprecation-contracts/LICENSE
   creating: nextcloud/3rdparty/symfony/polyfill-intl-grapheme/
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-grapheme/bootstrap.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-grapheme/Grapheme.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-grapheme/bootstrap80.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-grapheme/LICENSE
   creating: nextcloud/3rdparty/symfony/string/
  inflating: nextcloud/3rdparty/symfony/string/AbstractUnicodeString.php
   creating: nextcloud/3rdparty/symfony/string/Exception/
  inflating: nextcloud/3rdparty/symfony/string/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/string/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/string/Exception/InvalidArgumentException.php
   creating: nextcloud/3rdparty/symfony/string/Inflector/
  inflating: nextcloud/3rdparty/symfony/string/Inflector/InflectorInterface.php
  inflating: nextcloud/3rdparty/symfony/string/Inflector/FrenchInflector.php
  inflating: nextcloud/3rdparty/symfony/string/Inflector/EnglishInflector.php
  inflating: nextcloud/3rdparty/symfony/string/ByteString.php
   creating: nextcloud/3rdparty/symfony/string/Slugger/
  inflating: nextcloud/3rdparty/symfony/string/Slugger/SluggerInterface.php
  inflating: nextcloud/3rdparty/symfony/string/Slugger/AsciiSlugger.php
  inflating: nextcloud/3rdparty/symfony/string/AbstractString.php
  inflating: nextcloud/3rdparty/symfony/string/UnicodeString.php
   creating: nextcloud/3rdparty/symfony/string/Resources/
   creating: nextcloud/3rdparty/symfony/string/Resources/data/
  inflating: nextcloud/3rdparty/symfony/string/Resources/data/wcswidth_table_zero.php
  inflating: nextcloud/3rdparty/symfony/string/Resources/data/wcswidth_table_wide.php
  inflating: nextcloud/3rdparty/symfony/string/Resources/functions.php
  inflating: nextcloud/3rdparty/symfony/string/LICENSE
  inflating: nextcloud/3rdparty/symfony/string/LazyString.php
  inflating: nextcloud/3rdparty/symfony/string/CodePointString.php
   creating: nextcloud/3rdparty/symfony/routing/
  inflating: nextcloud/3rdparty/symfony/routing/RequestContext.php
  inflating: nextcloud/3rdparty/symfony/routing/CompiledRoute.php
   creating: nextcloud/3rdparty/symfony/routing/Exception/
  inflating: nextcloud/3rdparty/symfony/routing/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/RouteNotFoundException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/InvalidParameterException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/MethodNotAllowedException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/NoConfigurationException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/ResourceNotFoundException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/MissingMandatoryParametersException.php
  inflating: nextcloud/3rdparty/symfony/routing/Exception/RouteCircularReferenceException.php
  inflating: nextcloud/3rdparty/symfony/routing/RouterInterface.php
  inflating: nextcloud/3rdparty/symfony/routing/Route.php
  inflating: nextcloud/3rdparty/symfony/routing/Router.php
   creating: nextcloud/3rdparty/symfony/routing/Requirement/
  inflating: nextcloud/3rdparty/symfony/routing/Requirement/Requirement.php
  inflating: nextcloud/3rdparty/symfony/routing/Requirement/EnumRequirement.php
  inflating: nextcloud/3rdparty/symfony/routing/RouteCompiler.php
   creating: nextcloud/3rdparty/symfony/routing/Attribute/
  inflating: nextcloud/3rdparty/symfony/routing/Attribute/Route.php
  inflating: nextcloud/3rdparty/symfony/routing/RouteCollection.php
   creating: nextcloud/3rdparty/symfony/routing/Generator/
  inflating: nextcloud/3rdparty/symfony/routing/Generator/UrlGeneratorInterface.php
   creating: nextcloud/3rdparty/symfony/routing/Generator/Dumper/
  inflating: nextcloud/3rdparty/symfony/routing/Generator/Dumper/GeneratorDumperInterface.php
  inflating: nextcloud/3rdparty/symfony/routing/Generator/Dumper/GeneratorDumper.php
  inflating: nextcloud/3rdparty/symfony/routing/Generator/Dumper/CompiledUrlGeneratorDumper.php
  inflating: nextcloud/3rdparty/symfony/routing/Generator/CompiledUrlGenerator.php
  inflating: nextcloud/3rdparty/symfony/routing/Generator/UrlGenerator.php
  inflating: nextcloud/3rdparty/symfony/routing/Generator/ConfigurableRequirementsInterface.php
   creating: nextcloud/3rdparty/symfony/routing/Matcher/
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/RequestMatcherInterface.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/RedirectableUrlMatcher.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/TraceableUrlMatcher.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/RedirectableUrlMatcherInterface.php
   creating: nextcloud/3rdparty/symfony/routing/Matcher/Dumper/
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/Dumper/StaticPrefixCollection.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/Dumper/CompiledUrlMatcherTrait.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/Dumper/CompiledUrlMatcherDumper.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/Dumper/MatcherDumperInterface.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/Dumper/MatcherDumper.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/UrlMatcher.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/CompiledUrlMatcher.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/ExpressionLanguageProvider.php
  inflating: nextcloud/3rdparty/symfony/routing/Matcher/UrlMatcherInterface.php
   creating: nextcloud/3rdparty/symfony/routing/Loader/
  inflating: nextcloud/3rdparty/symfony/routing/Loader/XmlFileLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/AnnotationClassLoader.php
   creating: nextcloud/3rdparty/symfony/routing/Loader/schema/
   creating: nextcloud/3rdparty/symfony/routing/Loader/schema/routing/
  inflating: nextcloud/3rdparty/symfony/routing/Loader/schema/routing/routing-1.0.xsd
  inflating: nextcloud/3rdparty/symfony/routing/Loader/ContainerLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/YamlFileLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Psr4DirectoryLoader.php
   creating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/AliasConfigurator.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/ImportConfigurator.php
   creating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/Traits/
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/Traits/PrefixTrait.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/Traits/RouteTrait.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/Traits/HostTrait.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/Traits/LocalizedRouteTrait.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/Traits/AddTrait.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/RouteConfigurator.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/CollectionConfigurator.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/Configurator/RoutingConfigurator.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/DirectoryLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/PhpFileLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/ObjectLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/AnnotationDirectoryLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/AttributeFileLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/AnnotationFileLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/AttributeDirectoryLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/AttributeClassLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/GlobFileLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/Loader/ClosureLoader.php
  inflating: nextcloud/3rdparty/symfony/routing/LICENSE
  inflating: nextcloud/3rdparty/symfony/routing/RouteCompilerInterface.php
   creating: nextcloud/3rdparty/symfony/routing/Annotation/
  inflating: nextcloud/3rdparty/symfony/routing/Annotation/Route.php
  inflating: nextcloud/3rdparty/symfony/routing/RequestContextAwareInterface.php
  inflating: nextcloud/3rdparty/symfony/routing/Alias.php
   creating: nextcloud/3rdparty/symfony/routing/DependencyInjection/
  inflating: nextcloud/3rdparty/symfony/routing/DependencyInjection/RoutingResolverPass.php
  inflating: nextcloud/3rdparty/symfony/routing/DependencyInjection/AddExpressionLanguageProvidersPass.php
   creating: nextcloud/3rdparty/symfony/console/
  inflating: nextcloud/3rdparty/symfony/console/Cursor.php
   creating: nextcloud/3rdparty/symfony/console/Style/
  inflating: nextcloud/3rdparty/symfony/console/Style/OutputStyle.php
  inflating: nextcloud/3rdparty/symfony/console/Style/StyleInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Style/SymfonyStyle.php
   creating: nextcloud/3rdparty/symfony/console/Output/
  inflating: nextcloud/3rdparty/symfony/console/Output/TrimmedBufferOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Output/ConsoleOutputInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Output/ConsoleOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Output/ConsoleSectionOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Output/NullOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Output/StreamOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Output/Output.php
  inflating: nextcloud/3rdparty/symfony/console/Output/OutputInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Output/BufferedOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Output/AnsiColorMode.php
   creating: nextcloud/3rdparty/symfony/console/CommandLoader/
  inflating: nextcloud/3rdparty/symfony/console/CommandLoader/FactoryCommandLoader.php
  inflating: nextcloud/3rdparty/symfony/console/CommandLoader/ContainerCommandLoader.php
  inflating: nextcloud/3rdparty/symfony/console/CommandLoader/CommandLoaderInterface.php
   creating: nextcloud/3rdparty/symfony/console/Exception/
  inflating: nextcloud/3rdparty/symfony/console/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/MissingInputException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/RunCommandFailedException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/CommandNotFoundException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/NamespaceNotFoundException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/InvalidOptionException.php
  inflating: nextcloud/3rdparty/symfony/console/Exception/LogicException.php
  inflating: nextcloud/3rdparty/symfony/console/Color.php
   creating: nextcloud/3rdparty/symfony/console/Completion/
   creating: nextcloud/3rdparty/symfony/console/Completion/Output/
  inflating: nextcloud/3rdparty/symfony/console/Completion/Output/BashCompletionOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Completion/Output/CompletionOutputInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Completion/Output/FishCompletionOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Completion/Output/ZshCompletionOutput.php
  inflating: nextcloud/3rdparty/symfony/console/Completion/Suggestion.php
  inflating: nextcloud/3rdparty/symfony/console/Completion/CompletionSuggestions.php
  inflating: nextcloud/3rdparty/symfony/console/Completion/CompletionInput.php
   creating: nextcloud/3rdparty/symfony/console/Question/
  inflating: nextcloud/3rdparty/symfony/console/Question/ConfirmationQuestion.php
  inflating: nextcloud/3rdparty/symfony/console/Question/ChoiceQuestion.php
  inflating: nextcloud/3rdparty/symfony/console/Question/Question.php
   creating: nextcloud/3rdparty/symfony/console/Messenger/
  inflating: nextcloud/3rdparty/symfony/console/Messenger/RunCommandMessageHandler.php
  inflating: nextcloud/3rdparty/symfony/console/Messenger/RunCommandContext.php
  inflating: nextcloud/3rdparty/symfony/console/Messenger/RunCommandMessage.php
  inflating: nextcloud/3rdparty/symfony/console/Terminal.php
  inflating: nextcloud/3rdparty/symfony/console/ConsoleEvents.php
   creating: nextcloud/3rdparty/symfony/console/Command/
  inflating: nextcloud/3rdparty/symfony/console/Command/LazyCommand.php
  inflating: nextcloud/3rdparty/symfony/console/Command/SignalableCommandInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Command/HelpCommand.php
  inflating: nextcloud/3rdparty/symfony/console/Command/TraceableCommand.php
  inflating: nextcloud/3rdparty/symfony/console/Command/CompleteCommand.php
  inflating: nextcloud/3rdparty/symfony/console/Command/LockableTrait.php
  inflating: nextcloud/3rdparty/symfony/console/Command/DumpCompletionCommand.php
  inflating: nextcloud/3rdparty/symfony/console/Command/ListCommand.php
  inflating: nextcloud/3rdparty/symfony/console/Command/Command.php
   creating: nextcloud/3rdparty/symfony/console/DataCollector/
  inflating: nextcloud/3rdparty/symfony/console/DataCollector/CommandDataCollector.php
   creating: nextcloud/3rdparty/symfony/console/Attribute/
  inflating: nextcloud/3rdparty/symfony/console/Attribute/AsCommand.php
   creating: nextcloud/3rdparty/symfony/console/Resources/
  inflating: nextcloud/3rdparty/symfony/console/Resources/completion.fish
  inflating: nextcloud/3rdparty/symfony/console/Resources/completion.bash
  inflating: nextcloud/3rdparty/symfony/console/Resources/completion.zsh
   creating: nextcloud/3rdparty/symfony/console/Tester/
   creating: nextcloud/3rdparty/symfony/console/Tester/Constraint/
  inflating: nextcloud/3rdparty/symfony/console/Tester/Constraint/CommandIsSuccessful.php
  inflating: nextcloud/3rdparty/symfony/console/Tester/TesterTrait.php
  inflating: nextcloud/3rdparty/symfony/console/Tester/CommandCompletionTester.php
  inflating: nextcloud/3rdparty/symfony/console/Tester/ApplicationTester.php
  inflating: nextcloud/3rdparty/symfony/console/Tester/CommandTester.php
   creating: nextcloud/3rdparty/symfony/console/Logger/
  inflating: nextcloud/3rdparty/symfony/console/Logger/ConsoleLogger.php
   creating: nextcloud/3rdparty/symfony/console/SignalRegistry/
  inflating: nextcloud/3rdparty/symfony/console/SignalRegistry/SignalRegistry.php
  inflating: nextcloud/3rdparty/symfony/console/SignalRegistry/SignalMap.php
   creating: nextcloud/3rdparty/symfony/console/Descriptor/
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/DescriptorInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/TextDescriptor.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/JsonDescriptor.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/ApplicationDescription.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/MarkdownDescriptor.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/XmlDescriptor.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/Descriptor.php
  inflating: nextcloud/3rdparty/symfony/console/Descriptor/ReStructuredTextDescriptor.php
  inflating: nextcloud/3rdparty/symfony/console/SingleCommandApplication.php
  inflating: nextcloud/3rdparty/symfony/console/LICENSE
   creating: nextcloud/3rdparty/symfony/console/EventListener/
  inflating: nextcloud/3rdparty/symfony/console/EventListener/ErrorListener.php
   creating: nextcloud/3rdparty/symfony/console/Event/
  inflating: nextcloud/3rdparty/symfony/console/Event/ConsoleEvent.php
  inflating: nextcloud/3rdparty/symfony/console/Event/ConsoleTerminateEvent.php
  inflating: nextcloud/3rdparty/symfony/console/Event/ConsoleSignalEvent.php
  inflating: nextcloud/3rdparty/symfony/console/Event/ConsoleErrorEvent.php
  inflating: nextcloud/3rdparty/symfony/console/Event/ConsoleCommandEvent.php
   creating: nextcloud/3rdparty/symfony/console/Input/
  inflating: nextcloud/3rdparty/symfony/console/Input/InputDefinition.php
  inflating: nextcloud/3rdparty/symfony/console/Input/InputArgument.php
  inflating: nextcloud/3rdparty/symfony/console/Input/StreamableInputInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Input/InputOption.php
  inflating: nextcloud/3rdparty/symfony/console/Input/InputAwareInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Input/Input.php
  inflating: nextcloud/3rdparty/symfony/console/Input/StringInput.php
  inflating: nextcloud/3rdparty/symfony/console/Input/ArrayInput.php
  inflating: nextcloud/3rdparty/symfony/console/Input/InputInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Input/ArgvInput.php
   creating: nextcloud/3rdparty/symfony/console/Formatter/
  inflating: nextcloud/3rdparty/symfony/console/Formatter/NullOutputFormatter.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/NullOutputFormatterStyle.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/WrappableOutputFormatterInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/OutputFormatter.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/OutputFormatterStyle.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/OutputFormatterStyleInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/OutputFormatterInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Formatter/OutputFormatterStyleStack.php
   creating: nextcloud/3rdparty/symfony/console/CI/
  inflating: nextcloud/3rdparty/symfony/console/CI/GithubActionReporter.php
  inflating: nextcloud/3rdparty/symfony/console/Application.php
   creating: nextcloud/3rdparty/symfony/console/DependencyInjection/
  inflating: nextcloud/3rdparty/symfony/console/DependencyInjection/AddConsoleCommandPass.php
   creating: nextcloud/3rdparty/symfony/console/Helper/
  inflating: nextcloud/3rdparty/symfony/console/Helper/TableStyle.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/HelperInterface.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/Dumper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/TableCell.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/ProgressIndicator.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/FormatterHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/DebugFormatterHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/SymfonyQuestionHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/OutputWrapper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/TableRows.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/HelperSet.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/Helper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/Table.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/InputAwareHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/TableSeparator.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/ProcessHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/ProgressBar.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/DescriptorHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/QuestionHelper.php
  inflating: nextcloud/3rdparty/symfony/console/Helper/TableCellStyle.php
   creating: nextcloud/3rdparty/symfony/console/Debug/
  inflating: nextcloud/3rdparty/symfony/console/Debug/CliRequest.php
   creating: nextcloud/3rdparty/symfony/uid/
  inflating: nextcloud/3rdparty/symfony/uid/UuidV8.php
  inflating: nextcloud/3rdparty/symfony/uid/UuidV4.php
   creating: nextcloud/3rdparty/symfony/uid/Factory/
  inflating: nextcloud/3rdparty/symfony/uid/Factory/RandomBasedUuidFactory.php
  inflating: nextcloud/3rdparty/symfony/uid/Factory/UuidFactory.php
  inflating: nextcloud/3rdparty/symfony/uid/Factory/NameBasedUuidFactory.php
  inflating: nextcloud/3rdparty/symfony/uid/Factory/TimeBasedUuidFactory.php
  inflating: nextcloud/3rdparty/symfony/uid/Factory/UlidFactory.php
  inflating: nextcloud/3rdparty/symfony/uid/MaxUuid.php
  inflating: nextcloud/3rdparty/symfony/uid/Uuid.php
  inflating: nextcloud/3rdparty/symfony/uid/AbstractUid.php
  inflating: nextcloud/3rdparty/symfony/uid/UuidV1.php
  inflating: nextcloud/3rdparty/symfony/uid/UuidV7.php
   creating: nextcloud/3rdparty/symfony/uid/Command/
  inflating: nextcloud/3rdparty/symfony/uid/Command/GenerateUlidCommand.php
  inflating: nextcloud/3rdparty/symfony/uid/Command/GenerateUuidCommand.php
  inflating: nextcloud/3rdparty/symfony/uid/Command/InspectUlidCommand.php
  inflating: nextcloud/3rdparty/symfony/uid/Command/InspectUuidCommand.php
  inflating: nextcloud/3rdparty/symfony/uid/UuidV3.php
  inflating: nextcloud/3rdparty/symfony/uid/BinaryUtil.php
  inflating: nextcloud/3rdparty/symfony/uid/TimeBasedUidInterface.php
  inflating: nextcloud/3rdparty/symfony/uid/UuidV6.php
  inflating: nextcloud/3rdparty/symfony/uid/NilUlid.php
  inflating: nextcloud/3rdparty/symfony/uid/LICENSE
  inflating: nextcloud/3rdparty/symfony/uid/NilUuid.php
  inflating: nextcloud/3rdparty/symfony/uid/Ulid.php
  inflating: nextcloud/3rdparty/symfony/uid/MaxUlid.php
  inflating: nextcloud/3rdparty/symfony/uid/UuidV5.php
   creating: nextcloud/3rdparty/symfony/polyfill-php84/
  inflating: nextcloud/3rdparty/symfony/polyfill-php84/bootstrap.php
   creating: nextcloud/3rdparty/symfony/polyfill-php84/Resources/
   creating: nextcloud/3rdparty/symfony/polyfill-php84/Resources/stubs/
  inflating: nextcloud/3rdparty/symfony/polyfill-php84/Resources/stubs/Deprecated.php
  inflating: nextcloud/3rdparty/symfony/polyfill-php84/LICENSE
  inflating: nextcloud/3rdparty/symfony/polyfill-php84/Php84.php
   creating: nextcloud/3rdparty/symfony/mime/
  inflating: nextcloud/3rdparty/symfony/mime/Message.php
   creating: nextcloud/3rdparty/symfony/mime/HtmlToTextConverter/
  inflating: nextcloud/3rdparty/symfony/mime/HtmlToTextConverter/LeagueHtmlToMarkdownConverter.php
  inflating: nextcloud/3rdparty/symfony/mime/HtmlToTextConverter/HtmlToTextConverterInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/HtmlToTextConverter/DefaultHtmlToTextConverter.php
   creating: nextcloud/3rdparty/symfony/mime/Exception/
  inflating: nextcloud/3rdparty/symfony/mime/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Exception/RfcComplianceException.php
  inflating: nextcloud/3rdparty/symfony/mime/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/symfony/mime/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/symfony/mime/Exception/AddressEncoderException.php
  inflating: nextcloud/3rdparty/symfony/mime/Exception/LogicException.php
  inflating: nextcloud/3rdparty/symfony/mime/MimeTypesInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Email.php
   creating: nextcloud/3rdparty/symfony/mime/Header/
  inflating: nextcloud/3rdparty/symfony/mime/Header/MailboxListHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/AbstractHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/UnstructuredHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/DateHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/IdentificationHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/HeaderInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/PathHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/ParameterizedHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/Headers.php
  inflating: nextcloud/3rdparty/symfony/mime/Header/MailboxHeader.php
  inflating: nextcloud/3rdparty/symfony/mime/FileBinaryMimeTypeGuesser.php
  inflating: nextcloud/3rdparty/symfony/mime/Address.php
  inflating: nextcloud/3rdparty/symfony/mime/FileinfoMimeTypeGuesser.php
   creating: nextcloud/3rdparty/symfony/mime/Part/
  inflating: nextcloud/3rdparty/symfony/mime/Part/MessagePart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/DataPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/AbstractPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/TextPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/AbstractMultipartPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/SMimePart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/File.php
   creating: nextcloud/3rdparty/symfony/mime/Part/Multipart/
  inflating: nextcloud/3rdparty/symfony/mime/Part/Multipart/FormDataPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/Multipart/DigestPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/Multipart/AlternativePart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/Multipart/RelatedPart.php
  inflating: nextcloud/3rdparty/symfony/mime/Part/Multipart/MixedPart.php
  inflating: nextcloud/3rdparty/symfony/mime/RawMessage.php
   creating: nextcloud/3rdparty/symfony/mime/Encoder/
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/EncoderInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/Base64Encoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/QpMimeHeaderEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/ContentEncoderInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/QpContentEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/MimeHeaderEncoderInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/Base64ContentEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/EightBitContentEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/Rfc2231Encoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/AddressEncoderInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/IdnAddressEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/QpEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/Encoder/Base64MimeHeaderEncoder.php
  inflating: nextcloud/3rdparty/symfony/mime/MimeTypeGuesserInterface.php
  inflating: nextcloud/3rdparty/symfony/mime/MimeTypes.php
  inflating: nextcloud/3rdparty/symfony/mime/LICENSE
  inflating: nextcloud/3rdparty/symfony/mime/BodyRendererInterface.php
   creating: nextcloud/3rdparty/symfony/mime/Crypto/
  inflating: nextcloud/3rdparty/symfony/mime/Crypto/SMime.php
  inflating: nextcloud/3rdparty/symfony/mime/Crypto/DkimOptions.php
  inflating: nextcloud/3rdparty/symfony/mime/Crypto/SMimeEncrypter.php
  inflating: nextcloud/3rdparty/symfony/mime/Crypto/DkimSigner.php
  inflating: nextcloud/3rdparty/symfony/mime/Crypto/SMimeSigner.php
  inflating: nextcloud/3rdparty/symfony/mime/MessageConverter.php
  inflating: nextcloud/3rdparty/symfony/mime/DraftEmail.php
  inflating: nextcloud/3rdparty/symfony/mime/CharacterStream.php
   creating: nextcloud/3rdparty/symfony/mime/DependencyInjection/
  inflating: nextcloud/3rdparty/symfony/mime/DependencyInjection/AddMimeTypeGuesserPass.php
   creating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/bootstrap.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Normalizer.php
   creating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/
   creating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/unidata/
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/unidata/combiningClass.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/unidata/compatibilityDecomposition.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/unidata/canonicalDecomposition.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/unidata/canonicalComposition.php
   creating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/stubs/
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/Resources/stubs/Normalizer.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/bootstrap80.php
  inflating: nextcloud/3rdparty/symfony/polyfill-intl-normalizer/LICENSE
   creating: nextcloud/3rdparty/symfony/service-contracts/
  inflating: nextcloud/3rdparty/symfony/service-contracts/ServiceSubscriberInterface.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/ServiceProviderInterface.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/ServiceMethodsSubscriberTrait.php
   creating: nextcloud/3rdparty/symfony/service-contracts/Attribute/
  inflating: nextcloud/3rdparty/symfony/service-contracts/Attribute/Required.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/Attribute/SubscribedService.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/LICENSE
  inflating: nextcloud/3rdparty/symfony/service-contracts/ResetInterface.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/ServiceSubscriberTrait.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/ServiceCollectionInterface.php
  inflating: nextcloud/3rdparty/symfony/service-contracts/ServiceLocatorTrait.php
   creating: nextcloud/3rdparty/deepdiver/
   creating: nextcloud/3rdparty/deepdiver/zipstreamer/
   creating: nextcloud/3rdparty/deepdiver/zipstreamer/src/
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/src/Count64.php
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/src/ZipStreamer.php
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/src/COMPR.php
   creating: nextcloud/3rdparty/deepdiver/zipstreamer/src/Lib/
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/src/Lib/Count64Base.php
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/src/Lib/Count64_64.php
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/src/Lib/Count64_32.php
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/MANUAL.md
  inflating: nextcloud/3rdparty/deepdiver/zipstreamer/COPYING
   creating: nextcloud/3rdparty/punic/
   creating: nextcloud/3rdparty/punic/punic/
  inflating: nextcloud/3rdparty/punic/punic/LIBPHONENUMBER-LICENSE.txt
   creating: nextcloud/3rdparty/punic/punic/src/
  inflating: nextcloud/3rdparty/punic/punic/src/Phone.php
   creating: nextcloud/3rdparty/punic/punic/src/Exception/
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/InvalidDataFile.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/InvalidLocale.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/NotImplemented.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/BadArgumentType.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/DataFileNotReadable.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/ValueNotInList.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/InvalidOverride.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/DataFolderNotFound.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/DataFileNotFound.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception/BadDataFileContents.php
  inflating: nextcloud/3rdparty/punic/punic/src/Language.php
  inflating: nextcloud/3rdparty/punic/punic/src/Number.php
  inflating: nextcloud/3rdparty/punic/punic/src/Data.php
  inflating: nextcloud/3rdparty/punic/punic/src/Territory.php
  inflating: nextcloud/3rdparty/punic/punic/src/Plural.php
  inflating: nextcloud/3rdparty/punic/punic/src/Script.php
  inflating: nextcloud/3rdparty/punic/punic/src/Unit.php
  inflating: nextcloud/3rdparty/punic/punic/src/Exception.php
  inflating: nextcloud/3rdparty/punic/punic/src/Misc.php
  inflating: nextcloud/3rdparty/punic/punic/src/Calendar.php
   creating: nextcloud/3rdparty/punic/punic/src/data/
   creating: nextcloud/3rdparty/punic/punic/src/data/en-GB/
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-GB/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh-Hant/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/en-IN/
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-IN/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/territoryContainment.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ordinals.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/timeData.php
   creating: nextcloud/3rdparty/punic/punic/src/data/hr/
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hr/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/fr/
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fr/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/cs/
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/cs/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/primaryZones.php
   creating: nextcloud/3rdparty/punic/punic/src/data/el/
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/el/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/sv/
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sv/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/telephoneCodeData.php
   creating: nextcloud/3rdparty/punic/punic/src/data/nn/
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nn/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/likelySubtags.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/parentLocales.php
   creating: nextcloud/3rdparty/punic/punic/src/data/th/
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/th/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/sr/
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sr/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/plurals.php
   creating: nextcloud/3rdparty/punic/punic/src/data/ko/
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ko/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/sl/
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sl/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/dayPeriods.php
   creating: nextcloud/3rdparty/punic/punic/src/data/nl/
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nl/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/codeMappings.php
   creating: nextcloud/3rdparty/punic/punic/src/data/sk/
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/sk/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/currencyData.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/subdivisionContainment.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/weekData.php
   creating: nextcloud/3rdparty/punic/punic/src/data/hi/
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hi/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/en-CA/
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-CA/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/uk/
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/uk/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/en-AU/
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-AU/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/fi/
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/fi/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/pt/
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/en-HK/
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en-HK/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/territoryInfo.php
   creating: nextcloud/3rdparty/punic/punic/src/data/en/
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/en/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/pl/
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pl/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/hu/
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/hu/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/tr/
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/tr/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/timeZones.php
   creating: nextcloud/3rdparty/punic/punic/src/data/root/
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/root/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/de/
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/de/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/ar/
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ar/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/nb/
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/nb/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/zh/
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/zh/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/da/
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/da/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/vi/
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/vi/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/measurementData.php
   creating: nextcloud/3rdparty/punic/punic/src/data/ru/
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ru/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/it/
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/it/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/ja/
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ja/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/he/
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/he/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/ro/
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ro/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/es/
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/es/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/pt-PT/dateFields.php
   creating: nextcloud/3rdparty/punic/punic/src/data/ca/
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/territories.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/numbers.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/localeDisplayNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/calendar.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/rbnf.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/currencies.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/subdivisions.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/units.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/measurementSystemNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/layout.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/languages.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/scripts.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/listPatterns.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/timeZoneNames.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/ca/dateFields.php
  inflating: nextcloud/3rdparty/punic/punic/src/data/metaZones.php
  inflating: nextcloud/3rdparty/punic/punic/src/Comparer.php
  inflating: nextcloud/3rdparty/punic/punic/src/Currency.php
  inflating: nextcloud/3rdparty/punic/punic/LICENSE.txt
  inflating: nextcloud/3rdparty/punic/punic/punic.php
  inflating: nextcloud/3rdparty/punic/punic/UNICODE-LICENSE.txt
  inflating: nextcloud/3rdparty/autoload.php
  inflating: nextcloud/3rdparty/composer.json
   creating: nextcloud/3rdparty/sabre/
   creating: nextcloud/3rdparty/sabre/http/
   creating: nextcloud/3rdparty/sabre/http/lib/
  inflating: nextcloud/3rdparty/sabre/http/lib/ClientException.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Message.php
  inflating: nextcloud/3rdparty/sabre/http/lib/MessageInterface.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Request.php
  inflating: nextcloud/3rdparty/sabre/http/lib/ResponseDecorator.php
  inflating: nextcloud/3rdparty/sabre/http/lib/MessageDecoratorTrait.php
  inflating: nextcloud/3rdparty/sabre/http/lib/HttpException.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Sapi.php
  inflating: nextcloud/3rdparty/sabre/http/lib/ClientHttpException.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Response.php
  inflating: nextcloud/3rdparty/sabre/http/lib/RequestInterface.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Client.php
   creating: nextcloud/3rdparty/sabre/http/lib/Auth/
  inflating: nextcloud/3rdparty/sabre/http/lib/Auth/Digest.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Auth/AWS.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Auth/Bearer.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Auth/Basic.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Auth/AbstractAuth.php
  inflating: nextcloud/3rdparty/sabre/http/lib/RequestDecorator.php
  inflating: nextcloud/3rdparty/sabre/http/lib/Version.php
  inflating: nextcloud/3rdparty/sabre/http/lib/functions.php
  inflating: nextcloud/3rdparty/sabre/http/lib/ResponseInterface.php
  inflating: nextcloud/3rdparty/sabre/http/LICENSE
   creating: nextcloud/3rdparty/sabre/uri/
   creating: nextcloud/3rdparty/sabre/uri/lib/
  inflating: nextcloud/3rdparty/sabre/uri/lib/InvalidUriException.php
  inflating: nextcloud/3rdparty/sabre/uri/lib/Version.php
  inflating: nextcloud/3rdparty/sabre/uri/lib/functions.php
  inflating: nextcloud/3rdparty/sabre/uri/LICENSE
   creating: nextcloud/3rdparty/sabre/xml/
   creating: nextcloud/3rdparty/sabre/xml/lib/
  inflating: nextcloud/3rdparty/sabre/xml/lib/ContextStackTrait.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/XmlSerializable.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element.php
   creating: nextcloud/3rdparty/sabre/xml/lib/Element/
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element/XmlFragment.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element/Base.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element/Cdata.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element/KeyValue.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element/Elements.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Element/Uri.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Reader.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Writer.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Service.php
   creating: nextcloud/3rdparty/sabre/xml/lib/Deserializer/
  inflating: nextcloud/3rdparty/sabre/xml/lib/Deserializer/functions.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/ParseException.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/LibXMLException.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/Version.php
   creating: nextcloud/3rdparty/sabre/xml/lib/Serializer/
  inflating: nextcloud/3rdparty/sabre/xml/lib/Serializer/functions.php
  inflating: nextcloud/3rdparty/sabre/xml/lib/XmlDeserializable.php
  inflating: nextcloud/3rdparty/sabre/xml/LICENSE
   creating: nextcloud/3rdparty/sabre/dav/
   creating: nextcloud/3rdparty/sabre/dav/lib/
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/IQuota.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/LockInfo.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/Plugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/Backend/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/Backend/PDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/Backend/BackendInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/Backend/File.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Locks/Backend/AbstractBackend.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/FSExt/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/FSExt/File.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/FSExt/Directory.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Sharing/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Sharing/ISharedNode.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Sharing/Plugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/LockTokenMatchesRequestUri.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/LengthRequired.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/MethodNotAllowed.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/NotFound.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/TooManyMatches.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/NotAuthenticated.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/NotImplemented.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/UnsupportedMediaType.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/Locked.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/PaymentRequired.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/Forbidden.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/ReportNotSupported.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/InvalidResourceType.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/RequestedRangeNotSatisfiable.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/InsufficientStorage.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/PreconditionFailed.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/ServiceUnavailable.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/ConflictingLock.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/InvalidSyncToken.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/BadRequest.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception/Conflict.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Collection.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/PartialUpdate/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PartialUpdate/IPatchSupport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PartialUpdate/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/INode.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/FS/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/FS/Node.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/FS/File.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/FS/Directory.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropertyStorage/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropertyStorage/Plugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropertyStorage/Backend/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropertyStorage/Backend/PDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropertyStorage/Backend/BackendInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/IExtendedCollection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Node.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/PropFindAll.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/sabredav.css
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/ICON-LICENSE
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/open-iconic.ttf
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/open-iconic.woff
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/open-iconic.otf
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/open-iconic.eot
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/open-iconic.svg
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/openiconic/open-iconic.css
 extracting: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/sabredav.png
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/assets/favicon.ico
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/MapGetToPropFind.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/GuessContentType.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/HtmlOutput.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Browser/HtmlOutputHelper.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropFind.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/MkCol.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Sync/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Sync/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Sync/ISyncCollection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/StringUtil.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/File.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/UUIDUtil.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/IProperties.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/ICopyTarget.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/IMoveTarget.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/INodeByPath.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/CorePlugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Mount/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Mount/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/IMultiGet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Client.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Plugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/Apache.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/PDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/BackendInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/File.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/AbstractBasic.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/BasicCallBack.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/IMAP.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/PDOBasicAuth.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/AbstractBearer.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Auth/Backend/AbstractDigest.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Exception.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/PropPatch.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Tree.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/SimpleCollection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Version.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/ServerPlugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/TemporaryFileFilterPlugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Element/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Element/Sharee.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Element/Response.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Element/Prop.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/LockDiscovery.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/SupportedMethodSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/LocalHref.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/Invite.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/SupportedLock.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/Complex.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/Href.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/SupportedReportSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/GetLastModified.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/ShareAccess.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Property/ResourceType.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Service.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Response/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Response/MultiStatus.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/PropFind.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/MkCol.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/SyncCollectionReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/PropPatch.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/Lock.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Xml/Request/ShareResource.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/Server.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/SimpleFile.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/IFile.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAV/ICollection.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/AbstractPrincipalCollection.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Exception/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Exception/NoAbstract.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Exception/NeedPrivileges.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Exception/NotSupportedPrivilege.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Exception/NotRecognizedPrincipal.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Exception/AceConflict.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/FS/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/FS/Collection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/FS/File.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/FS/HomeCollection.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/PrincipalBackend/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/PrincipalBackend/PDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/PrincipalBackend/BackendInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/PrincipalBackend/CreatePrincipalSupport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/PrincipalBackend/AbstractBackend.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Principal.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/IACL.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/PrincipalCollection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/ACLTrait.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/IPrincipalCollection.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Property/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Property/CurrentUserPrivilegeSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Property/Acl.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Property/Principal.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Property/SupportedPrivilegeSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Property/AclRestrictions.php
   creating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Request/
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Request/PrincipalPropertySearchReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Request/PrincipalSearchPropertySetReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Request/PrincipalMatchReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Request/ExpandPropertyReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/Xml/Request/AclPrincipalPropSetReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/DAVACL/IPrincipal.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/AddressBook.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/IAddressBook.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Card.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/AddressBookHome.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/IDirectory.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/ICard.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/VCFExportPlugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/
   creating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Property/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Property/SupportedAddressData.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Property/SupportedCollationSet.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Request/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Request/AddressBookQueryReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Request/AddressBookMultiGetReport.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Filter/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Filter/PropFilter.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Filter/AddressData.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Xml/Filter/ParamFilter.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/AddressBookRoot.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Backend/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Backend/PDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Backend/BackendInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Backend/AbstractBackend.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CardDAV/Backend/SyncSupport.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/SharingPlugin.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/Collection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/IProxyWrite.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/IProxyRead.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/User.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/ProxyRead.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Principal/ProxyWrite.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/ICSExportPlugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/ICalendar.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Exception/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Exception/InvalidComponentType.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/CalendarObject.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/CalendarHome.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/ICalendarObjectContainer.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/CalendarRoot.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/ISharedCalendar.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/ICalendarObject.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/CalendarQueryValidator.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Subscriptions/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Subscriptions/ISubscription.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Subscriptions/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Subscriptions/Subscription.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Calendar.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/ScheduleCalendarTransp.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/Invite.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/AllowedSharingModes.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/SupportedCalendarComponentSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/SupportedCollationSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/EmailAddressSet.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Property/SupportedCalendarData.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/CalendarMultiGetReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/MkCalendar.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/CalendarQueryReport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/InviteReply.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/Share.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Request/FreeBusyQueryReport.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Filter/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Filter/PropFilter.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Filter/CompFilter.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Filter/ParamFilter.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Filter/CalendarData.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Notification/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Notification/NotificationInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Notification/Invite.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Notification/SystemStatus.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Xml/Notification/InviteReply.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/SharedCalendar.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/SubscriptionSupport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/SharingSupport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/SchedulingSupport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/PDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/NotificationSupport.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/BackendInterface.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/SimplePDO.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/AbstractBackend.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Backend/SyncSupport.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Notifications/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Notifications/Collection.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Notifications/INode.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Notifications/Node.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Notifications/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Notifications/ICollection.php
   creating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/IOutbox.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/Plugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/IMipPlugin.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/SchedulingObject.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/ISchedulingObject.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/Inbox.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/IInbox.php
  inflating: nextcloud/3rdparty/sabre/dav/lib/CalDAV/Schedule/Outbox.php
  inflating: nextcloud/3rdparty/sabre/dav/LICENSE
   creating: nextcloud/3rdparty/sabre/event/
   creating: nextcloud/3rdparty/sabre/event/lib/
  inflating: nextcloud/3rdparty/sabre/event/lib/EventEmitter.php
  inflating: nextcloud/3rdparty/sabre/event/lib/WildcardEmitterTrait.php
  inflating: nextcloud/3rdparty/sabre/event/lib/PromiseAlreadyResolvedException.php
  inflating: nextcloud/3rdparty/sabre/event/lib/Emitter.php
  inflating: nextcloud/3rdparty/sabre/event/lib/WildcardEmitter.php
  inflating: nextcloud/3rdparty/sabre/event/lib/EmitterTrait.php
  inflating: nextcloud/3rdparty/sabre/event/lib/coroutine.php
  inflating: nextcloud/3rdparty/sabre/event/lib/EmitterInterface.php
  inflating: nextcloud/3rdparty/sabre/event/lib/Promise.php
  inflating: nextcloud/3rdparty/sabre/event/lib/Version.php
   creating: nextcloud/3rdparty/sabre/event/lib/Promise/
  inflating: nextcloud/3rdparty/sabre/event/lib/Promise/functions.php
   creating: nextcloud/3rdparty/sabre/event/lib/Loop/
  inflating: nextcloud/3rdparty/sabre/event/lib/Loop/Loop.php
  inflating: nextcloud/3rdparty/sabre/event/lib/Loop/functions.php
  inflating: nextcloud/3rdparty/sabre/event/LICENSE
   creating: nextcloud/3rdparty/sabre/vobject/
   creating: nextcloud/3rdparty/sabre/vobject/resources/
   creating: nextcloud/3rdparty/sabre/vobject/resources/schema/
  inflating: nextcloud/3rdparty/sabre/vobject/resources/schema/xcal.rng
  inflating: nextcloud/3rdparty/sabre/vobject/resources/schema/xcard.rng
   creating: nextcloud/3rdparty/sabre/vobject/lib/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/FreeBusyGenerator.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Parser/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Parser/Json.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Parser/MimeDir.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Parser/XML/
   creating: nextcloud/3rdparty/sabre/vobject/lib/Parser/XML/Element/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Parser/XML/Element/KeyValue.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Parser/Parser.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Parser/XML.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/BirthdayCalendarGenerator.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/ElementList.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Splitter/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Splitter/ICalendar.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Splitter/SplitterInterface.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Splitter/VCard.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/timezonedata/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/timezonedata/php-bc.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/timezonedata/exchangezones.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/timezonedata/lotuszones.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/timezonedata/windowszones.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/timezonedata/php-workaround.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Node.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Recur/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Recur/EventIterator.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Recur/RDateIterator.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Recur/NoInstancesException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Recur/MaxInstancesExceededException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Recur/RRuleIterator.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Reader.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/FindFromOffset.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/GuessFromLicEntry.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/TimezoneGuesser.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/FindFromTimezoneMap.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/GuessFromMsTzId.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/FindFromTimezoneIdentifier.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimezoneGuesser/TimezoneFinder.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/TimeZoneUtil.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/StringUtil.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/FreeBusyData.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/UUIDUtil.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Property/
   creating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/Duration.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/Date.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/DateTime.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/Period.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/CalAddress.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/ICalendar/Recur.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/FloatValue.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/DateAndOrTime.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/Date.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/LanguageTag.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/DateTime.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/TimeStamp.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/VCard/PhoneNumber.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/Time.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/UtcOffset.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/IntegerValue.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/Boolean.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/Unknown.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/Text.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/Binary.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/FlatText.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property/Uri.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/VCardConverter.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Writer.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/InvalidDataException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/DateTimeParser.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/ITip/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/ITip/Message.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/ITip/ITipException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/ITip/SameOrganizerForAllComponentsException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/ITip/Broker.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/ParseException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Document.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/EofException.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Settings.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/PHPUnitAssertions.php
   creating: nextcloud/3rdparty/sabre/vobject/lib/Component/
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VAlarm.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VTodo.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VAvailability.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VFreeBusy.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VCard.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VCalendar.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VJournal.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VEvent.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/VTimeZone.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Component/Available.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Version.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Parameter.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Property.php
  inflating: nextcloud/3rdparty/sabre/vobject/lib/Cli.php
  inflating: nextcloud/3rdparty/sabre/vobject/LICENSE
   creating: nextcloud/3rdparty/mlocati/
   creating: nextcloud/3rdparty/mlocati/ip-lib/
   creating: nextcloud/3rdparty/mlocati/ip-lib/src/
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/ParseStringFlag.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Factory.php
   creating: nextcloud/3rdparty/mlocati/ip-lib/src/Address/
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Address/AddressInterface.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Address/AssignedRange.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Address/IPv4.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Address/Type.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Address/IPv6.php
   creating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/RangeInterface.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/Single.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/AbstractRange.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/Type.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/Pattern.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Range/Subnet.php
   creating: nextcloud/3rdparty/mlocati/ip-lib/src/Service/
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Service/RangesFromBoundaryCalculator.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Service/UnsignedIntegerMath.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/src/Service/BinaryMath.php
  inflating: nextcloud/3rdparty/mlocati/ip-lib/LICENSE.txt
  inflating: nextcloud/3rdparty/mlocati/ip-lib/ip-lib.php
   creating: nextcloud/3rdparty/icewind/
   creating: nextcloud/3rdparty/icewind/streams/
   creating: nextcloud/3rdparty/icewind/streams/src/
  inflating: nextcloud/3rdparty/icewind/streams/src/Wrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/ReadHashWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/Path.php
  inflating: nextcloud/3rdparty/icewind/streams/src/IteratorDirectory.php
  inflating: nextcloud/3rdparty/icewind/streams/src/SeekableWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/WriteHashWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/CallbackWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/File.php
  inflating: nextcloud/3rdparty/icewind/streams/src/UrlCallback.php
  inflating: nextcloud/3rdparty/icewind/streams/src/RetryWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/NullWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/PathWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/Url.php
  inflating: nextcloud/3rdparty/icewind/streams/src/HashWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/WrapperHandler.php
  inflating: nextcloud/3rdparty/icewind/streams/src/Directory.php
  inflating: nextcloud/3rdparty/icewind/streams/src/DirectoryFilter.php
  inflating: nextcloud/3rdparty/icewind/streams/src/DirectoryWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/src/CountWrapper.php
  inflating: nextcloud/3rdparty/icewind/streams/LICENSE.txt
  inflating: nextcloud/3rdparty/icewind/streams/composer.json.license
   creating: nextcloud/3rdparty/icewind/streams/LICENSES/
  inflating: nextcloud/3rdparty/icewind/streams/LICENSES/MIT.txt
  inflating: nextcloud/3rdparty/icewind/streams/LICENSES/CC0-1.0.txt
  inflating: nextcloud/3rdparty/icewind/streams/LICENSES/AGPL-3.0-or-later.txt
   creating: nextcloud/3rdparty/icewind/smb/
   creating: nextcloud/3rdparty/icewind/smb/src/
   creating: nextcloud/3rdparty/icewind/smb/src/Exception/
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/FileInUseException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/OutOfSpaceException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidTicket.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidRequestException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/ConnectionAbortedException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidParameterException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/NotFoundException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/DependencyException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/AuthenticationException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/TimedOutException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/NotEmptyException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/AlreadyExistsException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidResourceException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/AccessDeniedException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidTypeException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/ConnectionRefusedException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/ForbiddenException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/ConnectionResetException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/NoLoginServerException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/ConnectionException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/Exception.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/ConnectException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/HostDownException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/NoRouteToHostException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/RevisionMismatchException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidPathException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Exception/InvalidHostException.php
  inflating: nextcloud/3rdparty/icewind/smb/src/ISystem.php
  inflating: nextcloud/3rdparty/icewind/smb/src/KerberosApacheAuth.php
  inflating: nextcloud/3rdparty/icewind/smb/src/AnonymousAuth.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Options.php
  inflating: nextcloud/3rdparty/icewind/smb/src/ITimeZoneProvider.php
  inflating: nextcloud/3rdparty/icewind/smb/src/KerberosAuth.php
  inflating: nextcloud/3rdparty/icewind/smb/src/AbstractServer.php
  inflating: nextcloud/3rdparty/icewind/smb/src/BasicAuth.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Change.php
  inflating: nextcloud/3rdparty/icewind/smb/src/IOptions.php
  inflating: nextcloud/3rdparty/icewind/smb/src/KerberosTicket.php
  inflating: nextcloud/3rdparty/icewind/smb/src/System.php
  inflating: nextcloud/3rdparty/icewind/smb/src/INotifyHandler.php
  inflating: nextcloud/3rdparty/icewind/smb/src/AbstractShare.php
   creating: nextcloud/3rdparty/icewind/smb/src/Wrapped/
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/RawConnection.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/ErrorCodes.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/FileInfo.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/Connection.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/Share.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/NotifyHandler.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/Parser.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Wrapped/Server.php
  inflating: nextcloud/3rdparty/icewind/smb/src/TimeZoneProvider.php
  inflating: nextcloud/3rdparty/icewind/smb/src/IServer.php
  inflating: nextcloud/3rdparty/icewind/smb/src/ServerFactory.php
  inflating: nextcloud/3rdparty/icewind/smb/src/ACL.php
  inflating: nextcloud/3rdparty/icewind/smb/src/IAuth.php
   creating: nextcloud/3rdparty/icewind/smb/src/Native/
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeState.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeReadStream.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeServer.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeShare.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeWriteStream.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeFileInfo.php
  inflating: nextcloud/3rdparty/icewind/smb/src/Native/NativeStream.php
  inflating: nextcloud/3rdparty/icewind/smb/src/IFileInfo.php
  inflating: nextcloud/3rdparty/icewind/smb/src/IShare.php
  inflating: nextcloud/3rdparty/icewind/smb/src/StringBuffer.php
  inflating: nextcloud/3rdparty/icewind/smb/LICENSE.txt
   creating: nextcloud/3rdparty/icewind/smb/LICENSES/
  inflating: nextcloud/3rdparty/icewind/smb/LICENSES/MIT.txt
  inflating: nextcloud/3rdparty/icewind/smb/LICENSES/CC0-1.0.txt
  inflating: nextcloud/3rdparty/icewind/smb/LICENSES/AGPL-3.0-or-later.txt
   creating: nextcloud/3rdparty/icewind/searchdav/
   creating: nextcloud/3rdparty/icewind/searchdav/src/
   creating: nextcloud/3rdparty/icewind/searchdav/src/DAV/
  inflating: nextcloud/3rdparty/icewind/searchdav/src/DAV/DiscoverHandler.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/DAV/SearchHandler.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/DAV/SearchPlugin.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/DAV/QueryParser.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/DAV/PathHelper.php
   creating: nextcloud/3rdparty/icewind/searchdav/src/XML/
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/BasicSearchSchema.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/Order.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/Literal.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/Limit.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/BasicSearch.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/SupportedQueryGrammar.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/Scope.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/QueryDiscoverResponse.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/Operator.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/XML/PropDesc.php
   creating: nextcloud/3rdparty/icewind/searchdav/src/Query/
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Query/Order.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Query/Literal.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Query/Limit.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Query/Scope.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Query/Query.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Query/Operator.php
   creating: nextcloud/3rdparty/icewind/searchdav/src/Backend/
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Backend/SearchPropertyDefinition.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Backend/SearchResult.php
  inflating: nextcloud/3rdparty/icewind/searchdav/src/Backend/ISearchBackend.php
  inflating: nextcloud/3rdparty/icewind/searchdav/LICENSE
   creating: nextcloud/3rdparty/cweagans/
   creating: nextcloud/3rdparty/cweagans/composer-patches/
  inflating: nextcloud/3rdparty/cweagans/composer-patches/LICENSE.md
   creating: nextcloud/3rdparty/cweagans/composer-patches/src/
  inflating: nextcloud/3rdparty/cweagans/composer-patches/src/Patches.php
  inflating: nextcloud/3rdparty/cweagans/composer-patches/src/PatchEvents.php
  inflating: nextcloud/3rdparty/cweagans/composer-patches/src/PatchEvent.php
   creating: nextcloud/3rdparty/paragonie/
   creating: nextcloud/3rdparty/paragonie/constant_time_encoding/
   creating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Base64.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Encoding.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Base64DotSlashOrdered.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Base32.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/EncoderInterface.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Base64DotSlash.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Base32Hex.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Base64UrlSafe.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Hex.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/RFC4648.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/src/Binary.php
  inflating: nextcloud/3rdparty/paragonie/constant_time_encoding/LICENSE.txt
  inflating: nextcloud/3rdparty/LICENSE INFO
  inflating: nextcloud/3rdparty/composer.patches.json
   creating: nextcloud/3rdparty/egulias/
   creating: nextcloud/3rdparty/egulias/email-validator/
   creating: nextcloud/3rdparty/egulias/email-validator/src/
   creating: nextcloud/3rdparty/egulias/email-validator/src/Parser/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/DomainLiteral.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/DoubleQuote.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/IDRightPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/DomainPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/Comment.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/LocalPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/PartParser.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/IDLeftPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/FoldingWhiteSpace.php
   creating: nextcloud/3rdparty/egulias/email-validator/src/Parser/CommentStrategy/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/CommentStrategy/CommentStrategy.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/CommentStrategy/DomainComment.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser/CommentStrategy/LocalComment.php
   creating: nextcloud/3rdparty/egulias/email-validator/src/Validation/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/MessageIDValidation.php
   creating: nextcloud/3rdparty/egulias/email-validator/src/Validation/Exception/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/Exception/EmptyValidationList.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/RFCValidation.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/DNSRecords.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/DNSGetRecordWrapper.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/NoRFCWarningsValidation.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/EmailValidation.php
   creating: nextcloud/3rdparty/egulias/email-validator/src/Validation/Extra/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/Extra/SpoofCheckValidation.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/DNSCheckValidation.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Validation/MultipleValidationWithAnd.php
   creating: nextcloud/3rdparty/egulias/email-validator/src/Warning/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/QuotedPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/DomainLiteral.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6ColonEnd.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6Deprecated.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/AddressLiteral.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/DeprecatedComment.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6BadChar.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/ObsoleteDTEXT.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/CFWSWithFWS.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6GroupCount.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/TLD.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/CFWSNearAt.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/Comment.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/Warning.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/EmailTooLong.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/NoDNSMXRecord.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/LocalTooLong.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/QuotedString.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6DoubleColon.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6ColonStart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Warning/IPV6MaxGroups.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/EmailParser.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/MessageIDParser.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/EmailLexer.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/EmailValidator.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Parser.php
   creating: nextcloud/3rdparty/egulias/email-validator/src/Result/
   creating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/UnclosedQuotedString.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/DomainTooLong.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/UnclosedComment.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ExpectingDTEXT.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/NoLocalPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/NoDomainPart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/SpoofEmail.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ExceptionFound.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/LocalOrReservedDomain.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/AtextAfterCFWS.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/DotAtStart.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ConsecutiveAt.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/CRLFX2.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/EmptyReason.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/CRLFAtTheEnd.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/UnOpenedComment.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/DotAtEnd.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/UnableToGetDNSRecord.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/DomainAcceptsNoMail.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/UnusualElements.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/DomainHyphened.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/CharNotAllowed.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ExpectingDomainLiteralClose.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/CommaInDomain.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ConsecutiveDot.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/LabelTooLong.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/NoDNSRecord.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ExpectingATEXT.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/ExpectingCTEXT.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/Reason.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/RFCWarnings.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/CommentsInIDRight.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/DetailedReason.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Reason/CRNoLF.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/SpoofEmail.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/Result.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/InvalidEmail.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/MultipleErrors.php
  inflating: nextcloud/3rdparty/egulias/email-validator/src/Result/ValidEmail.php
  inflating: nextcloud/3rdparty/egulias/email-validator/CONTRIBUTING.md
  inflating: nextcloud/3rdparty/egulias/email-validator/LICENSE
   creating: nextcloud/3rdparty/masterminds/
   creating: nextcloud/3rdparty/masterminds/html5/
   creating: nextcloud/3rdparty/masterminds/html5/src/
   creating: nextcloud/3rdparty/masterminds/html5/src/HTML5/
   creating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/UTF8Utils.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/CharacterReference.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/TreeBuildingRules.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/Tokenizer.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/DOMTreeBuilder.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/StringInputStream.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/Scanner.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/InputStream.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/ParseError.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/FileInputStream.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Parser/EventHandler.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Entities.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/InstructionProcessor.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Exception.php
   creating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Serializer/
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Serializer/HTML5Entities.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Serializer/Traverser.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Serializer/OutputRules.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Serializer/RulesInterface.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5/Elements.php
  inflating: nextcloud/3rdparty/masterminds/html5/src/HTML5.php
  inflating: nextcloud/3rdparty/masterminds/html5/LICENSE.txt
   creating: nextcloud/3rdparty/aws/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/AwsClientInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/XmlParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/MetadataParserTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/EventParsingIterator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/RestXmlParser.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/Exception/ParserException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/Crc32ValidatingParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/AbstractParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/PayloadParserTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/JsonParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/DecodingEventStreamIterator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/JsonRpcParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/NonSeekableStreamDecodingEventStreamIterator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/RestJsonParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/AbstractRestParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Parser/QueryParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Shape.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ApiProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ListShape.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/AbstractModel.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/DateTimeResult.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Operation.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/TimestampShape.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/StructureShape.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Service.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/MapShape.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Validator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/SupportedProtocols.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/QueryParamBuilder.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/RestSerializer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/JsonRpcSerializer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/RestXmlSerializer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/XmlBody.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/QuerySerializer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/RestJsonSerializer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/Ec2ParamBuilder.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/Serializer/JsonBody.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ErrorParser/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ErrorParser/JsonRpcErrorParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ErrorParser/JsonParserTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ErrorParser/RestJsonErrorParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ErrorParser/XmlErrorParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ErrorParser/AbstractErrorParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/ShapeMap.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Api/DocModel.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/ArnInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/Exception/InvalidArnException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/ResourceTypeAndIdTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/AccessPointArn.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/BucketArnInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/AccessPointArn.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/MultiRegionAccessPointArn.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/OutpostsBucketArn.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/OutpostsAccessPointArn.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/S3/OutpostsArnInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/ArnParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/AccessPointArnInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/ObjectLambdaAccessPointArn.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Arn/Arn.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/RetryMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/PresignUrlMiddleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/EndpointDefinitionProvider.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Rule/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Rule/RuleCreator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Rule/EndpointRule.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Rule/ErrorRule.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Rule/AbstractRule.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Rule/TreeRule.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Ruleset/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Ruleset/RulesetEndpoint.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Ruleset/RulesetStandardLibrary.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Ruleset/RulesetParameter.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/Ruleset/Ruleset.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/EndpointProviderV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/EndpointV2SerializerTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointV2/EndpointV2Middleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/PatternEndpointProvider.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseFipsEndpoint/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseFipsEndpoint/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseFipsEndpoint/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseFipsEndpoint/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseFipsEndpoint/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseFipsEndpoint/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/Partition.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/PartitionEndpointProvider.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseDualstackEndpoint/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseDualstackEndpoint/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseDualstackEndpoint/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseDualstackEndpoint/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseDualstackEndpoint/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/UseDualstackEndpoint/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/PartitionInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Endpoint/EndpointProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientResolver.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/MockHandler.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/RefreshableTokenProviderInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/Token.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/TokenProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/TokenInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/SsoTokenProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/ParsesIniTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/TokenAuthorization.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/BearerTokenAuthorization.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Token/SsoToken.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/IncalculablePayloadException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/CryptoException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/EventStreamDataException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/CommonRuntimeException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/TokenException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/InvalidRegionException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/UnresolvedApiException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/UnresolvedSignatureException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/CredentialsException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/MultipartUploadException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/InvalidJsonException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/CryptoPolyfillException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/UnresolvedEndpointException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/CouldNotCreateChecksumException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Exception/AwsException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/AbstractConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/LruArrayCache.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/SignatureInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/S3SignatureV4.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/S3ExpressSignature.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/SignatureV4.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/AnonymousSignature.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/SignatureProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Signature/SignatureTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/TraceMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/QueryCompatibleInputMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/HandlerList.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/PhpHash.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/DefaultsMode/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/DefaultsMode/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/DefaultsMode/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/DefaultsMode/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/DefaultsMode/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/DefaultsMode/Configuration.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Kms/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Kms/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Kms/Exception/KmsException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Kms/KmsClient.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/HasMonitoringEventsTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Result.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Parser/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Parser/ValidateResponseChecksumResultMutator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Parser/S3ResultMutator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Parser/GetBucketLocationResultMutator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Parser/S3Parser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/MultipartUploadingTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/AmbiguousSuccessParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/S3MultiRegionClient.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Exception/DeleteMultipleObjectsException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Exception/S3Exception.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Exception/S3MultipartUploadException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Exception/PermanentRedirectException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/PutObjectUrlMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/S3EndpointMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/MultipartCopy.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/ObjectCopier.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/S3ClientInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/UseArnRegion/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/UseArnRegion/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/UseArnRegion/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/UseArnRegion/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/UseArnRegion/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/UseArnRegion/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/MultipartUploader.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/BucketEndpointArnMiddleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RegionalEndpoint/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RegionalEndpoint/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RegionalEndpoint/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RegionalEndpoint/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RegionalEndpoint/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RegionalEndpoint/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/ExpiresParsingMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/ApplyChecksumMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Transfer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/S3UriParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/S3ClientTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/BatchDelete.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/StreamWrapper.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/ObjectUploader.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/PostObject.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/ValidateResponseChecksumParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/RetryableMalformedResponseParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/SSECMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/S3Client.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/GetBucketLocationParser.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/PermanentRedirectMiddleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/InstructionFileMetadataStrategy.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/UserAgentTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/S3EncryptionMultipartUploader.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/S3EncryptionClientV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/S3EncryptionClient.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/CryptoParamsTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/HeadersMetadataStrategy.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/CryptoParamsTraitV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/Crypto/S3EncryptionMultipartUploaderV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/CalculatesChecksumTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/PostObjectV4.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/BucketEndpointMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/S3/EndpointRegionHelperTrait.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Configuration/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Configuration/ConfigurationResolver.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/MultiRegionClient.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/AwsClient.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/PsrCacheAdapter.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/HashInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/IdempotencyTokenMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/CacheInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/History.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/MonitoringMiddlewareInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/ApiCallMonitoringMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/ApiCallAttemptMonitoringMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ClientSideMonitoring/AbstractMonitoringMiddleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/RateLimiter.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/RetryHelperTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Retry/QuotaManager.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Psr16CacheAdapter.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/DoctrineCacheAdapter.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSOOIDC/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSOOIDC/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSOOIDC/Exception/SSOOIDCException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSOOIDC/SSOOIDCClient.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/HasDataTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/MonitoringEventsInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/HashingStream.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Middleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Script/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Script/Composer/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Script/Composer/Composer.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sdk.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/RetryMiddlewareV2.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Auth/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Auth/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Auth/Exception/UnresolvedAuthSchemeException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Auth/AuthSchemeResolver.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Auth/AuthSelectionMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Auth/AuthSchemeResolverInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/RequestCompressionMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Waiter.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Handler/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Handler/GuzzleV6/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Handler/GuzzleV6/GuzzleHandler.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Handler/Guzzle/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Handler/Guzzle/GuzzleHandler.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Multipart/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Multipart/AbstractUploadManager.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Multipart/UploadState.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Multipart/AbstractUploader.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ResultPaginator.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/WrappedHttpHandler.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/InputValidationMiddleware.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/MaterialsProviderInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/MetadataStrategyInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AesDecryptingStream.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AesStreamInterfaceV2.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/Cipher/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/Cipher/CipherBuilderTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/Cipher/CipherMethod.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/Cipher/Cbc.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/KmsMaterialsProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AesEncryptingStream.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/KmsMaterialsProviderV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/DecryptionTraitV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/MetadataEnvelope.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/EncryptionTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/MaterialsProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AbstractCryptoClientV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AesGcmEncryptingStream.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AesGcmDecryptingStream.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AbstractCryptoClient.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/MaterialsProviderV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/DecryptionTrait.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/MaterialsProviderInterfaceV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/AesStreamInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Crypto/EncryptionTraitV2.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ConfigurationProviderInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/StreamRequestPayloadMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/CommandInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/AwsClientTrait.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSO/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSO/SSOClient.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSO/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/SSO/Exception/SSOException.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/kms/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/kms/2014-11-01/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/kms/2014-11-01/paginators-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/kms/2014-11-01/smoke.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/kms/2014-11-01/api-2.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/kms/2014-11-01/endpoint-rule-set-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/endpoints.json.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso/2019-06-10/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso/2019-06-10/paginators-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso/2019-06-10/api-2.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso/2019-06-10/endpoint-rule-set-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/endpoints_prefix_history.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/grandfathered-services.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/manifest.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/partitions.json.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sts/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sts/2011-06-15/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sts/2011-06-15/paginators-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sts/2011-06-15/smoke.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sts/2011-06-15/api-2.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sts/2011-06-15/endpoint-rule-set-1.json.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/paginators-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/smoke.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/waiters-2.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/api-2.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/waiters-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/s3/2006-03-01/endpoint-rule-set-1.json.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso-oidc/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso-oidc/2019-06-10/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso-oidc/2019-06-10/paginators-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso-oidc/2019-06-10/api-2.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sso-oidc/2019-06-10/endpoint-rule-set-1.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/aliases.json.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/data/sdk-default-configuration.json.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/Exception/StsException.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/RegionalEndpoints/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/RegionalEndpoints/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/RegionalEndpoints/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/RegionalEndpoints/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/RegionalEndpoints/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/RegionalEndpoints/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Sts/StsClient.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/BearerTokenIdentity.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/AwsCredentialIdentity.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/S3/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/S3/S3ExpressIdentity.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/S3/S3ExpressIdentityProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Identity/IdentityInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/MetricsBuilder.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointParameterMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ResponseContainerInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/JsonCompiler.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/ConfigurationInterface.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/Exception/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/Exception/ConfigurationException.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/EndpointDiscoveryMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/ConfigurationProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/Configuration.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/EndpointDiscovery/EndpointList.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/CommandPool.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/functions.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/UserAgentMiddleware.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/ResultInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Command.php
   creating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/CredentialSources.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/AssumeRoleCredentialProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/AssumeRoleWithWebIdentityCredentialProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/CredentialsUtils.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/CredentialsInterface.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/InstanceProfileProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/Credentials.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/EcsCredentialProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/src/Credentials/CredentialProvider.php
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/THIRD-PARTY-LICENSES
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/LICENSE
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/CRT_INSTRUCTIONS.md
  inflating: nextcloud/3rdparty/aws/aws-sdk-php/NOTICE
   creating: nextcloud/3rdparty/aws/aws-crt-php/
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/IO/
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/IO/InputStream.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/IO/EventLoopGroup.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Log.php
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Internal/
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Internal/Encoding.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Internal/Extension.php
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/HTTP/
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/HTTP/Message.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/HTTP/Request.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/HTTP/Response.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/HTTP/Headers.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Options.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/NativeResource.php
   creating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/CredentialsProvider.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/SigningAlgorithm.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/SigningConfigAWS.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/SignedBodyHeaderType.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/Signable.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/SignatureType.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/Signing.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/AwsCredentials.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/StaticCredentialsProvider.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/Auth/SigningResult.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/src/AWS/CRT/CRT.php
  inflating: nextcloud/3rdparty/aws/aws-crt-php/LICENSE
 extracting: nextcloud/3rdparty/aws/aws-crt-php/NOTICE
   creating: nextcloud/3rdparty/deepdiver1975/
   creating: nextcloud/3rdparty/deepdiver1975/tarstreamer/
   creating: nextcloud/3rdparty/deepdiver1975/tarstreamer/src/
  inflating: nextcloud/3rdparty/deepdiver1975/tarstreamer/src/TarStreamer.php
  inflating: nextcloud/3rdparty/deepdiver1975/tarstreamer/src/TarHeader.php
  inflating: nextcloud/3rdparty/deepdiver1975/tarstreamer/LICENSE
   creating: nextcloud/3rdparty/stecman/
   creating: nextcloud/3rdparty/stecman/symfony-console-completion/
   creating: nextcloud/3rdparty/stecman/symfony-console-completion/src/
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/EnvironmentCompletionContext.php
   creating: nextcloud/3rdparty/stecman/symfony-console-completion/src/Completion/
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/Completion/CompletionInterface.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/Completion/CompletionAwareInterface.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/Completion/ShellPathCompletion.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/CompletionHandler.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/CompletionCommand.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/CompletionContext.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/HookFactory.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/src/Completion.php
  inflating: nextcloud/3rdparty/stecman/symfony-console-completion/LICENCE
   creating: nextcloud/3rdparty/nextcloud/
   creating: nextcloud/3rdparty/nextcloud/lognormalizer/
   creating: nextcloud/3rdparty/nextcloud/lognormalizer/src/
  inflating: nextcloud/3rdparty/nextcloud/lognormalizer/src/Normalizer.php
  inflating: nextcloud/3rdparty/nextcloud/lognormalizer/COPYING
   creating: nextcloud/3rdparty/lcobucci/
   creating: nextcloud/3rdparty/lcobucci/clock/
   creating: nextcloud/3rdparty/lcobucci/clock/src/
  inflating: nextcloud/3rdparty/lcobucci/clock/src/Clock.php
  inflating: nextcloud/3rdparty/lcobucci/clock/src/SystemClock.php
  inflating: nextcloud/3rdparty/lcobucci/clock/src/FrozenClock.php
  inflating: nextcloud/3rdparty/lcobucci/clock/LICENSE
   creating: nextcloud/3rdparty/brick/
   creating: nextcloud/3rdparty/brick/math/
   creating: nextcloud/3rdparty/brick/math/src/
  inflating: nextcloud/3rdparty/brick/math/src/BigDecimal.php
   creating: nextcloud/3rdparty/brick/math/src/Exception/
  inflating: nextcloud/3rdparty/brick/math/src/Exception/NegativeNumberException.php
  inflating: nextcloud/3rdparty/brick/math/src/Exception/IntegerOverflowException.php
  inflating: nextcloud/3rdparty/brick/math/src/Exception/MathException.php
  inflating: nextcloud/3rdparty/brick/math/src/Exception/RoundingNecessaryException.php
  inflating: nextcloud/3rdparty/brick/math/src/Exception/DivisionByZeroException.php
  inflating: nextcloud/3rdparty/brick/math/src/Exception/NumberFormatException.php
  inflating: nextcloud/3rdparty/brick/math/src/BigRational.php
   creating: nextcloud/3rdparty/brick/math/src/Internal/
   creating: nextcloud/3rdparty/brick/math/src/Internal/Calculator/
  inflating: nextcloud/3rdparty/brick/math/src/Internal/Calculator/BcMathCalculator.php
  inflating: nextcloud/3rdparty/brick/math/src/Internal/Calculator/GmpCalculator.php
  inflating: nextcloud/3rdparty/brick/math/src/Internal/Calculator/NativeCalculator.php
  inflating: nextcloud/3rdparty/brick/math/src/Internal/Calculator.php
  inflating: nextcloud/3rdparty/brick/math/src/BigNumber.php
  inflating: nextcloud/3rdparty/brick/math/src/BigInteger.php
  inflating: nextcloud/3rdparty/brick/math/src/RoundingMode.php
  inflating: nextcloud/3rdparty/brick/math/LICENSE
   creating: nextcloud/3rdparty/justinrainbow/
   creating: nextcloud/3rdparty/justinrainbow/json-schema/
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/Retrievers/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/Retrievers/AbstractRetriever.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/Retrievers/UriRetrieverInterface.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/Retrievers/PredefinedArray.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/Retrievers/FileGetContents.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/Retrievers/Curl.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/UriRetriever.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Uri/UriResolver.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/ConstraintError.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/ExceptionInterface.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/UnresolvableJsonPointerException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/UriResolverException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/InvalidConfigException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/InvalidSourceUriException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/ValidationException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/RuntimeException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/InvalidSchemaMediaTypeException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/InvalidSchemaException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/InvalidArgumentException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/ResourceNotFoundException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Exception/JsonDecodingException.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Rfc3339.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Enum.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/SchemaStorageInterface.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/UriRetrieverInterface.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Iterator/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Iterator/ObjectIterator.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Tool/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Tool/DeepComparer.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Tool/Validator/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Tool/Validator/UriValidator.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Tool/Validator/RelativeReferenceValidator.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Tool/DeepCopy.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Validator.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/SchemaStorage.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/UriResolverInterface.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Entity/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Entity/JsonPointer.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/SchemaConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/FormatConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/Factory.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/ConstraintInterface.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/BaseConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/ConstConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/TypeConstraint.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/TypeCheck/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/TypeCheck/LooseTypeCheck.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/TypeCheck/TypeCheckInterface.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/TypeCheck/StrictTypeCheck.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/NumberConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/UndefinedConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/Constraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/CollectionConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/StringConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/ObjectConstraint.php
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/src/JsonSchema/Constraints/EnumConstraint.php
   creating: nextcloud/3rdparty/justinrainbow/json-schema/dist/
   creating: nextcloud/3rdparty/justinrainbow/json-schema/dist/schema/
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/dist/schema/json-schema-draft-04.json
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/dist/schema/json-schema-draft-03.json
  inflating: nextcloud/3rdparty/justinrainbow/json-schema/LICENSE
   creating: nextcloud/3rdparty/pimple/
   creating: nextcloud/3rdparty/pimple/pimple/
   creating: nextcloud/3rdparty/pimple/pimple/src/
   creating: nextcloud/3rdparty/pimple/pimple/src/Pimple/
   creating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Exception/
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Exception/FrozenServiceException.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Exception/UnknownIdentifierException.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Exception/InvalidServiceIdentifierException.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Exception/ExpectedInvokableException.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/ServiceProviderInterface.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Container.php
   creating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Psr11/
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Psr11/ServiceLocator.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/Psr11/Container.php
  inflating: nextcloud/3rdparty/pimple/pimple/src/Pimple/ServiceIterator.php
  inflating: nextcloud/3rdparty/pimple/pimple/LICENSE
   creating: nextcloud/3rdparty/spomky-labs/
   creating: nextcloud/3rdparty/spomky-labs/cbor-php/
   creating: nextcloud/3rdparty/spomky-labs/cbor-php/src/
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/AbstractCBORObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Normalizable.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/StringStream.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Utils.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/CBORObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/DecoderInterface.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/MapItem.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/LengthCalculator.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Stream.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/MapObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/ListObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/IndefiniteLengthMapObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/IndefiniteLengthTextStringObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/TextStringObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/UnsignedIntegerObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/IndefiniteLengthListObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/IndefiniteLengthByteStringObject.php
   creating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/OtherObjectInterface.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/SimpleObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/BreakObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/DoublePrecisionFloatObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/NullObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/UndefinedObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/SinglePrecisionFloatObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/TrueObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/GenericObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/OtherObjectManagerInterface.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/FalseObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/OtherObjectManager.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/OtherObject/HalfPrecisionFloatObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/ByteStringObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Decoder.php
   creating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/Base64EncodingTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/Base64Tag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/NegativeBigIntegerTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/UnsignedBigIntegerTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/DatetimeTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/TagInterface.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/CBORTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/BigFloatTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/Base64UrlTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/CBOREncodingTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/TimestampTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/DecimalFractionTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/MimeTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/Base16EncodingTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/GenericTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/TagManager.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/UriTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/Base64UrlEncodingTag.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/Tag/TagManagerInterface.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/src/NegativeIntegerObject.php
  inflating: nextcloud/3rdparty/spomky-labs/cbor-php/LICENSE
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoBridge/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoBridge/Crypto.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoBridge/Crypto/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoBridge/Crypto/OpenSSLCrypto.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Holder.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Validation/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Validation/Exception/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Validation/Exception/ACValidationException.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Validation/ACValidationConfig.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Validation/ACValidator.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/AttributeCertificateInfo.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/AttCertValidityPeriod.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/AttributeCertificate.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/AttCertIssuer.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attributes.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/IetfAttrSyntax.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/AccessIdentityAttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/RoleAttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/SvceAuthInfo.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/AuthenticationInfoAttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/ChargingIdentityAttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/IetfAttrValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/Attribute/GroupAttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/V2Form.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/ObjectDigestInfo.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/AttributeCertificate/IssuerSerial.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Exception/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Exception/X509ValidationException.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/RFC822Name.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/IPAddress.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/OtherName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/DirectoryName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/RegisteredID.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/GeneralNames.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/GeneralName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/UniformResourceIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/EDIPartyName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/IPv4Address.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/X400Address.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/DNSName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/GeneralName/IPv6Address.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathBuilding/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathBuilding/CertificationPathBuilder.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/Exception/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/Exception/PathBuildingException.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/Exception/PathValidationException.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/Policy/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/Policy/PolicyNode.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/Policy/PolicyTree.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathValidation/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathValidation/PathValidator.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathValidation/PathValidationConfig.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathValidation/ValidatorState.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/PathValidation/PathValidationResult.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationPath/CertificationPath.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationRequest/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationRequest/CertificationRequest.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationRequest/Attributes.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationRequest/Attribute/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationRequest/Attribute/ExtensionRequestValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/CertificationRequest/CertificationRequestInfo.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extensions.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/UniqueIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Time.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Validity.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/TBSCertificate.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/PolicyMappingsExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePoliciesExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/NoRevocationAvailableExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/InhibitAnyPolicyExtension.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/PolicyMappings/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/PolicyMappings/PolicyMapping.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CRLDistributionPointsExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/IssuerAlternativeNameExtension.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AccessDescription/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AccessDescription/AuthorityAccessDescription.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AccessDescription/AccessDescription.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AccessDescription/SubjectAccessDescription.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AuthorityInformationAccessExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/Extension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/ExtendedKeyUsageExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/BasicConstraintsExtension.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/NameConstraints/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/NameConstraints/GeneralSubtree.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/NameConstraints/GeneralSubtrees.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/SubjectDirectoryAttributesExtension.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/PolicyInformation.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/CPSQualifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/UserNoticeQualifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/DisplayText.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/PolicyQualifierInfo.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/CertificatePolicy/NoticeReference.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/TargetInformationExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AAControlsExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/UnknownExtension.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/Target/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/Target/TargetName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/Target/Target.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/Target/Targets.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/Target/TargetGroup.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/SubjectKeyIdentifierExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/NameConstraintsExtension.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/DistributionPoint/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/DistributionPoint/DistributionPoint.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/DistributionPoint/RelativeName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/DistributionPoint/DistributionPointName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/DistributionPoint/FullName.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/DistributionPoint/ReasonFlags.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/KeyUsageExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/SubjectAlternativeNameExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/PolicyConstraintsExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/FreshestCRLExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/AuthorityKeyIdentifierExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Extension/SubjectInformationAccessExtension.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/CertificateChain.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/CertificateBundle.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Certificate/Certificate.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Feature/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X509/Feature/DateTimeHelper.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/BaseString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/UnspecifiedType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/PrimitiveString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/PrimitiveType.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Constructed/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Constructed/ConstructedString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Constructed/Sequence.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Constructed/Set.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/StringType.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/ExplicitlyTaggedType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/PrivateType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/ImplicitTagging.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/ApplicationType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/TaggedTypeWrap.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/ImplicitlyTaggedType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/DERTaggedType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/ExplicitTagging.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Tagged/ContextSpecificType.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/UniversalString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/GraphicString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/VisibleString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/Integer.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/OctetString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/VideotexString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/BMPString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/PrintableString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/Number.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/ObjectDescriptor.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/Boolean.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/Real.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/NullType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/GeneralizedTime.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/BitString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/UTCTime.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/GeneralString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/IA5String.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/NumericString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/UTF8String.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/ObjectIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/CharacterString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/RelativeOID.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/Enumerated.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/T61String.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Primitive/EOC.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/TimeType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/Structure.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/BaseTime.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/UniversalClass.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Type/TaggedType.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Exception/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Exception/DecodeException.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Element.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Component/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Component/Identifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Component/Length.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Util/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Util/Flags.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Util/BigInt.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Feature/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Feature/Stringable.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Feature/Encodable.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/Feature/ElementBase.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/ASN1/DERData.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoEncoding/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoEncoding/PEMBundle.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoEncoding/PEM.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/ECSignature.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/Ed448Signature.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/Signature.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/GenericSignature.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/Ed25519Signature.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Signature/RSASignature.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/AlgorithmIdentifierFactory.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/AlgorithmIdentifier.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/SHA1WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/ECDSAWithSHA224AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/MD5WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/RFC3279RSASignatureAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/RSASignatureAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/ECDSAWithSHA512AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/MD2WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/SHA256WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/ECDSAWithSHA1AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/ECDSAWithSHA384AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/ECSignatureAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/SHA224WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/RFC4055RSASignatureAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/SHA384WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/ECDSAWithSHA256AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/SHA512WithRSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Signature/MD4WithRSAEncryptionAlgorithmIdentifier.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/SHA512AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/SHA256AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/MD5AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/HMACWithSHA256AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/HMACWithSHA1AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/SHA224AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/HMACWithSHA512AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/SHA2AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/HMACWithSHA224AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/HMACWithSHA384AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/RFC4231HMACAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/SHA384AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Hash/SHA1AlgorithmIdentifier.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/AES128CBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/AES256CBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/CipherAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/AESCBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/DESCBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/AES192CBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/BlockCipherAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/DESEDE3CBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Cipher/RC2CBCAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/AlgorithmIdentifierProvider.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/X448AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/RFC8410EdAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/X25519AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/Ed448AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/RSAPSSSSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/Ed25519AlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/RSAEncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/RFC8410XAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Asymmetric/ECPublicKeyAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/SpecificAlgorithmIdentifier.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/EncryptionAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/AlgorithmIdentifierType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/PRFAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/SignatureAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/AsymmetricCryptoAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/Feature/HashAlgorithmIdentifier.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/AlgorithmIdentifier/GenericAlgorithmIdentifier.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/OneAsymmetricKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/PublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/PrivateKeyInfo.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/PrivateKey.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve448/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve448/Ed448PrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve448/X448PublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve448/X448PrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve448/Ed448PublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/RFC8410PrivateKey.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/X25519PublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/X25519PrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/Curve25519PublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/Curve25519PrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/Ed25519PublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/Curve25519/Ed25519PrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RFC8410/RFC8410PublicKey.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RSA/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RSA/RSASSAPSSPrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RSA/RSAPublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/RSA/RSAPrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/PublicKeyInfo.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/EC/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/EC/ECPublicKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/EC/ECPrivateKey.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/EC/ECConversion.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/Attribute/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/CryptoTypes/Asymmetric/Attribute/OneAsymmetricKeyAttributes.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/Collection/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/Collection/SequenceOfAttributes.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/Collection/SetOfAttributes.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/Collection/AttributeCollection.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/RDN.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeTypeAndValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeType.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/Name.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/TitleValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/GivenNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/SurnameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/CommonNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/OrganizationalUnitNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/DescriptionValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/NameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/UnknownAttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/OrganizationNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/PseudonymValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/AttributeValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/SerialNumberValue.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/Feature/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/Feature/DirectoryString.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/Feature/PrintableStringValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/StateOrProvinceNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/CountryNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/AttributeValue/LocalityNameValue.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/ASN1/Attribute.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/DN/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/DN/DNParser.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/MatchingRule/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/MatchingRule/CaseExactMatch.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/MatchingRule/StringPrepMatchingRule.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/MatchingRule/CaseIgnoreMatch.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/MatchingRule/MatchingRule.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/MatchingRule/BinaryMatch.php
   creating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/ProhibitStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/PrepareStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/MapStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/CheckBidiStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/TranscodeStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/NormalizeStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/StringPreparer.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/src/X501/StringPrep/InsignificantNonSubstringSpaceStep.php
  inflating: nextcloud/3rdparty/spomky-labs/pki-framework/LICENSE
   creating: nextcloud/3rdparty/php-http/
   creating: nextcloud/3rdparty/php-http/promise/
   creating: nextcloud/3rdparty/php-http/promise/src/
  inflating: nextcloud/3rdparty/php-http/promise/src/Promise.php
  inflating: nextcloud/3rdparty/php-http/promise/src/RejectedPromise.php
  inflating: nextcloud/3rdparty/php-http/promise/src/FulfilledPromise.php
  inflating: nextcloud/3rdparty/php-http/promise/LICENSE
   creating: nextcloud/3rdparty/php-http/guzzle7-adapter/
   creating: nextcloud/3rdparty/php-http/guzzle7-adapter/src/
   creating: nextcloud/3rdparty/php-http/guzzle7-adapter/src/Exception/
  inflating: nextcloud/3rdparty/php-http/guzzle7-adapter/src/Exception/UnexpectedValueException.php
  inflating: nextcloud/3rdparty/php-http/guzzle7-adapter/src/Client.php
  inflating: nextcloud/3rdparty/php-http/guzzle7-adapter/src/Promise.php
  inflating: nextcloud/3rdparty/php-http/guzzle7-adapter/LICENSE
   creating: nextcloud/3rdparty/php-http/httplug/
  inflating: nextcloud/3rdparty/php-http/httplug/puli.json
   creating: nextcloud/3rdparty/php-http/httplug/src/
  inflating: nextcloud/3rdparty/php-http/httplug/src/HttpClient.php
   creating: nextcloud/3rdparty/php-http/httplug/src/Exception/
  inflating: nextcloud/3rdparty/php-http/httplug/src/Exception/NetworkException.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/Exception/TransferException.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/Exception/HttpException.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/Exception/RequestAwareTrait.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/Exception/RequestException.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/HttpAsyncClient.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/Exception.php
   creating: nextcloud/3rdparty/php-http/httplug/src/Promise/
  inflating: nextcloud/3rdparty/php-http/httplug/src/Promise/HttpFulfilledPromise.php
  inflating: nextcloud/3rdparty/php-http/httplug/src/Promise/HttpRejectedPromise.php
  inflating: nextcloud/3rdparty/php-http/httplug/LICENSE
   creating: nextcloud/3rdparty/mtdowling/
   creating: nextcloud/3rdparty/mtdowling/jmespath.php/
   creating: nextcloud/3rdparty/mtdowling/jmespath.php/src/
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/CompilerRuntime.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/TreeCompiler.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/SyntaxErrorException.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/TreeInterpreter.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/Utils.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/JmesPath.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/AstRuntime.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/FnDispatcher.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/Lexer.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/DebugRuntime.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/Parser.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/src/Env.php
  inflating: nextcloud/3rdparty/mtdowling/jmespath.php/LICENSE
   creating: nextcloud/3rdparty/kornrunner/
   creating: nextcloud/3rdparty/kornrunner/blurhash/
   creating: nextcloud/3rdparty/kornrunner/blurhash/src/
  inflating: nextcloud/3rdparty/kornrunner/blurhash/src/Color.php
  inflating: nextcloud/3rdparty/kornrunner/blurhash/src/Base83.php
  inflating: nextcloud/3rdparty/kornrunner/blurhash/src/AC.php
  inflating: nextcloud/3rdparty/kornrunner/blurhash/src/Blurhash.php
  inflating: nextcloud/3rdparty/kornrunner/blurhash/src/DC.php
  inflating: nextcloud/3rdparty/kornrunner/blurhash/LICENSE
   creating: nextcloud/3rdparty/microsoft/
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/MarkerContinuationTokenTrait.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/MetadataTrait.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Utilities.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/ServiceRestTrait.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Http/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Http/HttpFormatter.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Http/HttpCallContext.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/RestProxy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Resources.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Middlewares/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Middlewares/CommonRequestMiddleware.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/ConnectionStringParser.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/ACLBase.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/ServiceRestProxy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/ServiceSettings.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/ConnectionStringSource.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Authentication/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Authentication/SharedAccessSignatureAuthScheme.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Authentication/IAuthScheme.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Authentication/SharedKeyAuthScheme.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Authentication/TokenAuthScheme.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/StorageServiceSettings.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Validate.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Serialization/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Serialization/ISerializer.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Serialization/XmlSerializer.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Serialization/MessageSerializer.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Internal/Serialization/JsonSerializer.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/SharedAccessSignatureHelper.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/AccessPolicy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/Metrics.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/Range.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/CORS.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/MarkerContinuationToken.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/GetServicePropertiesResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/TransactionalMD5Trait.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/GetServiceStatsResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/SignedIdentifier.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/RetentionPolicy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/ContinuationToken.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/RangeDiff.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/ServiceProperties.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/Logging.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Models/ServiceOptions.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/RetryMiddleware.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/HistoryMiddleware.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/MiddlewareStack.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/IMiddleware.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/MiddlewareBase.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Middlewares/RetryMiddlewareFactory.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/LocationMode.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Logger.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Exceptions/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Exceptions/InvalidArgumentTypeException.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/Exceptions/ServiceException.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/src/Common/CloudConfigurationManager.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/BreakingChanges.md
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/CONTRIBUTING.md
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/ChangeLog.md
  inflating: nextcloud/3rdparty/microsoft/azure-storage-common/LICENSE
   creating: nextcloud/3rdparty/microsoft/azure-storage-blob/
   creating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/
   creating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/
   creating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Internal/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Internal/BlobResources.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Internal/IBlob.php
   creating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListPageBlobRangesOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlobAccessPolicy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListPageBlobRangesResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CommitBlobBlocksOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListPageBlobRangesDiffResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/LeaseMode.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetBlobMetadataOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/AccessCondition.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/DeleteBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/UndeleteBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateContainerOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlockBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CopyState.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetBlobPropertiesResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListContainersOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/AppendBlockOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CopyBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetContainerACLResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlobType.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ContainerAccessPolicy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetBlobPropertiesOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/LeaseResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/AccessTierTrait.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CopyBlobResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListBlobsResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/Container.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlobSnapshotOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/PageWriteOption.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/SetBlobPropertiesResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/Blob.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/PublicAccessType.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetContainerPropertiesResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListContainersResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetBlobResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreatePageBlobOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/SetBlobMetadataResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreatePageBlobFromContentOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/SetBlobTierOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/AppendBlockResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/PutBlobResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlobPagesResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/PutBlockResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListBlobBlocksOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlobPagesOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BreakLeaseResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlockList.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlobBlockType.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListBlobsOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ContainerACL.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlobSnapshotResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CreateBlobBlockOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/CopyBlobFromURLOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlobPrefix.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlobProperties.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/BlobServiceOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/GetBlobMetadataResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/SetBlobPropertiesOptions.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/Block.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ContainerProperties.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/Models/ListBlobBlocksResult.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/BlobSharedAccessSignatureHelper.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/src/Blob/BlobRestProxy.php
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/BreakingChanges.md
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/CONTRIBUTING.md
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/ChangeLog.md
  inflating: nextcloud/3rdparty/microsoft/azure-storage-blob/LICENSE
  inflating: nextcloud/COPYING
   creating: nextcloud/LICENSES/
  inflating: nextcloud/LICENSES/CC-BY-SA-3.0.txt
  inflating: nextcloud/LICENSES/OFL-1.1-RFN.txt
  inflating: nextcloud/LICENSES/MIT.txt
  inflating: nextcloud/LICENSES/CC0-1.0.txt
  inflating: nextcloud/LICENSES/AGPL-3.0-only.txt
  inflating: nextcloud/LICENSES/GPL-2.0-only.txt
  inflating: nextcloud/LICENSES/OFL-1.1.txt
  inflating: nextcloud/LICENSES/LicenseRef-FacebookTrademarks.txt
  inflating: nextcloud/LICENSES/BSD-2-Clause.txt
  inflating: nextcloud/LICENSES/GPL-3.0-or-later.txt
  inflating: nextcloud/LICENSES/LicenseRef-AppleAppStoreBadge.txt
  inflating: nextcloud/LICENSES/CC-BY-4.0.txt
  inflating: nextcloud/LICENSES/LicenseRef-MastodonTrademarks.txt
  inflating: nextcloud/LICENSES/AGPL-3.0-or-later.txt
  inflating: nextcloud/LICENSES/MPL-2.0.txt
  inflating: nextcloud/LICENSES/BSD-3-Clause.txt
  inflating: nextcloud/LICENSES/CC-BY-SA-2.0.txt
  inflating: nextcloud/LICENSES/LicenseRef-GooglePlayBadge.txt
  inflating: nextcloud/LICENSES/ISC.txt
  inflating: nextcloud/LICENSES/CC-BY-SA-3.0-IGO.txt
  inflating: nextcloud/LICENSES/LicenseRef-CollaboraTrademarks.txt
  inflating: nextcloud/LICENSES/LicenseRef-DiasporaTrademarks.txt
  inflating: nextcloud/LICENSES/CC-BY-SA-4.0.txt
  inflating: nextcloud/LICENSES/LicenseRef-Nasa.txt
  inflating: nextcloud/LICENSES/LicenseRef-DCO.txt
  inflating: nextcloud/LICENSES/LicenseRef-NextcloudTrademarks.txt
  inflating: nextcloud/LICENSES/Apache-2.0.txt
  inflating: nextcloud/LICENSES/LicenseRef-XTrademarks.txt
  inflating: nextcloud/LICENSES/CC-BY-2.0.txt
  inflating: nextcloud/LICENSES/LicenseRef-Unsplash.txt
   creating: nextcloud/config/
 extracting: nextcloud/config/CAN_INSTALL
  inflating: nextcloud/config/config.sample.php
  inflating: nextcloud/config/.htaccess
root@nextcloud:/var/www# chown -R www-data:www-data /var/www/nextcloud
root@nextcloud:/var/www# chown -R www-data:www-data /mnt/nextcloud-data
root@nextcloud:/var/www# nano /etc/nginx/sites-available/nextcloud
root@nextcloud:/var/www# cat /etc/nginx/sites-available/nextcloud
server {
    listen 80;
    server_name 160.191.150.238;

    root /var/www/nextcloud;
    index index.php index.html;

    client_max_body_size 10G;

    location / {
        try_files $uri $uri/ /index.php$request_uri;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.1-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
root@nextcloud:/var/www# ln -s /etc/nginx/sites-available/nextcloud /etc/nginx/sites-enabled/
root@nextcloud:/var/www# nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@nextcloud:/var/www# systemctl reload nginx
root@nextcloud:/var/www# cd /usr/local/bin
root@nextcloud:/usr/local/bin# wget https://dl.min.io/server/minio/release/linux-amd64/minio
--2025-12-15 09:39:25--  https://dl.min.io/server/minio/release/linux-amd64/minio
Resolving dl.min.io (dl.min.io)... 178.128.69.202, 138.68.11.125
Connecting to dl.min.io (dl.min.io)|178.128.69.202|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 110989496 (106M) [application/octet-stream]
Saving to: ‘minio’

minio                                                100%[===================================================================================================================>] 105.85M  13.7MB/s    in 9.6s

2025-12-15 09:39:36 (11.0 MB/s) - ‘minio’ saved [110989496/110989496]

root@nextcloud:/usr/local/bin# chmod +x minio
root@nextcloud:/usr/local/bin# useradd -r minio -s /sbin/nologin
root@nextcloud:/usr/local/bin# mkdir /etc/minio
root@nextcloud:/usr/local/bin# nano /etc/minio/minio.conf
root@nextcloud:/usr/local/bin# cat /etc/minio/minio.conf
MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=STRONG_MINIO_PASSWORD
MINIO_VOLUMES="/mnt/minio-data"
MINIO_OPTS="--console-address :9001"

root@nextcloud:/usr/local/bin# chown -R minio:minio /mnt/minio-data
root@nextcloud:/usr/local/bin# nano /etc/systemd/system/minio.service
root@nextcloud:/usr/local/bin# cat /etc/systemd/system/minio.service
[Unit]
Description=MinIO
After=network-online.target

[Service]
User=minio
Group=minio
EnvironmentFile=/etc/minio/minio.conf
ExecStart=/usr/local/bin/minio server $MINIO_OPTS $MINIO_VOLUMES
Restart=always
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
root@nextcloud:/usr/local/bin# systemctl daemon-reexec
root@nextcloud:/usr/local/bin# systemctl enable minio
Created symlink /etc/systemd/system/multi-user.target.wants/minio.service → /etc/systemd/system/minio.service.
root@nextcloud:/usr/local/bin# systemctl start minio
root@nextcloud:/usr/local/bin#

root@nextcloud:/usr/local/bin# #issue occured this error in the gui of nextcloud: Error while trying to create admin account: An exception occurred in the driver: SQLSTATE[HY000] [1045] Access denied for user'nextcloud'@'localhost' (using password: YES)
root@nextcloud:/usr/local/bin# systemctl status mysql
● mariadb.service - MariaDB 10.6.22 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 09:27:45 UTC; 1h 29min ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
   Main PID: 2769 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 9 (limit: 62530)
     Memory: 61.8M
        CPU: 728ms
     CGroup: /system.slice/mariadb.service
             └─2769 /usr/sbin/mariadbd

Dec 15 09:27:45 nextcloud mariadbd[2769]: Version: '10.6.22-MariaDB-0ubuntu0.22.04.1'  socket: '/run/mysqld/mysqld.sock'  port: 3306  Ubuntu 22.04
Dec 15 09:27:45 nextcloud systemd[1]: Started MariaDB 10.6.22 database server.
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2788]: Looking for 'mariadb' as: /usr/bin/mariadb
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2788]: Looking for 'mariadb-check' as: /usr/bin/mariadb-check
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2788]: This installation of MariaDB is already upgraded to 10.6.22-MariaDB.
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2788]: There is no need to run mysql_upgrade again.
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2788]: You can use --force if you still want to run mysql_upgrade
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2796]: Checking for insecure root accounts.
Dec 15 09:27:45 nextcloud /etc/mysql/debian-start[2800]: Triggering myisam-recover for all MyISAM tables and aria-recover for all Aria tables
Dec 15 10:54:35 nextcloud mariadbd[2769]: 2025-12-15 10:54:35 39 [Warning] Access denied for user 'nextcloud'@'localhost' (using password: YES)
root@nextcloud:/usr/local/bin# sudo mysql
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 40
Server version: 10.6.22-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SELECT user, host FROM mysql.user;
+-------------+-----------+
| User        | Host      |
+-------------+-----------+
| mariadb.sys | localhost |
| mysql       | localhost |
| nextcloud   | localhost |
| root        | localhost |
+-------------+-----------+
4 rows in set (0.001 sec)

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| nextcloud          |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.000 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'nextcloud'@'localhost';
+------------------------------------------------------------------------------------------------------------------+
| Grants for nextcloud@localhost                                                                                   |
+------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `nextcloud`@`localhost` IDENTIFIED BY PASSWORD '*14E791F367BC45FECEE759C40AE9622C47625E69' |
| GRANT ALL PRIVILEGES ON `nextcloud`.* TO `nextcloud`@`localhost`                                                 |
+------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> EXIT;
Bye
root@nextcloud:/usr/local/bin# mysql -u nextcloud -p -h localhost nextcloud
Enter password:
ERROR 1045 (28000): Access denied for user 'nextcloud'@'localhost' (using password: YES)
root@nextcloud:/usr/local/bin# sudo mysql
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 42
Server version: 10.6.22-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> DROP USER IF EXISTS 'nextcloud'@'localhost';
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> CREATE USER 'nextcloud'@'localhost'
    -> IDENTIFIED VIA mysql_native_password
    -> USING PASSWORD('Nc12345!');
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'localhost';
Query OK, 0 rows affected (0.002 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'nextcloud'@'localhost';
+------------------------------------------------------------------------------------------------------------------+
| Grants for nextcloud@localhost                                                                                   |
+------------------------------------------------------------------------------------------------------------------+
| GRANT USAGE ON *.* TO `nextcloud`@`localhost` IDENTIFIED BY PASSWORD '*64EC5F650633D04A3D778C98317570EBEEF5AE3C' |
| GRANT ALL PRIVILEGES ON `nextcloud`.* TO `nextcloud`@`localhost`                                                 |
+------------------------------------------------------------------------------------------------------------------+
2 rows in set (0.000 sec)

MariaDB [(none)]> EXIT;
Bye
root@nextcloud:/usr/local/bin# mysql -u nextcloud -p -h localhost nextcloud
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 43
Server version: 10.6.22-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [nextcloud]> EXIT;
Bye
root@nextcloud:/usr/local/bin# #new error occures after doing this and the instilation click : error 500 Internal Server Error
nginx/1.18.0 (Ubuntu)
bash: syntax error near unexpected token `Ubuntu'
root@nextcloud:/usr/local/bin# sudo tail -n 50 /var/log/nginx/error.log
2025/12/15 09:27:45 [notice] 2862#2862: using inherited sockets from "6;7;"
2025/12/15 09:39:15 [notice] 21109#21109: signal process started
2025/12/15 10:40:31 [error] 21110#21110: *13 rewrite or internal redirection cycle while internally redirecting to "/index.php/SDK/webLanguage", client: 89.42.231.244, server: 160.191.150.238, request: "GET /SDK/webLanguage HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 11:08:27 [error] 21110#21110: *22 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:28 [error] 21110#21110: *24 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:08:48 [error] 21110#21110: *25 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:48 [error] 21110#21110: *26 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:08:49 [error] 21110#21110: *27 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:49 [error] 21110#21110: *28 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
root@nextcloud:/usr/local/bin# sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo mv /etc/nginx/sites-enabled/default /etc/nginx/sites-enabled/default.bak
root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# cat /etc/nginx/sites-available/nextcloud.conf
upstream php-handler {
    server unix:/run/php/php8.1-fpm.sock;
}

server {
    listen 80;
    server_name  _;

    root /var/www/nextcloud/;

    client_max_body_size 10240M;
    fastcgi_buffers 64 4K;

    index index.php index.html /index.php$request_uri;

    location / {
        rewrite ^ /index.php$request_uri;
    }

    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
        deny all;
    }

    location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console) {
        deny all;
    }

    location ~ \.php(?:$|/) {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param HTTPS off;
        fastcgi_pass php-handler;
        fastcgi_intercept_errors on;
    }

    location ~* \.(?:css|js|woff|svg|gif)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }

    location ~* \.(?:png|html|ttf|ico|jpg|jpeg)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }
}
root@nextcloud:/usr/local/bin# sudo ln -s /etc/nginx/sites-available/nextcloud.conf /etc/nginx/sites-enabled/
sudo nginx -t
nginx: [emerg] open() "/etc/nginx/sites-enabled/default.bak" failed (2: No such file or directory) in /etc/nginx/nginx.conf:60
nginx: configuration file /etc/nginx/nginx.conf test failed
root@nextcloud:/usr/local/bin# ls -l /etc/nginx/sites-enabled/
total 0
lrwxrwxrwx 1 root root 34 Dec 15 09:27 default.bak -> /etc/nginx/sites-available/default
lrwxrwxrwx 1 root root 36 Dec 15 09:39 nextcloud -> /etc/nginx/sites-available/nextcloud
lrwxrwxrwx 1 root root 41 Dec 15 11:13 nextcloud.conf -> /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo rm /etc/nginx/sites-enabled/default.bak
root@nextcloud:/usr/local/bin# sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo systemctl restart nginx
root@nextcloud:/usr/local/bin# #the issue is not fix yet: 500 Internal Server Error
nginx/1.18.0 (Ubuntu)
bash: syntax error near unexpected token `Ubuntu'
root@nextcloud:/usr/local/bin# sudo chown -R www-data:www-data /var/www/nextcloud/
root@nextcloud:/usr/local/bin# sudo find /var/www/nextcloud/ -type d -exec chmod 750 {} \;
root@nextcloud:/usr/local/bin# ^C
root@nextcloud:/usr/local/bin# sudo find /var/www/nextcloud/ -type d -exec chmod 750 {} \;
root@nextcloud:/usr/local/bin# sudo find /var/www/nextcloud/ -type f -exec chmod 640 {} \;
root@nextcloud:/usr/local/bin# sudo systemctl status php8.1-fpm
● php8.1-fpm.service - The PHP 8.1 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php8.1-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 11:14:29 UTC; 1h 53min ago
       Docs: man:php-fpm8.1(8)
    Process: 22181 ExecStartPost=/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.1/fpm/pool.d/www.conf 81 (code=exited, status=0/SUCCESS)
   Main PID: 22178 (php-fpm8.1)
     Status: "Processes active: 0, idle: 2, Requests: 6, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 9474)
     Memory: 48.9M
        CPU: 1.079s
     CGroup: /system.slice/php8.1-fpm.service
             ├─22178 "php-fpm: master process (/etc/php/8.1/fpm/php-fpm.conf)" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─22179 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">
             └─22180 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">

Dec 15 11:14:29 nextcloud systemd[1]: Starting The PHP 8.1 FastCGI Process Manager...
Dec 15 11:14:29 nextcloud systemd[1]: Started The PHP 8.1 FastCGI Process Manager.
...skipping...
● php8.1-fpm.service - The PHP 8.1 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php8.1-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 11:14:29 UTC; 1h 53min ago
       Docs: man:php-fpm8.1(8)
    Process: 22181 ExecStartPost=/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.1/fpm/pool.d/www.conf 81 (code=exited, status=0/SUCCESS)
   Main PID: 22178 (php-fpm8.1)
     Status: "Processes active: 0, idle: 2, Requests: 6, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 9474)
     Memory: 48.9M
        CPU: 1.079s
     CGroup: /system.slice/php8.1-fpm.service
             ├─22178 "php-fpm: master process (/etc/php/8.1/fpm/php-fpm.conf)" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─22179 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">
             └─22180 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">

Dec 15 11:14:29 nextcloud systemd[1]: Starting The PHP 8.1 FastCGI Process Manager...
Dec 15 11:14:29 nextcloud systemd[1]: Started The PHP 8.1 FastCGI Process Manager.
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~

root@nextcloud:/usr/local/bin# sudo systemctl status php8.1-fpm
● php8.1-fpm.service - The PHP 8.1 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php8.1-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 11:14:29 UTC; 1h 53min ago
       Docs: man:php-fpm8.1(8)
    Process: 22181 ExecStartPost=/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.1/fpm/pool.d/www.conf 81 (code=exited, status=0/SUCCESS)
   Main PID: 22178 (php-fpm8.1)
     Status: "Processes active: 0, idle: 2, Requests: 6, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 9474)
     Memory: 48.9M
        CPU: 1.080s
     CGroup: /system.slice/php8.1-fpm.service
             ├─22178 "php-fpm: master process (/etc/php/8.1/fpm/php-fpm.conf)" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─22179 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">
             └─22180 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">

Dec 15 11:14:29 nextcloud systemd[1]: Starting The PHP 8.1 FastCGI Process Manager...
Dec 15 11:14:29 nextcloud systemd[1]: Started The PHP 8.1 FastCGI Process Manager.

root@nextcloud:/usr/local/bin# sudo systemctl status php8.1-fpm
● php8.1-fpm.service - The PHP 8.1 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php8.1-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 11:14:29 UTC; 1h 53min ago
       Docs: man:php-fpm8.1(8)
    Process: 22181 ExecStartPost=/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.1/fpm/pool.d/www.conf 81 (code=exited, status=0/SUCCESS)
   Main PID: 22178 (php-fpm8.1)
     Status: "Processes active: 0, idle: 2, Requests: 6, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 9474)
     Memory: 48.9M
        CPU: 1.080s
     CGroup: /system.slice/php8.1-fpm.service
             ├─22178 "php-fpm: master process (/etc/php/8.1/fpm/php-fpm.conf)" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─22179 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">
             └─22180 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">

Dec 15 11:14:29 nextcloud systemd[1]: Starting The PHP 8.1 FastCGI Process Manager...
Dec 15 11:14:29 nextcloud systemd[1]: Started The PHP 8.1 FastCGI Process Manager.
...skipping...
● php8.1-fpm.service - The PHP 8.1 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php8.1-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 11:14:29 UTC; 1h 53min ago
       Docs: man:php-fpm8.1(8)
    Process: 22181 ExecStartPost=/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.1/fpm/pool.d/www.conf 81 (code=exited, status=0/SUCCESS)
   Main PID: 22178 (php-fpm8.1)
     Status: "Processes active: 0, idle: 2, Requests: 6, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 9474)
     Memory: 48.9M
        CPU: 1.080s
     CGroup: /system.slice/php8.1-fpm.service
             ├─22178 "php-fpm: master process (/etc/php/8.1/fpm/php-fpm.conf)" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─22179 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">
             └─22180 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">

Dec 15 11:14:29 nextcloud systemd[1]: Starting The PHP 8.1 FastCGI Process Manager...
Dec 15 11:14:29 nextcloud systemd[1]: Started The PHP 8.1 FastCGI Process Manager.
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~
~

root@nextcloud:/usr/local/bin# sudo apt update
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease
Fetched 129 kB in 2s (64.5 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
root@nextcloud:/usr/local/bin# sudo apt install php8.1-gd php8.1-mysql php8.1-curl php8.1-xml php8.1-zip php8.1-mbstring php8.1-bcmath php8.1-gmp php8.1-intl php8.1-imagick php8.1-bz2 php8.1-sqlite3 -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
php8.1-imagick is already the newest version (3.6.0-4ubuntu1).
php8.1-imagick set to manually installed.
php8.1-curl is already the newest version (8.1.2-1ubuntu2.22).
php8.1-curl set to manually installed.
php8.1-gd is already the newest version (8.1.2-1ubuntu2.22).
php8.1-gd set to manually installed.
php8.1-mbstring is already the newest version (8.1.2-1ubuntu2.22).
php8.1-mbstring set to manually installed.
php8.1-mysql is already the newest version (8.1.2-1ubuntu2.22).
php8.1-mysql set to manually installed.
php8.1-xml is already the newest version (8.1.2-1ubuntu2.22).
php8.1-xml set to manually installed.
php8.1-bcmath is already the newest version (8.1.2-1ubuntu2.22).
php8.1-bcmath set to manually installed.
php8.1-intl is already the newest version (8.1.2-1ubuntu2.22).
php8.1-intl set to manually installed.
php8.1-zip is already the newest version (8.1.2-1ubuntu2.22).
php8.1-zip set to manually installed.
The following NEW packages will be installed:
  php8.1-bz2 php8.1-gmp php8.1-sqlite3
0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
Need to get 66.4 kB of archives.
After this operation, 303 kB of additional disk space will be used.
Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 php8.1-bz2 amd64 8.1.2-1ubuntu2.22 [11.5 kB]
Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-gmp amd64 8.1.2-1ubuntu2.22 [22.6 kB]
Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-sqlite3 amd64 8.1.2-1ubuntu2.22 [32.3 kB]
Fetched 66.4 kB in 1s (55.0 kB/s)
Selecting previously unselected package php8.1-bz2.
(Reading database ... 97406 files and directories currently installed.)
Preparing to unpack .../php8.1-bz2_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-bz2 (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php8.1-gmp.
Preparing to unpack .../php8.1-gmp_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-gmp (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php8.1-sqlite3.
Preparing to unpack .../php8.1-sqlite3_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-sqlite3 (8.1.2-1ubuntu2.22) ...
Setting up php8.1-gmp (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/gmp.ini with new version
Setting up php8.1-bz2 (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/bz2.ini with new version
Setting up php8.1-sqlite3 (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/sqlite3.ini with new version

Creating config file /etc/php/8.1/mods-available/pdo_sqlite.ini with new version
Processing triggers for php8.1-fpm (8.1.2-1ubuntu2.22) ...
Processing triggers for php8.1-cli (8.1.2-1ubuntu2.22) ...
Scanning processes...
Scanning linux images...

Running kernel seems to be up-to-date.

No services need to be restarted.

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo tail -n 50 /var/log/nginx/error.log
2025/12/15 09:27:45 [notice] 2862#2862: using inherited sockets from "6;7;"
2025/12/15 09:39:15 [notice] 21109#21109: signal process started
2025/12/15 10:40:31 [error] 21110#21110: *13 rewrite or internal redirection cycle while internally redirecting to "/index.php/SDK/webLanguage", client: 89.42.231.244, server: 160.191.150.238, request: "GET /SDK/webLanguage HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 11:08:27 [error] 21110#21110: *22 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:28 [error] 21110#21110: *24 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:08:48 [error] 21110#21110: *25 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:48 [error] 21110#21110: *26 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:08:49 [error] 21110#21110: *27 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:49 [error] 21110#21110: *28 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:13:43 [emerg] 22157#22157: open() "/etc/nginx/sites-enabled/default.bak" failed (2: No such file or directory) in /etc/nginx/nginx.conf:60
2025/12/15 11:14:23 [error] 21110#21110: *31 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 43.153.10.13, server: 160.191.150.238, request: "GET /index.php/login HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238"
2025/12/15 11:21:12 [error] 22196#22196: *1 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 185.180.140.4, server: 160.191.150.238, request: "GET /index.php/login HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/"
2025/12/15 11:27:12 [error] 22196#22196: *5 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 43.135.133.241, server: 160.191.150.238, request: "GET /index.php/login HTTP/1.1", host: "160.191.150.238:80", referrer: "http://160.191.150.238:80"
2025/12/15 11:44:00 [error] 22196#22196: *6 rewrite or internal redirection cycle while internally redirecting to "/index.php/cgi-bin/luci/;stok=/locale", client: 193.142.147.209, server: 160.191.150.238, request: "GET /cgi-bin/luci/;stok=/locale HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 12:35:47 [error] 22196#22196: *10 rewrite or internal redirection cycle while internally redirecting to "/index.php/SDK/webLanguage", client: 204.76.203.214, server: 160.191.150.238, request: "GET /SDK/webLanguage HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 12:46:29 [error] 22196#22196: *15 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 162.142.125.118, server: 160.191.150.238, request: "GET/index.php/login HTTP/1.1", host: "160.191.150.238"
2025/12/15 12:46:36 [error] 22196#22196: *16 rewrite or internal redirection cycle while internally redirecting to "/index.php/ReportServer", client: 135.237.125.146, server: 160.191.150.238, request: "GET /ReportServer HTTP/1.1", host: "160.191.150.238"
2025/12/15 12:46:44 [error] 22196#22196: *18 rewrite or internal redirection cycle while internally redirecting to "/index.php/sitemap.xml", client: 162.142.125.118, server: 160.191.150.238, request: "GET /sitemap.xml HTTP/1.1", host: "160.191.150.238"
2025/12/15 12:58:47 [error] 22196#22196: *21 rewrite or internal redirection cycle while internally redirecting to "/index.php/cgi-bin/login", client: 87.121.84.181, server: 160.191.150.238, request: "POST /cgi-bin/login HTTP/1.0", host: "160.191.150.238:80"
2025/12/15 13:04:58 [error] 22196#22196: *22 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 13:05:00 [error] 22196#22196: *23 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 13:05:00 [error] 22196#22196: *24 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 13:05:01 [error] 22196#22196: *25 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 13:05:01 [error] 22196#22196: *26 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 13:05:29 [error] 22196#22196: *27 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/apps/dashboard/", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/apps/dashboard/ HTTP/1.1", host: "160.191.150.238"
2025/12/15 13:05:30 [error] 22196#22196: *29 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/apps/dashboard/"
root@nextcloud:/usr/local/bin# sudo tail -n 50 /var/log/nginx/error.log
2025/12/15 09:27:45 [notice] 2862#2862: using inherited sockets from "6;7;"
2025/12/15 09:39:15 [notice] 21109#21109: signal process started
2025/12/15 10:40:31 [error] 21110#21110: *13 rewrite or internal redirection cycle while internally redirecting to "/index.php/SDK/webLanguage", client: 89.42.231.244, server: 160.191.150.238, request: "GET /SDK/webLanguage HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 11:08:27 [error] 21110#21110: *22 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:28 [error] 21110#21110: *24 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:08:48 [error] 21110#21110: *25 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:48 [error] 21110#21110: *26 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:08:49 [error] 21110#21110: *27 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 11:08:49 [error] 21110#21110: *28 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 11:13:43 [emerg] 22157#22157: open() "/etc/nginx/sites-enabled/default.bak" failed (2: No such file or directory) in /etc/nginx/nginx.conf:60
2025/12/15 11:14:23 [error] 21110#21110: *31 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 43.153.10.13, server: 160.191.150.238, request: "GET /index.php/login HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238"
2025/12/15 11:21:12 [error] 22196#22196: *1 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 185.180.140.4, server: 160.191.150.238, request: "GET /index.php/login HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/"
2025/12/15 11:27:12 [error] 22196#22196: *5 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 43.135.133.241, server: 160.191.150.238, request: "GET /index.php/login HTTP/1.1", host: "160.191.150.238:80", referrer: "http://160.191.150.238:80"
2025/12/15 11:44:00 [error] 22196#22196: *6 rewrite or internal redirection cycle while internally redirecting to "/index.php/cgi-bin/luci/;stok=/locale", client: 193.142.147.209, server: 160.191.150.238, request: "GET /cgi-bin/luci/;stok=/locale HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 12:35:47 [error] 22196#22196: *10 rewrite or internal redirection cycle while internally redirecting to "/index.php/SDK/webLanguage", client: 204.76.203.214, server: 160.191.150.238, request: "GET /SDK/webLanguage HTTP/1.1", host: "160.191.150.238:80"
2025/12/15 12:46:29 [error] 22196#22196: *15 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/login", client: 162.142.125.118, server: 160.191.150.238, request: "GET/index.php/login HTTP/1.1", host: "160.191.150.238"
2025/12/15 12:46:36 [error] 22196#22196: *16 rewrite or internal redirection cycle while internally redirecting to "/index.php/ReportServer", client: 135.237.125.146, server: 160.191.150.238, request: "GET /ReportServer HTTP/1.1", host: "160.191.150.238"
2025/12/15 12:46:44 [error] 22196#22196: *18 rewrite or internal redirection cycle while internally redirecting to "/index.php/sitemap.xml", client: 162.142.125.118, server: 160.191.150.238, request: "GET /sitemap.xml HTTP/1.1", host: "160.191.150.238"
2025/12/15 12:58:47 [error] 22196#22196: *21 rewrite or internal redirection cycle while internally redirecting to "/index.php/cgi-bin/login", client: 87.121.84.181, server: 160.191.150.238, request: "POST /cgi-bin/login HTTP/1.0", host: "160.191.150.238:80"
2025/12/15 13:04:58 [error] 22196#22196: *22 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 13:05:00 [error] 22196#22196: *23 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 13:05:00 [error] 22196#22196: *24 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 13:05:01 [error] 22196#22196: *25 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/core/apps/recommended", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/core/apps/recommended HTTP/1.1", host: "160.191.150.238"
2025/12/15 13:05:01 [error] 22196#22196: *26 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/core/apps/recommended"
2025/12/15 13:05:29 [error] 22196#22196: *27 rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/apps/dashboard/", client: 103.229.83.244, server: 160.191.150.238, request: "GET /index.php/apps/dashboard/ HTTP/1.1", host: "160.191.150.238"
2025/12/15 13:05:30 [error] 22196#22196: *29 rewrite or internal redirection cycle while internally redirecting to "/index.php/favicon.ico", client: 103.229.83.244, server: 160.191.150.238, request: "GET /favicon.ico HTTP/1.1", host: "160.191.150.238", referrer: "http://160.191.150.238/index.php/apps/dashboard/"
root@nextcloud:/usr/local/bin# sudo chown -R www-data:www-data /mnt/nextcloud-data
root@nextcloud:/usr/local/bin# sudo chmod -R 750 /mnt/nextcloud-data
root@nextcloud:/usr/local/bin# #this is the error maybe lets solve this shit: rewrite or internal redirection cycle while internally redirecting to "/index.php/index.php/…"
root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# cat /etc/nginx/sites-available/nextcloud.conf
upstream php-handler {
    server unix:/run/php/php8.1-fpm.sock;
}

server {
    listen 80;
    server_name  _;

    root /var/www/nextcloud/;

    client_max_body_size 10240M;
    fastcgi_buffers 64 4K;

    index index.php index.html /index.php$request_uri;

    location / {
        rewrite ^ /index.php$request_uri;
    }

    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
        deny all;
    }

    location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console) {
        deny all;
    }

    location ~ \.php(?:$|/) {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param HTTPS off;
        fastcgi_pass php-handler;
        fastcgi_intercept_errors on;
    }

    location ~* \.(?:css|js|woff|svg|gif)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }

    location ~* \.(?:png|html|ttf|ico|jpg|jpeg)$ {
        try_files $uri /index.php$request_uri;
        access_log off;
        expires 6M;
    }
}
root@nextcloud:/usr/local/bin# > /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo systemctl restart nginx
root@nextcloud:/usr/local/bin# nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# cat /etc/nginx/sites-available/nextcloud.conf
upstream php-handler {
    server unix:/run/php/php8.1-fpm.sock;
}

server {
    listen 80;
    server_name _;

    root /var/www/nextcloud/;

    client_max_body_size 10240M;
    fastcgi_buffers 64 4K;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ ^/(?:build|tests|config|lib|3rdparty|templates|data)/ {
        deny all;
    }

    location ~ ^/(?:\.|autotest|occ|issue|indie|db_|console) {
        deny all;
    }

    location ~ \.php(?:$|/) {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
        fastcgi_param HTTPS off;
        fastcgi_pass php-handler;
        fastcgi_intercept_errors on;
    }

    location ~* \.(?:css|js|woff|svg|gif|png|html|ttf|ico|jpg|jpeg)$ {
        try_files $uri /index.php?$query_string;
        access_log off;
        expires 6M;
    }
}
root@nextcloud:/usr/local/bin# > /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo systemctl restart nginx
root@nextcloud:/usr/local/bin# sudo cp /etc/nginx/sites-available/nextcloud.conf /etc/nginx/sites-available/nextcloud.conf.bak
root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# > /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo systemctl restart nginx
root@nextcloud:/usr/local/bin# sudo ufw status
Status: inactive
root@nextcloud:/usr/local/bin# v
v: command not found
root@nextcloud:/usr/local/bin# sudo systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 13:39:34 UTC; 1min 2s ago
       Docs: man:nginx(8)
    Process: 56583 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
    Process: 56584 ExecStart=/usr/sbin/nginx -g daemon on; master_process on; (code=exited, status=0/SUCCESS)
   Main PID: 56585 (nginx)
      Tasks: 5 (limit: 9474)
     Memory: 5.0M
        CPU: 24ms
     CGroup: /system.slice/nginx.service
             ├─56585 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             ├─56586 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─56587 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─56588 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             └─56589 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Dec 15 13:39:34 nextcloud systemd[1]: Starting A high performance web server and a reverse proxy server...
Dec 15 13:39:34 nextcloud systemd[1]: Started A high performance web server and a reverse proxy server.
root@nextcloud:/usr/local/bin# sudo systemctl restart nginx
root@nextcloud:/usr/local/bin# sudo systemctl status php8.1-fpm
● php8.1-fpm.service - The PHP 8.1 FastCGI Process Manager
     Loaded: loaded (/lib/systemd/system/php8.1-fpm.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2025-12-15 13:39:31 UTC; 1min 16s ago
       Docs: man:php-fpm8.1(8)
    Process: 56574 ExecStartPost=/usr/lib/php/php-fpm-socket-helper install /run/php/php-fpm.sock /etc/php/8.1/fpm/pool.d/www.conf 81 (code=exited, status=0/SUCCESS)
   Main PID: 56571 (php-fpm8.1)
     Status: "Processes active: 0, idle: 2, Requests: 1, slow: 0, Traffic: 0req/sec"
      Tasks: 3 (limit: 9474)
     Memory: 42.0M
        CPU: 581ms
     CGroup: /system.slice/php8.1-fpm.service
             ├─56571 "php-fpm: master process (/etc/php/8.1/fpm/php-fpm.conf)" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─56572 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">
             └─56573 "php-fpm: pool www" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "">

Dec 15 13:39:31 nextcloud systemd[1]: Starting The PHP 8.1 FastCGI Process Manager...
Dec 15 13:39:31 nextcloud systemd[1]: Started The PHP 8.1 FastCGI Process Manager.

root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo chown -R www-data:www-data /mnt/nextcloud-data
root@nextcloud:/usr/local/bin# sudo chmod -R 750 /mnt/nextcloud-data
root@nextcloud:/usr/local/bin# curl -I http://localhost
HTTP/1.1 302 Found
Server: nginx/1.18.0 (Ubuntu)
Date: Mon, 15 Dec 2025 13:41:03 GMT
Content-Type: text/html; charset=UTF-8
Connection: keep-alive
Set-Cookie: oc_sessionPassphrase=ZZuFu98lyXoF%2F8MKLGnRH8Xm%2Bmy3WZagPjehcRyfiO3xahjM6AO%2FRWmmYLPvzc4VRaF99qgZwVTQRa2eY8xh2IsVS2GZq5Ov3inC%2FHmIa5yzochTOVqeJ871eQTAKSOn; path=/; HttpOnly; SameSite=Lax
Content-Security-Policy: default-src 'self'; script-src 'self' 'nonce-wUuapOVcmCTo7x+3ExE+Vf1dloh4bnRrSBCmPostmWU='; style-src 'self' 'unsafe-inline'; frame-src *; img-src * data: blob:; font-src 'self' data:; media-src *; connect-src *; object-src 'none'; base-uri 'self';
Referrer-Policy: no-referrer
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Robots-Tag: noindex, nofollow
Set-Cookie: nc_sameSiteCookielax=true; path=/; httponly;expires=Fri, 31-Dec-2100 23:59:59 GMT; SameSite=lax
Set-Cookie: nc_sameSiteCookiestrict=true; path=/; httponly;expires=Fri, 31-Dec-2100 23:59:59 GMT; SameSite=strict
Set-Cookie: oc1alrzetxgb=7f8r9tq2cduqn76qo566ijuvkb; path=/; HttpOnly; SameSite=Lax
Location: http://localhost/index.php/login

root@nextcloud:/usr/local/bin# sudo nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nano /var/www/nextcloud/config/config.php
root@nextcloud:/usr/local/bin# sudo nano /var/www/nextcloud/config/config.php
root@nextcloud:/usr/local/bin# > /var/www/nextcloud/config/config.php
root@nextcloud:/usr/local/bin# sudo nano /var/www/nextcloud/config/config.php
root@nextcloud:/usr/local/bin# nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# > /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# nano /etc/nginx/sites-available/nextcloud.conf
root@nextcloud:/usr/local/bin# sudo nginx -t
nginx: [warn] conflicting server name "160.191.150.238" on 0.0.0.0:80, ignored
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
root@nextcloud:/usr/local/bin# sudo systemctl restart php8.1-fpm
root@nextcloud:/usr/local/bin# sudo systemctl restart nginx
root@nextcloud:/usr/local/bin#

```