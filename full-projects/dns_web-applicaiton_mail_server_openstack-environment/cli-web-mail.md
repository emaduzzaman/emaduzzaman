ubuntu@web-mail:~$ sudo bash

root@web-mail:/home/ubuntu# sudo apt update \&\& sudo apt upgrade -y

Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease \[129 kB]

Hit:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy InRelease

Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease \[128 kB]

Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease \[127 kB]

Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages \[14.1 MB]

Get:6 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages \[2843 kB]

Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe Translation-en \[5652 kB]

Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata \[286 kB]

Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages \[217 kB]

Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en \[112 kB]

Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata \[8372 B]

Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages \[3109 kB]

Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en \[478 kB]

Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata \[19.0 kB]

Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages \[4939 kB]

Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en \[921 kB]

Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata \[640 B]

Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages \[1244 kB]

Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en \[310 kB]

Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata \[30.0 kB]

Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages \[57.6 kB]

Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en \[13.2 kB]

Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata \[600 B]

Get:24 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages \[69.4 kB]

Get:25 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en \[11.5 kB]

Get:26 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en \[411 kB]

Get:27 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata \[412 B]

Get:28 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata \[116 B]

Get:29 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages \[30.1 kB]

Get:30 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en \[16.6 kB]

Get:31 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata \[672 B]

Get:32 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata \[116 B]

Get:33 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata \[13.9 kB]

Get:34 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages \[4772 kB]

Get:35 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en \[893 kB]

Get:36 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 c-n-f Metadata \[652 B]

Get:37 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages \[1006 kB]

Get:38 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en \[220 kB]

Get:39 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata \[22.3 kB]

Get:40 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages \[50.5 kB]

Get:41 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en \[10.2 kB]

Get:42 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata \[376 B]

Fetched 42.2 MB in 19s (2251 kB/s)

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

80 packages can be upgraded. Run 'apt list --upgradable' to see them.

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

Calculating upgrade... Done

The following NEW packages will be installed:

&nbsp; linux-headers-5.15.0-163 linux-headers-5.15.0-163-generic linux-image-5.15.0-163-generic linux-modules-5.15.0-163-generic

The following packages have been kept back:

&nbsp; libnss-systemd libpam-systemd libsystemd0 libudev1 systemd systemd-sysv systemd-timesyncd udev

The following packages will be upgraded:

&nbsp; apport bind9-dnsutils bind9-host bind9-libs binutils binutils-common binutils-x86-64-linux-gnu cloud-init curl dirmngr distro-info-data dpkg gcc-12-base git git-man gnupg gnupg-l10n gnupg-utils gpg

&nbsp; gpg-agent gpg-wks-client gpg-wks-server gpgconf gpgsm gpgv iputils-ping iputils-tracepath landscape-common libbinutils libc-bin libc6 libctf-nobfd0 libctf0 libcurl3-gnutls libcurl4 libgcc-s1 libglib2.0-0

&nbsp; libglib2.0-bin libglib2.0-data libgnutls30 libperl5.34 libpython3.10 libpython3.10-minimal libpython3.10-stdlib libsqlite3-0 libssh-4 libssl3 libstdc++6 libudisks2-0 libxml2 linux-headers-generic

&nbsp; linux-headers-virtual linux-image-virtual linux-virtual locales needrestart open-vm-tools openssl perl perl-base perl-modules-5.34 powermgmt-base python3-apport python3-problem-report python3.10

&nbsp; python3.10-minimal snapd sosreport systemd-hwe-hwdb ubuntu-advantage-tools ubuntu-pro-client ubuntu-pro-client-l10n

72 upgraded, 4 newly installed, 0 to remove and 8 not upgraded.

58 standard LTS security updates

Need to get 130 MB of archives.

After this operation, 243 MB of additional disk space will be used.

Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dpkg amd64 1.21.1ubuntu2.6 \[1239 kB]

Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libperl5.34 amd64 5.34.0-3ubuntu1.5 \[4797 kB]

Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl amd64 5.34.0-3ubuntu1.5 \[232 kB]

Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-base amd64 5.34.0-3ubuntu1.5 \[1761 kB]

Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-modules-5.34 all 5.34.0-3ubuntu1.5 \[2977 kB]

Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gcc-12-base amd64 12.3.0-1ubuntu1~22.04.2 \[20.6 kB]

Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgcc-s1 amd64 12.3.0-1ubuntu1~22.04.2 \[53.9 kB]

Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libstdc++6 amd64 12.3.0-1ubuntu1~22.04.2 \[699 kB]

Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc6 amd64 2.35-0ubuntu3.11 \[3235 kB]

Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc-bin amd64 2.35-0ubuntu3.11 \[706 kB]

Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10 amd64 3.10.12-1~22.04.12 \[1949 kB]

Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssl3 amd64 3.0.2-0ubuntu1.20 \[1905 kB]

Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10 amd64 3.10.12-1~22.04.12 \[508 kB]

Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-stdlib amd64 3.10.12-1~22.04.12 \[1849 kB]

Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10-minimal amd64 3.10.12-1~22.04.12 \[2268 kB]

Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-minimal amd64 3.10.12-1~22.04.12 \[815 kB]

Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsqlite3-0 amd64 3.37.2-2ubuntu0.5 \[643 kB]

Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-data all 2.72.4-0ubuntu2.6 \[4698 B]

Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-bin amd64 2.72.4-0ubuntu2.6 \[80.9 kB]

Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-0 amd64 2.72.4-0ubuntu2.6 \[1467 kB]

Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxml2 amd64 2.9.13+dfsg-1ubuntu0.10 \[764 kB]

Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 open-vm-tools amd64 2:12.3.5-3~ubuntu0.22.04.3 \[747 kB]

Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-client amd64 2.2.27-3ubuntu2.4 \[62.7 kB]

Get:24 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dirmngr amd64 2.2.27-3ubuntu2.4 \[293 kB]

Get:25 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-server amd64 2.2.27-3ubuntu2.4 \[57.5 kB]

Get:26 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-utils amd64 2.2.27-3ubuntu2.4 \[309 kB]

Get:27 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-agent amd64 2.2.27-3ubuntu2.4 \[209 kB]

Get:28 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg amd64 2.2.27-3ubuntu2.4 \[518 kB]

Get:29 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgconf amd64 2.2.27-3ubuntu2.4 \[94.5 kB]

Get:30 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-l10n all 2.2.27-3ubuntu2.4 \[54.7 kB]

Get:31 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg all 2.2.27-3ubuntu2.4 \[315 kB]

Get:32 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgsm amd64 2.2.27-3ubuntu2.4 \[197 kB]

Get:33 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgnutls30 amd64 3.7.3-4ubuntu1.7 \[967 kB]

Get:34 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgv amd64 2.2.27-3ubuntu2.4 \[137 kB]

Get:35 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 distro-info-data all 0.52ubuntu0.11 \[5444 B]

Get:36 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-ping amd64 3:20211215-1ubuntu0.1 \[43.0 kB]

Get:37 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 locales all 2.35-0ubuntu3.11 \[4247 kB]

Get:38 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.20 \[1185 kB]

Get:39 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client-l10n amd64 37.1ubuntu0~22.04 \[20.7 kB]

Get:40 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client amd64 37.1ubuntu0~22.04 \[238 kB]

Get:41 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-advantage-tools all 37.1ubuntu0~22.04 \[10.9 kB]

Get:42 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-dnsutils amd64 1:9.18.39-0ubuntu0.22.04.2 \[158 kB]

Get:43 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-host amd64 1:9.18.39-0ubuntu0.22.04.2 \[52.5 kB]

Get:44 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-libs amd64 1:9.18.39-0ubuntu0.22.04.2 \[1262 kB]

Get:45 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-tracepath amd64 3:20211215-1ubuntu0.1 \[14.2 kB]

Get:46 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 powermgmt-base all 1.36ubuntu0.22.04.1 \[7736 B]

Get:47 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-problem-report all 2.20.11-0ubuntu82.10 \[11.4 kB]

Get:48 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apport all 2.20.11-0ubuntu82.10 \[89.0 kB]

Get:49 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apport all 2.20.11-0ubuntu82.10 \[135 kB]

Get:50 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf0 amd64 2.38-4ubuntu2.11 \[103 kB]

Get:51 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf-nobfd0 amd64 2.38-4ubuntu2.11 \[108 kB]

Get:52 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-x86-64-linux-gnu amd64 2.38-4ubuntu2.11 \[2324 kB]

Get:53 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libbinutils amd64 2.38-4ubuntu2.11 \[658 kB]

Get:54 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils amd64 2.38-4ubuntu2.11 \[3200 B]

Get:55 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-common amd64 2.38-4ubuntu2.11 \[223 kB]

Get:56 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssh-4 amd64 0.9.6-2ubuntu0.22.04.5 \[187 kB]

Get:57 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.21 \[194 kB]

Get:58 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.21 \[290 kB]

Get:59 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl3-gnutls amd64 7.81.0-1ubuntu1.21 \[284 kB]

Get:60 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git-man all 1:2.34.1-1ubuntu1.15 \[955 kB]

Get:61 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git amd64 1:2.34.1-1ubuntu1.15 \[3166 kB]

Get:62 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 landscape-common amd64 23.02-0ubuntu1~22.04.6 \[88.9 kB]

Get:63 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudisks2-0 amd64 2.9.4-1ubuntu2.3 \[167 kB]

Get:64 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-163 all 5.15.0-163.173 \[12.4 MB]

Get:65 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-163-generic amd64 5.15.0-163.173 \[2861 kB]

Get:66 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-modules-5.15.0-163-generic amd64 5.15.0-163.173 \[22.7 MB]

Get:67 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-5.15.0-163-generic amd64 5.15.0-163.173 \[11.6 MB]

Get:68 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-virtual amd64 5.15.0.163.158 \[1654 B]

Get:69 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-virtual amd64 5.15.0.163.158 \[2434 B]

Get:70 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-virtual amd64 5.15.0.163.158 \[1636 B]

Get:71 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-generic amd64 5.15.0.163.158 \[2328 B]

Get:72 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 needrestart all 3.5-5ubuntu2.5 \[45.5 kB]

Get:73 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 snapd amd64 2.72+ubuntu22.04 \[31.8 MB]

Get:74 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 sosreport amd64 4.9.2-0ubuntu0~22.04.1 \[367 kB]

Get:75 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-hwe-hwdb all 249.11.6 \[3668 B]

Get:76 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 cloud-init all 25.2-0ubuntu1~22.04.1 \[586 kB]

Fetched 130 MB in 13s (10.3 MB/s)

Extracting templates from packages: 100%

Preconfiguring packages ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../dpkg\_1.21.1ubuntu2.6\_amd64.deb ...

Unpacking dpkg (1.21.1ubuntu2.6) over (1.21.1ubuntu2.3) ...

Setting up dpkg (1.21.1ubuntu2.6) ...

dpkg-db-backup.service is a disabled or a static unit not running, not starting it.

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../libperl5.34\_5.34.0-3ubuntu1.5\_amd64.deb ...

Unpacking libperl5.34:amd64 (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...

Preparing to unpack .../perl\_5.34.0-3ubuntu1.5\_amd64.deb ...

Unpacking perl (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...

Preparing to unpack .../perl-base\_5.34.0-3ubuntu1.5\_amd64.deb ...

Unpacking perl-base (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...

Setting up perl-base (5.34.0-3ubuntu1.5) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../perl-modules-5.34\_5.34.0-3ubuntu1.5\_all.deb ...

Unpacking perl-modules-5.34 (5.34.0-3ubuntu1.5) over (5.34.0-3ubuntu1.4) ...

Preparing to unpack .../gcc-12-base\_12.3.0-1ubuntu1~22.04.2\_amd64.deb ...

Unpacking gcc-12-base:amd64 (12.3.0-1ubuntu1~22.04.2) over (12.3.0-1ubuntu1~22.04) ...

Setting up gcc-12-base:amd64 (12.3.0-1ubuntu1~22.04.2) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../libgcc-s1\_12.3.0-1ubuntu1~22.04.2\_amd64.deb ...

Unpacking libgcc-s1:amd64 (12.3.0-1ubuntu1~22.04.2) over (12.3.0-1ubuntu1~22.04) ...

Setting up libgcc-s1:amd64 (12.3.0-1ubuntu1~22.04.2) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../libstdc++6\_12.3.0-1ubuntu1~22.04.2\_amd64.deb ...

Unpacking libstdc++6:amd64 (12.3.0-1ubuntu1~22.04.2) over (12.3.0-1ubuntu1~22.04) ...

Setting up libstdc++6:amd64 (12.3.0-1ubuntu1~22.04.2) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../libc6\_2.35-0ubuntu3.11\_amd64.deb ...

Unpacking libc6:amd64 (2.35-0ubuntu3.11) over (2.35-0ubuntu3.10) ...

Setting up libc6:amd64 (2.35-0ubuntu3.11) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../libc-bin\_2.35-0ubuntu3.11\_amd64.deb ...

Unpacking libc-bin (2.35-0ubuntu3.11) over (2.35-0ubuntu3.10) ...

Setting up libc-bin (2.35-0ubuntu3.11) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../libpython3.10\_3.10.12-1~22.04.12\_amd64.deb ...

Unpacking libpython3.10:amd64 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...

Preparing to unpack .../libssl3\_3.0.2-0ubuntu1.20\_amd64.deb ...

Unpacking libssl3:amd64 (3.0.2-0ubuntu1.20) over (3.0.2-0ubuntu1.19) ...

Setting up libssl3:amd64 (3.0.2-0ubuntu1.20) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../00-python3.10\_3.10.12-1~22.04.12\_amd64.deb ...

Unpacking python3.10 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...

Preparing to unpack .../01-libpython3.10-stdlib\_3.10.12-1~22.04.12\_amd64.deb ...

Unpacking libpython3.10-stdlib:amd64 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...

Preparing to unpack .../02-python3.10-minimal\_3.10.12-1~22.04.12\_amd64.deb ...

Unpacking python3.10-minimal (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...

Preparing to unpack .../03-libpython3.10-minimal\_3.10.12-1~22.04.12\_amd64.deb ...

Unpacking libpython3.10-minimal:amd64 (3.10.12-1~22.04.12) over (3.10.12-1~22.04.10) ...

Preparing to unpack .../04-libsqlite3-0\_3.37.2-2ubuntu0.5\_amd64.deb ...

Unpacking libsqlite3-0:amd64 (3.37.2-2ubuntu0.5) over (3.37.2-2ubuntu0.4) ...

Preparing to unpack .../05-libglib2.0-data\_2.72.4-0ubuntu2.6\_all.deb ...

Unpacking libglib2.0-data (2.72.4-0ubuntu2.6) over (2.72.4-0ubuntu2.5) ...

Preparing to unpack .../06-libglib2.0-bin\_2.72.4-0ubuntu2.6\_amd64.deb ...

Unpacking libglib2.0-bin (2.72.4-0ubuntu2.6) over (2.72.4-0ubuntu2.5) ...

Preparing to unpack .../07-libglib2.0-0\_2.72.4-0ubuntu2.6\_amd64.deb ...

Unpacking libglib2.0-0:amd64 (2.72.4-0ubuntu2.6) over (2.72.4-0ubuntu2.5) ...

Preparing to unpack .../08-libxml2\_2.9.13+dfsg-1ubuntu0.10\_amd64.deb ...

Unpacking libxml2:amd64 (2.9.13+dfsg-1ubuntu0.10) over (2.9.13+dfsg-1ubuntu0.7) ...

Preparing to unpack .../09-open-vm-tools\_2%3a12.3.5-3~ubuntu0.22.04.3\_amd64.deb ...

Unpacking open-vm-tools (2:12.3.5-3~ubuntu0.22.04.3) over (2:12.3.5-3~ubuntu0.22.04.2) ...

Preparing to unpack .../10-gpg-wks-client\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpg-wks-client (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../11-dirmngr\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking dirmngr (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../12-gpg-wks-server\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpg-wks-server (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../13-gnupg-utils\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gnupg-utils (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../14-gpg-agent\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpg-agent (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../15-gpg\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpg (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../16-gpgconf\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpgconf (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../17-gnupg-l10n\_2.2.27-3ubuntu2.4\_all.deb ...

Unpacking gnupg-l10n (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../18-gnupg\_2.2.27-3ubuntu2.4\_all.deb ...

Unpacking gnupg (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../19-gpgsm\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpgsm (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Preparing to unpack .../20-libgnutls30\_3.7.3-4ubuntu1.7\_amd64.deb ...

Unpacking libgnutls30:amd64 (3.7.3-4ubuntu1.7) over (3.7.3-4ubuntu1.6) ...

Setting up libgnutls30:amd64 (3.7.3-4ubuntu1.7) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../gpgv\_2.2.27-3ubuntu2.4\_amd64.deb ...

Unpacking gpgv (2.2.27-3ubuntu2.4) over (2.2.27-3ubuntu2.3) ...

Setting up gpgv (2.2.27-3ubuntu2.4) ...

(Reading database ... 64592 files and directories currently installed.)

Preparing to unpack .../00-distro-info-data\_0.52ubuntu0.11\_all.deb ...

Unpacking distro-info-data (0.52ubuntu0.11) over (0.52ubuntu0.9) ...

Preparing to unpack .../01-iputils-ping\_3%3a20211215-1ubuntu0.1\_amd64.deb ...

Unpacking iputils-ping (3:20211215-1ubuntu0.1) over (3:20211215-1) ...

Preparing to unpack .../02-locales\_2.35-0ubuntu3.11\_all.deb ...

Unpacking locales (2.35-0ubuntu3.11) over (2.35-0ubuntu3.10) ...

Preparing to unpack .../03-openssl\_3.0.2-0ubuntu1.20\_amd64.deb ...

Unpacking openssl (3.0.2-0ubuntu1.20) over (3.0.2-0ubuntu1.19) ...

Preparing to unpack .../04-ubuntu-pro-client-l10n\_37.1ubuntu0~22.04\_amd64.deb ...

Unpacking ubuntu-pro-client-l10n (37.1ubuntu0~22.04) over (35.1ubuntu0~22.04) ...

Preparing to unpack .../05-ubuntu-pro-client\_37.1ubuntu0~22.04\_amd64.deb ...

Unpacking ubuntu-pro-client (37.1ubuntu0~22.04) over (35.1ubuntu0~22.04) ...

Preparing to unpack .../06-ubuntu-advantage-tools\_37.1ubuntu0~22.04\_all.deb ...

Unpacking ubuntu-advantage-tools (37.1ubuntu0~22.04) over (35.1ubuntu0~22.04) ...

Preparing to unpack .../07-bind9-dnsutils\_1%3a9.18.39-0ubuntu0.22.04.2\_amd64.deb ...

Unpacking bind9-dnsutils (1:9.18.39-0ubuntu0.22.04.2) over (1:9.18.30-0ubuntu0.22.04.2) ...

Preparing to unpack .../08-bind9-host\_1%3a9.18.39-0ubuntu0.22.04.2\_amd64.deb ...

Unpacking bind9-host (1:9.18.39-0ubuntu0.22.04.2) over (1:9.18.30-0ubuntu0.22.04.2) ...

Preparing to unpack .../09-bind9-libs\_1%3a9.18.39-0ubuntu0.22.04.2\_amd64.deb ...

Unpacking bind9-libs:amd64 (1:9.18.39-0ubuntu0.22.04.2) over (1:9.18.30-0ubuntu0.22.04.2) ...

Preparing to unpack .../10-iputils-tracepath\_3%3a20211215-1ubuntu0.1\_amd64.deb ...

Unpacking iputils-tracepath (3:20211215-1ubuntu0.1) over (3:20211215-1) ...

Preparing to unpack .../11-powermgmt-base\_1.36ubuntu0.22.04.1\_all.deb ...

Unpacking powermgmt-base (1.36ubuntu0.22.04.1) over (1.36) ...

Preparing to unpack .../12-python3-problem-report\_2.20.11-0ubuntu82.10\_all.deb ...

Unpacking python3-problem-report (2.20.11-0ubuntu82.10) over (2.20.11-0ubuntu82.8) ...

Preparing to unpack .../13-python3-apport\_2.20.11-0ubuntu82.10\_all.deb ...

Unpacking python3-apport (2.20.11-0ubuntu82.10) over (2.20.11-0ubuntu82.8) ...

Preparing to unpack .../14-apport\_2.20.11-0ubuntu82.10\_all.deb ...

Unpacking apport (2.20.11-0ubuntu82.10) over (2.20.11-0ubuntu82.8) ...

Preparing to unpack .../15-libctf0\_2.38-4ubuntu2.11\_amd64.deb ...

Unpacking libctf0:amd64 (2.38-4ubuntu2.11) over (2.38-4ubuntu2.8) ...

Preparing to unpack .../16-libctf-nobfd0\_2.38-4ubuntu2.11\_amd64.deb ...

Unpacking libctf-nobfd0:amd64 (2.38-4ubuntu2.11) over (2.38-4ubuntu2.8) ...

Preparing to unpack .../17-binutils-x86-64-linux-gnu\_2.38-4ubuntu2.11\_amd64.deb ...

Unpacking binutils-x86-64-linux-gnu (2.38-4ubuntu2.11) over (2.38-4ubuntu2.8) ...

Preparing to unpack .../18-libbinutils\_2.38-4ubuntu2.11\_amd64.deb ...

Unpacking libbinutils:amd64 (2.38-4ubuntu2.11) over (2.38-4ubuntu2.8) ...

Preparing to unpack .../19-binutils\_2.38-4ubuntu2.11\_amd64.deb ...

Unpacking binutils (2.38-4ubuntu2.11) over (2.38-4ubuntu2.8) ...

Preparing to unpack .../20-binutils-common\_2.38-4ubuntu2.11\_amd64.deb ...

Unpacking binutils-common:amd64 (2.38-4ubuntu2.11) over (2.38-4ubuntu2.8) ...

Preparing to unpack .../21-libssh-4\_0.9.6-2ubuntu0.22.04.5\_amd64.deb ...

Unpacking libssh-4:amd64 (0.9.6-2ubuntu0.22.04.5) over (0.9.6-2ubuntu0.22.04.3) ...

Preparing to unpack .../22-curl\_7.81.0-1ubuntu1.21\_amd64.deb ...

Unpacking curl (7.81.0-1ubuntu1.21) over (7.81.0-1ubuntu1.20) ...

Preparing to unpack .../23-libcurl4\_7.81.0-1ubuntu1.21\_amd64.deb ...

Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.21) over (7.81.0-1ubuntu1.20) ...

Preparing to unpack .../24-libcurl3-gnutls\_7.81.0-1ubuntu1.21\_amd64.deb ...

Unpacking libcurl3-gnutls:amd64 (7.81.0-1ubuntu1.21) over (7.81.0-1ubuntu1.20) ...

Preparing to unpack .../25-git-man\_1%3a2.34.1-1ubuntu1.15\_all.deb ...

Unpacking git-man (1:2.34.1-1ubuntu1.15) over (1:2.34.1-1ubuntu1.12) ...

Preparing to unpack .../26-git\_1%3a2.34.1-1ubuntu1.15\_amd64.deb ...

Unpacking git (1:2.34.1-1ubuntu1.15) over (1:2.34.1-1ubuntu1.12) ...

Preparing to unpack .../27-landscape-common\_23.02-0ubuntu1~22.04.6\_amd64.deb ...

Unpacking landscape-common (23.02-0ubuntu1~22.04.6) over (23.02-0ubuntu1~22.04.4) ...

Preparing to unpack .../28-libudisks2-0\_2.9.4-1ubuntu2.3\_amd64.deb ...

Unpacking libudisks2-0:amd64 (2.9.4-1ubuntu2.3) over (2.9.4-1ubuntu2.2) ...

Selecting previously unselected package linux-headers-5.15.0-163.

Preparing to unpack .../29-linux-headers-5.15.0-163\_5.15.0-163.173\_all.deb ...

Unpacking linux-headers-5.15.0-163 (5.15.0-163.173) ...

Selecting previously unselected package linux-headers-5.15.0-163-generic.

Preparing to unpack .../30-linux-headers-5.15.0-163-generic\_5.15.0-163.173\_amd64.deb ...

Unpacking linux-headers-5.15.0-163-generic (5.15.0-163.173) ...

Selecting previously unselected package linux-modules-5.15.0-163-generic.

Preparing to unpack .../31-linux-modules-5.15.0-163-generic\_5.15.0-163.173\_amd64.deb ...

Unpacking linux-modules-5.15.0-163-generic (5.15.0-163.173) ...

Selecting previously unselected package linux-image-5.15.0-163-generic.

Preparing to unpack .../32-linux-image-5.15.0-163-generic\_5.15.0-163.173\_amd64.deb ...

Unpacking linux-image-5.15.0-163-generic (5.15.0-163.173) ...

Preparing to unpack .../33-linux-virtual\_5.15.0.163.158\_amd64.deb ...

Unpacking linux-virtual (5.15.0.163.158) over (5.15.0.143.138) ...

Preparing to unpack .../34-linux-image-virtual\_5.15.0.163.158\_amd64.deb ...

Unpacking linux-image-virtual (5.15.0.163.158) over (5.15.0.143.138) ...

Preparing to unpack .../35-linux-headers-virtual\_5.15.0.163.158\_amd64.deb ...

Unpacking linux-headers-virtual (5.15.0.163.158) over (5.15.0.143.138) ...

Preparing to unpack .../36-linux-headers-generic\_5.15.0.163.158\_amd64.deb ...

Unpacking linux-headers-generic (5.15.0.163.158) over (5.15.0.143.138) ...

Preparing to unpack .../37-needrestart\_3.5-5ubuntu2.5\_all.deb ...

Unpacking needrestart (3.5-5ubuntu2.5) over (3.5-5ubuntu2.4) ...

Preparing to unpack .../38-snapd\_2.72+ubuntu22.04\_amd64.deb ...

Unpacking snapd (2.72+ubuntu22.04) over (2.67.1+22.04) ...

Preparing to unpack .../39-sosreport\_4.9.2-0ubuntu0~22.04.1\_amd64.deb ...

Unpacking sosreport (4.9.2-0ubuntu0~22.04.1) over (4.8.2-0ubuntu0~22.04.2) ...

Preparing to unpack .../40-systemd-hwe-hwdb\_249.11.6\_all.deb ...

Unpacking systemd-hwe-hwdb (249.11.6) over (249.11.5) ...

Preparing to unpack .../41-cloud-init\_25.2-0ubuntu1~22.04.1\_all.deb ...

Unpacking cloud-init (25.2-0ubuntu1~22.04.1) over (25.1.2-0ubuntu0~22.04.2) ...

Setting up powermgmt-base (1.36ubuntu0.22.04.1) ...

Setting up snapd (2.72+ubuntu22.04) ...

Installing new version of config file /etc/apparmor.d/usr.lib.snapd.snap-confine.real ...

snapd.failure.service is a disabled or a static unit not running, not starting it.

snapd.gpio-chardev-setup.target is a disabled or a static unit not running, not starting it.

snapd.snap-repair.service is a disabled or a static unit not running, not starting it.

Setting up cloud-init (25.2-0ubuntu1~22.04.1) ...

Installing new version of config file /etc/cloud/templates/sources.list.debian.deb822.tmpl ...

Setting up linux-headers-5.15.0-163 (5.15.0-163.173) ...

Setting up python3-problem-report (2.20.11-0ubuntu82.10) ...

Setting up libglib2.0-0:amd64 (2.72.4-0ubuntu2.6) ...

No schema files found: doing nothing.

Setting up distro-info-data (0.52ubuntu0.11) ...

Setting up libsqlite3-0:amd64 (3.37.2-2ubuntu0.5) ...

Setting up binutils-common:amd64 (2.38-4ubuntu2.11) ...

Setting up libctf-nobfd0:amd64 (2.38-4ubuntu2.11) ...

Setting up perl-modules-5.34 (5.34.0-3ubuntu1.5) ...

Setting up locales (2.35-0ubuntu3.11) ...

Generating locales (this might take a while)...

&nbsp; en\_US.UTF-8... done

Generation complete.

Setting up landscape-common (23.02-0ubuntu1~22.04.6) ...

Setting up python3-apport (2.20.11-0ubuntu82.10) ...

Setting up libglib2.0-data (2.72.4-0ubuntu2.6) ...

Setting up gnupg-l10n (2.2.27-3ubuntu2.4) ...

Setting up libpython3.10-minimal:amd64 (3.10.12-1~22.04.12) ...

Setting up libssh-4:amd64 (0.9.6-2ubuntu0.22.04.5) ...

Setting up sosreport (4.9.2-0ubuntu0~22.04.1) ...

Installing new version of config file /etc/sos/sos.conf ...

Setting up systemd-hwe-hwdb (249.11.6) ...

Setting up gpgconf (2.2.27-3ubuntu2.4) ...

Setting up libcurl4:amd64 (7.81.0-1ubuntu1.21) ...

Setting up git-man (1:2.34.1-1ubuntu1.15) ...

Setting up curl (7.81.0-1ubuntu1.21) ...

Setting up libbinutils:amd64 (2.38-4ubuntu2.11) ...

Setting up openssl (3.0.2-0ubuntu1.20) ...

Setting up iputils-ping (3:20211215-1ubuntu0.1) ...

Setting up libxml2:amd64 (2.9.13+dfsg-1ubuntu0.10) ...

Setting up ubuntu-pro-client (37.1ubuntu0~22.04) ...

Installing new version of config file /etc/apparmor.d/ubuntu\_pro\_apt\_news ...

Installing new version of config file /etc/apparmor.d/ubuntu\_pro\_esm\_cache ...

Setting up gpg (2.2.27-3ubuntu2.4) ...

Setting up iputils-tracepath (3:20211215-1ubuntu0.1) ...

Setting up libudisks2-0:amd64 (2.9.4-1ubuntu2.3) ...

Setting up gnupg-utils (2.2.27-3ubuntu2.4) ...

Setting up linux-headers-5.15.0-163-generic (5.15.0-163.173) ...

Setting up libctf0:amd64 (2.38-4ubuntu2.11) ...

Setting up ubuntu-pro-client-l10n (37.1ubuntu0~22.04) ...

Setting up libperl5.34:amd64 (5.34.0-3ubuntu1.5) ...

Setting up gpg-agent (2.2.27-3ubuntu2.4) ...

Setting up bind9-libs:amd64 (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up gpgsm (2.2.27-3ubuntu2.4) ...

Setting up libglib2.0-bin (2.72.4-0ubuntu2.6) ...

Setting up libcurl3-gnutls:amd64 (7.81.0-1ubuntu1.21) ...

Setting up linux-headers-generic (5.15.0.163.158) ...

Setting up python3.10-minimal (3.10.12-1~22.04.12) ...

Setting up apport (2.20.11-0ubuntu82.10) ...

apport-autoreport.service is a disabled or a static unit, not starting it.

Setting up libpython3.10-stdlib:amd64 (3.10.12-1~22.04.12) ...

Setting up dirmngr (2.2.27-3ubuntu2.4) ...

Setting up perl (5.34.0-3ubuntu1.5) ...

Setting up git (1:2.34.1-1ubuntu1.15) ...

Setting up gpg-wks-server (2.2.27-3ubuntu2.4) ...

Setting up open-vm-tools (2:12.3.5-3~ubuntu0.22.04.3) ...

Setting up ubuntu-advantage-tools (37.1ubuntu0~22.04) ...

Setting up bind9-host (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up binutils-x86-64-linux-gnu (2.38-4ubuntu2.11) ...

Setting up libpython3.10:amd64 (3.10.12-1~22.04.12) ...

Setting up python3.10 (3.10.12-1~22.04.12) ...

Setting up linux-headers-virtual (5.15.0.163.158) ...

Setting up gpg-wks-client (2.2.27-3ubuntu2.4) ...

Setting up binutils (2.38-4ubuntu2.11) ...

Setting up gnupg (2.2.27-3ubuntu2.4) ...

Setting up bind9-dnsutils (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up needrestart (3.5-5ubuntu2.5) ...

Setting up linux-modules-5.15.0-163-generic (5.15.0-163.173) ...

Setting up linux-image-5.15.0-163-generic (5.15.0-163.173) ...

I: /boot/vmlinuz is now a symlink to vmlinuz-5.15.0-163-generic

I: /boot/initrd.img is now a symlink to initrd.img-5.15.0-163-generic

Setting up linux-image-virtual (5.15.0.163.158) ...

Setting up linux-virtual (5.15.0.163.158) ...

Processing triggers for dbus (1.12.20-2ubuntu4.1) ...

Processing triggers for udev (249.11-0ubuntu3.16) ...

Processing triggers for install-info (6.8-4build1) ...

Processing triggers for libc-bin (2.35-0ubuntu3.11) ...

Processing triggers for rsyslog (8.2112.0-2ubuntu2.2) ...

Processing triggers for man-db (2.10.2-1) ...

Processing triggers for linux-image-5.15.0-163-generic (5.15.0-163.173) ...

/etc/kernel/postinst.d/initramfs-tools:

update-initramfs: Generating /boot/initrd.img-5.15.0-163-generic

/etc/kernel/postinst.d/zz-update-grub:

Sourcing file `/etc/default/grub'

Sourcing file `/etc/default/grub.d/50-cloudimg-settings.cfg'

Sourcing file `/etc/default/grub.d/init-select.cfg'

Generating grub configuration file ...

Found linux image: /boot/vmlinuz-5.15.0-163-generic

Found initrd image: /boot/initrd.img-5.15.0-163-generic

Found linux image: /boot/vmlinuz-5.15.0-143-generic

Found initrd image: /boot/initrd.img-5.15.0-143-generic

Warning: os-prober will not be executed to detect other bootable partitions.

Systems on them will not be added to the GRUB boot configuration.

Check GRUB\_DISABLE\_OS\_PROBER documentation entry.

done

Scanning processes...

Scanning candidates...

Scanning linux images...



Restarting services...

&nbsp;/etc/needrestart/restart.d/systemd-manager

&nbsp;systemctl restart cron.service irqbalance.service multipathd.service packagekit.service polkit.service serial-getty@ttyS0.service ssh.service systemd-journald.service systemd-networkd.service systemd-resolved.service systemd-timesyncd.service systemd-udevd.service

Service restarts being deferred:

&nbsp;/etc/needrestart/restart.d/dbus.service

&nbsp;systemctl restart getty@tty1.service

&nbsp;systemctl restart networkd-dispatcher.service

&nbsp;systemctl restart systemd-logind.service

&nbsp;systemctl restart unattended-upgrades.service

&nbsp;systemctl restart user@1000.service



No containers need to be restarted.



No user sessions are running outdated binaries.



No VM guests are running outdated hypervisor (qemu) binaries on this host.

root@web-mail:/home/ubuntu# cat /etc/netplan/\*.yaml

\# This file is generated from information provided by the datasource.  Changes

\# to it will not persist across an instance reboot.  To disable cloud-init's

\# network configuration capabilities, write a file

\# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:

\# network: {config: disabled}

network:

&nbsp;   version: 2

&nbsp;   ethernets:

&nbsp;       ens3:

&nbsp;           dhcp4: true

&nbsp;           match:

&nbsp;               macaddress: fa:16:3e:39:0e:80

&nbsp;           mtu: 8942

&nbsp;           set-name: ens3

root@web-mail:/home/ubuntu# nano /etc/netplan/01-netcfg.yaml

root@web-mail:/home/ubuntu# cat /etc/netplan/01-netcfg.yaml

network:

&nbsp; version: 2

&nbsp; renderer: networkd

&nbsp; ethernets:

&nbsp;   ens3:

&nbsp;     addresses:

&nbsp;       - 192.168.20.15/24

&nbsp;     routes:

&nbsp;       - to: default

&nbsp;         via: 192.168.20.1

&nbsp;     nameservers:

&nbsp;       addresses:

&nbsp;         - 192.168.20.20    # my dns

&nbsp;         - 8.8.8.8          # forwordres shit

root@web-mail:/home/ubuntu# sudo netplan apply



\*\* (generate:10505): WARNING \*\*: 07:27:00.838: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.

WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.



\*\* (process:10503): WARNING \*\*: 07:27:01.043: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (process:10503): WARNING \*\*: 07:27:01.139: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (process:10503): WARNING \*\*: 07:27:01.139: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.

root@web-mail:/home/ubuntu# dig gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> gelani.com

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 46062

;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 65494

;; QUESTION SECTION:

;gelani.com.                    IN      A



;; ANSWER SECTION:

gelani.com.             14399   IN      A       64.190.63.222



;; Query time: 292 msec

;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)

;; WHEN: Thu Dec 04 07:27:06 UTC 2025

;; MSG SIZE  rcvd: 55



root@web-mail:/home/ubuntu# dig www.gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> www.gelani.com

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 39235

;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 65494

;; QUESTION SECTION:

;www.gelani.com.                        IN      A



;; ANSWER SECTION:

www.gelani.com.         14399   IN      A       64.190.63.222



;; Query time: 332 msec

;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)

;; WHEN: Thu Dec 04 07:27:10 UTC 2025

;; MSG SIZE  rcvd: 59



root@web-mail:/home/ubuntu# ping -c 3 gelani.com

PING gelani.com (64.190.63.222) 56(84) bytes of data.

^C

--- gelani.com ping statistics ---

3 packets transmitted, 0 received, 100% packet loss, time 2054ms



root@web-mail:/home/ubuntu# ping -c 3 gelani.com

PING gelani.com (64.190.63.222) 56(84) bytes of data.

^C

--- gelani.com ping statistics ---

3 packets transmitted, 0 received, 100% packet loss, time 2043ms



root@web-mail:/home/ubuntu# chmod 600 /etc/netplan/01-netcfg.yaml

root@web-mail:/home/ubuntu# systemctl stop systemd-resolved

root@web-mail:/home/ubuntu# systemctl disable systemd-resolved

Removed /etc/systemd/system/dbus-org.freedesktop.resolve1.service.

Removed /etc/systemd/system/multi-user.target.wants/systemd-resolved.service.

root@web-mail:/home/ubuntu# sudo rm /etc/resolv.conf

sudo: unable to resolve host web-mail: Temporary failure in name resolution

root@web-mail:/home/ubuntu# sudo nano /etc/resolv.conf

sudo: unable to resolve host web-mail: Temporary failure in name resolution

root@web-mail:/home/ubuntu# cat /etc/resolv.conf

nameserver 192.168.20.20

nameserver 8.8.8.8

root@web-mail:/home/ubuntu# chattr +i /etc/resolv.conf

root@web-mail:/home/ubuntu# dig gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> gelani.com

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 55148

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: a60494ed0bc3aac501000000693139decff84fb6277aa95c (good)

;; QUESTION SECTION:

;gelani.com.                    IN      A



;; ANSWER SECTION:

gelani.com.             604800  IN      A       192.168.20.15



;; Query time: 8 msec

;; SERVER: 192.168.20.20#53(192.168.20.20) (UDP)

;; WHEN: Thu Dec 04 07:35:58 UTC 2025

;; MSG SIZE  rcvd: 83



root@web-mail:/home/ubuntu# cat /etc/resolv.conf

nameserver 192.168.20.20

nameserver 8.8.8.8

root@web-mail:/home/ubuntu# nslookup gelani.com

Server:         192.168.20.20

Address:        192.168.20.20#53



Name:   gelani.com

Address: 192.168.20.15



root@web-mail:/home/ubuntu# ping -c 3 gelani.com

PING gelani.com (192.168.20.15) 56(84) bytes of data.

64 bytes from web-mail.openstack.internal (192.168.20.15): icmp\_seq=1 ttl=64 time=0.012 ms

64 bytes from web-mail.openstack.internal (192.168.20.15): icmp\_seq=2 ttl=64 time=0.032 ms

64 bytes from web-mail.openstack.internal (192.168.20.15): icmp\_seq=3 ttl=64 time=0.033 ms



--- gelani.com ping statistics ---

3 packets transmitted, 3 received, 0% packet loss, time 2016ms

rtt min/avg/max/mdev = 0.012/0.025/0.033/0.009 ms

root@web-mail:/home/ubuntu# systemctl status nginx

Unit nginx.service could not be found.

root@web-mail:/home/ubuntu# ip addr show ens3

2: ens3: <BROADCAST,MULTICAST,UP,LOWER\_UP> mtu 8942 qdisc fq\_codel state UP group default qlen 1000

&nbsp;   link/ether fa:16:3e:39:0e:80 brd ff:ff:ff:ff:ff:ff

&nbsp;   altname enp0s3

&nbsp;   inet 192.168.20.15/24 metric 100 brd 192.168.20.255 scope global dynamic ens3

&nbsp;      valid\_lft 42501sec preferred\_lft 42501sec

&nbsp;   inet6 fe80::f816:3eff:fe39:e80/64 scope link

&nbsp;      valid\_lft forever preferred\_lft forever

root@web-mail:/home/ubuntu# ip route show

default via 192.168.20.1 dev ens3 proto static

default via 192.168.20.1 dev ens3 proto dhcp src 192.168.20.15 metric 100

8.8.8.8 via 192.168.20.1 dev ens3 proto dhcp src 192.168.20.15 metric 100

169.254.169.254 via 192.168.20.10 dev ens3 proto dhcp src 192.168.20.15 metric 100

192.168.20.0/24 dev ens3 proto kernel scope link src 192.168.20.15 metric 100

192.168.20.1 dev ens3 proto dhcp scope link src 192.168.20.15 metric 100

192.168.20.10 dev ens3 proto dhcp scope link src 192.168.20.15 metric 100

root@web-mail:/home/ubuntu# # Check current network configuration

cat /etc/netplan/\*.yaml

network:

&nbsp; version: 2

&nbsp; renderer: networkd

&nbsp; ethernets:

&nbsp;   ens3:

&nbsp;     addresses:

&nbsp;       - 192.168.20.15/24

&nbsp;     routes:

&nbsp;       - to: default

&nbsp;         via: 192.168.20.1

&nbsp;     nameservers:

&nbsp;       addresses:

&nbsp;         - 192.168.20.20    # my dns

&nbsp;         - 8.8.8.8          # forwordres shit

\# This file is generated from information provided by the datasource.  Changes

\# to it will not persist across an instance reboot.  To disable cloud-init's

\# network configuration capabilities, write a file

\# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:

\# network: {config: disabled}

network:

&nbsp;   version: 2

&nbsp;   ethernets:

&nbsp;       ens3:

&nbsp;           dhcp4: true

&nbsp;           match:

&nbsp;               macaddress: fa:16:3e:39:0e:80

&nbsp;           mtu: 8942

&nbsp;           set-name: ens3

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# \#nginx installation

root@web-mail:/home/ubuntu# apt update \&\& apt upgrade -y

Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease

Hit:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy InRelease

Hit:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease

Hit:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

8 packages can be upgraded. Run 'apt list --upgradable' to see them.

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

Calculating upgrade... Done

The following packages have been kept back:

&nbsp; libnss-systemd libpam-systemd libsystemd0 libudev1 systemd systemd-sysv systemd-timesyncd udev

0 upgraded, 0 newly installed, 0 to remove and 8 not upgraded.

root@web-mail:/home/ubuntu# sudo apt install nginx -y

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

The following additional packages will be installed:

&nbsp; fontconfig-config fonts-dejavu-core libdeflate0 libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-geoip2 libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter

&nbsp; libnginx-mod-mail libnginx-mod-stream libnginx-mod-stream-geoip2 libtiff5 libwebp7 libxpm4 nginx-common nginx-core

Suggested packages:

&nbsp; libgd-tools fcgiwrap nginx-doc ssl-cert

The following NEW packages will be installed:

&nbsp; fontconfig-config fonts-dejavu-core libdeflate0 libfontconfig1 libgd3 libjbig0 libjpeg-turbo8 libjpeg8 libnginx-mod-http-geoip2 libnginx-mod-http-image-filter libnginx-mod-http-xslt-filter

&nbsp; libnginx-mod-mail libnginx-mod-stream libnginx-mod-stream-geoip2 libtiff5 libwebp7 libxpm4 nginx nginx-common nginx-core

0 upgraded, 20 newly installed, 0 to remove and 8 not upgraded.

Need to get 2694 kB of archives.

After this operation, 8346 kB of additional disk space will be used.

Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 fonts-dejavu-core all 2.37-2build1 \[1041 kB]

Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 fontconfig-config all 2.13.1-4.2ubuntu5 \[29.1 kB]

Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libdeflate0 amd64 1.10-2 \[70.9 kB]

Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libfontconfig1 amd64 2.13.1-4.2ubuntu5 \[131 kB]

Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libjpeg-turbo8 amd64 2.1.2-0ubuntu1 \[134 kB]

Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libjpeg8 amd64 8c-2ubuntu10 \[2264 B]

Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libjbig0 amd64 2.1-3.1ubuntu0.22.04.1 \[29.2 kB]

Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libwebp7 amd64 1.2.2-2ubuntu0.22.04.2 \[206 kB]

Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libtiff5 amd64 4.3.0-6ubuntu0.12 \[185 kB]

Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxpm4 amd64 1:3.5.12-1ubuntu0.22.04.2 \[36.7 kB]

Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgd3 amd64 2.3.0-2ubuntu2.3 \[129 kB]

Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 nginx-common all 1.18.0-6ubuntu14.7 \[40.1 kB]

Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnginx-mod-http-geoip2 amd64 1.18.0-6ubuntu14.7 \[12.0 kB]

Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnginx-mod-http-image-filter amd64 1.18.0-6ubuntu14.7 \[15.5 kB]

Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnginx-mod-http-xslt-filter amd64 1.18.0-6ubuntu14.7 \[13.8 kB]

Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnginx-mod-mail amd64 1.18.0-6ubuntu14.7 \[45.8 kB]

Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnginx-mod-stream amd64 1.18.0-6ubuntu14.7 \[73.0 kB]

Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libnginx-mod-stream-geoip2 amd64 1.18.0-6ubuntu14.7 \[10.1 kB]

Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 nginx-core amd64 1.18.0-6ubuntu14.7 \[483 kB]

Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 nginx amd64 1.18.0-6ubuntu14.7 \[3878 B]

Fetched 2694 kB in 4s (656 kB/s)

Preconfiguring packages ...

Selecting previously unselected package fonts-dejavu-core.

(Reading database ... 94194 files and directories currently installed.)

Preparing to unpack .../00-fonts-dejavu-core\_2.37-2build1\_all.deb ...

Unpacking fonts-dejavu-core (2.37-2build1) ...

Selecting previously unselected package fontconfig-config.

Preparing to unpack .../01-fontconfig-config\_2.13.1-4.2ubuntu5\_all.deb ...

Unpacking fontconfig-config (2.13.1-4.2ubuntu5) ...

Selecting previously unselected package libdeflate0:amd64.

Preparing to unpack .../02-libdeflate0\_1.10-2\_amd64.deb ...

Unpacking libdeflate0:amd64 (1.10-2) ...

Selecting previously unselected package libfontconfig1:amd64.

Preparing to unpack .../03-libfontconfig1\_2.13.1-4.2ubuntu5\_amd64.deb ...

Unpacking libfontconfig1:amd64 (2.13.1-4.2ubuntu5) ...

Selecting previously unselected package libjpeg-turbo8:amd64.

Preparing to unpack .../04-libjpeg-turbo8\_2.1.2-0ubuntu1\_amd64.deb ...

Unpacking libjpeg-turbo8:amd64 (2.1.2-0ubuntu1) ...

Selecting previously unselected package libjpeg8:amd64.

Preparing to unpack .../05-libjpeg8\_8c-2ubuntu10\_amd64.deb ...

Unpacking libjpeg8:amd64 (8c-2ubuntu10) ...

Selecting previously unselected package libjbig0:amd64.

Preparing to unpack .../06-libjbig0\_2.1-3.1ubuntu0.22.04.1\_amd64.deb ...

Unpacking libjbig0:amd64 (2.1-3.1ubuntu0.22.04.1) ...

Selecting previously unselected package libwebp7:amd64.

Preparing to unpack .../07-libwebp7\_1.2.2-2ubuntu0.22.04.2\_amd64.deb ...

Unpacking libwebp7:amd64 (1.2.2-2ubuntu0.22.04.2) ...

Selecting previously unselected package libtiff5:amd64.

Preparing to unpack .../08-libtiff5\_4.3.0-6ubuntu0.12\_amd64.deb ...

Unpacking libtiff5:amd64 (4.3.0-6ubuntu0.12) ...

Selecting previously unselected package libxpm4:amd64.

Preparing to unpack .../09-libxpm4\_1%3a3.5.12-1ubuntu0.22.04.2\_amd64.deb ...

Unpacking libxpm4:amd64 (1:3.5.12-1ubuntu0.22.04.2) ...

Selecting previously unselected package libgd3:amd64.

Preparing to unpack .../10-libgd3\_2.3.0-2ubuntu2.3\_amd64.deb ...

Unpacking libgd3:amd64 (2.3.0-2ubuntu2.3) ...

Selecting previously unselected package nginx-common.

Preparing to unpack .../11-nginx-common\_1.18.0-6ubuntu14.7\_all.deb ...

Unpacking nginx-common (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package libnginx-mod-http-geoip2.

Preparing to unpack .../12-libnginx-mod-http-geoip2\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking libnginx-mod-http-geoip2 (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package libnginx-mod-http-image-filter.

Preparing to unpack .../13-libnginx-mod-http-image-filter\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking libnginx-mod-http-image-filter (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package libnginx-mod-http-xslt-filter.

Preparing to unpack .../14-libnginx-mod-http-xslt-filter\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking libnginx-mod-http-xslt-filter (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package libnginx-mod-mail.

Preparing to unpack .../15-libnginx-mod-mail\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking libnginx-mod-mail (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package libnginx-mod-stream.

Preparing to unpack .../16-libnginx-mod-stream\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking libnginx-mod-stream (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package libnginx-mod-stream-geoip2.

Preparing to unpack .../17-libnginx-mod-stream-geoip2\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking libnginx-mod-stream-geoip2 (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package nginx-core.

Preparing to unpack .../18-nginx-core\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking nginx-core (1.18.0-6ubuntu14.7) ...

Selecting previously unselected package nginx.

Preparing to unpack .../19-nginx\_1.18.0-6ubuntu14.7\_amd64.deb ...

Unpacking nginx (1.18.0-6ubuntu14.7) ...

Setting up libxpm4:amd64 (1:3.5.12-1ubuntu0.22.04.2) ...

Setting up libdeflate0:amd64 (1.10-2) ...

Setting up nginx-common (1.18.0-6ubuntu14.7) ...

Created symlink /etc/systemd/system/multi-user.target.wants/nginx.service → /lib/systemd/system/nginx.service.

Setting up libjbig0:amd64 (2.1-3.1ubuntu0.22.04.1) ...

Setting up libnginx-mod-http-xslt-filter (1.18.0-6ubuntu14.7) ...

Setting up fonts-dejavu-core (2.37-2build1) ...

Setting up libjpeg-turbo8:amd64 (2.1.2-0ubuntu1) ...

Setting up libwebp7:amd64 (1.2.2-2ubuntu0.22.04.2) ...

Setting up libnginx-mod-http-geoip2 (1.18.0-6ubuntu14.7) ...

Setting up libjpeg8:amd64 (8c-2ubuntu10) ...

Setting up libnginx-mod-mail (1.18.0-6ubuntu14.7) ...

Setting up fontconfig-config (2.13.1-4.2ubuntu5) ...

Setting up libnginx-mod-stream (1.18.0-6ubuntu14.7) ...

Setting up libtiff5:amd64 (4.3.0-6ubuntu0.12) ...

Setting up libfontconfig1:amd64 (2.13.1-4.2ubuntu5) ...

Setting up libnginx-mod-stream-geoip2 (1.18.0-6ubuntu14.7) ...

Setting up libgd3:amd64 (2.3.0-2ubuntu2.3) ...

Setting up libnginx-mod-http-image-filter (1.18.0-6ubuntu14.7) ...

Setting up nginx-core (1.18.0-6ubuntu14.7) ...

&nbsp;\* Upgrading binary nginx                                                                                                                                                                                 \[ OK ]

Setting up nginx (1.18.0-6ubuntu14.7) ...

Processing triggers for ufw (0.36.1-4ubuntu0.1) ...

Processing triggers for man-db (2.10.2-1) ...

Processing triggers for libc-bin (2.35-0ubuntu3.11) ...

Scanning processes...

Scanning candidates...

Scanning linux images...



Restarting services...

Service restarts being deferred:

&nbsp;/etc/needrestart/restart.d/dbus.service

&nbsp;systemctl restart getty@tty1.service

&nbsp;systemctl restart networkd-dispatcher.service

&nbsp;systemctl restart systemd-logind.service

&nbsp;systemctl restart unattended-upgrades.service

&nbsp;systemctl restart user@1000.service



No containers need to be restarted.



No user sessions are running outdated binaries.



No VM guests are running outdated hypervisor (qemu) binaries on this host.

root@web-mail:/home/ubuntu# systemctl start nginx

root@web-mail:/home/ubuntu# systemctl enable nginx

Synchronizing state of nginx.service with SysV service script with /lib/systemd/systemd-sysv-install.

Executing: /lib/systemd/systemd-sysv-install enable nginx

root@web-mail:/home/ubuntu# systemctl status nginx

● nginx.service - A high performance web server and a reverse proxy server

&nbsp;    Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (running) since Thu 2025-12-04 08:29:11 UTC; 32s ago

&nbsp;      Docs: man:nginx(8)

&nbsp;  Main PID: 11633 (nginx)

&nbsp;     Tasks: 5 (limit: 9477)

&nbsp;    Memory: 4.9M

&nbsp;       CPU: 28ms

&nbsp;    CGroup: /system.slice/nginx.service

&nbsp;            ├─11633 "nginx: master process /usr/sbin/nginx -g daemon on; master\_process on;"

&nbsp;            ├─11635 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

&nbsp;            ├─11636 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

&nbsp;            ├─11637 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

&nbsp;            └─11638 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""



Dec 04 08:29:11 web-mail systemd\[1]: Starting A high performance web server and a reverse proxy server...

Dec 04 08:29:11 web-mail systemd\[1]: Started A high performance web server and a reverse proxy server.

root@web-mail:/home/ubuntu# sudo mkdir -p /var/www/gelani.com/html

root@web-mail:/home/ubuntu# sudo chown -R $USER:$USER /var/www/gelani.com/html

root@web-mail:/home/ubuntu# sudo chmod -R 755 /var/www/gelani.com

root@web-mail:/home/ubuntu# nano /var/www/gelani.com/html/index.html

root@web-mail:/home/ubuntu# sudo nano /etc/nginx/sites-available/gelani.com

root@web-mail:/home/ubuntu# sudo ln -s /etc/nginx/sites-available/gelani.com /etc/nginx/sites-enabled/

root@web-mail:/home/ubuntu# sudo rm /etc/nginx/sites-enabled/default

root@web-mail:/home/ubuntu# sudo nginx -t

nginx: the configuration file /etc/nginx/nginx.conf syntax is ok

nginx: configuration file /etc/nginx/nginx.conf test is successful

root@web-mail:/home/ubuntu# systemctl restart nginx

root@web-mail:/home/ubuntu# systemctl status nginx

● nginx.service - A high performance web server and a reverse proxy server

&nbsp;    Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (running) since Thu 2025-12-04 08:31:19 UTC; 8s ago

&nbsp;      Docs: man:nginx(8)

&nbsp;   Process: 11867 ExecStartPre=/usr/sbin/nginx -t -q -g daemon on; master\_process on; (code=exited, status=0/SUCCESS)

&nbsp;   Process: 11868 ExecStart=/usr/sbin/nginx -g daemon on; master\_process on; (code=exited, status=0/SUCCESS)

&nbsp;  Main PID: 11869 (nginx)

&nbsp;     Tasks: 5 (limit: 9477)

&nbsp;    Memory: 4.8M

&nbsp;       CPU: 23ms

&nbsp;    CGroup: /system.slice/nginx.service

&nbsp;            ├─11869 "nginx: master process /usr/sbin/nginx -g daemon on; master\_process on;"

&nbsp;            ├─11870 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

&nbsp;            ├─11871 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

&nbsp;            ├─11872 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

&nbsp;            └─11873 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""



Dec 04 08:31:19 web-mail systemd\[1]: Starting A high performance web server and a reverse proxy server...

Dec 04 08:31:19 web-mail systemd\[1]: Started A high performance web server and a reverse proxy server.

root@web-mail:/home/ubuntu# sudo ufw status

Status: inactive

root@web-mail:/home/ubuntu# curl http://gelani.com

<!DOCTYPE html>

<html>

<head>

&nbsp;   <title>Welcome to Gelani.com</title>

&nbsp;   <style>

&nbsp;       body {

&nbsp;           font-family: Arial, sans-serif;

&nbsp;           max-width: 800px;

&nbsp;           margin: 50px auto;

&nbsp;           padding: 20px;

&nbsp;           background: #f4f4f4;

&nbsp;       }

&nbsp;       .container {

&nbsp;           background: white;

&nbsp;           padding: 30px;

&nbsp;           border-radius: 10px;

&nbsp;           box-shadow: 0 0 10px rgba(0,0,0,0.1);

&nbsp;       }

&nbsp;       h1 { color: #333; }

&nbsp;       .info { color: #666; margin-top: 20px; }

&nbsp;   </style>

</head>

<body>

&nbsp;   <div class="container">

&nbsp;       <h1>🎉 Welcome to Gelani.com!</h1>

&nbsp;       <p>This is the web server for gelani.com domain.</p>

&nbsp;       <div class="info">

&nbsp;           <p><strong>Server IP:</strong> 192.168.20.15</p>

&nbsp;           <p><strong>DNS Server:</strong> 192.168.20.20</p>

&nbsp;           <p><strong>Status:</strong> Web Server is running successfully!</p>

&nbsp;       </div>

&nbsp;   </div>

</body>

</html>

root@web-mail:/home/ubuntu# curl http://www.gelani.com

<!DOCTYPE html>

<html>

<head>

&nbsp;   <title>Welcome to Gelani.com</title>

&nbsp;   <style>

&nbsp;       body {

&nbsp;           font-family: Arial, sans-serif;

&nbsp;           max-width: 800px;

&nbsp;           margin: 50px auto;

&nbsp;           padding: 20px;

&nbsp;           background: #f4f4f4;

&nbsp;       }

&nbsp;       .container {

&nbsp;           background: white;

&nbsp;           padding: 30px;

&nbsp;           border-radius: 10px;

&nbsp;           box-shadow: 0 0 10px rgba(0,0,0,0.1);

&nbsp;       }

&nbsp;       h1 { color: #333; }

&nbsp;       .info { color: #666; margin-top: 20px; }

&nbsp;   </style>

</head>

<body>

&nbsp;   <div class="container">

&nbsp;       <h1>🎉 Welcome to Gelani.com!</h1>

&nbsp;       <p>This is the web server for gelani.com domain.</p>

&nbsp;       <div class="info">

&nbsp;           <p><strong>Server IP:</strong> 192.168.20.15</p>

&nbsp;           <p><strong>DNS Server:</strong> 192.168.20.20</p>

&nbsp;           <p><strong>Status:</strong> Web Server is running successfully!</p>

&nbsp;       </div>

&nbsp;   </div>

</body>

</html>

root@web-mail:/home/ubuntu# curl http://192.168.20.15

<!DOCTYPE html>

<html>

<head>

&nbsp;   <title>Welcome to Gelani.com</title>

&nbsp;   <style>

&nbsp;       body {

&nbsp;           font-family: Arial, sans-serif;

&nbsp;           max-width: 800px;

&nbsp;           margin: 50px auto;

&nbsp;           padding: 20px;

&nbsp;           background: #f4f4f4;

&nbsp;       }

&nbsp;       .container {

&nbsp;           background: white;

&nbsp;           padding: 30px;

&nbsp;           border-radius: 10px;

&nbsp;           box-shadow: 0 0 10px rgba(0,0,0,0.1);

&nbsp;       }

&nbsp;       h1 { color: #333; }

&nbsp;       .info { color: #666; margin-top: 20px; }

&nbsp;   </style>

</head>

<body>

&nbsp;   <div class="container">

&nbsp;       <h1>🎉 Welcome to Gelani.com!</h1>

&nbsp;       <p>This is the web server for gelani.com domain.</p>

&nbsp;       <div class="info">

&nbsp;           <p><strong>Server IP:</strong> 192.168.20.15</p>

&nbsp;           <p><strong>DNS Server:</strong> 192.168.20.20</p>

&nbsp;           <p><strong>Status:</strong> Web Server is running successfully!</p>

&nbsp;       </div>

&nbsp;   </div>

</body>

</html>

root@web-mail:/home/ubuntu# curl http://192.168.20.15

<!DOCTYPE html>

<html>

<head>

&nbsp;   <title>Welcome to Gelani.com</title>

&nbsp;   <style>

&nbsp;       body {

&nbsp;           font-family: Arial, sans-serif;

&nbsp;           max-width: 800px;

&nbsp;           margin: 50px auto;

&nbsp;           padding: 20px;

&nbsp;           background: #f4f4f4;

&nbsp;       }

&nbsp;       .container {

&nbsp;           background: white;

&nbsp;           padding: 30px;

&nbsp;           border-radius: 10px;

&nbsp;           box-shadow: 0 0 10px rgba(0,0,0,0.1);

&nbsp;       }

&nbsp;       h1 { color: #333; }

&nbsp;       .info { color: #666; margin-top: 20px; }

&nbsp;   </style>

</head>

<body>

&nbsp;   <div class="container">

&nbsp;       <h1>🎉 Welcome to Gelani.com!</h1>

&nbsp;       <p>This is the web server for gelani.com domain.</p>

&nbsp;       <div class="info">

&nbsp;           <p><strong>Server IP:</strong> 192.168.20.15</p>

&nbsp;           <p><strong>DNS Server:</strong> 192.168.20.20</p>

&nbsp;           <p><strong>Status:</strong> Web Server is running successfully!</p>

&nbsp;       </div>

&nbsp;   </div>

</body>

</html>

root@web-mail:/home/ubuntu# curl -I http://gelani.com

HTTP/1.1 200 OK

Server: nginx/1.18.0 (Ubuntu)

Date: Thu, 04 Dec 2025 08:35:09 GMT

Content-Type: text/html

Content-Length: 956

Last-Modified: Thu, 04 Dec 2025 08:30:36 GMT

Connection: keep-alive

ETag: "693146ac-3bc"

Accept-Ranges: bytes



root@web-mail:/home/ubuntu# curl http://gelani.com

<!DOCTYPE html>

<html>

<head>

&nbsp;   <title>Welcome to Gelani.com</title>

&nbsp;   <style>

&nbsp;       body {

&nbsp;           font-family: Arial, sans-serif;

&nbsp;           max-width: 800px;

&nbsp;           margin: 50px auto;

&nbsp;           padding: 20px;

&nbsp;           background: #f4f4f4;

&nbsp;       }

&nbsp;       .container {

&nbsp;           background: white;

&nbsp;           padding: 30px;

&nbsp;           border-radius: 10px;

&nbsp;           box-shadow: 0 0 10px rgba(0,0,0,0.1);

&nbsp;       }

&nbsp;       h1 { color: #333; }

&nbsp;       .info { color: #666; margin-top: 20px; }

&nbsp;   </style>

</head>

<body>

&nbsp;   <div class="container">

&nbsp;       <h1>🎉 Welcome to Gelani.com!</h1>

&nbsp;       <p>This is the web server for gelani.com domain.</p>

&nbsp;       <div class="info">

&nbsp;           <p><strong>Server IP:</strong> 192.168.20.15</p>

&nbsp;           <p><strong>DNS Server:</strong> 192.168.20.20</p>

&nbsp;           <p><strong>Status:</strong> Web Server is running successfully!</p>

&nbsp;       </div>

&nbsp;   </div>

</body>

</html>

root@web-mail:/home/ubuntu# curl -I http://gelani.com

HTTP/1.1 200 OK

Server: nginx/1.18.0 (Ubuntu)

Date: Thu, 04 Dec 2025 08:35:29 GMT

Content-Type: text/html

Content-Length: 956

Last-Modified: Thu, 04 Dec 2025 08:30:36 GMT

Connection: keep-alive

ETag: "693146ac-3bc"

Accept-Ranges: bytes



root@web-mail:/home/ubuntu#

------------------------------------------------------------------------------------------------------------------------------------------------------

# \#Mail server instillation

## \#Install Postfix (SMTP/MTA)

root@web-mail:/home/ubuntu# sudo apt install postfix -y

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

The following additional packages will be installed:

&nbsp; ssl-cert

Suggested packages:

&nbsp; procmail postfix-mysql postfix-pgsql postfix-ldap postfix-pcre postfix-lmdb postfix-sqlite sasl2-bin | dovecot-common resolvconf postfix-cdb mail-reader postfix-mta-sts-resolver postfix-doc

The following NEW packages will be installed:

&nbsp; postfix ssl-cert

0 upgraded, 2 newly installed, 0 to remove and 8 not upgraded.

Need to get 1265 kB of archives.

After this operation, 4248 kB of additional disk space will be used.

Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 ssl-cert all 1.1.2 \[17.4 kB]

Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 postfix amd64 3.6.4-1ubuntu1.3 \[1248 kB]

Fetched 1265 kB in 4s (328 kB/s)

Preconfiguring packages ...

Selecting previously unselected package ssl-cert.

(Reading database ... 94436 files and directories currently installed.)

Preparing to unpack .../ssl-cert\_1.1.2\_all.deb ...

Unpacking ssl-cert (1.1.2) ...

Selecting previously unselected package postfix.

Preparing to unpack .../postfix\_3.6.4-1ubuntu1.3\_amd64.deb ...

Unpacking postfix (3.6.4-1ubuntu1.3) ...

Setting up ssl-cert (1.1.2) ...

Setting up postfix (3.6.4-1ubuntu1.3) ...

Adding group `postfix' (GID 122) ...

Done.

Adding system user `postfix' (UID 113) ...

Adding new user `postfix' (UID 113) with group `postfix' ...

Not creating home directory `/var/spool/postfix'.

Creating /etc/postfix/dynamicmaps.cf

Adding group `postdrop' (GID 123) ...

Done.

setting myhostname: web-mail

setting alias maps

setting alias database

changing /etc/mailname to gelani.com

setting myorigin

setting destinations: $myhostname, gelani.com, web-mail, localhost.localdomain, localhost

setting relayhost:

setting mynetworks: 127.0.0.0/8 \[::ffff:127.0.0.0]/104 \[::1]/128

setting mailbox\_size\_limit: 0

setting recipient\_delimiter: +

setting inet\_interfaces: all

setting inet\_protocols: all

/etc/aliases does not exist, creating it.

WARNING: /etc/aliases exists, but does not have a root alias.



Postfix (main.cf) is now set up with a default configuration.  If you need to

make changes, edit /etc/postfix/main.cf (and others) as needed.  To view

Postfix configuration values, see postconf(1).



After modifying main.cf, be sure to run 'systemctl reload postfix'.



Running newaliases

Created symlink /etc/systemd/system/multi-user.target.wants/postfix.service → /lib/systemd/system/postfix.service.

Processing triggers for ufw (0.36.1-4ubuntu0.1) ...

Processing triggers for man-db (2.10.2-1) ...

Processing triggers for rsyslog (8.2112.0-2ubuntu2.2) ...

Scanning processes...

Scanning candidates...

Scanning linux images...



Restarting services...

Service restarts being deferred:

&nbsp;/etc/needrestart/restart.d/dbus.service

&nbsp;systemctl restart getty@tty1.service

&nbsp;systemctl restart networkd-dispatcher.service

&nbsp;systemctl restart systemd-logind.service

&nbsp;systemctl restart unattended-upgrades.service

&nbsp;systemctl restart user@1000.service



No containers need to be restarted.



No user sessions are running outdated binaries.



No VM guests are running outdated hypervisor (qemu) binaries on this host.

root@web-mail:/home/ubuntu# #configure postfix

root@web-mail:/home/ubuntu# cp /etc/postfix/main.cf /etc/postfix/main/cd.backup

cp: cannot create regular file '/etc/postfix/main/cd.backup': No such file or directory

root@web-mail:/home/ubuntu# cd /etc/postfix

root@web-mail:/etc/postfix# ls

dynamicmaps.cf  dynamicmaps.cf.d  main.cf  main.cf.proto  makedefs.out  master.cf  master.cf.proto  post-install  postfix-files  postfix-files.d  postfix-script  sasl

root@web-mail:/etc/postfix# cp main.cf main.cf.backup

root@web-mail:/etc/postfix# ls

dynamicmaps.cf  dynamicmaps.cf.d  main.cf  main.cf.backup  main.cf.proto  makedefs.out  master.cf  master.cf.proto  post-install  postfix-files  postfix-files.d  postfix-script  sasl

root@web-mail:/etc/postfix# nano main.cf

root@web-mail:/etc/postfix# curl http://gelani.com

<!DOCTYPE html>

<html>

<head>

&nbsp;   <title>Welcome to Gelani.com</title>

&nbsp;   <style>

&nbsp;       body {

&nbsp;           font-family: Arial, sans-serif;

&nbsp;           max-width: 800px;

&nbsp;           margin: 50px auto;

&nbsp;           padding: 20px;

&nbsp;           background: #f4f4f4;

&nbsp;       }

&nbsp;       .container {

&nbsp;           background: white;

&nbsp;           padding: 30px;

&nbsp;           border-radius: 10px;

&nbsp;           box-shadow: 0 0 10px rgba(0,0,0,0.1);

&nbsp;       }

&nbsp;       h1 { color: #333; }

&nbsp;       .info { color: #666; margin-top: 20px; }

&nbsp;   </style>

</head>

<body>

&nbsp;   <div class="container">

&nbsp;       <h1>🎉 Welcome to Gelani.com!</h1>

&nbsp;       <p>This is the web server for gelani.com domain.</p>

&nbsp;       <div class="info">

&nbsp;           <p><strong>Server IP:</strong> 192.168.20.15</p>

&nbsp;           <p><strong>DNS Server:</strong> 192.168.20.20</p>

&nbsp;           <p><strong>Status:</strong> Web Server is running successfully!</p>

&nbsp;       </div>

&nbsp;   </div>

</body>

</html>

root@web-mail:/etc/postfix# ls

dynamicmaps.cf  dynamicmaps.cf.d  main.cf  main.cf.backup  main.cf.proto  makedefs.out  master.cf  master.cf.proto  post-install  postfix-files  postfix-files.d  postfix-script  sasl

root@web-mail:/etc/postfix# nano main.cf

root@web-mail:/etc/postfix# sudo postfix check

postfix: Postfix is running with backwards-compatible default settings

postfix: See http://www.postfix.org/COMPATIBILITY\_README.html for details

postfix: To disable backwards compatibility use "postconf compatibility\_level=3.6" and "postfix reload"

root@web-mail:/etc/postfix# sudo systemctl restart postfix

root@web-mail:/etc/postfix# sudo systemctl status postfix

● postfix.service - Postfix Mail Transport Agent

&nbsp;    Loaded: loaded (/lib/systemd/system/postfix.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (exited) since Thu 2025-12-04 09:52:38 UTC; 3s ago

&nbsp;      Docs: man:postfix(1)

&nbsp;   Process: 13990 ExecStart=/bin/true (code=exited, status=0/SUCCESS)

&nbsp;  Main PID: 13990 (code=exited, status=0/SUCCESS)

&nbsp;       CPU: 1ms



Dec 04 09:52:38 web-mail systemd\[1]: Starting Postfix Mail Transport Agent...

Dec 04 09:52:38 web-mail systemd\[1]: Finished Postfix Mail Transport Agent.

root@web-mail:/etc/postfix# sudo systemctl enable postfix

Synchronizing state of postfix.service with SysV service script with /lib/systemd/systemd-sysv-install.

Executing: /lib/systemd/systemd-sysv-install enable postfix

root@web-mail:/etc/postfix#

## -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Install and Configure Dovecot (IMAP/POP3)

root@web-mail:/etc/postfix# # Install Dovecot packages

sudo apt install dovecot-core dovecot-imapd dovecot-pop3d -y

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

The following additional packages will be installed:

&nbsp; libexttextcat-2.0-0 libexttextcat-data liblua5.3-0

Suggested packages:

&nbsp; dovecot-gssapi dovecot-ldap dovecot-lmtpd dovecot-lucene dovecot-managesieved dovecot-mysql

&nbsp; dovecot-pgsql dovecot-sieve dovecot-solr dovecot-sqlite dovecot-submissiond ntp

The following NEW packages will be installed:

&nbsp; dovecot-core dovecot-imapd dovecot-pop3d libexttextcat-2.0-0 libexttextcat-data liblua5.3-0

0 upgraded, 6 newly installed, 0 to remove and 8 not upgraded.

Need to get 3882 kB of archives.

After this operation, 12.5 MB of additional disk space will be used.

Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libexttextcat-data all 3.4.5-1build2 \[179 kB]

Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libexttextcat-2.0-0 amd64 3.4.5-1build2 \[13.7 kB]

Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 liblua5.3-0 amd64 5.3.6-1build1 \[140 kB]

Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dovecot-core amd64 1:2.3.16+dfsg1-3ubuntu2.6 \[3319 kB]

Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dovecot-imapd amd64 1:2.3.16+dfsg1-3ubuntu2.6 \[193 kB]

Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dovecot-pop3d amd64 1:2.3.16+dfsg1-3ubuntu2.6 \[37.8 kB]

Fetched 3882 kB in 3s (1217 kB/s)

Selecting previously unselected package libexttextcat-data.

(Reading database ... 94647 files and directories currently installed.)

Preparing to unpack .../0-libexttextcat-data\_3.4.5-1build2\_all.deb ...

Unpacking libexttextcat-data (3.4.5-1build2) ...

Selecting previously unselected package libexttextcat-2.0-0:amd64.

Preparing to unpack .../1-libexttextcat-2.0-0\_3.4.5-1build2\_amd64.deb ...

Unpacking libexttextcat-2.0-0:amd64 (3.4.5-1build2) ...

Selecting previously unselected package liblua5.3-0:amd64.

Preparing to unpack .../2-liblua5.3-0\_5.3.6-1build1\_amd64.deb ...

Unpacking liblua5.3-0:amd64 (5.3.6-1build1) ...

Selecting previously unselected package dovecot-core.

Preparing to unpack .../3-dovecot-core\_1%3a2.3.16+dfsg1-3ubuntu2.6\_amd64.deb ...

Unpacking dovecot-core (1:2.3.16+dfsg1-3ubuntu2.6) ...

Selecting previously unselected package dovecot-imapd.

Preparing to unpack .../4-dovecot-imapd\_1%3a2.3.16+dfsg1-3ubuntu2.6\_amd64.deb ...

Unpacking dovecot-imapd (1:2.3.16+dfsg1-3ubuntu2.6) ...

Selecting previously unselected package dovecot-pop3d.

Preparing to unpack .../5-dovecot-pop3d\_1%3a2.3.16+dfsg1-3ubuntu2.6\_amd64.deb ...

Unpacking dovecot-pop3d (1:2.3.16+dfsg1-3ubuntu2.6) ...

Setting up libexttextcat-data (3.4.5-1build2) ...

Setting up liblua5.3-0:amd64 (5.3.6-1build1) ...

Setting up libexttextcat-2.0-0:amd64 (3.4.5-1build2) ...

Setting up dovecot-core (1:2.3.16+dfsg1-3ubuntu2.6) ...



Creating config file /etc/dovecot/dovecot.conf with new version



Creating config file /etc/dovecot/dovecot-dict-auth.conf.ext with new version



Creating config file /etc/dovecot/dovecot-dict-sql.conf.ext with new version



Creating config file /etc/dovecot/dovecot-sql.conf.ext with new version



Creating config file /etc/dovecot/conf.d/10-auth.conf with new version



Creating config file /etc/dovecot/conf.d/10-director.conf with new version



Creating config file /etc/dovecot/conf.d/10-logging.conf with new version



Creating config file /etc/dovecot/conf.d/10-mail.conf with new version



Creating config file /etc/dovecot/conf.d/10-master.conf with new version



Creating config file /etc/dovecot/conf.d/10-ssl.conf with new version



Creating config file /etc/dovecot/conf.d/10-tcpwrapper.conf with new version



Creating config file /etc/dovecot/conf.d/15-lda.conf with new version



Creating config file /etc/dovecot/conf.d/15-mailboxes.conf with new version



Creating config file /etc/dovecot/conf.d/90-acl.conf with new version



Creating config file /etc/dovecot/conf.d/90-plugin.conf with new version



Creating config file /etc/dovecot/conf.d/90-quota.conf with new version



Creating config file /etc/dovecot/conf.d/auth-checkpassword.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-deny.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-dict.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-master.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-passwdfile.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-sql.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-static.conf.ext with new version



Creating config file /etc/dovecot/conf.d/auth-system.conf.ext with new version

Created symlink /etc/systemd/system/multi-user.target.wants/dovecot.service → /lib/systemd/system/dovecot.service.

dovecot.socket is a disabled or a static unit, not starting it.

Setting up dovecot-imapd (1:2.3.16+dfsg1-3ubuntu2.6) ...



Creating config file /etc/dovecot/conf.d/20-imap.conf with new version

Setting up dovecot-pop3d (1:2.3.16+dfsg1-3ubuntu2.6) ...



Creating config file /etc/dovecot/conf.d/20-pop3.conf with new version

Processing triggers for ufw (0.36.1-4ubuntu0.1) ...

Processing triggers for man-db (2.10.2-1) ...

Processing triggers for libc-bin (2.35-0ubuntu3.11) ...

Processing triggers for dovecot-core (1:2.3.16+dfsg1-3ubuntu2.6) ...

Scanning processes...

Scanning candidates...

Scanning linux images...



Restarting services...

Service restarts being deferred:

&nbsp;/etc/needrestart/restart.d/dbus.service

&nbsp;systemctl restart getty@tty1.service

&nbsp;systemctl restart networkd-dispatcher.service

&nbsp;systemctl restart systemd-logind.service

&nbsp;systemctl restart unattended-upgrades.service

&nbsp;systemctl restart user@1000.service



No containers need to be restarted.



No user sessions are running outdated binaries.



No VM guests are running outdated hypervisor (qemu) binaries on this host.

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/dovecot.conf

\## Dovecot configuration file



\# If you're in a hurry, see http://wiki2.dovecot.org/QuickConfiguration



\# "doveconf -n" command gives a clean output of the changed settings. Use it

\# instead of copy\&pasting files when posting to the Dovecot mailing list.



\# '#' character and everything after it is treated as comments. Extra spaces

\# and tabs are ignored. If you want to use either of these explicitly, put the

\# value inside quotes, eg.: key = "# char and trailing whitespace  "



\# Most (but not all) settings can be overridden by different protocols and/or

\# source/destination IPs by placing the settings inside sections, for example:

\# protocol imap { }, local 127.0.0.1 { }, remote 10.0.0.0/8 { }



\# Default values are shown for each setting, it's not required to uncomment

\# those. These are exceptions to this though: No sections (e.g. namespace {})

\# or plugin settings are added by default, they're listed only as examples.

\# Paths are also just examples with the real defaults being based on configure

\# options. The paths listed here are for configure --prefix=/usr

\# --sysconfdir=/etc --localstatedir=/var



\# Enable installed protocols

!include\_try /usr/share/dovecot/protocols.d/\*.protocol



\# A comma separated list of IPs or hosts where to listen in for connections.

\# "\*" listens in all IPv4 interfaces, "::" listens in all IPv6 interfaces.

\# If you want to specify non-default ports or anything more complex,

\# edit conf.d/master.conf.

\#listen = \*, ::



\# Base directory where to store runtime data.

\#base\_dir = /var/run/dovecot/



\# Name of this instance. In multi-instance setup doveadm and other commands

\# can use -i <instance\_name> to select which instance is used (an alternative

\# to -c <config\_path>). The instance name is also added to Dovecot processes

\# in ps output.

\#instance\_name = dovecot



\# Greeting message for clients.

\#login\_greeting = Dovecot ready.



\# Space separated list of trusted network ranges. Connections from these

\# IPs are allowed to override their IP addresses and ports (for logging and

\# for authentication checks). disable\_plaintext\_auth is also ignored for

\# these networks. Typically you'd specify your IMAP proxy servers here.

\#login\_trusted\_networks =



\# Space separated list of login access check sockets (e.g. tcpwrap)

\#login\_access\_sockets =



\# With proxy\_maybe=yes if proxy destination matches any of these IPs, don't do

\# proxying. This isn't necessary normally, but may be useful if the destination

\# IP is e.g. a load balancer's IP.

\#auth\_proxy\_self =



\# Show more verbose process titles (in ps). Currently shows user name and

\# IP address. Useful for seeing who are actually using the IMAP processes

\# (eg. shared mailboxes or if same uid is used for multiple accounts).

\#verbose\_proctitle = no



\# Should all processes be killed when Dovecot master process shuts down.

\# Setting this to "no" means that Dovecot can be upgraded without

\# forcing existing client connections to close (although that could also be

\# a problem if the upgrade is e.g. because of a security fix).

\#shutdown\_clients = yes



\# If non-zero, run mail commands via this many connections to doveadm server,

\# instead of running them directly in the same process.

\#doveadm\_worker\_count = 0

\# UNIX socket or host:port used for connecting to doveadm server

\#doveadm\_socket\_path = doveadm-server



\# Space separated list of environment variables that are preserved on Dovecot

\# startup and passed down to all of its child processes. You can also give

\# key=value pairs to always set specific settings.

\#import\_environment = TZ



\##

\## Dictionary server settings

\##



\# Dictionary can be used to store key=value lists. This is used by several

\# plugins. The dictionary can be accessed either directly or though a

\# dictionary server. The following dict block maps dictionary names to URIs

\# when the server is used. These can then be referenced using URIs in format

\# "proxy::<name>".



dict {

&nbsp; #quota = mysql:/etc/dovecot/dovecot-dict-sql.conf.ext

}



\# Most of the actual configuration gets included below. The filenames are

\# first sorted by their ASCII value and parsed in that order. The 00-prefixes

\# in filenames are intended to make it easier to understand the ordering.

!include conf.d/\*.conf



\# A config file can also tried to be included without giving an error if

\# it's not found:

!include\_try local.conf

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/dovecot.conf

\## Dovecot configuration file



\# If you're in a hurry, see http://wiki2.dovecot.org/QuickConfiguration



\# "doveconf -n" command gives a clean output of the changed settings. Use it

\# instead of copy\&pasting files when posting to the Dovecot mailing list.



\# '#' character and everything after it is treated as comments. Extra spaces

\# and tabs are ignored. If you want to use either of these explicitly, put the

\# value inside quotes, eg.: key = "# char and trailing whitespace  "



\# Most (but not all) settings can be overridden by different protocols and/or

\# source/destination IPs by placing the settings inside sections, for example:

\# protocol imap { }, local 127.0.0.1 { }, remote 10.0.0.0/8 { }



\# Default values are shown for each setting, it's not required to uncomment

\# those. These are exceptions to this though: No sections (e.g. namespace {})

\# or plugin settings are added by default, they're listed only as examples.

\# Paths are also just examples with the real defaults being based on configure

\# options. The paths listed here are for configure --prefix=/usr

\# --sysconfdir=/etc --localstatedir=/var



\# Enable installed protocols

!include\_try /usr/share/dovecot/protocols.d/\*.protocol



\# A comma separated list of IPs or hosts where to listen in for connections.

\# "\*" listens in all IPv4 interfaces, "::" listens in all IPv6 interfaces.

\# If you want to specify non-default ports or anything more complex,

\# edit conf.d/master.conf.

listen = \*, ::



\# Base directory where to store runtime data.

\#base\_dir = /var/run/dovecot/



\# Name of this instance. In multi-instance setup doveadm and other commands

\# can use -i <instance\_name> to select which instance is used (an alternative

\# to -c <config\_path>). The instance name is also added to Dovecot processes

\# in ps output.

\#instance\_name = dovecot



\# Greeting message for clients.

\#login\_greeting = Dovecot ready.



\# Space separated list of trusted network ranges. Connections from these

\# IPs are allowed to override their IP addresses and ports (for logging and

\# for authentication checks). disable\_plaintext\_auth is also ignored for

\# these networks. Typically you'd specify your IMAP proxy servers here.

\#login\_trusted\_networks =



\# Space separated list of login access check sockets (e.g. tcpwrap)

\#login\_access\_sockets =



\# With proxy\_maybe=yes if proxy destination matches any of these IPs, don't do

\# proxying. This isn't necessary normally, but may be useful if the destination

\# IP is e.g. a load balancer's IP.

\#auth\_proxy\_self =



\# Show more verbose process titles (in ps). Currently shows user name and

\# IP address. Useful for seeing who are actually using the IMAP processes

\# (eg. shared mailboxes or if same uid is used for multiple accounts).

\#verbose\_proctitle = no



\# Should all processes be killed when Dovecot master process shuts down.

\# Setting this to "no" means that Dovecot can be upgraded without

\# forcing existing client connections to close (although that could also be

\# a problem if the upgrade is e.g. because of a security fix).

\#shutdown\_clients = yes



\# If non-zero, run mail commands via this many connections to doveadm server,

\# instead of running them directly in the same process.

\#doveadm\_worker\_count = 0

\# UNIX socket or host:port used for connecting to doveadm server

\#doveadm\_socket\_path = doveadm-server



\# Space separated list of environment variables that are preserved on Dovecot

\# startup and passed down to all of its child processes. You can also give

\# key=value pairs to always set specific settings.

\#import\_environment = TZ



\##

\## Dictionary server settings

\##



\# Dictionary can be used to store key=value lists. This is used by several

\# plugins. The dictionary can be accessed either directly or though a

\# dictionary server. The following dict block maps dictionary names to URIs

\# when the server is used. These can then be referenced using URIs in format

\# "proxy::<name>".



dict {

&nbsp; #quota = mysql:/etc/dovecot/dovecot-dict-sql.conf.ext

}



\# Most of the actual configuration gets included below. The filenames are

\# first sorted by their ASCII value and parsed in that order. The 00-prefixes

\# in filenames are intended to make it easier to understand the ordering.

!include conf.d/\*.conf



\# A config file can also tried to be included without giving an error if

\# it's not found:

!include\_try local.conf

root@web-mail:/etc/postfix# doveconf -n | grep protocols

protocols = " imap pop3"

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# vi /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/dovecot.conf

\## Dovecot configuration file



\# If you're in a hurry, see http://wiki2.dovecot.org/QuickConfiguration



\# "doveconf -n" command gives a clean output of the changed settings. Use it

\# instead of copy\&pasting files when posting to the Dovecot mailing list.



\# '#' character and everything after it is treated as comments. Extra spaces

\# and tabs are ignored. If you want to use either of these explicitly, put the

\# value inside quotes, eg.: key = "# char and trailing whitespace  "



\# Most (but not all) settings can be overridden by different protocols and/or

\# source/destination IPs by placing the settings inside sections, for example:

\# protocol imap { }, local 127.0.0.1 { }, remote 10.0.0.0/8 { }



\# Default values are shown for each setting, it's not required to uncomment

\# those. These are exceptions to this though: No sections (e.g. namespace {})

\# or plugin settings are added by default, they're listed only as examples.

\# Paths are also just examples with the real defaults being based on configure

\# options. The paths listed here are for configure --prefix=/usr

\# --sysconfdir=/etc --localstatedir=/var



\# Enable installed protocols

!include\_try /usr/share/dovecot/protocols.d/\*.protocol



\# A comma separated list of IPs or hosts where to listen in for connections.

\# "\*" listens in all IPv4 interfaces, "::" listens in all IPv6 interfaces.

\# If you want to specify non-default ports or anything more complex,

\# edit conf.d/master.conf.

listen = \*, ::



\# Base directory where to store runtime data.

\#base\_dir = /var/run/dovecot/



\# Name of this instance. In multi-instance setup doveadm and other commands

\# can use -i <instance\_name> to select which instance is used (an alternative

\# to -c <config\_path>). The instance name is also added to Dovecot processes

\# in ps output.

\#instance\_name = dovecot



\# Greeting message for clients.

\#login\_greeting = Dovecot ready.



\# Space separated list of trusted network ranges. Connections from these

\# IPs are allowed to override their IP addresses and ports (for logging and

\# for authentication checks). disable\_plaintext\_auth is also ignored for

\# these networks. Typically you'd specify your IMAP proxy servers here.

\#login\_trusted\_networks =



\# Space separated list of login access check sockets (e.g. tcpwrap)

\#login\_access\_sockets =



\# With proxy\_maybe=yes if proxy destination matches any of these IPs, don't do

\# proxying. This isn't necessary normally, but may be useful if the destination

\# IP is e.g. a load balancer's IP.

\#auth\_proxy\_self =



\# Show more verbose process titles (in ps). Currently shows user name and

\# IP address. Useful for seeing who are actually using the IMAP processes

\# (eg. shared mailboxes or if same uid is used for multiple accounts).

\#verbose\_proctitle = no



\# Should all processes be killed when Dovecot master process shuts down.

\# Setting this to "no" means that Dovecot can be upgraded without

\# forcing existing client connections to close (although that could also be

\# a problem if the upgrade is e.g. because of a security fix).

\#shutdown\_clients = yes



\# If non-zero, run mail commands via this many connections to doveadm server,

\# instead of running them directly in the same process.

\#doveadm\_worker\_count = 0

\# UNIX socket or host:port used for connecting to doveadm server

\#doveadm\_socket\_path = doveadm-server



\# Space separated list of environment variables that are preserved on Dovecot

\# startup and passed down to all of its child processes. You can also give

\# key=value pairs to always set specific settings.

\#import\_environment = TZ



\##

\## Dictionary server settings

\##



\# Dictionary can be used to store key=value lists. This is used by several

\# plugins. The dictionary can be accessed either directly or though a

\# dictionary server. The following dict block maps dictionary names to URIs

\# when the server is used. These can then be referenced using URIs in format

\# "proxy::<name>".



dict {

&nbsp; #quota = mysql:/etc/dovecot/dovecot-dict-sql.conf.ext

}



\# Most of the actual configuration gets included below. The filenames are

\# first sorted by their ASCII value and parsed in that order. The 00-prefixes

\# in filenames are intended to make it easier to understand the ordering.

!include conf.d/\*.conf



\# A config file can also tried to be included without giving an error if

\# it's not found:

!include\_try local.conf

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# nano /etc/dovecot/dovecot.conf

root@web-mail:/etc/postfix# systemctl restart dovecot

Job for dovecot.service failed because the control process exited with error code.

See "systemctl status dovecot.service" and "journalctl -xeu dovecot.service" for details.

root@web-mail:/etc/postfix# doveconf -n | grep protocols

protocols = imap pop3 lmtp

root@web-mail:/etc/postfix# cat /etc/dovecot/dovecot.conf

\## Dovecot configuration file



\# If you're in a hurry, see http://wiki2.dovecot.org/QuickConfiguration



\# "doveconf -n" command gives a clean output of the changed settings. Use it

\# instead of copy\&pasting files when posting to the Dovecot mailing list.



\# '#' character and everything after it is treated as comments. Extra spaces

\# and tabs are ignored. If you want to use either of these explicitly, put the

\# value inside quotes, eg.: key = "# char and trailing whitespace  "



\# Most (but not all) settings can be overridden by different protocols and/or

\# source/destination IPs by placing the settings inside sections, for example:

\# protocol imap { }, local 127.0.0.1 { }, remote 10.0.0.0/8 { }



\# Default values are shown for each setting, it's not required to uncomment

\# those. These are exceptions to this though: No sections (e.g. namespace {})

\# or plugin settings are added by default, they're listed only as examples.

\# Paths are also just examples with the real defaults being based on configure

\# options. The paths listed here are for configure --prefix=/usr

\# --sysconfdir=/etc --localstatedir=/var



\# Enable installed protocols

!include\_try /usr/share/dovecot/protocols.d/\*.protocol



\# A comma separated list of IPs or hosts where to listen in for connections.

\# "\*" listens in all IPv4 interfaces, "::" listens in all IPv6 interfaces.

protocols = imap pop3 lmtp

\# If you want to specify non-default ports or anything more complex,

\# edit conf.d/master.conf.

listen = \*, ::



\# Base directory where to store runtime data.

\#base\_dir = /var/run/dovecot/



\# Name of this instance. In multi-instance setup doveadm and other commands

\# can use -i <instance\_name> to select which instance is used (an alternative

\# to -c <config\_path>). The instance name is also added to Dovecot processes

\# in ps output.

\#instance\_name = dovecot



\# Greeting message for clients.

\#login\_greeting = Dovecot ready.



\# Space separated list of trusted network ranges. Connections from these

\# IPs are allowed to override their IP addresses and ports (for logging and

\# for authentication checks). disable\_plaintext\_auth is also ignored for

\# these networks. Typically you'd specify your IMAP proxy servers here.

\#login\_trusted\_networks =



\# Space separated list of login access check sockets (e.g. tcpwrap)

\#login\_access\_sockets =



\# With proxy\_maybe=yes if proxy destination matches any of these IPs, don't do

\# proxying. This isn't necessary normally, but may be useful if the destination

\# IP is e.g. a load balancer's IP.

\#auth\_proxy\_self =



\# Show more verbose process titles (in ps). Currently shows user name and

\# IP address. Useful for seeing who are actually using the IMAP processes

\# (eg. shared mailboxes or if same uid is used for multiple accounts).

\#verbose\_proctitle = no



\# Should all processes be killed when Dovecot master process shuts down.

\# Setting this to "no" means that Dovecot can be upgraded without

\# forcing existing client connections to close (although that could also be

\# a problem if the upgrade is e.g. because of a security fix).

\#shutdown\_clients = yes



\# If non-zero, run mail commands via this many connections to doveadm server,

\# instead of running them directly in the same process.

\#doveadm\_worker\_count = 0

\# UNIX socket or host:port used for connecting to doveadm server

\#doveadm\_socket\_path = doveadm-server



\# Space separated list of environment variables that are preserved on Dovecot

\# startup and passed down to all of its child processes. You can also give

\# key=value pairs to always set specific settings.

\#import\_environment = TZ



\##

\## Dictionary server settings

\##



\# Dictionary can be used to store key=value lists. This is used by several

\# plugins. The dictionary can be accessed either directly or though a

\# dictionary server. The following dict block maps dictionary names to URIs

\# when the server is used. These can then be referenced using URIs in format

\# "proxy::<name>".



dict {

&nbsp; #quota = mysql:/etc/dovecot/dovecot-dict-sql.conf.ext

}



\# Most of the actual configuration gets included below. The filenames are

\# first sorted by their ASCII value and parsed in that order. The 00-prefixes

\# in filenames are intended to make it easier to understand the ordering.

!include conf.d/\*.conf



\# A config file can also tried to be included without giving an error if

\# it's not found:

!include\_try local.conf

root@web-mail:/etc/postfix# nano /etc/dovecot/conf.d/10-mail.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/conf.d/10-mail.conf

\##

\## Mailbox locations and namespaces

\##



\# Location for users' mailboxes. The default is empty, which means that Dovecot

\# tries to find the mailboxes automatically. This won't work if the user

\# doesn't yet have any mail, so you should explicitly tell Dovecot the full

\# location.

\#

\# If you're using mbox, giving a path to the INBOX file (eg. /var/mail/%u)

\# isn't enough. You'll also need to tell Dovecot where the other mailboxes are

\# kept. This is called the "root mail directory", and it must be the first

\# path given in the mail\_location setting.

\#

\# There are a few special variables you can use, eg.:

\#

\#   %u - username

\#   %n - user part in user@domain, same as %u if there's no domain

\#   %d - domain part in user@domain, empty if there's no domain

\#   %h - home directory

\#

\# See doc/wiki/Variables.txt for full list. Some examples:

\#

\#   mail\_location = maildir:~/Maildir

\#   mail\_location = mbox:~/mail:INBOX=/var/mail/%u

\#   mail\_location = mbox:/var/mail/%d/%1n/%n:INDEX=/var/indexes/%d/%1n/%n

\#

\# <doc/wiki/MailLocation.txt>

\#

mail\_location = mbox:~/mail:INBOX=/var/mail/%u



\# If you need to set multiple mailbox locations or want to change default

\# namespace settings, you can do it by defining namespace sections.

\#

\# You can have private, shared and public namespaces. Private namespaces

\# are for user's personal mails. Shared namespaces are for accessing other

\# users' mailboxes that have been shared. Public namespaces are for shared

\# mailboxes that are managed by sysadmin. If you create any shared or public

\# namespaces you'll typically want to enable ACL plugin also, otherwise all

\# users can access all the shared mailboxes, assuming they have permissions

\# on filesystem level to do so.

namespace inbox {

&nbsp; # Namespace type: private, shared or public

&nbsp; #type = private



&nbsp; # Hierarchy separator to use. You should use the same separator for all

&nbsp; # namespaces or some clients get confused. '/' is usually a good one.

&nbsp; # The default however depends on the underlying mail storage format.

&nbsp; #separator =



&nbsp; # Prefix required to access this namespace. This needs to be different for

&nbsp; # all namespaces. For example "Public/".

&nbsp; #prefix =



&nbsp; # Physical location of the mailbox. This is in same format as

&nbsp; # mail\_location, which is also the default for it.

&nbsp; #location =



&nbsp; # There can be only one INBOX, and this setting defines which namespace

&nbsp; # has it.

&nbsp; inbox = yes



&nbsp; # If namespace is hidden, it's not advertised to clients via NAMESPACE

&nbsp; # extension. You'll most likely also want to set list=no. This is mostly

&nbsp; # useful when converting from another server with different namespaces which

&nbsp; # you want to deprecate but still keep working. For example you can create

&nbsp; # hidden namespaces with prefixes "~/mail/", "~%u/mail/" and "mail/".

&nbsp; #hidden = no



&nbsp; # Show the mailboxes under this namespace with LIST command. This makes the

&nbsp; # namespace visible for clients that don't support NAMESPACE extension.

&nbsp; # "children" value lists child mailboxes, but hides the namespace prefix.

&nbsp; #list = yes



&nbsp; # Namespace handles its own subscriptions. If set to "no", the parent

&nbsp; # namespace handles them (empty prefix should always have this as "yes")

&nbsp; #subscriptions = yes



&nbsp; # See 15-mailboxes.conf for definitions of special mailboxes.

}



\# Example shared namespace configuration

\#namespace {

&nbsp; #type = shared

&nbsp; #separator = /



&nbsp; # Mailboxes are visible under "shared/user@domain/"

&nbsp; # %%n, %%d and %%u are expanded to the destination user.

&nbsp; #prefix = shared/%%u/



&nbsp; # Mail location for other users' mailboxes. Note that %variables and ~/

&nbsp; # expands to the logged in user's data. %%n, %%d, %%u and %%h expand to the

&nbsp; # destination user's data.

&nbsp; #location = maildir:%%h/Maildir:INDEX=~/Maildir/shared/%%u



&nbsp; # Use the default namespace for saving subscriptions.

&nbsp; #subscriptions = no



&nbsp; # List the shared/ namespace only if there are visible shared mailboxes.

&nbsp; #list = children

\#}

\# Should shared INBOX be visible as "shared/user" or "shared/user/INBOX"?

\#mail\_shared\_explicit\_inbox = no



\# System user and group used to access mails. If you use multiple, userdb

\# can override these by returning uid or gid fields. You can use either numbers

\# or names. <doc/wiki/UserIds.txt>

\#mail\_uid =

\#mail\_gid =



\# Group to enable temporarily for privileged operations. Currently this is

\# used only with INBOX when either its initial creation or dotlocking fails.

\# Typically this is set to "mail" to give access to /var/mail.

mail\_privileged\_group = mail



\# Grant access to these supplementary groups for mail processes. Typically

\# these are used to set up access to shared mailboxes. Note that it may be

\# dangerous to set these if users can create symlinks (e.g. if "mail" group is

\# set here, ln -s /var/mail ~/mail/var could allow a user to delete others'

\# mailboxes, or ln -s /secret/shared/box ~/mail/mybox would allow reading it).

\#mail\_access\_groups =



\# Allow full filesystem access to clients. There's no access checks other than

\# what the operating system does for the active UID/GID. It works with both

\# maildir and mboxes, allowing you to prefix mailboxes names with eg. /path/

\# or ~user/.

\#mail\_full\_filesystem\_access = no



\# Dictionary for key=value mailbox attributes. This is used for example by

\# URLAUTH and METADATA extensions.

\#mail\_attribute\_dict =



\# A comment or note that is associated with the server. This value is

\# accessible for authenticated users through the IMAP METADATA server

\# entry "/shared/comment".

\#mail\_server\_comment = ""



\# Indicates a method for contacting the server administrator. According to

\# RFC 5464, this value MUST be a URI (e.g., a mailto: or tel: URL), but that

\# is currently not enforced. Use for example mailto:admin@example.com. This

\# value is accessible for authenticated users through the IMAP METADATA server

\# entry "/shared/admin".

\#mail\_server\_admin =



\##

\## Mail processes

\##



\# Don't use mmap() at all. This is required if you store indexes to shared

\# filesystems (NFS or clustered filesystem).

\#mmap\_disable = no



\# Rely on O\_EXCL to work when creating dotlock files. NFS supports O\_EXCL

\# since version 3, so this should be safe to use nowadays by default.

\#dotlock\_use\_excl = yes



\# When to use fsync() or fdatasync() calls:

\#   optimized (default): Whenever necessary to avoid losing important data

\#   always: Useful with e.g. NFS when write()s are delayed

\#   never: Never use it (best performance, but crashes can lose data)

\#mail\_fsync = optimized



\# Locking method for index files. Alternatives are fcntl, flock and dotlock.

\# Dotlocking uses some tricks which may create more disk I/O than other locking

\# methods. NFS users: flock doesn't work, remember to change mmap\_disable.

\#lock\_method = fcntl



\# Directory where mails can be temporarily stored. Usually it's used only for

\# mails larger than >= 128 kB. It's used by various parts of Dovecot, for

\# example LDA/LMTP while delivering large mails or zlib plugin for keeping

\# uncompressed mails.

\#mail\_temp\_dir = /tmp



\# Valid UID range for users, defaults to 500 and above. This is mostly

\# to make sure that users can't log in as daemons or other system users.

\# Note that denying root logins is hardcoded to dovecot binary and can't

\# be done even if first\_valid\_uid is set to 0.

\#first\_valid\_uid = 500

\#last\_valid\_uid = 0



\# Valid GID range for users, defaults to non-root/wheel. Users having

\# non-valid GID as primary group ID aren't allowed to log in. If user

\# belongs to supplementary groups with non-valid GIDs, those groups are

\# not set.

\#first\_valid\_gid = 1

\#last\_valid\_gid = 0



\# Maximum allowed length for mail keyword name. It's only forced when trying

\# to create new keywords.

\#mail\_max\_keyword\_length = 50



\# ':' separated list of directories under which chrooting is allowed for mail

\# processes (ie. /var/mail will allow chrooting to /var/mail/foo/bar too).

\# This setting doesn't affect login\_chroot, mail\_chroot or auth chroot

\# settings. If this setting is empty, "/./" in home dirs are ignored.

\# WARNING: Never add directories here which local users can modify, that

\# may lead to root exploit. Usually this should be done only if you don't

\# allow shell access for users. <doc/wiki/Chrooting.txt>

\#valid\_chroot\_dirs =



\# Default chroot directory for mail processes. This can be overridden for

\# specific users in user database by giving /./ in user's home directory

\# (eg. /home/./user chroots into /home). Note that usually there is no real

\# need to do chrooting, Dovecot doesn't allow users to access files outside

\# their mail directory anyway. If your home directories are prefixed with

\# the chroot directory, append "/." to mail\_chroot. <doc/wiki/Chrooting.txt>

\#mail\_chroot =



\# UNIX socket path to master authentication server to find users.

\# This is used by imap (for shared users) and lda.

\#auth\_socket\_path = /var/run/dovecot/auth-userdb



\# Directory where to look up mail plugins.

\#mail\_plugin\_dir = /usr/lib/dovecot/modules



\# Space separated list of plugins to load for all services. Plugins specific to

\# IMAP, LDA, etc. are added to this list in their own .conf files.

\#mail\_plugins =



\##

\## Mailbox handling optimizations

\##



\# Mailbox list indexes can be used to optimize IMAP STATUS commands. They are

\# also required for IMAP NOTIFY extension to be enabled.

\#mailbox\_list\_index = yes



\# Trust mailbox list index to be up-to-date. This reduces disk I/O at the cost

\# of potentially returning out-of-date results after e.g. server crashes.

\# The results will be automatically fixed once the folders are opened.

\#mailbox\_list\_index\_very\_dirty\_syncs = yes



\# Should INBOX be kept up-to-date in the mailbox list index? By default it's

\# not, because most of the mailbox accesses will open INBOX anyway.

\#mailbox\_list\_index\_include\_inbox = no



\# The minimum number of mails in a mailbox before updates are done to cache

\# file. This allows optimizing Dovecot's behavior to do less disk writes at

\# the cost of more disk reads.

\#mail\_cache\_min\_mail\_count = 0



\# When IDLE command is running, mailbox is checked once in a while to see if

\# there are any new mails or other changes. This setting defines the minimum

\# time to wait between those checks. Dovecot can also use inotify and

\# kqueue to find out immediately when changes occur.

\#mailbox\_idle\_check\_interval = 30 secs



\# Save mails with CR+LF instead of plain LF. This makes sending those mails

\# take less CPU, especially with sendfile() syscall with Linux and FreeBSD.

\# But it also creates a bit more disk I/O which may just make it slower.

\# Also note that if other software reads the mboxes/maildirs, they may handle

\# the extra CRs wrong and cause problems.

\#mail\_save\_crlf = no



\# Max number of mails to keep open and prefetch to memory. This only works with

\# some mailbox formats and/or operating systems.

\#mail\_prefetch\_count = 0



\# How often to scan for stale temporary files and delete them (0 = never).

\# These should exist only after Dovecot dies in the middle of saving mails.

\#mail\_temp\_scan\_interval = 1w



\# How many slow mail accesses sorting can perform before it returns failure.

\# With IMAP the reply is: NO \[LIMIT] Requested sort would have taken too long.

\# The untagged SORT reply is still returned, but it's likely not correct.

\#mail\_sort\_max\_read\_count = 0



protocol !indexer-worker {

&nbsp; # If folder vsize calculation requires opening more than this many mails from

&nbsp; # disk (i.e. mail sizes aren't in cache already), return failure and finish

&nbsp; # the calculation via indexer process. Disabled by default. This setting must

&nbsp; # be 0 for indexer-worker processes.

&nbsp; #mail\_vsize\_bg\_after\_count = 0

}



\##

\## Maildir-specific settings

\##



\# By default LIST command returns all entries in maildir beginning with a dot.

\# Enabling this option makes Dovecot return only entries which are directories.

\# This is done by stat()ing each entry, so it causes more disk I/O.

\# (For systems setting struct dirent->d\_type, this check is free and it's

\# done always regardless of this setting)

\#maildir\_stat\_dirs = no



\# When copying a message, do it with hard links whenever possible. This makes

\# the performance much better, and it's unlikely to have any side effects.

\#maildir\_copy\_with\_hardlinks = yes



\# Assume Dovecot is the only MUA accessing Maildir: Scan cur/ directory only

\# when its mtime changes unexpectedly or when we can't find the mail otherwise.

\#maildir\_very\_dirty\_syncs = no



\# If enabled, Dovecot doesn't use the S=<size> in the Maildir filenames for

\# getting the mail's physical size, except when recalculating Maildir++ quota.

\# This can be useful in systems where a lot of the Maildir filenames have a

\# broken size. The performance hit for enabling this is very small.

\#maildir\_broken\_filename\_sizes = no



\# Always move mails from new/ directory to cur/, even when the \\Recent flags

\# aren't being reset.

\#maildir\_empty\_new = no



\##

\## mbox-specific settings

\##



\# Which locking methods to use for locking mbox. There are four available:

\#  dotlock: Create <mailbox>.lock file. This is the oldest and most NFS-safe

\#           solution. If you want to use /var/mail/ like directory, the users

\#           will need write access to that directory.

\#  dotlock\_try: Same as dotlock, but if it fails because of permissions or

\#               because there isn't enough disk space, just skip it.

\#  fcntl  : Use this if possible. Works with NFS too if lockd is used.

\#  flock  : May not exist in all systems. Doesn't work with NFS.

\#  lockf  : May not exist in all systems. Doesn't work with NFS.

\#

\# You can use multiple locking methods; if you do the order they're declared

\# in is important to avoid deadlocks if other MTAs/MUAs are using multiple

\# locking methods as well. Some operating systems don't allow using some of

\# them simultaneously.

\#

\# The Debian value for mbox\_write\_locks differs from upstream Dovecot. It is

\# changed to be compliant with Debian Policy (section 11.6) for NFS safety.

\#       Dovecot: mbox\_write\_locks = dotlock fcntl

\#       Debian:  mbox\_write\_locks = fcntl dotlock

\#

\#mbox\_read\_locks = fcntl

\#mbox\_write\_locks = fcntl dotlock



\# Maximum time to wait for lock (all of them) before aborting.

\#mbox\_lock\_timeout = 5 mins



\# If dotlock exists but the mailbox isn't modified in any way, override the

\# lock file after this much time.

\#mbox\_dotlock\_change\_timeout = 2 mins



\# When mbox changes unexpectedly we have to fully read it to find out what

\# changed. If the mbox is large this can take a long time. Since the change

\# is usually just a newly appended mail, it'd be faster to simply read the

\# new mails. If this setting is enabled, Dovecot does this but still safely

\# fallbacks to re-reading the whole mbox file whenever something in mbox isn't

\# how it's expected to be. The only real downside to this setting is that if

\# some other MUA changes message flags, Dovecot doesn't notice it immediately.

\# Note that a full sync is done with SELECT, EXAMINE, EXPUNGE and CHECK

\# commands.

\#mbox\_dirty\_syncs = yes



\# Like mbox\_dirty\_syncs, but don't do full syncs even with SELECT, EXAMINE,

\# EXPUNGE or CHECK commands. If this is set, mbox\_dirty\_syncs is ignored.

\#mbox\_very\_dirty\_syncs = no



\# Delay writing mbox headers until doing a full write sync (EXPUNGE and CHECK

\# commands and when closing the mailbox). This is especially useful for POP3

\# where clients often delete all mails. The downside is that our changes

\# aren't immediately visible to other MUAs.

\#mbox\_lazy\_writes = yes



\# If mbox size is smaller than this (e.g. 100k), don't write index files.

\# If an index file already exists it's still read, just not updated.

\#mbox\_min\_index\_size = 0



\# Mail header selection algorithm to use for MD5 POP3 UIDLs when

\# pop3\_uidl\_format=%m. For backwards compatibility we use apop3d inspired

\# algorithm, but it fails if the first Received: header isn't unique in all

\# mails. An alternative algorithm is "all" that selects all headers.

\#mbox\_md5 = apop3d



\##

\## mdbox-specific settings

\##



\# Maximum dbox file size until it's rotated.

\#mdbox\_rotate\_size = 10M



\# Maximum dbox file age until it's rotated. Typically in days. Day begins

\# from midnight, so 1d = today, 2d = yesterday, etc. 0 = check disabled.

\#mdbox\_rotate\_interval = 0



\# When creating new mdbox files, immediately preallocate their size to

\# mdbox\_rotate\_size. This setting currently works only in Linux with some

\# filesystems (ext4, xfs).

\#mdbox\_preallocate\_space = no



\##

\## Mail attachments

\##



\# sdbox and mdbox support saving mail attachments to external files, which

\# also allows single instance storage for them. Other backends don't support

\# this for now.



\# Directory root where to store mail attachments. Disabled, if empty.

\#mail\_attachment\_dir =



\# Attachments smaller than this aren't saved externally. It's also possible to

\# write a plugin to disable saving specific attachments externally.

\#mail\_attachment\_min\_size = 128k



\# Filesystem backend to use for saving attachments:

\#  posix : No SiS done by Dovecot (but this might help FS's own deduplication)

\#  sis posix : SiS with immediate byte-by-byte comparison during saving

\#  sis-queue posix : SiS with delayed comparison and deduplication

\#mail\_attachment\_fs = sis posix



\# Hash format to use in attachment filenames. You can add any text and

\# variables: %{md4}, %{md5}, %{sha1}, %{sha256}, %{sha512}, %{size}.

\# Variables can be truncated, e.g. %{sha256:80} returns only first 80 bits

\#mail\_attachment\_hash = %{sha1}



\# Settings to control adding $HasAttachment or $HasNoAttachment keywords.

\# By default, all MIME parts with Content-Disposition=attachment, or inlines

\# with filename parameter are consired attachments.

\#   add-flags - Add the keywords when saving new mails or when fetching can

\#      do it efficiently.

\#   content-type=type or !type - Include/exclude content type. Excluding will

\#     never consider the matched MIME part as attachment. Including will only

\#     negate an exclusion (e.g. content-type=!foo/\* content-type=foo/bar).

\#   exclude-inlined - Exclude any Content-Disposition=inline MIME part.

\#mail\_attachment\_detection\_options =

root@web-mail:/etc/postfix# nano /etc/dovecot/conf.d/10-mail.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/conf.d/10-mail.conf

\##

\## Mailbox locations and namespaces

\##



\# Location for users' mailboxes. The default is empty, which means that Dovecot

\# tries to find the mailboxes automatically. This won't work if the user

\# doesn't yet have any mail, so you should explicitly tell Dovecot the full

\# location.

\#

\# If you're using mbox, giving a path to the INBOX file (eg. /var/mail/%u)

\# isn't enough. You'll also need to tell Dovecot where the other mailboxes are

\# kept. This is called the "root mail directory", and it must be the first

\# path given in the mail\_location setting.

\#

\# There are a few special variables you can use, eg.:

\#

\#   %u - username

\#   %n - user part in user@domain, same as %u if there's no domain

\#   %d - domain part in user@domain, empty if there's no domain

\#   %h - home directory

\#

\# See doc/wiki/Variables.txt for full list. Some examples:

\#

\#   mail\_location = maildir:~/Maildir

\#   mail\_location = mbox:~/mail:INBOX=/var/mail/%u

\#   mail\_location = mbox:/var/mail/%d/%1n/%n:INDEX=/var/indexes/%d/%1n/%n

\#

\# <doc/wiki/MailLocation.txt>

\#

mail\_location = maildir:~/Maildir



\# If you need to set multiple mailbox locations or want to change default

\# namespace settings, you can do it by defining namespace sections.

\#

\# You can have private, shared and public namespaces. Private namespaces

\# are for user's personal mails. Shared namespaces are for accessing other

\# users' mailboxes that have been shared. Public namespaces are for shared

\# mailboxes that are managed by sysadmin. If you create any shared or public

\# namespaces you'll typically want to enable ACL plugin also, otherwise all

\# users can access all the shared mailboxes, assuming they have permissions

\# on filesystem level to do so.

namespace inbox {

&nbsp; # Namespace type: private, shared or public

&nbsp; #type = private



&nbsp; # Hierarchy separator to use. You should use the same separator for all

&nbsp; # namespaces or some clients get confused. '/' is usually a good one.

&nbsp; # The default however depends on the underlying mail storage format.

&nbsp; #separator =



&nbsp; # Prefix required to access this namespace. This needs to be different for

&nbsp; # all namespaces. For example "Public/".

&nbsp; #prefix =



&nbsp; # Physical location of the mailbox. This is in same format as

&nbsp; # mail\_location, which is also the default for it.

&nbsp; #location =



&nbsp; # There can be only one INBOX, and this setting defines which namespace

&nbsp; # has it.

&nbsp; inbox = yes



&nbsp; # If namespace is hidden, it's not advertised to clients via NAMESPACE

&nbsp; # extension. You'll most likely also want to set list=no. This is mostly

&nbsp; # useful when converting from another server with different namespaces which

&nbsp; # you want to deprecate but still keep working. For example you can create

&nbsp; # hidden namespaces with prefixes "~/mail/", "~%u/mail/" and "mail/".

&nbsp; #hidden = no



&nbsp; # Show the mailboxes under this namespace with LIST command. This makes the

&nbsp; # namespace visible for clients that don't support NAMESPACE extension.

&nbsp; # "children" value lists child mailboxes, but hides the namespace prefix.

&nbsp; #list = yes



&nbsp; # Namespace handles its own subscriptions. If set to "no", the parent

&nbsp; # namespace handles them (empty prefix should always have this as "yes")

&nbsp; #subscriptions = yes



&nbsp; # See 15-mailboxes.conf for definitions of special mailboxes.

}



\# Example shared namespace configuration

\#namespace {

&nbsp; #type = shared

&nbsp; #separator = /



&nbsp; # Mailboxes are visible under "shared/user@domain/"

&nbsp; # %%n, %%d and %%u are expanded to the destination user.

&nbsp; #prefix = shared/%%u/



&nbsp; # Mail location for other users' mailboxes. Note that %variables and ~/

&nbsp; # expands to the logged in user's data. %%n, %%d, %%u and %%h expand to the

&nbsp; # destination user's data.

&nbsp; #location = maildir:%%h/Maildir:INDEX=~/Maildir/shared/%%u



&nbsp; # Use the default namespace for saving subscriptions.

&nbsp; #subscriptions = no



&nbsp; # List the shared/ namespace only if there are visible shared mailboxes.

&nbsp; #list = children

\#}

\# Should shared INBOX be visible as "shared/user" or "shared/user/INBOX"?

\#mail\_shared\_explicit\_inbox = no



\# System user and group used to access mails. If you use multiple, userdb

\# can override these by returning uid or gid fields. You can use either numbers

\# or names. <doc/wiki/UserIds.txt>

\#mail\_uid =

\#mail\_gid =



\# Group to enable temporarily for privileged operations. Currently this is

\# used only with INBOX when either its initial creation or dotlocking fails.

\# Typically this is set to "mail" to give access to /var/mail.

mail\_privileged\_group = mail



\# Grant access to these supplementary groups for mail processes. Typically

\# these are used to set up access to shared mailboxes. Note that it may be

\# dangerous to set these if users can create symlinks (e.g. if "mail" group is

\# set here, ln -s /var/mail ~/mail/var could allow a user to delete others'

\# mailboxes, or ln -s /secret/shared/box ~/mail/mybox would allow reading it).

\#mail\_access\_groups =



\# Allow full filesystem access to clients. There's no access checks other than

\# what the operating system does for the active UID/GID. It works with both

\# maildir and mboxes, allowing you to prefix mailboxes names with eg. /path/

\# or ~user/.

\#mail\_full\_filesystem\_access = no



\# Dictionary for key=value mailbox attributes. This is used for example by

\# URLAUTH and METADATA extensions.

\#mail\_attribute\_dict =



\# A comment or note that is associated with the server. This value is

\# accessible for authenticated users through the IMAP METADATA server

\# entry "/shared/comment".

\#mail\_server\_comment = ""



\# Indicates a method for contacting the server administrator. According to

\# RFC 5464, this value MUST be a URI (e.g., a mailto: or tel: URL), but that

\# is currently not enforced. Use for example mailto:admin@example.com. This

\# value is accessible for authenticated users through the IMAP METADATA server

\# entry "/shared/admin".

\#mail\_server\_admin =



\##

\## Mail processes

\##



\# Don't use mmap() at all. This is required if you store indexes to shared

\# filesystems (NFS or clustered filesystem).

\#mmap\_disable = no



\# Rely on O\_EXCL to work when creating dotlock files. NFS supports O\_EXCL

\# since version 3, so this should be safe to use nowadays by default.

\#dotlock\_use\_excl = yes



\# When to use fsync() or fdatasync() calls:

\#   optimized (default): Whenever necessary to avoid losing important data

\#   always: Useful with e.g. NFS when write()s are delayed

\#   never: Never use it (best performance, but crashes can lose data)

\#mail\_fsync = optimized



\# Locking method for index files. Alternatives are fcntl, flock and dotlock.

\# Dotlocking uses some tricks which may create more disk I/O than other locking

\# methods. NFS users: flock doesn't work, remember to change mmap\_disable.

\#lock\_method = fcntl



\# Directory where mails can be temporarily stored. Usually it's used only for

\# mails larger than >= 128 kB. It's used by various parts of Dovecot, for

\# example LDA/LMTP while delivering large mails or zlib plugin for keeping

\# uncompressed mails.

\#mail\_temp\_dir = /tmp



\# Valid UID range for users, defaults to 500 and above. This is mostly

\# to make sure that users can't log in as daemons or other system users.

\# Note that denying root logins is hardcoded to dovecot binary and can't

\# be done even if first\_valid\_uid is set to 0.

\#first\_valid\_uid = 500

\#last\_valid\_uid = 0



\# Valid GID range for users, defaults to non-root/wheel. Users having

\# non-valid GID as primary group ID aren't allowed to log in. If user

\# belongs to supplementary groups with non-valid GIDs, those groups are

\# not set.

\#first\_valid\_gid = 1

\#last\_valid\_gid = 0



\# Maximum allowed length for mail keyword name. It's only forced when trying

\# to create new keywords.

\#mail\_max\_keyword\_length = 50



\# ':' separated list of directories under which chrooting is allowed for mail

\# processes (ie. /var/mail will allow chrooting to /var/mail/foo/bar too).

\# This setting doesn't affect login\_chroot, mail\_chroot or auth chroot

\# settings. If this setting is empty, "/./" in home dirs are ignored.

\# WARNING: Never add directories here which local users can modify, that

\# may lead to root exploit. Usually this should be done only if you don't

\# allow shell access for users. <doc/wiki/Chrooting.txt>

\#valid\_chroot\_dirs =



\# Default chroot directory for mail processes. This can be overridden for

\# specific users in user database by giving /./ in user's home directory

\# (eg. /home/./user chroots into /home). Note that usually there is no real

\# need to do chrooting, Dovecot doesn't allow users to access files outside

\# their mail directory anyway. If your home directories are prefixed with

\# the chroot directory, append "/." to mail\_chroot. <doc/wiki/Chrooting.txt>

\#mail\_chroot =



\# UNIX socket path to master authentication server to find users.

\# This is used by imap (for shared users) and lda.

\#auth\_socket\_path = /var/run/dovecot/auth-userdb



\# Directory where to look up mail plugins.

\#mail\_plugin\_dir = /usr/lib/dovecot/modules



\# Space separated list of plugins to load for all services. Plugins specific to

\# IMAP, LDA, etc. are added to this list in their own .conf files.

\#mail\_plugins =



\##

\## Mailbox handling optimizations

\##



\# Mailbox list indexes can be used to optimize IMAP STATUS commands. They are

\# also required for IMAP NOTIFY extension to be enabled.

\#mailbox\_list\_index = yes



\# Trust mailbox list index to be up-to-date. This reduces disk I/O at the cost

\# of potentially returning out-of-date results after e.g. server crashes.

\# The results will be automatically fixed once the folders are opened.

\#mailbox\_list\_index\_very\_dirty\_syncs = yes



\# Should INBOX be kept up-to-date in the mailbox list index? By default it's

\# not, because most of the mailbox accesses will open INBOX anyway.

\#mailbox\_list\_index\_include\_inbox = no



\# The minimum number of mails in a mailbox before updates are done to cache

\# file. This allows optimizing Dovecot's behavior to do less disk writes at

\# the cost of more disk reads.

\#mail\_cache\_min\_mail\_count = 0



\# When IDLE command is running, mailbox is checked once in a while to see if

\# there are any new mails or other changes. This setting defines the minimum

\# time to wait between those checks. Dovecot can also use inotify and

\# kqueue to find out immediately when changes occur.

\#mailbox\_idle\_check\_interval = 30 secs



\# Save mails with CR+LF instead of plain LF. This makes sending those mails

\# take less CPU, especially with sendfile() syscall with Linux and FreeBSD.

\# But it also creates a bit more disk I/O which may just make it slower.

\# Also note that if other software reads the mboxes/maildirs, they may handle

\# the extra CRs wrong and cause problems.

\#mail\_save\_crlf = no



\# Max number of mails to keep open and prefetch to memory. This only works with

\# some mailbox formats and/or operating systems.

\#mail\_prefetch\_count = 0



\# How often to scan for stale temporary files and delete them (0 = never).

\# These should exist only after Dovecot dies in the middle of saving mails.

\#mail\_temp\_scan\_interval = 1w



\# How many slow mail accesses sorting can perform before it returns failure.

\# With IMAP the reply is: NO \[LIMIT] Requested sort would have taken too long.

\# The untagged SORT reply is still returned, but it's likely not correct.

\#mail\_sort\_max\_read\_count = 0



protocol !indexer-worker {

&nbsp; # If folder vsize calculation requires opening more than this many mails from

&nbsp; # disk (i.e. mail sizes aren't in cache already), return failure and finish

&nbsp; # the calculation via indexer process. Disabled by default. This setting must

&nbsp; # be 0 for indexer-worker processes.

&nbsp; #mail\_vsize\_bg\_after\_count = 0

}



\##

\## Maildir-specific settings

\##



\# By default LIST command returns all entries in maildir beginning with a dot.

\# Enabling this option makes Dovecot return only entries which are directories.

\# This is done by stat()ing each entry, so it causes more disk I/O.

\# (For systems setting struct dirent->d\_type, this check is free and it's

\# done always regardless of this setting)

\#maildir\_stat\_dirs = no



\# When copying a message, do it with hard links whenever possible. This makes

\# the performance much better, and it's unlikely to have any side effects.

\#maildir\_copy\_with\_hardlinks = yes



\# Assume Dovecot is the only MUA accessing Maildir: Scan cur/ directory only

\# when its mtime changes unexpectedly or when we can't find the mail otherwise.

\#maildir\_very\_dirty\_syncs = no



\# If enabled, Dovecot doesn't use the S=<size> in the Maildir filenames for

\# getting the mail's physical size, except when recalculating Maildir++ quota.

\# This can be useful in systems where a lot of the Maildir filenames have a

\# broken size. The performance hit for enabling this is very small.

\#maildir\_broken\_filename\_sizes = no



\# Always move mails from new/ directory to cur/, even when the \\Recent flags

\# aren't being reset.

\#maildir\_empty\_new = no



\##

\## mbox-specific settings

\##



\# Which locking methods to use for locking mbox. There are four available:

\#  dotlock: Create <mailbox>.lock file. This is the oldest and most NFS-safe

\#           solution. If you want to use /var/mail/ like directory, the users

\#           will need write access to that directory.

\#  dotlock\_try: Same as dotlock, but if it fails because of permissions or

\#               because there isn't enough disk space, just skip it.

\#  fcntl  : Use this if possible. Works with NFS too if lockd is used.

\#  flock  : May not exist in all systems. Doesn't work with NFS.

\#  lockf  : May not exist in all systems. Doesn't work with NFS.

\#

\# You can use multiple locking methods; if you do the order they're declared

\# in is important to avoid deadlocks if other MTAs/MUAs are using multiple

\# locking methods as well. Some operating systems don't allow using some of

\# them simultaneously.

\#

\# The Debian value for mbox\_write\_locks differs from upstream Dovecot. It is

\# changed to be compliant with Debian Policy (section 11.6) for NFS safety.

\#       Dovecot: mbox\_write\_locks = dotlock fcntl

\#       Debian:  mbox\_write\_locks = fcntl dotlock

\#

\#mbox\_read\_locks = fcntl

\#mbox\_write\_locks = fcntl dotlock



\# Maximum time to wait for lock (all of them) before aborting.

\#mbox\_lock\_timeout = 5 mins



\# If dotlock exists but the mailbox isn't modified in any way, override the

\# lock file after this much time.

\#mbox\_dotlock\_change\_timeout = 2 mins



\# When mbox changes unexpectedly we have to fully read it to find out what

\# changed. If the mbox is large this can take a long time. Since the change

\# is usually just a newly appended mail, it'd be faster to simply read the

\# new mails. If this setting is enabled, Dovecot does this but still safely

\# fallbacks to re-reading the whole mbox file whenever something in mbox isn't

\# how it's expected to be. The only real downside to this setting is that if

\# some other MUA changes message flags, Dovecot doesn't notice it immediately.

\# Note that a full sync is done with SELECT, EXAMINE, EXPUNGE and CHECK

\# commands.

\#mbox\_dirty\_syncs = yes



\# Like mbox\_dirty\_syncs, but don't do full syncs even with SELECT, EXAMINE,

\# EXPUNGE or CHECK commands. If this is set, mbox\_dirty\_syncs is ignored.

\#mbox\_very\_dirty\_syncs = no



\# Delay writing mbox headers until doing a full write sync (EXPUNGE and CHECK

\# commands and when closing the mailbox). This is especially useful for POP3

\# where clients often delete all mails. The downside is that our changes

\# aren't immediately visible to other MUAs.

\#mbox\_lazy\_writes = yes



\# If mbox size is smaller than this (e.g. 100k), don't write index files.

\# If an index file already exists it's still read, just not updated.

\#mbox\_min\_index\_size = 0



\# Mail header selection algorithm to use for MD5 POP3 UIDLs when

\# pop3\_uidl\_format=%m. For backwards compatibility we use apop3d inspired

\# algorithm, but it fails if the first Received: header isn't unique in all

\# mails. An alternative algorithm is "all" that selects all headers.

\#mbox\_md5 = apop3d



\##

\## mdbox-specific settings

\##



\# Maximum dbox file size until it's rotated.

\#mdbox\_rotate\_size = 10M



\# Maximum dbox file age until it's rotated. Typically in days. Day begins

\# from midnight, so 1d = today, 2d = yesterday, etc. 0 = check disabled.

\#mdbox\_rotate\_interval = 0



\# When creating new mdbox files, immediately preallocate their size to

\# mdbox\_rotate\_size. This setting currently works only in Linux with some

\# filesystems (ext4, xfs).

\#mdbox\_preallocate\_space = no



\##

\## Mail attachments

\##



\# sdbox and mdbox support saving mail attachments to external files, which

\# also allows single instance storage for them. Other backends don't support

\# this for now.



\# Directory root where to store mail attachments. Disabled, if empty.

\#mail\_attachment\_dir =



\# Attachments smaller than this aren't saved externally. It's also possible to

\# write a plugin to disable saving specific attachments externally.

\#mail\_attachment\_min\_size = 128k



\# Filesystem backend to use for saving attachments:

\#  posix : No SiS done by Dovecot (but this might help FS's own deduplication)

\#  sis posix : SiS with immediate byte-by-byte comparison during saving

\#  sis-queue posix : SiS with delayed comparison and deduplication

\#mail\_attachment\_fs = sis posix



\# Hash format to use in attachment filenames. You can add any text and

\# variables: %{md4}, %{md5}, %{sha1}, %{sha256}, %{sha512}, %{size}.

\# Variables can be truncated, e.g. %{sha256:80} returns only first 80 bits

\#mail\_attachment\_hash = %{sha1}



\# Settings to control adding $HasAttachment or $HasNoAttachment keywords.

\# By default, all MIME parts with Content-Disposition=attachment, or inlines

\# with filename parameter are consired attachments.

\#   add-flags - Add the keywords when saving new mails or when fetching can

\#      do it efficiently.

\#   content-type=type or !type - Include/exclude content type. Excluding will

\#     never consider the matched MIME part as attachment. Including will only

\#     negate an exclusion (e.g. content-type=!foo/\* content-type=foo/bar).

\#   exclude-inlined - Exclude any Content-Disposition=inline MIME part.

\#mail\_attachment\_detection\_options =

root@web-mail:/etc/postfix# nano /etc/dovecot/conf.d/10-auth.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/conf.d/10-auth.conf

\##

\## Authentication processes

\##



\# Disable LOGIN command and all other plaintext authentications unless

\# SSL/TLS is used (LOGINDISABLED capability). Note that if the remote IP

\# matches the local IP (ie. you're connecting from the same computer), the

\# connection is considered secure and plaintext authentication is allowed.

\# See also ssl=required setting.

disable\_plaintext\_auth = no



\# Authentication cache size (e.g. 10M). 0 means it's disabled. Note that

\# bsdauth and PAM require cache\_key to be set for caching to be used.

\#auth\_cache\_size = 0

\# Time to live for cached data. After TTL expires the cached record is no

\# longer used, \*except\* if the main database lookup returns internal failure.

\# We also try to handle password changes automatically: If user's previous

\# authentication was successful, but this one wasn't, the cache isn't used.

\# For now this works only with plaintext authentication.

\#auth\_cache\_ttl = 1 hour

\# TTL for negative hits (user not found, password mismatch).

\# 0 disables caching them completely.

\#auth\_cache\_negative\_ttl = 1 hour



\# Space separated list of realms for SASL authentication mechanisms that need

\# them. You can leave it empty if you don't want to support multiple realms.

\# Many clients simply use the first one listed here, so keep the default realm

\# first.

\#auth\_realms =



\# Default realm/domain to use if none was specified. This is used for both

\# SASL realms and appending @domain to username in plaintext logins.

\#auth\_default\_realm =



\# List of allowed characters in username. If the user-given username contains

\# a character not listed in here, the login automatically fails. This is just

\# an extra check to make sure user can't exploit any potential quote escaping

\# vulnerabilities with SQL/LDAP databases. If you want to allow all characters,

\# set this value to empty.

\#auth\_username\_chars = abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890.-\_@



\# Username character translations before it's looked up from databases. The

\# value contains series of from -> to characters. For example "#@/@" means

\# that '#' and '/' characters are translated to '@'.

\#auth\_username\_translation =



\# Username formatting before it's looked up from databases. You can use

\# the standard variables here, eg. %Lu would lowercase the username, %n would

\# drop away the domain if it was given, or "%n-AT-%d" would change the '@' into

\# "-AT-". This translation is done after auth\_username\_translation changes.

\#auth\_username\_format = %Lu



\# If you want to allow master users to log in by specifying the master

\# username within the normal username string (ie. not using SASL mechanism's

\# support for it), you can specify the separator character here. The format

\# is then <username><separator><master username>. UW-IMAP uses "\*" as the

\# separator, so that could be a good choice.

\#auth\_master\_user\_separator =



\# Username to use for users logging in with ANONYMOUS SASL mechanism

\#auth\_anonymous\_username = anonymous



\# Maximum number of dovecot-auth worker processes. They're used to execute

\# blocking passdb and userdb queries (eg. MySQL and PAM). They're

\# automatically created and destroyed as needed.

\#auth\_worker\_max\_count = 30



\# Host name to use in GSSAPI principal names. The default is to use the

\# name returned by gethostname(). Use "$ALL" (with quotes) to allow all keytab

\# entries.

\#auth\_gssapi\_hostname =



\# Kerberos keytab to use for the GSSAPI mechanism. Will use the system

\# default (usually /etc/krb5.keytab) if not specified. You may need to change

\# the auth service to run as root to be able to read this file.

\#auth\_krb5\_keytab =



\# Do NTLM and GSS-SPNEGO authentication using Samba's winbind daemon and

\# ntlm\_auth helper. <doc/wiki/Authentication/Mechanisms/Winbind.txt>

\#auth\_use\_winbind = no



\# Path for Samba's ntlm\_auth helper binary.

\#auth\_winbind\_helper\_path = /usr/bin/ntlm\_auth



\# Time to delay before replying to failed authentications.

\#auth\_failure\_delay = 2 secs



\# Require a valid SSL client certificate or the authentication fails.

\#auth\_ssl\_require\_client\_cert = no



\# Take the username from client's SSL certificate, using

\# X509\_NAME\_get\_text\_by\_NID() which returns the subject's DN's

\# CommonName.

\#auth\_ssl\_username\_from\_cert = no



\# Space separated list of wanted authentication mechanisms:

\#   plain login digest-md5 cram-md5 ntlm rpa apop anonymous gssapi otp

\#   gss-spnego

\# NOTE: See also disable\_plaintext\_auth setting.

auth\_mechanisms = plain



\##

\## Password and user databases

\##



\#

\# Password database is used to verify user's password (and nothing more).

\# You can have multiple passdbs and userdbs. This is useful if you want to

\# allow both system users (/etc/passwd) and virtual users to login without

\# duplicating the system users into virtual database.

\#

\# <doc/wiki/PasswordDatabase.txt>

\#

\# User database specifies where mails are located and what user/group IDs

\# own them. For single-UID configuration use "static" userdb.

\#

\# <doc/wiki/UserDatabase.txt>



\#!include auth-deny.conf.ext

\#!include auth-master.conf.ext



!include auth-system.conf.ext

\#!include auth-sql.conf.ext

\#!include auth-ldap.conf.ext

\#!include auth-passwdfile.conf.ext

\#!include auth-checkpassword.conf.ext

\#!include auth-static.conf.ext

root@web-mail:/etc/postfix# cat /etc/dovecot/conf.d/10-master.conf

\#default\_process\_limit = 100

\#default\_client\_limit = 1000



\# Default VSZ (virtual memory size) limit for service processes. This is mainly

\# intended to catch and kill processes that leak memory before they eat up

\# everything.

\#default\_vsz\_limit = 256M



\# Login user is internally used by login processes. This is the most untrusted

\# user in Dovecot system. It shouldn't have access to anything at all.

\#default\_login\_user = dovenull



\# Internal user is used by unprivileged processes. It should be separate from

\# login user, so that login processes can't disturb other processes.

\#default\_internal\_user = dovecot



service imap-login {

&nbsp; inet\_listener imap {

&nbsp;   #port = 143

&nbsp; }

&nbsp; inet\_listener imaps {

&nbsp;   #port = 993

&nbsp;   #ssl = yes

&nbsp; }



&nbsp; # Number of connections to handle before starting a new process. Typically

&nbsp; # the only useful values are 0 (unlimited) or 1. 1 is more secure, but 0

&nbsp; # is faster. <doc/wiki/LoginProcess.txt>

&nbsp; #service\_count = 1



&nbsp; # Number of processes to always keep waiting for more connections.

&nbsp; #process\_min\_avail = 0



&nbsp; # If you set service\_count=0, you probably need to grow this.

&nbsp; #vsz\_limit = $default\_vsz\_limit

}



service pop3-login {

&nbsp; inet\_listener pop3 {

&nbsp;   #port = 110

&nbsp; }

&nbsp; inet\_listener pop3s {

&nbsp;   #port = 995

&nbsp;   #ssl = yes

&nbsp; }

}



service submission-login {

&nbsp; inet\_listener submission {

&nbsp;   #port = 587

&nbsp; }

}



service lmtp {

&nbsp; unix\_listener lmtp {

&nbsp;   #mode = 0666

&nbsp; }



&nbsp; # Create inet listener only if you can't use the above UNIX socket

&nbsp; #inet\_listener lmtp {

&nbsp;   # Avoid making LMTP visible for the entire internet

&nbsp;   #address =

&nbsp;   #port =

&nbsp; #}

}



service imap {

&nbsp; # Most of the memory goes to mmap()ing files. You may need to increase this

&nbsp; # limit if you have huge mailboxes.

&nbsp; #vsz\_limit = $default\_vsz\_limit



&nbsp; # Max. number of IMAP processes (connections)

&nbsp; #process\_limit = 1024

}



service pop3 {

&nbsp; # Max. number of POP3 processes (connections)

&nbsp; #process\_limit = 1024

}



service submission {

&nbsp; # Max. number of SMTP Submission processes (connections)

&nbsp; #process\_limit = 1024

}



service auth {

&nbsp; # auth\_socket\_path points to this userdb socket by default. It's typically

&nbsp; # used by dovecot-lda, doveadm, possibly imap process, etc. Users that have

&nbsp; # full permissions to this socket are able to get a list of all usernames and

&nbsp; # get the results of everyone's userdb lookups.

&nbsp; #

&nbsp; # The default 0666 mode allows anyone to connect to the socket, but the

&nbsp; # userdb lookups will succeed only if the userdb returns an "uid" field that

&nbsp; # matches the caller process's UID. Also if caller's uid or gid matches the

&nbsp; # socket's uid or gid the lookup succeeds. Anything else causes a failure.

&nbsp; #

&nbsp; # To give the caller full permissions to lookup all users, set the mode to

&nbsp; # something else than 0666 and Dovecot lets the kernel enforce the

&nbsp; # permissions (e.g. 0777 allows everyone full permissions).

&nbsp; unix\_listener auth-userdb {

&nbsp;   #mode = 0666

&nbsp;   #user =

&nbsp;   #group =

&nbsp; }



&nbsp; # Postfix smtp-auth

&nbsp; #unix\_listener /var/spool/postfix/private/auth {

&nbsp; #  mode = 0666

&nbsp; #}



&nbsp; # Auth process is run as this user.

&nbsp; #user = $default\_internal\_user

}



service auth-worker {

&nbsp; # Auth worker process is run as root by default, so that it can access

&nbsp; # /etc/shadow. If this isn't necessary, the user should be changed to

&nbsp; # $default\_internal\_user.

&nbsp; #user = root

}



service dict {

&nbsp; # If dict proxy is used, mail processes should have access to its socket.

&nbsp; # For example: mode=0660, group=vmail and global mail\_access\_groups=vmail

&nbsp; unix\_listener dict {

&nbsp;   #mode = 0600

&nbsp;   #user =

&nbsp;   #group =

&nbsp; }

}

root@web-mail:/etc/postfix# nano /etc/dovecot/conf.d/10-master.conf

root@web-mail:/etc/postfix# cat /etc/dovecot/conf.d/10-master.conf

\#default\_process\_limit = 100

\#default\_client\_limit = 1000



\# Default VSZ (virtual memory size) limit for service processes. This is mainly

\# intended to catch and kill processes that leak memory before they eat up

\# everything.

\#default\_vsz\_limit = 256M



\# Login user is internally used by login processes. This is the most untrusted

\# user in Dovecot system. It shouldn't have access to anything at all.

\#default\_login\_user = dovenull



\# Internal user is used by unprivileged processes. It should be separate from

\# login user, so that login processes can't disturb other processes.

\#default\_internal\_user = dovecot



service imap-login {

&nbsp; inet\_listener imap {

&nbsp;   #port = 143

&nbsp; }

&nbsp; inet\_listener imaps {

&nbsp;   #port = 993

&nbsp;   #ssl = yes

&nbsp; }



&nbsp; # Number of connections to handle before starting a new process. Typically

&nbsp; # the only useful values are 0 (unlimited) or 1. 1 is more secure, but 0

&nbsp; # is faster. <doc/wiki/LoginProcess.txt>

&nbsp; #service\_count = 1



&nbsp; # Number of processes to always keep waiting for more connections.

&nbsp; #process\_min\_avail = 0



&nbsp; # If you set service\_count=0, you probably need to grow this.

&nbsp; #vsz\_limit = $default\_vsz\_limit

}



service pop3-login {

&nbsp; inet\_listener pop3 {

&nbsp;   #port = 110

&nbsp; }

&nbsp; inet\_listener pop3s {

&nbsp;   #port = 995

&nbsp;   #ssl = yes

&nbsp; }

}



service submission-login {

&nbsp; inet\_listener submission {

&nbsp;   #port = 587

&nbsp; }

}



service lmtp {

&nbsp; unix\_listener lmtp {

&nbsp;   #mode = 0666

&nbsp; }



&nbsp; # Create inet listener only if you can't use the above UNIX socket

&nbsp; #inet\_listener lmtp {

&nbsp;   # Avoid making LMTP visible for the entire internet

&nbsp;   #address =

&nbsp;   #port =

&nbsp; #}

}



service imap {

&nbsp; # Most of the memory goes to mmap()ing files. You may need to increase this

&nbsp; # limit if you have huge mailboxes.

&nbsp; #vsz\_limit = $default\_vsz\_limit



&nbsp; # Max. number of IMAP processes (connections)

&nbsp; #process\_limit = 1024

}



service pop3 {

&nbsp; # Max. number of POP3 processes (connections)

&nbsp; #process\_limit = 1024

}



service submission {

&nbsp; # Max. number of SMTP Submission processes (connections)

&nbsp; #process\_limit = 1024

}



\#service auth {

&nbsp; # auth\_socket\_path points to this userdb socket by default. It's typically

&nbsp; # used by dovecot-lda, doveadm, possibly imap process, etc. Users that have

&nbsp; # full permissions to this socket are able to get a list of all usernames and

&nbsp; # get the results of everyone's userdb lookups.

&nbsp; #

&nbsp; # The default 0666 mode allows anyone to connect to the socket, but the

&nbsp; # userdb lookups will succeed only if the userdb returns an "uid" field that

&nbsp; # matches the caller process's UID. Also if caller's uid or gid matches the

&nbsp; # socket's uid or gid the lookup succeeds. Anything else causes a failure.

&nbsp; #

&nbsp; # To give the caller full permissions to lookup all users, set the mode to

&nbsp; # something else than 0666 and Dovecot lets the kernel enforce the

&nbsp; # permissions (e.g. 0777 allows everyone full permissions).

&nbsp;# unix\_listener auth-userdb {

&nbsp;   #mode = 0666

&nbsp;   #user =

&nbsp;   #group =

&nbsp; #}



service auth {

&nbsp; # Postfix SMTP auth

&nbsp; unix\_listener /var/spool/postfix/private/auth {

&nbsp;   mode = 0660

&nbsp;   user = postfix

&nbsp;   group = postfix

&nbsp; }

}



&nbsp; # Postfix smtp-auth

&nbsp; #unix\_listener /var/spool/postfix/private/auth {

&nbsp; #  mode = 0666

&nbsp; #}



&nbsp; # Auth process is run as this user.

&nbsp; #user = $default\_internal\_user

}



service auth-worker {

&nbsp; # Auth worker process is run as root by default, so that it can access

&nbsp; # /etc/shadow. If this isn't necessary, the user should be changed to

&nbsp; # $default\_internal\_user.

&nbsp; #user = root

}



service dict {

&nbsp; # If dict proxy is used, mail processes should have access to its socket.

&nbsp; # For example: mode=0660, group=vmail and global mail\_access\_groups=vmail

&nbsp; unix\_listener dict {

&nbsp;   #mode = 0600

&nbsp;   #user =

&nbsp;   #group =

&nbsp; }

}

root@web-mail:/etc/postfix# systemctl restart dovecot

Job for dovecot.service failed because the control process exited with error code.

See "systemctl status dovecot.service" and "journalctl -xeu dovecot.service" for details.

root@web-mail:/etc/postfix# systemctl status dovecot

× dovecot.service - Dovecot IMAP/POP3 email server

&nbsp;    Loaded: loaded (/lib/systemd/system/dovecot.service; enabled; vendor preset: enabled)

&nbsp;    Active: failed (Result: exit-code) since Thu 2025-12-04 10:41:03 UTC; 5s ago

&nbsp;      Docs: man:dovecot(1)

&nbsp;            https://doc.dovecot.org/

&nbsp;   Process: 18156 ExecStart=/usr/sbin/dovecot -F (code=exited, status=89)

&nbsp;  Main PID: 18156 (code=exited, status=89)

&nbsp;       CPU: 10ms



Dec 04 10:41:03 web-mail systemd\[1]: Starting Dovecot IMAP/POP3 email server...

Dec 04 10:41:03 web-mail dovecot\[18156]: doveconf: Fatal: Error in configuration file /etc/dovecot/conf.d/10-master.conf line 122: Unexpected '}'

Dec 04 10:41:03 web-mail systemd\[1]: dovecot.service: Main process exited, code=exited, status=89/n/a

Dec 04 10:41:03 web-mail systemd\[1]: dovecot.service: Failed with result 'exit-code'.

Dec 04 10:41:03 web-mail systemd\[1]: Failed to start Dovecot IMAP/POP3 email server.

root@web-mail:/etc/postfix# nano /etc/dovecot/conf.d/10-master.conf

root@web-mail:/etc/postfix# # there was a extra curly brisge second bracket on that file

root@web-mail:/etc/postfix# systemctl restart dovecot

Job for dovecot.service failed because the control process exited with error code.

See "systemctl status dovecot.service" and "journalctl -xeu dovecot.service" for details.

root@web-mail:/etc/postfix# systemctl status dovecot

× dovecot.service - Dovecot IMAP/POP3 email server

&nbsp;    Loaded: loaded (/lib/systemd/system/dovecot.service; enabled; vendor preset: enabled)

&nbsp;    Active: failed (Result: exit-code) since Thu 2025-12-04 10:45:45 UTC; 5s ago

&nbsp;      Docs: man:dovecot(1)

&nbsp;            https://doc.dovecot.org/

&nbsp;   Process: 18242 ExecStart=/usr/sbin/dovecot -F (code=exited, status=89)

&nbsp;  Main PID: 18242 (code=exited, status=89)

&nbsp;       CPU: 14ms



Dec 04 10:45:45 web-mail systemd\[1]: Starting Dovecot IMAP/POP3 email server...

Dec 04 10:45:45 web-mail dovecot\[18242]: Fatal: service(lmtp) access(/usr/lib/dovecot/lmtp) failed: No such file or directory

Dec 04 10:45:45 web-mail dovecot\[18242]: master: Fatal: service(lmtp) access(/usr/lib/dovecot/lmtp) failed: No such file or directory

Dec 04 10:45:45 web-mail systemd\[1]: dovecot.service: Main process exited, code=exited, status=89/n/a

Dec 04 10:45:45 web-mail systemd\[1]: dovecot.service: Failed with result 'exit-code'.

Dec 04 10:45:45 web-mail systemd\[1]: Failed to start Dovecot IMAP/POP3 email server.

root@web-mail:/etc/postfix# dovecot -n

\# 2.3.16 (7e2e900c1a): /etc/dovecot/dovecot.conf

\# Pigeonhole version 0.5.16 (09c29328)

\# OS: Linux 5.15.0-143-generic x86\_64 Ubuntu 22.04.5 LTS

\# Hostname: web-mail

disable\_plaintext\_auth = no

mail\_location = maildir:~/Maildir

mail\_privileged\_group = mail

namespace inbox {

&nbsp; inbox = yes

&nbsp; location =

&nbsp; mailbox Drafts {

&nbsp;   special\_use = \\Drafts

&nbsp; }

&nbsp; mailbox Junk {

&nbsp;   special\_use = \\Junk

&nbsp; }

&nbsp; mailbox Sent {

&nbsp;   special\_use = \\Sent

&nbsp; }

&nbsp; mailbox "Sent Messages" {

&nbsp;   special\_use = \\Sent

&nbsp; }

&nbsp; mailbox Trash {

&nbsp;   special\_use = \\Trash

&nbsp; }

&nbsp; prefix =

}

passdb {

&nbsp; driver = pam

}

protocols = imap pop3 lmtp

service auth {

&nbsp; unix\_listener /var/spool/postfix/private/auth {

&nbsp;   group = postfix

&nbsp;   mode = 0660

&nbsp;   user = postfix

&nbsp; }

}

ssl\_cert = </etc/dovecot/private/dovecot.pem

ssl\_client\_ca\_dir = /etc/ssl/certs

ssl\_dh = # hidden, use -P to show it

ssl\_key = # hidden, use -P to show it

userdb {

&nbsp; driver = passwd

}

root@web-mail:/etc/postfix# systemctl restart dovecot

Job for dovecot.service failed because the control process exited with error code.

See "systemctl status dovecot.service" and "journalctl -xeu dovecot.service" for details.

root@web-mail:/etc/postfix# journalctl -xeu dovecot.service | tail -n 30

░░ Defined-By: systemd

░░ Support: http://www.ubuntu.com/support

░░

░░ A start job for unit dovecot.service has begun execution.

░░

░░ The job identifier is 4530.

Dec 04 10:46:44 web-mail dovecot\[18262]: Fatal: service(lmtp) access(/usr/lib/dovecot/lmtp) failed: No such file or directory

Dec 04 10:46:44 web-mail dovecot\[18262]: master: Fatal: service(lmtp) access(/usr/lib/dovecot/lmtp) failed: No such file or directory

Dec 04 10:46:44 web-mail systemd\[1]: dovecot.service: Main process exited, code=exited, status=89/n/a

░░ Subject: Unit process exited

░░ Defined-By: systemd

░░ Support: http://www.ubuntu.com/support

░░

░░ An ExecStart= process belonging to unit dovecot.service has exited.

░░

░░ The process' exit code is 'exited' and its exit status is 89.

Dec 04 10:46:44 web-mail systemd\[1]: dovecot.service: Failed with result 'exit-code'.

░░ Subject: Unit failed

░░ Defined-By: systemd

░░ Support: http://www.ubuntu.com/support

░░

░░ The unit dovecot.service has entered the 'failed' state with result 'exit-code'.

Dec 04 10:46:44 web-mail systemd\[1]: Failed to start Dovecot IMAP/POP3 email server.

░░ Subject: A start job for unit dovecot.service has failed

░░ Defined-By: systemd

░░ Support: http://www.ubuntu.com/support

░░

░░ A start job for unit dovecot.service has finished with a failure.

░░

░░ The job identifier is 4530 and the job result is failed.

root@web-mail:/etc/postfix# apt install dovecot-lmtpd -y

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

The following NEW packages will be installed:

&nbsp; dovecot-lmtpd

0 upgraded, 1 newly installed, 0 to remove and 8 not upgraded.

Need to get 29.4 kB of archives.

After this operation, 136 kB of additional disk space will be used.

Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 dovecot-lmtpd amd64 1:2.3.16+dfsg1-3ubuntu2.6 \[29.4 kB]

Fetched 29.4 kB in 1s (21.7 kB/s)

Selecting previously unselected package dovecot-lmtpd.

(Reading database ... 95392 files and directories currently installed.)

Preparing to unpack .../dovecot-lmtpd\_1%3a2.3.16+dfsg1-3ubuntu2.6\_amd64.deb ...

Unpacking dovecot-lmtpd (1:2.3.16+dfsg1-3ubuntu2.6) ...

Setting up dovecot-lmtpd (1:2.3.16+dfsg1-3ubuntu2.6) ...



Creating config file /etc/dovecot/conf.d/20-lmtp.conf with new version

Processing triggers for dovecot-core (1:2.3.16+dfsg1-3ubuntu2.6) ...

Scanning processes...

Scanning candidates...

Scanning linux images...



Restarting services...

Service restarts being deferred:

&nbsp;/etc/needrestart/restart.d/dbus.service

&nbsp;systemctl restart getty@tty1.service

&nbsp;systemctl restart networkd-dispatcher.service

&nbsp;systemctl restart systemd-logind.service

&nbsp;systemctl restart unattended-upgrades.service

&nbsp;systemctl restart user@1000.service



No containers need to be restarted.



No user sessions are running outdated binaries.



No VM guests are running outdated hypervisor (qemu) binaries on this host.

root@web-mail:/etc/postfix# systemctl restart dovecot

root@web-mail:/etc/postfix# systemctl status dovecot

● dovecot.service - Dovecot IMAP/POP3 email server

&nbsp;    Loaded: loaded (/lib/systemd/system/dovecot.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (running) since Thu 2025-12-04 10:47:57 UTC; 12s ago

&nbsp;      Docs: man:dovecot(1)

&nbsp;            https://doc.dovecot.org/

&nbsp;  Main PID: 18571 (dovecot)

&nbsp;    Status: "v2.3.16 (7e2e900c1a) running"

&nbsp;     Tasks: 4 (limit: 9477)

&nbsp;    Memory: 3.3M

&nbsp;       CPU: 23ms

&nbsp;    CGroup: /system.slice/dovecot.service

&nbsp;            ├─18571 /usr/sbin/dovecot -F

&nbsp;            ├─18572 dovecot/anvil

&nbsp;            ├─18573 dovecot/log

&nbsp;            └─18574 dovecot/config



Dec 04 10:47:57 web-mail systemd\[1]: Starting Dovecot IMAP/POP3 email server...

Dec 04 10:47:57 web-mail dovecot\[18571]: master: Dovecot v2.3.16 (7e2e900c1a) starting up for imap, pop3, lmtp (core dumps disabled)

Dec 04 10:47:57 web-mail systemd\[1]: Started Dovecot IMAP/POP3 email server.

root@web-mail:/etc/postfix#

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#TROUBE SHUTTING 

ubuntu@web-mail:~$ ls -la /etc/nginx/sites-enabled/
total 8
drwxr-xr-x 2 root root 4096 Dec  4 08:31 .
drwxr-xr-x 8 root root 4096 Dec  4 08:29 ..
lrwxrwxrwx 1 root root   37 Dec  4 08:31 gelani.com -> /etc/nginx/sites-available/gelani.com
ubuntu@web-mail:~$ cat /etc/nginx/sites-enabled/gelani.com
server {
    listen 80;
    listen [::]:80;

    # Server names - domain and www alias
    server_name gelani.com www.gelani.com;

    # Document root
    root /var/www/gelani.com/html;
    index index.html index.htm;

    # Logs
    access_log /var/log/nginx/gelani.com.access.log;
    error_log /var/log/nginx/gelani.com.error.log;

    # Main location
    location / {
        try_files $uri $uri/ =404;
    }
}

ubuntu@web-mail:~$ sudo apt install php php-fpm php-mysql php-xml php-mbstring php-intl php-zip php-curl php-gd php-imagick php-ldap -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils bzip2 fonts-droid-fallback fonts-noto-mono fonts-urw-base35 ghostscript gsfonts imagemagick-6-common libaom3
  libapache2-mod-php8.1 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libdav1d5 libde265-0
  libfftw3-double3 libgomp1 libgs9 libgs9-common libheif1 libidn12 libijs-0.35 libjbig2dec0 liblcms2-2 liblqr-1-0 libltdl7 libmagickcore-6.q16-6 libmagickwand-6.q16-6
  libonig5 libopenjp2-7 libpaper-utils libpaper1 libwebpdemux2 libwebpmux3 libx265-199 libzip4 mailcap mime-support php-common php8.1 php8.1-cli php8.1-common
  php8.1-curl php8.1-fpm php8.1-gd php8.1-imagick php8.1-intl php8.1-ldap php8.1-mbstring php8.1-mysql php8.1-opcache php8.1-readline php8.1-xml php8.1-zip poppler-data
Suggested packages:
  apache2-doc apache2-suexec-pristine | apache2-suexec-custom www-browser bzip2-doc fonts-noto fonts-freefont-otf | fonts-freefont-ttf fonts-texgyre ghostscript-x
  php-pear cups-common libfftw3-bin libfftw3-dev liblcms2-utils libmagickcore-6.q16-6-extra poppler-utils fonts-japanese-mincho | fonts-ipafont-mincho
  fonts-japanese-gothic | fonts-ipafont-gothic fonts-arphic-ukai fonts-arphic-uming fonts-nanum
Recommended packages:
  ttf-dejavu-core
The following NEW packages will be installed:
  apache2 apache2-bin apache2-data apache2-utils bzip2 fonts-droid-fallback fonts-noto-mono fonts-urw-base35 ghostscript gsfonts imagemagick-6-common libaom3
  libapache2-mod-php8.1 libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libavahi-client3 libavahi-common-data libavahi-common3 libcups2 libdav1d5 libde265-0
  libfftw3-double3 libgomp1 libgs9 libgs9-common libheif1 libidn12 libijs-0.35 libjbig2dec0 liblcms2-2 liblqr-1-0 libltdl7 libmagickcore-6.q16-6 libmagickwand-6.q16-6
  libonig5 libopenjp2-7 libpaper-utils libpaper1 libwebpdemux2 libwebpmux3 libx265-199 libzip4 mailcap mime-support php php-common php-curl php-fpm php-gd php-imagick
  php-intl php-ldap php-mbstring php-mysql php-xml php-zip php8.1 php8.1-cli php8.1-common php8.1-curl php8.1-fpm php8.1-gd php8.1-imagick php8.1-intl php8.1-ldap
  php8.1-mbstring php8.1-mysql php8.1-opcache php8.1-readline php8.1-xml php8.1-zip poppler-data
0 upgraded, 74 newly installed, 0 to remove and 8 not upgraded.
Need to get 37.9 MB of archives.
After this operation, 145 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapr1 amd64 1.7.0-8ubuntu0.22.04.2 [108 kB]
Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libaprutil1 amd64 1.6.1-5ubuntu4.22.04.2 [92.8 kB]
Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libaprutil1-dbd-sqlite3 amd64 1.6.1-5ubuntu4.22.04.2 [11.3 kB]
Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libaprutil1-ldap amd64 1.6.1-5ubuntu4.22.04.2 [9170 B]
Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2-bin amd64 2.4.52-1ubuntu4.16 [1349 kB]
Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2-data all 2.4.52-1ubuntu4.16 [165 kB]
Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2-utils amd64 2.4.52-1ubuntu4.16 [89.3 kB]
Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 mailcap all 3.70+nmu1ubuntu1 [23.8 kB]
Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 mime-support all 3.66 [3696 B]
Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apache2 amd64 2.4.52-1ubuntu4.16 [97.9 kB]
Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 fonts-droid-fallback all 1:6.0.1r16-1.1build1 [1805 kB]
Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgomp1 amd64 12.3.0-1ubuntu1~22.04.2 [127 kB]
Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libfftw3-double3 amd64 3.3.8-2ubuntu8 [770 kB]
Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libaom3 amd64 3.3.0-1ubuntu0.1 [1748 kB]
Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libdav1d5 amd64 0.9.2-1 [463 kB]
Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libde265-0 amd64 1.0.8-1ubuntu0.3 [290 kB]
Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libx265-199 amd64 3.5-2 [1170 kB]
Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libheif1 amd64 1.12.0-2build1 [196 kB]
Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 liblcms2-2 amd64 2.12~rc1-2build2 [159 kB]
Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 liblqr-1-0 amd64 0.4.2-2.1 [27.7 kB]
Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libltdl7 amd64 2.4.6-15build2 [39.6 kB]
Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libopenjp2-7 amd64 2.4.0-6ubuntu0.4 [158 kB]
Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libwebpdemux2 amd64 1.2.2-2ubuntu0.22.04.2 [9964 B]
Get:24 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libwebpmux3 amd64 1.2.2-2ubuntu0.22.04.2 [20.5 kB]
Get:25 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 imagemagick-6-common all 8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5 [64.3 kB]
Get:26 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libmagickcore-6.q16-6 amd64 8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5 [1795 kB]
Get:27 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libmagickwand-6.q16-6 amd64 8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5 [328 kB]
Get:28 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-common all 2:92ubuntu1 [12.4 kB]
Get:29 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-common amd64 8.1.2-1ubuntu2.22 [1129 kB]
Get:30 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-opcache amd64 8.1.2-1ubuntu2.22 [365 kB]
Get:31 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-readline amd64 8.1.2-1ubuntu2.22 [13.6 kB]
Get:32 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-cli amd64 8.1.2-1ubuntu2.22 [1835 kB]
Get:33 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 php8.1-fpm amd64 8.1.2-1ubuntu2.22 [1841 kB]
Get:34 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libapache2-mod-php8.1 amd64 8.1.2-1ubuntu2.22 [1765 kB]
Get:35 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php8.1-imagick amd64 3.6.0-4ubuntu1 [117 kB]
Get:36 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-imagick amd64 3.6.0-4ubuntu1 [4436 B]
Get:37 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 poppler-data all 0.4.11-1 [2171 kB]
Get:38 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 bzip2 amd64 1.0.8-5build1 [34.8 kB]
Get:39 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 fonts-noto-mono all 20201225-1build1 [397 kB]
Get:40 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 fonts-urw-base35 all 20200910-1 [6367 kB]
Get:41 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgs9-common all 9.55.0~dfsg1-0ubuntu5.13 [753 kB]
Get:42 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libavahi-common-data amd64 0.8-5ubuntu5.3 [23.9 kB]
Get:43 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libavahi-common3 amd64 0.8-5ubuntu5.3 [23.9 kB]
Get:44 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libavahi-client3 amd64 0.8-5ubuntu5.3 [28.1 kB]
Get:45 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcups2 amd64 2.4.1op1-1ubuntu4.15 [264 kB]
Get:46 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libidn12 amd64 1.38-4ubuntu1 [60.0 kB]
Get:47 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libijs-0.35 amd64 0.35-15build2 [16.5 kB]
Get:48 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libjbig2dec0 amd64 0.19-3build2 [64.7 kB]
Get:49 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libpaper1 amd64 1.1.28build2 [13.8 kB]
Get:50 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgs9 amd64 9.55.0~dfsg1-0ubuntu5.13 [5032 kB]
Get:51 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ghostscript amd64 9.55.0~dfsg1-0ubuntu5.13 [49.4 kB]
Get:52 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 gsfonts all 1:8.11+urwcyr1.0.7~pre44-4.5 [3120 kB]
Get:53 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libonig5 amd64 6.9.7.1-2build1 [172 kB]
Get:54 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libpaper-utils amd64 1.1.28build2 [8674 B]
Get:55 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libzip4 amd64 1.7.3-1ubuntu2 [55.0 kB]
Get:56 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1 all 8.1.2-1ubuntu2.22 [9162 B]
Get:57 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php all 2:8.1+92ubuntu1 [2756 B]
Get:58 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-curl amd64 8.1.2-1ubuntu2.22 [38.8 kB]
Get:59 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-curl all 2:8.1+92ubuntu1 [1834 B]
Get:60 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-fpm all 2:8.1+92ubuntu1 [2838 B]
Get:61 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-gd amd64 8.1.2-1ubuntu2.22 [32.6 kB]
Get:62 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-gd all 2:8.1+92ubuntu1 [1828 B]
Get:63 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 php8.1-intl amd64 8.1.2-1ubuntu2.22 [142 kB]
Get:64 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-intl all 2:8.1+92ubuntu1 [1840 B]
Get:65 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-ldap amd64 8.1.2-1ubuntu2.22 [34.2 kB]
Get:66 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-ldap all 2:8.1+92ubuntu1 [1836 B]
Get:67 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-mbstring amd64 8.1.2-1ubuntu2.22 [484 kB]
Get:68 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-mbstring all 2:8.1+92ubuntu1 [1844 B]
Get:69 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-mysql amd64 8.1.2-1ubuntu2.22 [131 kB]
Get:70 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-mysql all 2:8.1+92ubuntu1 [1834 B]
Get:71 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 php8.1-xml amd64 8.1.2-1ubuntu2.22 [120 kB]
Get:72 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-xml all 2:8.1+92ubuntu1 [1850 B]
Get:73 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 php8.1-zip amd64 8.1.2-1ubuntu2.22 [27.1 kB]
Get:74 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-zip all 2:8.1+92ubuntu1 [1830 B]
Fetched 37.9 MB in 12s (3148 kB/s)
Extracting templates from packages: 100%
Preconfiguring packages ...
Selecting previously unselected package libapr1:amd64.
(Reading database ... 95399 files and directories currently installed.)
Preparing to unpack .../00-libapr1_1.7.0-8ubuntu0.22.04.2_amd64.deb ...
Unpacking libapr1:amd64 (1.7.0-8ubuntu0.22.04.2) ...
Selecting previously unselected package libaprutil1:amd64.
Preparing to unpack .../01-libaprutil1_1.6.1-5ubuntu4.22.04.2_amd64.deb ...
Unpacking libaprutil1:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Selecting previously unselected package libaprutil1-dbd-sqlite3:amd64.
Preparing to unpack .../02-libaprutil1-dbd-sqlite3_1.6.1-5ubuntu4.22.04.2_amd64.deb ...
Unpacking libaprutil1-dbd-sqlite3:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Selecting previously unselected package libaprutil1-ldap:amd64.
Preparing to unpack .../03-libaprutil1-ldap_1.6.1-5ubuntu4.22.04.2_amd64.deb ...
Unpacking libaprutil1-ldap:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Selecting previously unselected package apache2-bin.
Preparing to unpack .../04-apache2-bin_2.4.52-1ubuntu4.16_amd64.deb ...
Unpacking apache2-bin (2.4.52-1ubuntu4.16) ...
Selecting previously unselected package apache2-data.
Preparing to unpack .../05-apache2-data_2.4.52-1ubuntu4.16_all.deb ...
Unpacking apache2-data (2.4.52-1ubuntu4.16) ...
Selecting previously unselected package apache2-utils.
Preparing to unpack .../06-apache2-utils_2.4.52-1ubuntu4.16_amd64.deb ...
Unpacking apache2-utils (2.4.52-1ubuntu4.16) ...
Selecting previously unselected package mailcap.
Preparing to unpack .../07-mailcap_3.70+nmu1ubuntu1_all.deb ...
Unpacking mailcap (3.70+nmu1ubuntu1) ...
Selecting previously unselected package mime-support.
Preparing to unpack .../08-mime-support_3.66_all.deb ...
Unpacking mime-support (3.66) ...
Selecting previously unselected package apache2.
Preparing to unpack .../09-apache2_2.4.52-1ubuntu4.16_amd64.deb ...
Unpacking apache2 (2.4.52-1ubuntu4.16) ...
Selecting previously unselected package fonts-droid-fallback.
Preparing to unpack .../10-fonts-droid-fallback_1%3a6.0.1r16-1.1build1_all.deb ...
Unpacking fonts-droid-fallback (1:6.0.1r16-1.1build1) ...
Selecting previously unselected package libgomp1:amd64.
Preparing to unpack .../11-libgomp1_12.3.0-1ubuntu1~22.04.2_amd64.deb ...
Unpacking libgomp1:amd64 (12.3.0-1ubuntu1~22.04.2) ...
Selecting previously unselected package libfftw3-double3:amd64.
Preparing to unpack .../12-libfftw3-double3_3.3.8-2ubuntu8_amd64.deb ...
Unpacking libfftw3-double3:amd64 (3.3.8-2ubuntu8) ...
Selecting previously unselected package libaom3:amd64.
Preparing to unpack .../13-libaom3_3.3.0-1ubuntu0.1_amd64.deb ...
Unpacking libaom3:amd64 (3.3.0-1ubuntu0.1) ...
Selecting previously unselected package libdav1d5:amd64.
Preparing to unpack .../14-libdav1d5_0.9.2-1_amd64.deb ...
Unpacking libdav1d5:amd64 (0.9.2-1) ...
Selecting previously unselected package libde265-0:amd64.
Preparing to unpack .../15-libde265-0_1.0.8-1ubuntu0.3_amd64.deb ...
Unpacking libde265-0:amd64 (1.0.8-1ubuntu0.3) ...
Selecting previously unselected package libx265-199:amd64.
Preparing to unpack .../16-libx265-199_3.5-2_amd64.deb ...
Unpacking libx265-199:amd64 (3.5-2) ...
Selecting previously unselected package libheif1:amd64.
Preparing to unpack .../17-libheif1_1.12.0-2build1_amd64.deb ...
Unpacking libheif1:amd64 (1.12.0-2build1) ...
Selecting previously unselected package liblcms2-2:amd64.
Preparing to unpack .../18-liblcms2-2_2.12~rc1-2build2_amd64.deb ...
Unpacking liblcms2-2:amd64 (2.12~rc1-2build2) ...
Selecting previously unselected package liblqr-1-0:amd64.
Preparing to unpack .../19-liblqr-1-0_0.4.2-2.1_amd64.deb ...
Unpacking liblqr-1-0:amd64 (0.4.2-2.1) ...
Selecting previously unselected package libltdl7:amd64.
Preparing to unpack .../20-libltdl7_2.4.6-15build2_amd64.deb ...
Unpacking libltdl7:amd64 (2.4.6-15build2) ...
Selecting previously unselected package libopenjp2-7:amd64.
Preparing to unpack .../21-libopenjp2-7_2.4.0-6ubuntu0.4_amd64.deb ...
Unpacking libopenjp2-7:amd64 (2.4.0-6ubuntu0.4) ...
Selecting previously unselected package libwebpdemux2:amd64.
Preparing to unpack .../22-libwebpdemux2_1.2.2-2ubuntu0.22.04.2_amd64.deb ...
Unpacking libwebpdemux2:amd64 (1.2.2-2ubuntu0.22.04.2) ...
Selecting previously unselected package libwebpmux3:amd64.
Preparing to unpack .../23-libwebpmux3_1.2.2-2ubuntu0.22.04.2_amd64.deb ...
Unpacking libwebpmux3:amd64 (1.2.2-2ubuntu0.22.04.2) ...
Selecting previously unselected package imagemagick-6-common.
Preparing to unpack .../24-imagemagick-6-common_8%3a6.9.11.60+dfsg-1.3ubuntu0.22.04.5_all.deb ...
Unpacking imagemagick-6-common (8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5) ...
Selecting previously unselected package libmagickcore-6.q16-6:amd64.
Preparing to unpack .../25-libmagickcore-6.q16-6_8%3a6.9.11.60+dfsg-1.3ubuntu0.22.04.5_amd64.deb ...
Unpacking libmagickcore-6.q16-6:amd64 (8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5) ...
Selecting previously unselected package libmagickwand-6.q16-6:amd64.
Preparing to unpack .../26-libmagickwand-6.q16-6_8%3a6.9.11.60+dfsg-1.3ubuntu0.22.04.5_amd64.deb ...
Unpacking libmagickwand-6.q16-6:amd64 (8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5) ...
Selecting previously unselected package php-common.
Preparing to unpack .../27-php-common_2%3a92ubuntu1_all.deb ...
Unpacking php-common (2:92ubuntu1) ...
Selecting previously unselected package php8.1-common.
Preparing to unpack .../28-php8.1-common_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-common (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php8.1-opcache.
Preparing to unpack .../29-php8.1-opcache_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-opcache (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php8.1-readline.
Preparing to unpack .../30-php8.1-readline_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-readline (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php8.1-cli.
Preparing to unpack .../31-php8.1-cli_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-cli (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php8.1-fpm.
Preparing to unpack .../32-php8.1-fpm_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-fpm (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package libapache2-mod-php8.1.
Preparing to unpack .../33-libapache2-mod-php8.1_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking libapache2-mod-php8.1 (8.1.2-1ubuntu2.22) ...
Setting up php-common (2:92ubuntu1) ...
Created symlink /etc/systemd/system/timers.target.wants/phpsessionclean.timer → /lib/systemd/system/phpsessionclean.timer.
Selecting previously unselected package php8.1-imagick.
(Reading database ... 96641 files and directories currently installed.)
Preparing to unpack .../00-php8.1-imagick_3.6.0-4ubuntu1_amd64.deb ...
Unpacking php8.1-imagick (3.6.0-4ubuntu1) ...
Selecting previously unselected package php-imagick.
Preparing to unpack .../01-php-imagick_3.6.0-4ubuntu1_amd64.deb ...
Unpacking php-imagick (3.6.0-4ubuntu1) ...
Selecting previously unselected package poppler-data.
Preparing to unpack .../02-poppler-data_0.4.11-1_all.deb ...
Unpacking poppler-data (0.4.11-1) ...
Selecting previously unselected package bzip2.
Preparing to unpack .../03-bzip2_1.0.8-5build1_amd64.deb ...
Unpacking bzip2 (1.0.8-5build1) ...
Selecting previously unselected package fonts-noto-mono.
Preparing to unpack .../04-fonts-noto-mono_20201225-1build1_all.deb ...
Unpacking fonts-noto-mono (20201225-1build1) ...
Selecting previously unselected package fonts-urw-base35.
Preparing to unpack .../05-fonts-urw-base35_20200910-1_all.deb ...
Unpacking fonts-urw-base35 (20200910-1) ...
Selecting previously unselected package libgs9-common.
Preparing to unpack .../06-libgs9-common_9.55.0~dfsg1-0ubuntu5.13_all.deb ...
Unpacking libgs9-common (9.55.0~dfsg1-0ubuntu5.13) ...
Selecting previously unselected package libavahi-common-data:amd64.
Preparing to unpack .../07-libavahi-common-data_0.8-5ubuntu5.3_amd64.deb ...
Unpacking libavahi-common-data:amd64 (0.8-5ubuntu5.3) ...
Selecting previously unselected package libavahi-common3:amd64.
Preparing to unpack .../08-libavahi-common3_0.8-5ubuntu5.3_amd64.deb ...
Unpacking libavahi-common3:amd64 (0.8-5ubuntu5.3) ...
Selecting previously unselected package libavahi-client3:amd64.
Preparing to unpack .../09-libavahi-client3_0.8-5ubuntu5.3_amd64.deb ...
Unpacking libavahi-client3:amd64 (0.8-5ubuntu5.3) ...
Selecting previously unselected package libcups2:amd64.
Preparing to unpack .../10-libcups2_2.4.1op1-1ubuntu4.15_amd64.deb ...
Unpacking libcups2:amd64 (2.4.1op1-1ubuntu4.15) ...
Selecting previously unselected package libidn12:amd64.
Preparing to unpack .../11-libidn12_1.38-4ubuntu1_amd64.deb ...
Unpacking libidn12:amd64 (1.38-4ubuntu1) ...
Selecting previously unselected package libijs-0.35:amd64.
Preparing to unpack .../12-libijs-0.35_0.35-15build2_amd64.deb ...
Unpacking libijs-0.35:amd64 (0.35-15build2) ...
Selecting previously unselected package libjbig2dec0:amd64.
Preparing to unpack .../13-libjbig2dec0_0.19-3build2_amd64.deb ...
Unpacking libjbig2dec0:amd64 (0.19-3build2) ...
Selecting previously unselected package libpaper1:amd64.
Preparing to unpack .../14-libpaper1_1.1.28build2_amd64.deb ...
Unpacking libpaper1:amd64 (1.1.28build2) ...
Selecting previously unselected package libgs9:amd64.
Preparing to unpack .../15-libgs9_9.55.0~dfsg1-0ubuntu5.13_amd64.deb ...
Unpacking libgs9:amd64 (9.55.0~dfsg1-0ubuntu5.13) ...
Selecting previously unselected package ghostscript.
Preparing to unpack .../16-ghostscript_9.55.0~dfsg1-0ubuntu5.13_amd64.deb ...
Unpacking ghostscript (9.55.0~dfsg1-0ubuntu5.13) ...
Selecting previously unselected package gsfonts.
Preparing to unpack .../17-gsfonts_1%3a8.11+urwcyr1.0.7~pre44-4.5_all.deb ...
Unpacking gsfonts (1:8.11+urwcyr1.0.7~pre44-4.5) ...
Selecting previously unselected package libonig5:amd64.
Preparing to unpack .../18-libonig5_6.9.7.1-2build1_amd64.deb ...
Unpacking libonig5:amd64 (6.9.7.1-2build1) ...
Selecting previously unselected package libpaper-utils.
Preparing to unpack .../19-libpaper-utils_1.1.28build2_amd64.deb ...
Unpacking libpaper-utils (1.1.28build2) ...
Selecting previously unselected package libzip4:amd64.
Preparing to unpack .../20-libzip4_1.7.3-1ubuntu2_amd64.deb ...
Unpacking libzip4:amd64 (1.7.3-1ubuntu2) ...
Selecting previously unselected package php8.1.
Preparing to unpack .../21-php8.1_8.1.2-1ubuntu2.22_all.deb ...
Unpacking php8.1 (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php.
Preparing to unpack .../22-php_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-curl.
Preparing to unpack .../23-php8.1-curl_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-curl (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-curl.
Preparing to unpack .../24-php-curl_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-curl (2:8.1+92ubuntu1) ...
Selecting previously unselected package php-fpm.
Preparing to unpack .../25-php-fpm_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-fpm (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-gd.
Preparing to unpack .../26-php8.1-gd_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-gd (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-gd.
Preparing to unpack .../27-php-gd_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-gd (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-intl.
Preparing to unpack .../28-php8.1-intl_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-intl (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-intl.
Preparing to unpack .../29-php-intl_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-intl (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-ldap.
Preparing to unpack .../30-php8.1-ldap_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-ldap (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-ldap.
Preparing to unpack .../31-php-ldap_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-ldap (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-mbstring.
Preparing to unpack .../32-php8.1-mbstring_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-mbstring (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-mbstring.
Preparing to unpack .../33-php-mbstring_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-mbstring (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-mysql.
Preparing to unpack .../34-php8.1-mysql_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-mysql (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-mysql.
Preparing to unpack .../35-php-mysql_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-mysql (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-xml.
Preparing to unpack .../36-php8.1-xml_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-xml (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-xml.
Preparing to unpack .../37-php-xml_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-xml (2:8.1+92ubuntu1) ...
Selecting previously unselected package php8.1-zip.
Preparing to unpack .../38-php8.1-zip_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-zip (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-zip.
Preparing to unpack .../39-php-zip_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-zip (2:8.1+92ubuntu1) ...
Setting up liblcms2-2:amd64 (2.12~rc1-2build2) ...
Setting up libpaper1:amd64 (1.1.28build2) ...

Creating config file /etc/papersize with new version
Setting up libaom3:amd64 (3.3.0-1ubuntu0.1) ...
Setting up imagemagick-6-common (8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5) ...
Setting up fonts-noto-mono (20201225-1build1) ...
Setting up php8.1-common (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/calendar.ini with new version

Creating config file /etc/php/8.1/mods-available/ctype.ini with new version

Creating config file /etc/php/8.1/mods-available/exif.ini with new version

Creating config file /etc/php/8.1/mods-available/fileinfo.ini with new version

Creating config file /etc/php/8.1/mods-available/ffi.ini with new version

Creating config file /etc/php/8.1/mods-available/ftp.ini with new version

Creating config file /etc/php/8.1/mods-available/gettext.ini with new version

Creating config file /etc/php/8.1/mods-available/iconv.ini with new version

Creating config file /etc/php/8.1/mods-available/pdo.ini with new version

Creating config file /etc/php/8.1/mods-available/phar.ini with new version

Creating config file /etc/php/8.1/mods-available/posix.ini with new version

Creating config file /etc/php/8.1/mods-available/shmop.ini with new version

Creating config file /etc/php/8.1/mods-available/sockets.ini with new version

Creating config file /etc/php/8.1/mods-available/sysvmsg.ini with new version

Creating config file /etc/php/8.1/mods-available/sysvsem.ini with new version

Creating config file /etc/php/8.1/mods-available/sysvshm.ini with new version

Creating config file /etc/php/8.1/mods-available/tokenizer.ini with new version
Setting up libzip4:amd64 (1.7.3-1ubuntu2) ...
Setting up libijs-0.35:amd64 (0.35-15build2) ...
Setting up libwebpdemux2:amd64 (1.2.2-2ubuntu0.22.04.2) ...
Setting up php8.1-gd (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/gd.ini with new version
Setting up libapr1:amd64 (1.7.0-8ubuntu0.22.04.2) ...
Setting up libpaper-utils (1.1.28build2) ...
Setting up fonts-urw-base35 (20200910-1) ...
Setting up libgomp1:amd64 (12.3.0-1ubuntu1~22.04.2) ...
Setting up bzip2 (1.0.8-5build1) ...
Setting up php8.1-curl (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/curl.ini with new version
Setting up poppler-data (0.4.11-1) ...
Setting up php8.1-xml (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/dom.ini with new version

Creating config file /etc/php/8.1/mods-available/simplexml.ini with new version

Creating config file /etc/php/8.1/mods-available/xml.ini with new version

Creating config file /etc/php/8.1/mods-available/xmlreader.ini with new version

Creating config file /etc/php/8.1/mods-available/xmlwriter.ini with new version

Creating config file /etc/php/8.1/mods-available/xsl.ini with new version
Setting up php8.1-mysql (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/mysqlnd.ini with new version

Creating config file /etc/php/8.1/mods-available/mysqli.ini with new version

Creating config file /etc/php/8.1/mods-available/pdo_mysql.ini with new version
Setting up libjbig2dec0:amd64 (0.19-3build2) ...
Setting up gsfonts (1:8.11+urwcyr1.0.7~pre44-4.5) ...
Setting up libavahi-common-data:amd64 (0.8-5ubuntu5.3) ...
Setting up libidn12:amd64 (1.38-4ubuntu1) ...
Setting up libltdl7:amd64 (2.4.6-15build2) ...
Setting up libfftw3-double3:amd64 (3.3.8-2ubuntu8) ...
Setting up libx265-199:amd64 (3.5-2) ...
Setting up liblqr-1-0:amd64 (0.4.2-2.1) ...
Setting up php8.1-zip (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/zip.ini with new version
Setting up libopenjp2-7:amd64 (2.4.0-6ubuntu0.4) ...
Setting up php-gd (2:8.1+92ubuntu1) ...
Setting up php8.1-readline (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/readline.ini with new version
Setting up apache2-data (2.4.52-1ubuntu4.16) ...
Setting up fonts-droid-fallback (1:6.0.1r16-1.1build1) ...
Setting up libdav1d5:amd64 (0.9.2-1) ...
Setting up libde265-0:amd64 (1.0.8-1ubuntu0.3) ...
Setting up libwebpmux3:amd64 (1.2.2-2ubuntu0.22.04.2) ...
Setting up mailcap (3.70+nmu1ubuntu1) ...
Setting up php8.1-opcache (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/opcache.ini with new version
Setting up php8.1-intl (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/intl.ini with new version
Setting up libonig5:amd64 (6.9.7.1-2build1) ...
Setting up php8.1-ldap (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/ldap.ini with new version
Setting up libaprutil1:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Setting up libgs9-common (9.55.0~dfsg1-0ubuntu5.13) ...
Setting up php-xml (2:8.1+92ubuntu1) ...
Setting up php-curl (2:8.1+92ubuntu1) ...
Setting up php-mysql (2:8.1+92ubuntu1) ...
Setting up mime-support (3.66) ...
Setting up php8.1-mbstring (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/mbstring.ini with new version
Setting up libheif1:amd64 (1.12.0-2build1) ...
Setting up libavahi-common3:amd64 (0.8-5ubuntu5.3) ...
Setting up libaprutil1-ldap:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Setting up php-mbstring (2:8.1+92ubuntu1) ...
Setting up libaprutil1-dbd-sqlite3:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Setting up php-intl (2:8.1+92ubuntu1) ...
Setting up libmagickcore-6.q16-6:amd64 (8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5) ...
Setting up php-ldap (2:8.1+92ubuntu1) ...
Setting up php8.1-cli (8.1.2-1ubuntu2.22) ...
update-alternatives: using /usr/bin/php8.1 to provide /usr/bin/php (php) in auto mode
update-alternatives: using /usr/bin/phar8.1 to provide /usr/bin/phar (phar) in auto mode
update-alternatives: using /usr/bin/phar.phar8.1 to provide /usr/bin/phar.phar (phar.phar) in auto mode

Creating config file /etc/php/8.1/cli/php.ini with new version
Setting up php-zip (2:8.1+92ubuntu1) ...
Setting up libmagickwand-6.q16-6:amd64 (8:6.9.11.60+dfsg-1.3ubuntu0.22.04.5) ...
Setting up php8.1-imagick (3.6.0-4ubuntu1) ...
Setting up php-imagick (3.6.0-4ubuntu1) ...
Setting up libavahi-client3:amd64 (0.8-5ubuntu5.3) ...
Setting up apache2-utils (2.4.52-1ubuntu4.16) ...
Setting up apache2-bin (2.4.52-1ubuntu4.16) ...
Setting up php8.1-fpm (8.1.2-1ubuntu2.22) ...
Package apache2 is not configured yet. Will defer actions by package php8.1-fpm.

Creating config file /etc/php/8.1/fpm/php.ini with new version
NOTICE: Not enabling PHP 8.1 FPM by default.
NOTICE: To enable PHP 8.1 FPM in Apache2 do:
NOTICE: a2enmod proxy_fcgi setenvif
NOTICE: a2enconf php8.1-fpm
NOTICE: You are seeing this message because you have apache2 package installed.
Created symlink /etc/systemd/system/multi-user.target.wants/php8.1-fpm.service → /lib/systemd/system/php8.1-fpm.service.
Setting up php-fpm (2:8.1+92ubuntu1) ...
Setting up libcups2:amd64 (2.4.1op1-1ubuntu4.15) ...
Setting up libapache2-mod-php8.1 (8.1.2-1ubuntu2.22) ...
Package apache2 is not configured yet. Will defer actions by package libapache2-mod-php8.1.

Creating config file /etc/php/8.1/apache2/php.ini with new version
No module matches
Setting up libgs9:amd64 (9.55.0~dfsg1-0ubuntu5.13) ...
Setting up apache2 (2.4.52-1ubuntu4.16) ...
Enabling module mpm_event.
Enabling module authz_core.
Enabling module authz_host.
Enabling module authn_core.
Enabling module auth_basic.
Enabling module access_compat.
Enabling module authn_file.
Enabling module authz_user.
Enabling module alias.
Enabling module dir.
Enabling module autoindex.
Enabling module env.
Enabling module mime.
Enabling module negotiation.
Enabling module setenvif.
Enabling module filter.
Enabling module deflate.
Enabling module status.
Enabling module reqtimeout.
Enabling conf charset.
Enabling conf localized-error-pages.
Enabling conf other-vhosts-access-log.
Enabling conf security.
Enabling conf serve-cgi-bin.
Enabling site 000-default.
info: Switch to mpm prefork for package libapache2-mod-php8.1
Module mpm_event disabled.
Enabling module mpm_prefork.
info: Executing deferred 'a2enmod php8.1' for package libapache2-mod-php8.1
Enabling module php8.1.
Created symlink /etc/systemd/system/multi-user.target.wants/apache2.service → /lib/systemd/system/apache2.service.
Could not execute systemctl:  at /usr/bin/deb-systemd-invoke line 142.
Created symlink /etc/systemd/system/multi-user.target.wants/apache-htcacheclean.service → /lib/systemd/system/apache-htcacheclean.service.
Setting up ghostscript (9.55.0~dfsg1-0ubuntu5.13) ...
Setting up php8.1 (8.1.2-1ubuntu2.22) ...
Setting up php (2:8.1+92ubuntu1) ...
Processing triggers for ufw (0.36.1-4ubuntu0.1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.11) ...
Processing triggers for php8.1-cli (8.1.2-1ubuntu2.22) ...
Processing triggers for php8.1-fpm (8.1.2-1ubuntu2.22) ...
NOTICE: Not enabling PHP 8.1 FPM by default.
NOTICE: To enable PHP 8.1 FPM in Apache2 do:
NOTICE: a2enmod proxy_fcgi setenvif
NOTICE: a2enconf php8.1-fpm
NOTICE: You are seeing this message because you have apache2 package installed.
Processing triggers for libapache2-mod-php8.1 (8.1.2-1ubuntu2.22) ...
Job for apache2.service failed because the control process exited with error code.
See "systemctl status apache2.service" and "journalctl -xeu apache2.service" for details.
invoke-rc.d: initscript apache2, action "restart" failed.
× apache2.service - The Apache HTTP Server
     Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
     Active: failed (Result: exit-code) since Thu 2025-12-04 12:04:13 UTC; 5ms ago
       Docs: https://httpd.apache.org/docs/2.4/
    Process: 35127 ExecStart=/usr/sbin/apachectl start (code=exited, status=1/FAILURE)
        CPU: 16ms

Dec 04 12:04:13 web-mail systemd[1]: Starting The Apache HTTP Server...
Dec 04 12:04:13 web-mail apachectl[35130]: (98)Address already in use: AH00072: make_sock: could not bind to address [::]:80
Dec 04 12:04:13 web-mail apachectl[35130]: (98)Address already in use: AH00072: make_sock: could not bind to address 0.0.0.0:80
Dec 04 12:04:13 web-mail apachectl[35130]: no listening sockets available, shutting down
Dec 04 12:04:13 web-mail apachectl[35130]: AH00015: Unable to open logs
Dec 04 12:04:13 web-mail apachectl[35127]: Action 'start' failed.
Dec 04 12:04:13 web-mail apachectl[35127]: The Apache error log may have more information.
Dec 04 12:04:13 web-mail systemd[1]: apache2.service: Control process exited, code=exited, status=1/FAILURE
Dec 04 12:04:13 web-mail systemd[1]: apache2.service: Failed with result 'exit-code'.
Dec 04 12:04:13 web-mail systemd[1]: Failed to start The Apache HTTP Server.
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

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@web-mail:~$ systemctl stop apache2
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to stop 'apache2.service'.
Authenticating as: Ubuntu (ubuntu)
Password:
==== AUTHENTICATION COMPLETE ===
ubuntu@web-mail:~$ systemctl stop apache2
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to stop 'apache2.service'.
Authenticating as: Ubuntu (ubuntu)
Password:
ubuntu@web-mail:~$ systemctl disable apache2
Synchronizing state of apache2.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install disable apache2
==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
Authentication is required to reload the systemd state.
Authenticating as: Ubuntu (ubuntu)
Password:
polkit-agent-helper-1: pam_authenticate failed: Authentication failure
==== AUTHENTICATION FAILED ===
Failed to reload daemon: Access denied
update-rc.d: error: Permission denied
ubuntu@web-mail:~$ sudo systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2025-12-04 08:31:19 UTC; 3h 34min ago
       Docs: man:nginx(8)
   Main PID: 11869 (nginx)
      Tasks: 5 (limit: 9477)
     Memory: 4.9M
        CPU: 39ms
     CGroup: /system.slice/nginx.service
             ├─11869 "nginx: master process /usr/sbin/nginx -g daemon on; master_process on;"
             ├─11870 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─11871 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             ├─11872 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""
             └─11873 "nginx: worker process" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ""

Dec 04 08:31:19 web-mail systemd[1]: Starting A high performance web server and a reverse proxy server...
Dec 04 08:31:19 web-mail systemd[1]: Started A high performance web server and a reverse proxy server.
ubuntu@web-mail:~$ sudo netstat -tlnp | grep :80
sudo: netstat: command not found
ubuntu@web-mail:~$ sudo systemctl stop apache2
ubuntu@web-mail:~$ sudo systemctl disable apache2
Synchronizing state of apache2.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install disable apache2
Removed /etc/systemd/system/multi-user.target.wants/apache2.service.
ubuntu@web-mail:~$ sudo apt purge apache2 apache2-utils apache2-bin apache2-data -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  apache2* apache2-bin* apache2-data* apache2-utils* libapache2-mod-php8.1*
0 upgraded, 0 newly installed, 5 to remove and 8 not upgraded.
After this operation, 12.5 MB disk space will be freed.
(Reading database ... 98058 files and directories currently installed.)
Removing apache2 (2.4.52-1ubuntu4.16) ...
Removing libapache2-mod-php8.1 (8.1.2-1ubuntu2.22) ...
Removing apache2-bin (2.4.52-1ubuntu4.16) ...
dpkg: warning: while removing apache2-bin, directory '/var/lib/apache2' not empty so not removed
Removing apache2-data (2.4.52-1ubuntu4.16) ...
Removing apache2-utils (2.4.52-1ubuntu4.16) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for ufw (0.36.1-4ubuntu0.1) ...
(Reading database ... 97550 files and directories currently installed.)
Purging configuration files for apache2 (2.4.52-1ubuntu4.16) ...
Purging configuration files for libapache2-mod-php8.1 (8.1.2-1ubuntu2.22) ...
Processing triggers for ufw (0.36.1-4ubuntu0.1) ...
ubuntu@web-mail:~$ sudo apt autoremove -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be REMOVED:
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap
0 upgraded, 0 newly installed, 4 to remove and 8 not upgraded.
After this operation, 685 kB disk space will be freed.
(Reading database ... 97383 files and directories currently installed.)
Removing libaprutil1-dbd-sqlite3:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Removing libaprutil1-ldap:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Removing libaprutil1:amd64 (1.6.1-5ubuntu4.22.04.2) ...
Removing libapr1:amd64 (1.7.0-8ubuntu0.22.04.2) ...
Processing triggers for libc-bin (2.35-0ubuntu3.11) ...
ubuntu@web-mail:~$ sudo systemctl status apache2
× apache2.service
     Loaded: not-found (Reason: Unit apache2.service not found.)
     Active: failed (Result: exit-code) since Thu 2025-12-04 12:04:13 UTC; 5min ago
        CPU: 16ms

Dec 04 12:04:13 web-mail systemd[1]: Starting The Apache HTTP Server...
Dec 04 12:04:13 web-mail apachectl[35130]: (98)Address already in use: AH00072: make_sock: could not bind to address [::]:80
Dec 04 12:04:13 web-mail apachectl[35130]: (98)Address already in use: AH00072: make_sock: could not bind to address 0.0.0.0:80
Dec 04 12:04:13 web-mail apachectl[35130]: no listening sockets available, shutting down
Dec 04 12:04:13 web-mail apachectl[35130]: AH00015: Unable to open logs
Dec 04 12:04:13 web-mail apachectl[35127]: Action 'start' failed.
Dec 04 12:04:13 web-mail apachectl[35127]: The Apache error log may have more information.
Dec 04 12:04:13 web-mail systemd[1]: apache2.service: Control process exited, code=exited, status=1/FAILURE
Dec 04 12:04:13 web-mail systemd[1]: apache2.service: Failed with result 'exit-code'.
Dec 04 12:04:13 web-mail systemd[1]: Failed to start The Apache HTTP Server.
ubuntu@web-mail:~$ [200~sudo apt install net-tools -y~
[200~sudo: command not found
ubuntu@web-mail:~$ sudo apt install net-tools -y~
E: Command line option '~' [from -y~] is not understood in combination with the other options.
ubuntu@web-mail:~$ sudo apt install net-tools -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  net-tools
0 upgraded, 1 newly installed, 0 to remove and 8 not upgraded.
Need to get 204 kB of archives.
After this operation, 819 kB of additional disk space will be used.
Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 net-tools amd64 1.60+git20181103.0eebece-1ubuntu5.4 [204 kB]
Fetched 204 kB in 3s (76.1 kB/s)
Selecting previously unselected package net-tools.
(Reading database ... 97351 files and directories currently installed.)
Preparing to unpack .../net-tools_1.60+git20181103.0eebece-1ubuntu5.4_amd64.deb ...
Unpacking net-tools (1.60+git20181103.0eebece-1ubuntu5.4) ...
Setting up net-tools (1.60+git20181103.0eebece-1ubuntu5.4) ...
Processing triggers for man-db (2.10.2-1) ...
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

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@web-mail:~$ sudo netstat -tlnp | grep :80
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      11869/nginx: master
tcp6       0      0 :::80                   :::*                    LISTEN      11869/nginx: master
ubuntu@web-mail:~$ sudo ss -tlnp | grep :80
LISTEN 0      511          0.0.0.0:80        0.0.0.0:*    users:(("nginx",pid=11873,fd=8),("nginx",pid=11872,fd=8),("nginx",pid=11871,fd=8),("nginx",pid=11870,fd=8),("nginx",pid=11869,fd=8))
LISTEN 0      511             [::]:80           [::]:*    users:(("nginx",pid=11873,fd=9),("nginx",pid=11872,fd=9),("nginx",pid=11871,fd=9),("nginx",pid=11870,fd=9),("nginx",pid=11869,fd=9))
ubuntu@web-mail:~$ sudo apt install roundcube roundcube-core roundcube-mysql -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  aspell aspell-en dbconfig-common dictionaries-common emacsen-common enchant-2 fonts-glyphicons-halflings hunspell-en-us javascript-common libaspell15
  libconfig-inifiles-perl libdbd-mysql-perl libdbi-perl libenchant-2-2 libhunspell-1.7-0 libjs-bootstrap libjs-bootstrap4 libjs-codemirror libjs-jquery
  libjs-jquery-minicolors libjs-jquery-ui libjs-jstimezonedetect libjs-popper.js libjs-sizzle libmariadb3 libmysqlclient21 mariadb-client mariadb-client-10.6
  mariadb-client-core-10.6 mariadb-common mysql-common node-jquery php-auth-sasl php-enchant php-json php-mail-mime php-masterminds-html5 php-net-sieve php-net-smtp
  php-net-socket php-pear php8.1-enchant
Suggested packages:
  aspell-doc spellutils dbconfig-mysql | dbconfig-pgsql | dbconfig-sqlite3 | dbconfig-no-thanks wordlist hunspell openoffice.org-hunspell | openoffice.org-core
  libclone-perl libmldbm-perl libnet-daemon-perl libsql-statement-perl libenchant-2-voikko libjs-requirejs libjs-jquery-ui-docs roundcube-plugins php-endroid-qr-code
  php-guzzlehttp-guzzle php-roundcube-rtf-html-php php-crypt-gpg php-net-ldap3 php-bjeavons-zxcvbn-php mariadb-server | default-mysql-server
The following NEW packages will be installed:
  aspell aspell-en dbconfig-common dictionaries-common emacsen-common enchant-2 fonts-glyphicons-halflings hunspell-en-us javascript-common libaspell15
  libconfig-inifiles-perl libdbd-mysql-perl libdbi-perl libenchant-2-2 libhunspell-1.7-0 libjs-bootstrap libjs-bootstrap4 libjs-codemirror libjs-jquery
  libjs-jquery-minicolors libjs-jquery-ui libjs-jstimezonedetect libjs-popper.js libjs-sizzle libmariadb3 libmysqlclient21 mariadb-client mariadb-client-10.6
  mariadb-client-core-10.6 mariadb-common mysql-common node-jquery php-auth-sasl php-enchant php-json php-mail-mime php-masterminds-html5 php-net-sieve php-net-smtp
  php-net-socket php-pear php8.1-enchant roundcube roundcube-core roundcube-mysql
0 upgraded, 45 newly installed, 0 to remove and 8 not upgraded.
Need to get 15.0 MB of archives.
After this operation, 98.9 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 dbconfig-common all 2.0.21 [597 kB]
Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 javascript-common all 11+nmu1 [5936 B]
Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-popper.js all 1.16.1+ds-5 [53.8 kB]
Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-bootstrap4 all 4.6.0+dfsg1-4 [534 kB]
Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-codemirror all 5.65.0+~cs5.83.9-1 [757 kB]
Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libjs-jquery all 3.6.0+dfsg+~3.5.13-1 [321 kB]
Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-jquery-minicolors all 2.3.5+dfsg-2 [91.2 kB]
Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-jquery-ui all 1.13.1+dfsg-1 [253 kB]
Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-jstimezonedetect all 1.0.7+~1.0.3-1 [13.4 kB]
Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-json all 2:8.1+92ubuntu1 [1834 B]
Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 php-pear all 1:1.10.12+submodules+notgz+20210212-1ubuntu3 [293 kB]
Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libconfig-inifiles-perl all 3.000003-1 [40.5 kB]
Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 mysql-common all 5.8+1.0.8 [7212 B]
Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-common all 1:10.6.22-0ubuntu0.22.04.1 [16.5 kB]
Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libmariadb3 amd64 1:10.6.22-0ubuntu0.22.04.1 [188 kB]
Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-client-core-10.6 amd64 1:10.6.22-0ubuntu0.22.04.1 [1002 kB]
Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-client-10.6 amd64 1:10.6.22-0ubuntu0.22.04.1 [1658 kB]
Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-client all 1:10.6.22-0ubuntu0.22.04.1 [13.1 kB]
Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 roundcube-mysql all 1.5.0+dfsg.1-2 [14.5 kB]
Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-net-socket all 1.2.2-2 [10.5 kB]
Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-auth-sasl all 1.1.0-1 [13.4 kB]
Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-mail-mime all 1.10.11-1 [37.7 kB]
Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-net-smtp all 1.10.0-1 [19.6 kB]
Get:24 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-net-sieve all 1.4.5-1 [19.8 kB]
Get:25 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-masterminds-html5 all 2.7.5+dfsg-1 [62.1 kB]
Get:26 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 roundcube-core all 1.5.0+dfsg.1-2 [4942 kB]
Get:27 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 roundcube all 1.5.0+dfsg.1-2 [1120 B]
Get:28 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libaspell15 amd64 0.60.8-4build1 [325 kB]
Get:29 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 emacsen-common all 3.0.4 [14.9 kB]
Get:30 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 dictionaries-common all 1.28.14 [185 kB]
Get:31 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 aspell amd64 0.60.8-4build1 [87.7 kB]
Get:32 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 aspell-en all 2018.04.16-0-1 [299 kB]
Get:33 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 hunspell-en-us all 1:2020.12.07-2 [280 kB]
Get:34 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libhunspell-1.7-0 amd64 1.7.0-4build1 [175 kB]
Get:35 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libenchant-2-2 amd64 2.3.2-1ubuntu2 [50.9 kB]
Get:36 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 enchant-2 amd64 2.3.2-1ubuntu2 [13.0 kB]
Get:37 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 fonts-glyphicons-halflings all 1.009~3.4.1+dfsg-2+deb11u2build0.22.04.1 [122 kB]
Get:38 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libdbi-perl amd64 1.643-3build3 [741 kB]
Get:39 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libmysqlclient21 amd64 8.0.44-0ubuntu0.22.04.1 [1308 kB]
Get:40 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libdbd-mysql-perl amd64 4.050-5ubuntu0.22.04.1 [87.6 kB]
Get:41 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 libjs-bootstrap all 3.4.1+dfsg-2+deb11u2build0.22.04.1 [129 kB]
Get:42 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 libjs-sizzle all 2.3.6+ds+~2.3.3-1 [32.3 kB]
Get:43 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 node-jquery all 3.6.0+dfsg+~3.5.13-1 [160 kB]
Get:44 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 php8.1-enchant amd64 8.1.2-1ubuntu2.22 [10.2 kB]
Get:45 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 php-enchant all 2:8.1+92ubuntu1 [1834 B]
Fetched 15.0 MB in 4s (3371 kB/s)
Extracting templates from packages: 100%
Preconfiguring packages ...
Selecting previously unselected package dbconfig-common.
(Reading database ... 97400 files and directories currently installed.)
Preparing to unpack .../00-dbconfig-common_2.0.21_all.deb ...
Unpacking dbconfig-common (2.0.21) ...
Selecting previously unselected package javascript-common.
Preparing to unpack .../01-javascript-common_11+nmu1_all.deb ...
Unpacking javascript-common (11+nmu1) ...
Selecting previously unselected package libjs-popper.js.
Preparing to unpack .../02-libjs-popper.js_1.16.1+ds-5_all.deb ...
Unpacking libjs-popper.js (1.16.1+ds-5) ...
Selecting previously unselected package libjs-bootstrap4.
Preparing to unpack .../03-libjs-bootstrap4_4.6.0+dfsg1-4_all.deb ...
Unpacking libjs-bootstrap4 (4.6.0+dfsg1-4) ...
Selecting previously unselected package libjs-codemirror.
Preparing to unpack .../04-libjs-codemirror_5.65.0+~cs5.83.9-1_all.deb ...
Unpacking libjs-codemirror (5.65.0+~cs5.83.9-1) ...
Selecting previously unselected package libjs-jquery.
Preparing to unpack .../05-libjs-jquery_3.6.0+dfsg+~3.5.13-1_all.deb ...
Unpacking libjs-jquery (3.6.0+dfsg+~3.5.13-1) ...
Selecting previously unselected package libjs-jquery-minicolors.
Preparing to unpack .../06-libjs-jquery-minicolors_2.3.5+dfsg-2_all.deb ...
Unpacking libjs-jquery-minicolors (2.3.5+dfsg-2) ...
Selecting previously unselected package libjs-jquery-ui.
Preparing to unpack .../07-libjs-jquery-ui_1.13.1+dfsg-1_all.deb ...
Unpacking libjs-jquery-ui (1.13.1+dfsg-1) ...
Selecting previously unselected package libjs-jstimezonedetect.
Preparing to unpack .../08-libjs-jstimezonedetect_1.0.7+~1.0.3-1_all.deb ...
Unpacking libjs-jstimezonedetect (1.0.7+~1.0.3-1) ...
Selecting previously unselected package php-json.
Preparing to unpack .../09-php-json_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-json (2:8.1+92ubuntu1) ...
Selecting previously unselected package php-pear.
Preparing to unpack .../10-php-pear_1%3a1.10.12+submodules+notgz+20210212-1ubuntu3_all.deb ...
Unpacking php-pear (1:1.10.12+submodules+notgz+20210212-1ubuntu3) ...
Selecting previously unselected package libconfig-inifiles-perl.
Preparing to unpack .../11-libconfig-inifiles-perl_3.000003-1_all.deb ...
Unpacking libconfig-inifiles-perl (3.000003-1) ...
Selecting previously unselected package mysql-common.
Preparing to unpack .../12-mysql-common_5.8+1.0.8_all.deb ...
Unpacking mysql-common (5.8+1.0.8) ...
Selecting previously unselected package mariadb-common.
Preparing to unpack .../13-mariadb-common_1%3a10.6.22-0ubuntu0.22.04.1_all.deb ...
Unpacking mariadb-common (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package libmariadb3:amd64.
Preparing to unpack .../14-libmariadb3_1%3a10.6.22-0ubuntu0.22.04.1_amd64.deb ...
Unpacking libmariadb3:amd64 (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package mariadb-client-core-10.6.
Preparing to unpack .../15-mariadb-client-core-10.6_1%3a10.6.22-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mariadb-client-core-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package mariadb-client-10.6.
Preparing to unpack .../16-mariadb-client-10.6_1%3a10.6.22-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mariadb-client-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package mariadb-client.
Preparing to unpack .../17-mariadb-client_1%3a10.6.22-0ubuntu0.22.04.1_all.deb ...
Unpacking mariadb-client (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package roundcube-mysql.
Preparing to unpack .../18-roundcube-mysql_1.5.0+dfsg.1-2_all.deb ...
Unpacking roundcube-mysql (1.5.0+dfsg.1-2) ...
Selecting previously unselected package php-net-socket.
Preparing to unpack .../19-php-net-socket_1.2.2-2_all.deb ...
Unpacking php-net-socket (1.2.2-2) ...
Selecting previously unselected package php-auth-sasl.
Preparing to unpack .../20-php-auth-sasl_1.1.0-1_all.deb ...
Unpacking php-auth-sasl (1.1.0-1) ...
Selecting previously unselected package php-mail-mime.
Preparing to unpack .../21-php-mail-mime_1.10.11-1_all.deb ...
Unpacking php-mail-mime (1.10.11-1) ...
Selecting previously unselected package php-net-smtp.
Preparing to unpack .../22-php-net-smtp_1.10.0-1_all.deb ...
Unpacking php-net-smtp (1.10.0-1) ...
Selecting previously unselected package php-net-sieve.
Preparing to unpack .../23-php-net-sieve_1.4.5-1_all.deb ...
Unpacking php-net-sieve (1.4.5-1) ...
Selecting previously unselected package php-masterminds-html5.
Preparing to unpack .../24-php-masterminds-html5_2.7.5+dfsg-1_all.deb ...
Unpacking php-masterminds-html5 (2.7.5+dfsg-1) ...
Selecting previously unselected package roundcube-core.
Preparing to unpack .../25-roundcube-core_1.5.0+dfsg.1-2_all.deb ...
Unpacking roundcube-core (1.5.0+dfsg.1-2) ...
Selecting previously unselected package roundcube.
Preparing to unpack .../26-roundcube_1.5.0+dfsg.1-2_all.deb ...
Unpacking roundcube (1.5.0+dfsg.1-2) ...
Selecting previously unselected package libaspell15:amd64.
Preparing to unpack .../27-libaspell15_0.60.8-4build1_amd64.deb ...
Unpacking libaspell15:amd64 (0.60.8-4build1) ...
Selecting previously unselected package emacsen-common.
Preparing to unpack .../28-emacsen-common_3.0.4_all.deb ...
Unpacking emacsen-common (3.0.4) ...
Selecting previously unselected package dictionaries-common.
Preparing to unpack .../29-dictionaries-common_1.28.14_all.deb ...
Adding 'diversion of /usr/share/dict/words to /usr/share/dict/words.pre-dictionaries-common by dictionaries-common'
Unpacking dictionaries-common (1.28.14) ...
Selecting previously unselected package aspell.
Preparing to unpack .../30-aspell_0.60.8-4build1_amd64.deb ...
Unpacking aspell (0.60.8-4build1) ...
Selecting previously unselected package aspell-en.
Preparing to unpack .../31-aspell-en_2018.04.16-0-1_all.deb ...
Unpacking aspell-en (2018.04.16-0-1) ...
Selecting previously unselected package hunspell-en-us.
Preparing to unpack .../32-hunspell-en-us_1%3a2020.12.07-2_all.deb ...
Unpacking hunspell-en-us (1:2020.12.07-2) ...
Selecting previously unselected package libhunspell-1.7-0:amd64.
Preparing to unpack .../33-libhunspell-1.7-0_1.7.0-4build1_amd64.deb ...
Unpacking libhunspell-1.7-0:amd64 (1.7.0-4build1) ...
Selecting previously unselected package libenchant-2-2:amd64.
Preparing to unpack .../34-libenchant-2-2_2.3.2-1ubuntu2_amd64.deb ...
Unpacking libenchant-2-2:amd64 (2.3.2-1ubuntu2) ...
Selecting previously unselected package enchant-2.
Preparing to unpack .../35-enchant-2_2.3.2-1ubuntu2_amd64.deb ...
Unpacking enchant-2 (2.3.2-1ubuntu2) ...
Selecting previously unselected package fonts-glyphicons-halflings.
Preparing to unpack .../36-fonts-glyphicons-halflings_1.009~3.4.1+dfsg-2+deb11u2build0.22.04.1_all.deb ...
Unpacking fonts-glyphicons-halflings (1.009~3.4.1+dfsg-2+deb11u2build0.22.04.1) ...
Selecting previously unselected package libdbi-perl:amd64.
Preparing to unpack .../37-libdbi-perl_1.643-3build3_amd64.deb ...
Unpacking libdbi-perl:amd64 (1.643-3build3) ...
Selecting previously unselected package libmysqlclient21:amd64.
Preparing to unpack .../38-libmysqlclient21_8.0.44-0ubuntu0.22.04.1_amd64.deb ...
Unpacking libmysqlclient21:amd64 (8.0.44-0ubuntu0.22.04.1) ...
Selecting previously unselected package libdbd-mysql-perl:amd64.
Preparing to unpack .../39-libdbd-mysql-perl_4.050-5ubuntu0.22.04.1_amd64.deb ...
Unpacking libdbd-mysql-perl:amd64 (4.050-5ubuntu0.22.04.1) ...
Selecting previously unselected package libjs-bootstrap.
Preparing to unpack .../40-libjs-bootstrap_3.4.1+dfsg-2+deb11u2build0.22.04.1_all.deb ...
Unpacking libjs-bootstrap (3.4.1+dfsg-2+deb11u2build0.22.04.1) ...
Selecting previously unselected package libjs-sizzle.
Preparing to unpack .../41-libjs-sizzle_2.3.6+ds+~2.3.3-1_all.deb ...
Unpacking libjs-sizzle (2.3.6+ds+~2.3.3-1) ...
Selecting previously unselected package node-jquery.
Preparing to unpack .../42-node-jquery_3.6.0+dfsg+~3.5.13-1_all.deb ...
Unpacking node-jquery (3.6.0+dfsg+~3.5.13-1) ...
Selecting previously unselected package php8.1-enchant.
Preparing to unpack .../43-php8.1-enchant_8.1.2-1ubuntu2.22_amd64.deb ...
Unpacking php8.1-enchant (8.1.2-1ubuntu2.22) ...
Selecting previously unselected package php-enchant.
Preparing to unpack .../44-php-enchant_2%3a8.1+92ubuntu1_all.deb ...
Unpacking php-enchant (2:8.1+92ubuntu1) ...
Setting up libconfig-inifiles-perl (3.000003-1) ...
Setting up javascript-common (11+nmu1) ...
Setting up mysql-common (5.8+1.0.8) ...
update-alternatives: using /etc/mysql/my.cnf.fallback to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Setting up libmysqlclient21:amd64 (8.0.44-0ubuntu0.22.04.1) ...
Setting up libjs-jstimezonedetect (1.0.7+~1.0.3-1) ...
Setting up php-pear (1:1.10.12+submodules+notgz+20210212-1ubuntu3) ...
Setting up libjs-popper.js (1.16.1+ds-5) ...
Setting up php-json (2:8.1+92ubuntu1) ...
Setting up libaspell15:amd64 (0.60.8-4build1) ...
Setting up fonts-glyphicons-halflings (1.009~3.4.1+dfsg-2+deb11u2build0.22.04.1) ...
Setting up dbconfig-common (2.0.21) ...

Creating config file /etc/dbconfig-common/config with new version
Setting up libjs-sizzle (2.3.6+ds+~2.3.3-1) ...
Setting up mariadb-common (1:10.6.22-0ubuntu0.22.04.1) ...
update-alternatives: using /etc/mysql/mariadb.cnf to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Setting up php-mail-mime (1.10.11-1) ...
Setting up php-net-socket (1.2.2-2) ...
Setting up emacsen-common (3.0.4) ...
Setting up php-masterminds-html5 (2.7.5+dfsg-1) ...
Setting up libjs-codemirror (5.65.0+~cs5.83.9-1) ...
Setting up libmariadb3:amd64 (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up php-net-sieve (1.4.5-1) ...
Setting up php-net-smtp (1.10.0-1) ...
Setting up libjs-bootstrap4 (4.6.0+dfsg1-4) ...
Setting up libjs-jquery (3.6.0+dfsg+~3.5.13-1) ...
Setting up libhunspell-1.7-0:amd64 (1.7.0-4build1) ...
Setting up php-auth-sasl (1.1.0-1) ...
Setting up libdbi-perl:amd64 (1.643-3build3) ...
Setting up node-jquery (3.6.0+dfsg+~3.5.13-1) ...
Setting up libjs-bootstrap (3.4.1+dfsg-2+deb11u2build0.22.04.1) ...
Setting up libjs-jquery-minicolors (2.3.5+dfsg-2) ...
Setting up dictionaries-common (1.28.14) ...
Setting up libjs-jquery-ui (1.13.1+dfsg-1) ...
Setting up mariadb-client-core-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up libdbd-mysql-perl:amd64 (4.050-5ubuntu0.22.04.1) ...
Setting up aspell (0.60.8-4build1) ...
Setting up hunspell-en-us (1:2020.12.07-2) ...
Setting up mariadb-client-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up mariadb-client (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up libenchant-2-2:amd64 (2.3.2-1ubuntu2) ...
Setting up aspell-en (2018.04.16-0-1) ...
Setting up enchant-2 (2.3.2-1ubuntu2) ...
Setting up php8.1-enchant (8.1.2-1ubuntu2.22) ...

Creating config file /etc/php/8.1/mods-available/enchant.ini with new version
Setting up roundcube-mysql (1.5.0+dfsg.1-2) ...
Setting up php-enchant (2:8.1+92ubuntu1) ...
Setting up roundcube-core (1.5.0+dfsg.1-2) ...
dbconfig-common: writing config to /etc/dbconfig-common/roundcube.conf

Creating config file /etc/dbconfig-common/roundcube.conf with new version

Creating config file /etc/roundcube/debian-db.php with new version
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2).
unable to connect to mysql server.
error encountered creating user:
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2)
dbconfig-common: roundcube configure: trying again (skip questions).
dbconfig-common: writing config to /etc/dbconfig-common/roundcube.conf
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2).
unable to connect to mysql server.
error encountered creating user:
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2)
dbconfig-common: roundcube configure: trying again (skip questions).
dbconfig-common: writing config to /etc/dbconfig-common/roundcube.conf
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2).
unable to connect to mysql server.
error encountered creating user:
ERROR 2002 (HY000): Can't connect to local server through socket '/run/mysqld/mysqld.sock' (2)
dbconfig-common: roundcube configure: ignoring errors from here forwards
populating database via sql...  done.
dbconfig-common: flushing administrative password
dbconfig-common: roundcube configure: ignoring errors from here forwards
dbconfig-common: roundcube configure: ignoring errors from here forwards
Setting up roundcube (1.5.0+dfsg.1-2) ...
Processing triggers for php8.1-fpm (8.1.2-1ubuntu2.22) ...
Processing triggers for libc-bin (2.35-0ubuntu3.11) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for dictionaries-common (1.28.14) ...
aspell-autobuildhash: processing: en [en-common].
aspell-autobuildhash: processing: en [en-variant_0].
aspell-autobuildhash: processing: en [en-variant_1].
aspell-autobuildhash: processing: en [en-variant_2].
aspell-autobuildhash: processing: en [en-w_accents-only].
aspell-autobuildhash: processing: en [en-wo_accents-only].
aspell-autobuildhash: processing: en [en_AU-variant_0].
aspell-autobuildhash: processing: en [en_AU-variant_1].
aspell-autobuildhash: processing: en [en_AU-w_accents-only].
aspell-autobuildhash: processing: en [en_AU-wo_accents-only].
aspell-autobuildhash: processing: en [en_CA-variant_0].
aspell-autobuildhash: processing: en [en_CA-variant_1].
aspell-autobuildhash: processing: en [en_CA-w_accents-only].
aspell-autobuildhash: processing: en [en_CA-wo_accents-only].
aspell-autobuildhash: processing: en [en_GB-ise-w_accents-only].
aspell-autobuildhash: processing: en [en_GB-ise-wo_accents-only].
aspell-autobuildhash: processing: en [en_GB-ize-w_accents-only].
aspell-autobuildhash: processing: en [en_GB-ize-wo_accents-only].
aspell-autobuildhash: processing: en [en_GB-variant_0].
aspell-autobuildhash: processing: en [en_GB-variant_1].
aspell-autobuildhash: processing: en [en_US-w_accents-only].
aspell-autobuildhash: processing: en [en_US-wo_accents-only].
Processing triggers for php8.1-cli (8.1.2-1ubuntu2.22) ...
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

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@web-mail:~$ sudo apt install mariadb-server -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  galera-4 libcgi-fast-perl libcgi-pm-perl libclone-perl libencode-locale-perl libfcgi-bin libfcgi-perl libfcgi0ldbl libhtml-parser-perl libhtml-tagset-perl
  libhtml-template-perl libhttp-date-perl libhttp-message-perl libio-html-perl liblwp-mediatypes-perl libsnappy1v5 libtimedate-perl liburi-perl liburing2
  mariadb-server-10.6 mariadb-server-core-10.6 socat
Suggested packages:
  libdata-dump-perl libipc-sharedcache-perl libbusiness-isbn-perl libwww-perl mailx mariadb-test
The following NEW packages will be installed:
  galera-4 libcgi-fast-perl libcgi-pm-perl libclone-perl libencode-locale-perl libfcgi-bin libfcgi-perl libfcgi0ldbl libhtml-parser-perl libhtml-tagset-perl
  libhtml-template-perl libhttp-date-perl libhttp-message-perl libio-html-perl liblwp-mediatypes-perl libsnappy1v5 libtimedate-perl liburi-perl liburing2 mariadb-server
  mariadb-server-10.6 mariadb-server-core-10.6 socat
0 upgraded, 23 newly installed, 0 to remove and 8 not upgraded.
Need to get 14.0 MB of archives.
After this operation, 117 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 galera-4 amd64 26.4.9-1build1 [720 kB]
Get:2 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libsnappy1v5 amd64 1.1.8-1build3 [17.5 kB]
Get:3 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 liburing2 amd64 2.1-2build1 [10.3 kB]
Get:4 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-server-core-10.6 amd64 1:10.6.22-0ubuntu0.22.04.1 [8070 kB]
Get:5 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 socat amd64 1.7.4.1-3ubuntu4 [349 kB]
Get:6 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-server-10.6 amd64 1:10.6.22-0ubuntu0.22.04.1 [4128 kB]
Get:7 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libhtml-tagset-perl all 3.20-4 [12.5 kB]
Get:8 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 liburi-perl all 5.10-1 [78.8 kB]
Get:9 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libhtml-parser-perl amd64 3.76-1build2 [88.4 kB]
Get:10 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libcgi-pm-perl all 4.54-1 [188 kB]
Get:11 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libfcgi0ldbl amd64 2.4.2-2ubuntu0.1 [28.1 kB]
Get:12 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libfcgi-perl amd64 0.82+ds-1build1 [22.8 kB]
Get:13 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libcgi-fast-perl all 1:2.15-1 [10.5 kB]
Get:14 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libclone-perl amd64 0.45-1build3 [11.0 kB]
Get:15 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libencode-locale-perl all 1.05-1.1 [11.8 kB]
Get:16 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libfcgi-bin amd64 2.4.2-2ubuntu0.1 [11.1 kB]
Get:17 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libhtml-template-perl all 2.97-1.1 [59.1 kB]
Get:18 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libtimedate-perl all 2.3300-2 [34.0 kB]
Get:19 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libhttp-date-perl all 6.05-1 [9920 B]
Get:20 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libio-html-perl all 1.004-2 [15.4 kB]
Get:21 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 liblwp-mediatypes-perl all 6.04-1 [19.5 kB]
Get:22 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy/main amd64 libhttp-message-perl all 6.36-1 [76.8 kB]
Get:23 http://kkr-prd01-az3.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 mariadb-server all 1:10.6.22-0ubuntu0.22.04.1 [11.8 kB]
Fetched 14.0 MB in 4s (3515 kB/s)
Preconfiguring packages ...
Selecting previously unselected package galera-4.
(Reading database ... 102027 files and directories currently installed.)
Preparing to unpack .../00-galera-4_26.4.9-1build1_amd64.deb ...
Unpacking galera-4 (26.4.9-1build1) ...
Selecting previously unselected package libsnappy1v5:amd64.
Preparing to unpack .../01-libsnappy1v5_1.1.8-1build3_amd64.deb ...
Unpacking libsnappy1v5:amd64 (1.1.8-1build3) ...
Selecting previously unselected package liburing2:amd64.
Preparing to unpack .../02-liburing2_2.1-2build1_amd64.deb ...
Unpacking liburing2:amd64 (2.1-2build1) ...
Selecting previously unselected package mariadb-server-core-10.6.
Preparing to unpack .../03-mariadb-server-core-10.6_1%3a10.6.22-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mariadb-server-core-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package socat.
Preparing to unpack .../04-socat_1.7.4.1-3ubuntu4_amd64.deb ...
Unpacking socat (1.7.4.1-3ubuntu4) ...
Selecting previously unselected package mariadb-server-10.6.
Preparing to unpack .../05-mariadb-server-10.6_1%3a10.6.22-0ubuntu0.22.04.1_amd64.deb ...
Unpacking mariadb-server-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Selecting previously unselected package libhtml-tagset-perl.
Preparing to unpack .../06-libhtml-tagset-perl_3.20-4_all.deb ...
Unpacking libhtml-tagset-perl (3.20-4) ...
Selecting previously unselected package liburi-perl.
Preparing to unpack .../07-liburi-perl_5.10-1_all.deb ...
Unpacking liburi-perl (5.10-1) ...
Selecting previously unselected package libhtml-parser-perl:amd64.
Preparing to unpack .../08-libhtml-parser-perl_3.76-1build2_amd64.deb ...
Unpacking libhtml-parser-perl:amd64 (3.76-1build2) ...
Selecting previously unselected package libcgi-pm-perl.
Preparing to unpack .../09-libcgi-pm-perl_4.54-1_all.deb ...
Unpacking libcgi-pm-perl (4.54-1) ...
Selecting previously unselected package libfcgi0ldbl:amd64.
Preparing to unpack .../10-libfcgi0ldbl_2.4.2-2ubuntu0.1_amd64.deb ...
Unpacking libfcgi0ldbl:amd64 (2.4.2-2ubuntu0.1) ...
Selecting previously unselected package libfcgi-perl:amd64.
Preparing to unpack .../11-libfcgi-perl_0.82+ds-1build1_amd64.deb ...
Unpacking libfcgi-perl:amd64 (0.82+ds-1build1) ...
Selecting previously unselected package libcgi-fast-perl.
Preparing to unpack .../12-libcgi-fast-perl_1%3a2.15-1_all.deb ...
Unpacking libcgi-fast-perl (1:2.15-1) ...
Selecting previously unselected package libclone-perl.
Preparing to unpack .../13-libclone-perl_0.45-1build3_amd64.deb ...
Unpacking libclone-perl (0.45-1build3) ...
Selecting previously unselected package libencode-locale-perl.
Preparing to unpack .../14-libencode-locale-perl_1.05-1.1_all.deb ...
Unpacking libencode-locale-perl (1.05-1.1) ...
Selecting previously unselected package libfcgi-bin.
Preparing to unpack .../15-libfcgi-bin_2.4.2-2ubuntu0.1_amd64.deb ...
Unpacking libfcgi-bin (2.4.2-2ubuntu0.1) ...
Selecting previously unselected package libhtml-template-perl.
Preparing to unpack .../16-libhtml-template-perl_2.97-1.1_all.deb ...
Unpacking libhtml-template-perl (2.97-1.1) ...
Selecting previously unselected package libtimedate-perl.
Preparing to unpack .../17-libtimedate-perl_2.3300-2_all.deb ...
Unpacking libtimedate-perl (2.3300-2) ...
Selecting previously unselected package libhttp-date-perl.
Preparing to unpack .../18-libhttp-date-perl_6.05-1_all.deb ...
Unpacking libhttp-date-perl (6.05-1) ...
Selecting previously unselected package libio-html-perl.
Preparing to unpack .../19-libio-html-perl_1.004-2_all.deb ...
Unpacking libio-html-perl (1.004-2) ...
Selecting previously unselected package liblwp-mediatypes-perl.
Preparing to unpack .../20-liblwp-mediatypes-perl_6.04-1_all.deb ...
Unpacking liblwp-mediatypes-perl (6.04-1) ...
Selecting previously unselected package libhttp-message-perl.
Preparing to unpack .../21-libhttp-message-perl_6.36-1_all.deb ...
Unpacking libhttp-message-perl (6.36-1) ...
Selecting previously unselected package mariadb-server.
Preparing to unpack .../22-mariadb-server_1%3a10.6.22-0ubuntu0.22.04.1_all.deb ...
Unpacking mariadb-server (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up galera-4 (26.4.9-1build1) ...
Setting up libfcgi0ldbl:amd64 (2.4.2-2ubuntu0.1) ...
Setting up libclone-perl (0.45-1build3) ...
Setting up libhtml-tagset-perl (3.20-4) ...
Setting up liblwp-mediatypes-perl (6.04-1) ...
Setting up libfcgi-bin (2.4.2-2ubuntu0.1) ...
Setting up libencode-locale-perl (1.05-1.1) ...
Setting up libsnappy1v5:amd64 (1.1.8-1build3) ...
Setting up socat (1.7.4.1-3ubuntu4) ...
Setting up libio-html-perl (1.004-2) ...
Setting up libtimedate-perl (2.3300-2) ...
Setting up libfcgi-perl:amd64 (0.82+ds-1build1) ...
Setting up liburing2:amd64 (2.1-2build1) ...
Setting up liburi-perl (5.10-1) ...
Setting up mariadb-server-core-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up libhttp-date-perl (6.05-1) ...
Setting up mariadb-server-10.6 (1:10.6.22-0ubuntu0.22.04.1) ...
Created symlink /etc/systemd/system/multi-user.target.wants/mariadb.service → /lib/systemd/system/mariadb.service.
Setting up libhtml-parser-perl:amd64 (3.76-1build2) ...
Setting up libhttp-message-perl (6.36-1) ...
Setting up libcgi-pm-perl (4.54-1) ...
Setting up libhtml-template-perl (2.97-1.1) ...
Setting up mariadb-server (1:10.6.22-0ubuntu0.22.04.1) ...
Setting up libcgi-fast-perl (1:2.15-1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.11) ...
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

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@web-mail:~$ sudo apt install roundcube roundcube-core roundcube-mysql -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
roundcube is already the newest version (1.5.0+dfsg.1-2).
roundcube-core is already the newest version (1.5.0+dfsg.1-2).
roundcube-mysql is already the newest version (1.5.0+dfsg.1-2).
0 upgraded, 0 newly installed, 0 to remove and 8 not upgraded.
ubuntu@web-mail:~$ sudo mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] y
Enabled successfully!
Reloading privilege tables..
 ... Success!


You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] n
 ... skipping.

By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] t
Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] n
 ... skipping.

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
ubuntu@web-mail:~$ sudo nano /etc/nginx/sites-available/mail.gelani.com
ubuntu@web-mail:~$ sudo ln -s /etc/nginx/sites-available/mail.gelani.com /etc/nginx/sites-enabled/
ubuntu@web-mail:~$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
ubuntu@web-mail:~$ sudo systemctl restart nginx
ubuntu@web-mail:~$ sudo nano /etc/roundcube/config.inc.php
ubuntu@web-mail:~$ cat /etc/roundcube/config.inc.php
cat: /etc/roundcube/config.inc.php: Permission denied
ubuntu@web-mail:~$ sudo cat /etc/roundcube/config.inc.php
<?php

/*
 +-----------------------------------------------------------------------+
 | Local configuration for the Roundcube Webmail installation.           |
 |                                                                       |
 | This is a sample configuration file only containing the minimum       |
 | setup required for a functional installation. Copy more options       |
 | from defaults.inc.php to this file to override the defaults.          |
 |                                                                       |
 | This file is part of the Roundcube Webmail client                     |
 | Copyright (C) The Roundcube Dev Team                                  |
 |                                                                       |
 | Licensed under the GNU General Public License version 3 or            |
 | any later version with exceptions for skins & plugins.                |
 | See the README file for a full license statement.                     |
 +-----------------------------------------------------------------------+
*/

$config = [];

// Do not set db_dsnw here, use dpkg-reconfigure roundcube-core to configure database!
include_once("/etc/roundcube/debian-db-roundcube.php");

// The IMAP host chosen to perform the log-in.
// Leave blank to show a textbox at login, give a list of hosts
// to display a pulldown menu or set one host as string.
// Enter hostname with prefix ssl:// to use Implicit TLS, or use
// prefix tls:// to use STARTTLS.
// Supported replacement variables:
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %s - domain name after the '@' from e-mail address provided at login screen
// For example %n = mail.domain.tld, %t = domain.tld
$config['default_host'] = '';

// SMTP server host (for sending mails).
// Enter hostname with prefix ssl:// to use Implicit TLS, or use
// prefix tls:// to use STARTTLS.
// Supported replacement variables:
// %h - user's IMAP hostname
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %z - IMAP domain (IMAP hostname without the first part)
// For example %n = mail.domain.tld, %t = domain.tld
// To specify different SMTP servers for different IMAP hosts provide an array
// of IMAP host (no prefix or port) and SMTP server e.g. ['imap.example.com' => 'smtp.example.net']
$config['smtp_server'] = 'localhost';

// SMTP port. Use 25 for cleartext, 465 for Implicit TLS, or 587 for STARTTLS (default)
$config['smtp_port'] = 587;

// SMTP username (if required) if you use %u as the username Roundcube
// will use the current username for login
$config['smtp_user'] = '%u';

// SMTP password (if required) if you use %p as the password Roundcube
// will use the current user's password for login
$config['smtp_pass'] = '%p';

// provide an URL where a user can get support for this Roundcube installation
// PLEASE DO NOT LINK TO THE ROUNDCUBE.NET WEBSITE HERE!
$config['support_url'] = '';

// Name your service. This is displayed on the login screen and in the window title
$config['product_name'] = 'Roundcube Webmail';

// This key is used to encrypt the users imap password which is stored
// in the session record. For the default cipher method it must be
// exactly 24 characters long.
// YOUR KEY MUST BE DIFFERENT THAN THE SAMPLE VALUE FOR SECURITY REASONS
$config['des_key'] = 'zAdOxvrmol1f8vq24kNMqTCM';

// List of active plugins (in plugins/ directory)
// Debian: install roundcube-plugins first to have any
$config['plugins'] = [
    // 'archive',
    // 'zipdownload',
];

// skin name: folder from skins/
$config['skin'] = 'elastic';

// Disable spellchecking
// Debian: spellchecking needs additional packages to be installed, or calling external APIs
//         see defaults.inc.php for additional informations
$config['enable_spellcheck'] = false;
ubuntu@web-mail:~$ sudo nano /etc/roundcube/config.inc.php
ubuntu@web-mail:~$ sudo nano /etc/roundcube/config.inc.php
ubuntu@web-mail:~$ sudo cat /etc/roundcube/config.inc.php
<?php
/*
 +-----------------------------------------------------------------------+
 | Local configuration for the Roundcube Webmail installation.           |
 |                                                                       |
 | This is a sample configuration file only containing the minimum       |
 | setup required for a functional installation. Copy more options       |
 | from defaults.inc.php to this file to override the defaults.          |
 |                                                                       |
 | This file is part of the Roundcube Webmail client                     |
 | Copyright (C) The Roundcube Dev Team                                  |
 |                                                                       |
 | Licensed under the GNU General Public License version 3 or            |
 | any later version with exceptions for skins & plugins.                |
 | See the README file for a full license statement.                     |
 +-----------------------------------------------------------------------+
*/

$config = [];

// Do not set db_dsnw here, use dpkg-reconfigure roundcube-core to configure database!
include_once("/etc/roundcube/debian-db-roundcube.php");

// IMAP Configuration (non-SSL for testing)
$config['default_host'] = 'mail.gelani.com';
$config['default_port'] = 143;

// SMTP Configuration (non-SSL for testing)
$config['smtp_server'] = 'mail.gelani.com';
$config['smtp_port'] = 25;

// SMTP authentication
$config['smtp_user'] = '%u';
$config['smtp_pass'] = '%p';

// provide an URL where a user can get support for this Roundcube installation
// PLEASE DO NOT LINK TO THE ROUNDCUBE.NET WEBSITE HERE!
$config['support_url'] = '';

// Name your service
$config['product_name'] = 'Gelani Webmail';

// This key is used to encrypt the users imap password which is stored
// in the session record. For the default cipher method it must be
// exactly 24 characters long.
// YOUR KEY MUST BE DIFFERENT THAN THE SAMPLE VALUE FOR SECURITY REASONS
$config['des_key'] = 'zAdOxvrmol1f8vq24kNMqTCM';

// List of active plugins (in plugins/ directory)
// Debian: install roundcube-plugins first to have any
$config['plugins'] = [
    // 'archive',
    // 'zipdownload',
];

// skin name: folder from skins/
$config['skin'] = 'elastic';

// Disable spellchecking
// Debian: spellchecking needs additional packages to be installed, or calling external APIs
//         see defaults.inc.php for additional informations
$config['enable_spellcheck'] = false;






//Defalut files are these and these will be  commentout
//<?php

/*
 +-----------------------------------------------------------------------+
 | Local configuration for the Roundcube Webmail installation.           |
 |                                                                       |
 | This is a sample configuration file only containing the minimum       |
 | setup required for a functional installation. Copy more options       |
 | from defaults.inc.php to this file to override the defaults.          |
 |                                                                       |
 | This file is part of the Roundcube Webmail client                     |
 | Copyright (C) The Roundcube Dev Team                                  |
 |                                                                       |
 | Licensed under the GNU General Public License version 3 or            |
 | any later version with exceptions for skins & plugins.                |
 | See the README file for a full license statement.                     |
 +-----------------------------------------------------------------------+
*/

//$config = [];

// Do not set db_dsnw here, use dpkg-reconfigure roundcube-core to configure database!
/*include_once("/etc/roundcube/debian-db-roundcube.php");

// The IMAP host chosen to perform the log-in.
// Leave blank to show a textbox at login, give a list of hosts
// to display a pulldown menu or set one host as string.
// Enter hostname with prefix ssl:// to use Implicit TLS, or use
// prefix tls:// to use STARTTLS.
// Supported replacement variables:
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %s - domain name after the '@' from e-mail address provided at login screen
// For example %n = mail.domain.tld, %t = domain.tld
$config['default_host'] = '';

// SMTP server host (for sending mails).
// Enter hostname with prefix ssl:// to use Implicit TLS, or use
// prefix tls:// to use STARTTLS.
// Supported replacement variables:
// %h - user's IMAP hostname
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %z - IMAP domain (IMAP hostname without the first part)
// For example %n = mail.domain.tld, %t = domain.tld
// To specify different SMTP servers for different IMAP hosts provide an array
// of IMAP host (no prefix or port) and SMTP server e.g. ['imap.example.com' => 'smtp.example.net']
$config['smtp_server'] = 'localhost';

// SMTP port. Use 25 for cleartext, 465 for Implicit TLS, or 587 for STARTTLS (default)
$config['smtp_port'] = 587;

// SMTP username (if required) if you use %u as the username Roundcube
// will use the current username for login
$config['smtp_user'] = '%u';

// SMTP password (if required) if you use %p as the password Roundcube
// will use the current user's password for login
$config['smtp_pass'] = '%p';

// provide an URL where a user can get support for this Roundcube installation
// PLEASE DO NOT LINK TO THE ROUNDCUBE.NET WEBSITE HERE!
$config['support_url'] = '';

// Name your service. This is displayed on the login screen and in the window title
$config['product_name'] = 'Roundcube Webmail';

// This key is used to encrypt the users imap password which is stored
// in the session record. For the default cipher method it must be
// exactly 24 characters long.
// YOUR KEY MUST BE DIFFERENT THAN THE SAMPLE VALUE FOR SECURITY REASONS
$config['des_key'] = 'zAdOxvrmol1f8vq24kNMqTCM';

// List of active plugins (in plugins/ directory)
// Debian: install roundcube-plugins first to have any
$config['plugins'] = [
    // 'archive',
    // 'zipdownload',
];

// skin name: folder from skins/
$config['skin'] = 'elastic';

// Disable spellchecking
// Debian: spellchecking needs additional packages to be installed, or calling external APIs
//         see defaults.inc.php for additional informations
$config['enable_spellcheck'] = false;
*/
ubuntu@web-mail:~$ sudo chown -R www-data:www-data /var/lib/roundcube
ubuntu@web-mail:~$ sudo chmod -R 755 /var/lib/roundcube
ubuntu@web-mail:~$
ubuntu@web-mail:~$ sudo systemctl restart php8.1-fpm
ubuntu@web-mail:~$ sudo systemctl restart nginx
ubuntu@web-mail:~$ sudo systemctl status mariadb
● mariadb.service - MariaDB 10.6.22 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2025-12-04 12:12:19 UTC; 11min ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
    Process: 40427 ExecStartPre=/usr/bin/install -m 755 -o mysql -g root -d /var/run/mysqld (code=exited, status=0/SUCCESS)
    Process: 40428 ExecStartPre=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
    Process: 40430 ExecStartPre=/bin/sh -c [ ! -e /usr/bin/galera_recovery ] && VAR= ||   VAR=`/usr/bin/galera_recovery`; [ $? -eq 0 ]   && systemctl set-environment _WSR>
    Process: 40470 ExecStartPost=/bin/sh -c systemctl unset-environment _WSREP_START_POSITION (code=exited, status=0/SUCCESS)
    Process: 40472 ExecStartPost=/etc/mysql/debian-start (code=exited, status=0/SUCCESS)
   Main PID: 40459 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 9 (limit: 62548)
     Memory: 61.4M
        CPU: 357ms
     CGroup: /system.slice/mariadb.service
             └─40459 /usr/sbin/mariadbd

Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40474]: Upgrading MySQL tables if necessary.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: Looking for 'mariadb' as: /usr/bin/mariadb
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: Looking for 'mariadb-check' as: /usr/bin/mariadb-check
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: This installation of MariaDB is already upgraded to 10.6.22-MariaDB.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: There is no need to run mysql_upgrade again.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: You can use --force if you still want to run mysql_upgrade
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40485]: Checking for insecure root accounts.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40489]: Triggering myisam-recover for all MyISAM tables and aria-recover for all Aria tables
Dec 04 12:22:05 web-mail mariadbd[40459]: 2025-12-04 12:22:05 37 [Warning] Access denied for user 'roundcube'@'localhost' (using password: YES)
Dec 04 12:23:26 web-mail mariadbd[40459]: 2025-12-04 12:23:26 38 [Warning] Access denied for user 'roundcube'@'localhost' (using password: YES)

ubuntu@web-mail:~$ sudo systemctl enable mariadb
Synchronizing state of mariadb.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable mariadb
ubuntu@web-mail:~$ sudo dpkg-reconfigure roundcube-core
Determining localhost credentials from /etc/mysql/debian.cnf: succeeded.
dbconfig-common: writing config to /etc/dbconfig-common/roundcube.conf
dbconfig-common: flushing administrative password
INFO: Running /usr/share/roundcube/bin/update.sh as user 'www-data'
ubuntu@web-mail:~$ sudo dpkg-reconfigure roundcube-core
Determining localhost credentials from /etc/mysql/debian.cnf: succeeded.
Determining localhost credentials from /etc/mysql/debian.cnf: succeeded.
dbconfig-common: writing config to /etc/dbconfig-common/roundcube.conf
checking privileges on database roundcube for roundcube@localhost: user creation needed.
granting access to database roundcube for roundcube@localhost: success.
verifying access for roundcube@localhost: success.
dbconfig-common: dumping mysql database roundcube to /var/tmp/roundcube.roundcube.2025-12-04-12.27.mysql.Am1BR9.
database does not exist.
dbconfig-common: dropping old mysql database roundcube.
dropping database roundcube: database does not exist.
creating database roundcube: success.
verifying database roundcube exists: success.
populating database via sql...  done.
dbconfig-common: flushing administrative password
INFO: Running /usr/share/roundcube/bin/update.sh as user 'www-data'
ubuntu@web-mail:~$ sudo mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 54
Server version: 10.6.22-MariaDB-0ubuntu0.22.04.1 Ubuntu 22.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| roundcube          |
| sys                |
+--------------------+
5 rows in set (0.001 sec)

MariaDB [(none)]> EXIT
Bye
ubuntu@web-mail:~$ sudo cat /etc/roundcube/debian-db-roundcube.php
<?php
include_once("/etc/roundcube/debian-db.php");

switch ($dbtype) {
 case "sqlite":
 case "sqlite3":
   $config['db_dsnw'] = "sqlite:///$basepath/$dbname?mode=0640";
   break;
 default:
   if ($dbport != '') $dbport=":$dbport";
   if ($dbserver == '') $dbserver="localhost";
   $config['db_dsnw'] = "$dbtype://$dbuser:$dbpass@$dbserver$dbport/$dbname";
   break;
 }
?>
ubuntu@web-mail:~$ sudo tail -50 /var/log/roundcube/errors.log
[04-Dec-2025 12:22:05 +0000]: <mtrpl3hm> DB Error: SQLSTATE[HY000] [1045] Access denied for user 'roundcube'@'localhost' (using password: YES) in /usr/share/roundcube/program/lib/Roundcube/rcube_db.php on line 195 (GET /)
[04-Dec-2025 12:22:05 UTC] PHP Deprecated:  preg_replace(): Passing null to parameter #3 ($subject) of type array|string is deprecated in /usr/share/roundcube/program/lib/Roundcube/bootstrap.php on line 325
[04-Dec-2025 12:22:05 +0000]: <mtrpl3hm> DB Error: SQLSTATE[HY000] [1045] Access denied for user 'roundcube'@'localhost' (using password: YES) (GET /)
[04-Dec-2025 12:22:05 UTC] PHP Deprecated:  preg_replace(): Passing null to parameter #3 ($subject) of type array|string is deprecated in /usr/share/roundcube/program/lib/Roundcube/bootstrap.php on line 325
[04-Dec-2025 12:23:26 +0000]: <2jsi1ptj> DB Error: SQLSTATE[HY000] [1045] Access denied for user 'roundcube'@'localhost' (using password: YES) in /usr/share/roundcube/program/lib/Roundcube/rcube_db.php on line 195 (GET /)
[04-Dec-2025 12:23:26 UTC] PHP Deprecated:  preg_replace(): Passing null to parameter #3 ($subject) of type array|string is deprecated in /usr/share/roundcube/program/lib/Roundcube/bootstrap.php on line 325
[04-Dec-2025 12:23:26 +0000]: <2jsi1ptj> DB Error: SQLSTATE[HY000] [1045] Access denied for user 'roundcube'@'localhost' (using password: YES) (GET /)
[04-Dec-2025 12:23:26 UTC] PHP Deprecated:  preg_replace(): Passing null to parameter #3 ($subject) of type array|string is deprecated in /usr/share/roundcube/program/lib/Roundcube/bootstrap.php on line 325
[04-Dec-2025 12:25:46 UTC] PHP Deprecated:  substr(): Passing null to parameter #1 ($string) of type string is deprecated in /usr/share/roundcube/program/lib/Roundcube/rcube.php on line 837
[04-Dec-2025 12:25:46 UTC] PHP Deprecated:  preg_replace(): Passing null to parameter #3 ($subject) of type array|string is deprecated in /usr/share/roundcube/program/lib/Roundcube/bootstrap.php on line 325
[04-Dec-2025 12:27:49 UTC] PHP Deprecated:  substr(): Passing null to parameter #1 ($string) of type string is deprecated in /usr/share/roundcube/program/lib/Roundcube/rcube.php on line 837
[04-Dec-2025 12:27:49 UTC] PHP Deprecated:  preg_replace(): Passing null to parameter #3 ($subject) of type array|string is deprecated in /usr/share/roundcube/program/lib/Roundcube/bootstrap.php on line 325
ubuntu@web-mail:~$ sudo systemctl status mariadb
● mariadb.service - MariaDB 10.6.22 database server
     Loaded: loaded (/lib/systemd/system/mariadb.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2025-12-04 12:12:19 UTC; 16min ago
       Docs: man:mariadbd(8)
             https://mariadb.com/kb/en/library/systemd/
   Main PID: 40459 (mariadbd)
     Status: "Taking your SQL requests now..."
      Tasks: 9 (limit: 62548)
     Memory: 63.8M
        CPU: 401ms
     CGroup: /system.slice/mariadb.service
             └─40459 /usr/sbin/mariadbd

Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: Looking for 'mariadb-check' as: /usr/bin/mariadb-check
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: This installation of MariaDB is already upgraded to 10.6.22-MariaDB.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: There is no need to run mysql_upgrade again.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40477]: You can use --force if you still want to run mysql_upgrade
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40485]: Checking for insecure root accounts.
Dec 04 12:12:19 web-mail /etc/mysql/debian-start[40489]: Triggering myisam-recover for all MyISAM tables and aria-recover for all Aria tables
Dec 04 12:22:05 web-mail mariadbd[40459]: 2025-12-04 12:22:05 37 [Warning] Access denied for user 'roundcube'@'localhost' (using password: YES)
Dec 04 12:23:26 web-mail mariadbd[40459]: 2025-12-04 12:23:26 38 [Warning] Access denied for user 'roundcube'@'localhost' (using password: YES)
Dec 04 12:27:49 web-mail mariadbd[40459]: 2025-12-04 12:27:49 39 [Warning] Access denied for user 'roundcube'@'localhost' (using password: YES)
Dec 04 12:27:49 web-mail mariadbd[40459]: 2025-12-04 12:27:49 41 [Warning] Access denied for user 'roundcube'@'localhost' (using password: YES)
ubuntu@web-mail:~$
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
ubuntu@web-mail:~$ sudo adduser nahid-101
Adding user `nahid-101' ...
Adding new group `nahid-101' (1001) ...
Adding new user `nahid-101' (1001) with group `nahid-101' ...
Creating home directory `/home/nahid-101' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for nahid-101
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y
ubuntu@web-mail:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:39:0e:80 brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.20.15/24 metric 100 brd 192.168.20.255 scope global dynamic ens3
       valid_lft 32883sec preferred_lft 32883sec
    inet6 fe80::f816:3eff:fe39:e80/64 scope link
       valid_lft forever preferred_lft forever
ubuntu@web-mail:~$ sudo adduser fuad-102
Adding user `fuad-102' ...
Adding new group `fuad-102' (1002) ...
Adding new user `fuad-102' (1002) with group `fuad-102' ...
Creating home directory `/home/fuad-102' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for fuad-102
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y
ubuntu@web-mail:~$ sudo adduser ashfaq
Adding user `ashfaq' ...
Adding new group `ashfaq' (1003) ...
Adding new user `ashfaq' (1003) with group `ashfaq' ...
Creating home directory `/home/ashfaq' ...
Copying files from `/etc/skel' ...
New password:
Retype new password:
passwd: password updated successfully
Changing the user information for ashfaq
Enter the new value, or press ENTER for the default
        Full Name []:
        Room Number []:
        Work Phone []:
        Home Phone []:
        Other []:
Is the information correct? [Y/n] y
ubuntu@web-mail:~$ sudo i
sudo: i: command not found
ubuntu@web-mail:~$ sudo bash
root@web-mail:/home/ubuntu# usermod -l ashfaq-103 ashfaq
root@web-mail:/home/ubuntu# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:102:105::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
syslog:x:104:111::/home/syslog:/usr/sbin/nologin
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
tss:x:106:112:TPM software stack,,,:/var/lib/tpm:/bin/false
uuidd:x:107:113::/run/uuidd:/usr/sbin/nologin
tcpdump:x:108:114::/nonexistent:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
landscape:x:111:116::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:112:117:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
postfix:x:113:122::/var/spool/postfix:/usr/sbin/nologin
dovecot:x:114:124:Dovecot mail server,,,:/usr/lib/dovecot:/usr/sbin/nologin
dovenull:x:115:125:Dovecot login user,,,:/nonexistent:/usr/sbin/nologin
mysql:x:116:126:MySQL Server,,,:/nonexistent:/bin/false
nahid-101:x:1001:1001:,,,:/home/nahid-101:/bin/bash
fuad-102:x:1002:1002:,,,:/home/fuad-102:/bin/bash
ashfaq-103:x:1003:1003:,,,:/home/ashfaq:/bin/bash
root@web-mail:/home/ubuntu# nano rename-user.sh
root@web-mail:/home/ubuntu# chmod +x rename-user.sh
root@web-mail:/home/ubuntu# ./rename-user.sh
Renaming user...
usermod: user 'ashfaq' does not exist
usermod: directory /home/ashfaq-103 exists
Done! ✔️
User has been renamed from ashfaq to ashfaq-103.
It is recommended to reboot:  sudo reboot
root@web-mail:/home/ubuntu# cat rename-user.sh
#!/bin/bash

OLD_USER="ashfaq"
NEW_USER="ashfaq-103"

# 1. Make sure you're not logged in as the user you want to rename
if [ "$(whoami)" = "$OLD_USER" ]; then
  echo "❌ You are logged in as $OLD_USER. Log in as root or another sudo user."
  exit 1
fi

echo "Renaming user..."

# 2. Change the username
usermod -l "$NEW_USER" "$OLD_USER"

# 3. Rename group if it exists and matches old username
if getent group "$OLD_USER" > /dev/null; then
  groupmod -n "$NEW_USER" "$OLD_USER"
fi

# 4. Rename the home directory
if [ -d "/home/$OLD_USER" ]; then
  mv "/home/$OLD_USER" "/home/$NEW_USER"
fi

# 5. Update home directory path in user settings
usermod -d "/home/$NEW_USER" -m "$NEW_USER"

echo "Done! ✔️"
echo "User has been renamed from $OLD_USER to $NEW_USER."
echo "It is recommended to reboot:  sudo reboot"
root@web-mail:/home/ubuntu# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:102:105::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
syslog:x:104:111::/home/syslog:/usr/sbin/nologin
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
tss:x:106:112:TPM software stack,,,:/var/lib/tpm:/bin/false
uuidd:x:107:113::/run/uuidd:/usr/sbin/nologin
tcpdump:x:108:114::/nonexistent:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
landscape:x:111:116::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:112:117:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
postfix:x:113:122::/var/spool/postfix:/usr/sbin/nologin
dovecot:x:114:124:Dovecot mail server,,,:/usr/lib/dovecot:/usr/sbin/nologin
dovenull:x:115:125:Dovecot login user,,,:/nonexistent:/usr/sbin/nologin
mysql:x:116:126:MySQL Server,,,:/nonexistent:/bin/false
nahid-101:x:1001:1001:,,,:/home/nahid-101:/bin/bash
fuad-102:x:1002:1002:,,,:/home/fuad-102:/bin/bash
ashfaq-103:x:1003:1003:,,,:/home/ashfaq-103:/bin/bash
root@web-mail:/home/ubuntu#
-------------------------------------------------------------------------------------------------------------------------------------------------------------
root@web-mail:/home/ubuntu# ls
Maildir  rename-user.sh
root@web-mail:/home/ubuntu# nano rename-user.sh
root@web-mail:/home/ubuntu# ./rename-user.sh
Renaming user...
usermod: user 'ashfaq-101' does not exist
usermod: user 'ashfaq-101' does not exist
Done! ✔️
User has been renamed from ashfaq-101 to ashfaq-101.
It is recommended to reboot:  sudo reboot
root@web-mail:/home/ubuntu# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:102:105::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
syslog:x:104:111::/home/syslog:/usr/sbin/nologin
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
tss:x:106:112:TPM software stack,,,:/var/lib/tpm:/bin/false
uuidd:x:107:113::/run/uuidd:/usr/sbin/nologin
tcpdump:x:108:114::/nonexistent:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
landscape:x:111:116::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:112:117:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
postfix:x:113:122::/var/spool/postfix:/usr/sbin/nologin
dovecot:x:114:124:Dovecot mail server,,,:/usr/lib/dovecot:/usr/sbin/nologin
dovenull:x:115:125:Dovecot login user,,,:/nonexistent:/usr/sbin/nologin
mysql:x:116:126:MySQL Server,,,:/nonexistent:/bin/false
nahid-101:x:1001:1001:,,,:/home/nahid-101:/bin/bash
fuad-102:x:1002:1002:,,,:/home/fuad-102:/bin/bash
ashfaq-103:x:1003:1003:,,,:/home/ashfaq-103:/bin/bash
root@web-mail:/home/ubuntu# nano rename-user.sh
root@web-mail:/home/ubuntu# nano rename-user.sh
root@web-mail:/home/ubuntu# ./rename-user.sh
Renaming user...
usermod: directory /home/ashfaq-101 exists
Done! ✔️
User has been renamed from ashfaq-103 to ashfaq-101.
It is recommended to reboot:  sudo reboot
root@web-mail:/home/ubuntu# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:102:105::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
syslog:x:104:111::/home/syslog:/usr/sbin/nologin
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
tss:x:106:112:TPM software stack,,,:/var/lib/tpm:/bin/false
uuidd:x:107:113::/run/uuidd:/usr/sbin/nologin
tcpdump:x:108:114::/nonexistent:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
landscape:x:111:116::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:112:117:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
postfix:x:113:122::/var/spool/postfix:/usr/sbin/nologin
dovecot:x:114:124:Dovecot mail server,,,:/usr/lib/dovecot:/usr/sbin/nologin
dovenull:x:115:125:Dovecot login user,,,:/nonexistent:/usr/sbin/nologin
mysql:x:116:126:MySQL Server,,,:/nonexistent:/bin/false
nahid-101:x:1001:1001:,,,:/home/nahid-101:/bin/bash
fuad-102:x:1002:1002:,,,:/home/fuad-102:/bin/bash
ashfaq-101:x:1003:1003:,,,:/home/ashfaq-101:/bin/bash
root@web-mail:/home/ubuntu# nano rename-user.sh
root@web-mail:/home/ubuntu# ./rename-user.sh
Renaming user...
usermod: directory /home/fuad-101 exists
Done! ✔️
User has been renamed from fuad-102 to fuad-101.
It is recommended to reboot:  sudo reboot
root@web-mail:/home/ubuntu# cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
systemd-network:x:100:102:systemd Network Management,,,:/run/systemd:/usr/sbin/nologin
systemd-resolve:x:101:103:systemd Resolver,,,:/run/systemd:/usr/sbin/nologin
messagebus:x:102:105::/nonexistent:/usr/sbin/nologin
systemd-timesync:x:103:106:systemd Time Synchronization,,,:/run/systemd:/usr/sbin/nologin
syslog:x:104:111::/home/syslog:/usr/sbin/nologin
_apt:x:105:65534::/nonexistent:/usr/sbin/nologin
tss:x:106:112:TPM software stack,,,:/var/lib/tpm:/bin/false
uuidd:x:107:113::/run/uuidd:/usr/sbin/nologin
tcpdump:x:108:114::/nonexistent:/usr/sbin/nologin
sshd:x:109:65534::/run/sshd:/usr/sbin/nologin
pollinate:x:110:1::/var/cache/pollinate:/bin/false
landscape:x:111:116::/var/lib/landscape:/usr/sbin/nologin
fwupd-refresh:x:112:117:fwupd-refresh user,,,:/run/systemd:/usr/sbin/nologin
ubuntu:x:1000:1000:Ubuntu:/home/ubuntu:/bin/bash
lxd:x:999:100::/var/snap/lxd/common/lxd:/bin/false
postfix:x:113:122::/var/spool/postfix:/usr/sbin/nologin
dovecot:x:114:124:Dovecot mail server,,,:/usr/lib/dovecot:/usr/sbin/nologin
dovenull:x:115:125:Dovecot login user,,,:/nonexistent:/usr/sbin/nologin
mysql:x:116:126:MySQL Server,,,:/nonexistent:/bin/false
nahid-101:x:1001:1001:,,,:/home/nahid-101:/bin/bash
ashfaq-101:x:1003:1003:,,,:/home/ashfaq-101:/bin/bash
fuad-101:x:1002:1002:,,,:/home/fuad-101:/bin/bash
root@web-mail:/home/ubuntu#


