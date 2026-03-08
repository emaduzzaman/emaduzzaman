```
ubuntu@dns-lab:~$ sudo apt update

Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease \[129 kB]

Hit:2 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy InRelease

Get:3 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease \[128 kB]

Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages \[2843 kB]

Get:5 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease \[127 kB]

Get:6 http://security.ubuntu.com/ubuntu jammy-security/main Translation-en \[411 kB]

Get:7 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata \[13.9 kB]

Get:8 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 Packages \[4772 kB]

Get:9 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 Packages \[14.1 MB]

Get:10 http://security.ubuntu.com/ubuntu jammy-security/restricted Translation-en \[893 kB]

Get:11 http://security.ubuntu.com/ubuntu jammy-security/restricted amd64 c-n-f Metadata \[652 B]

Get:12 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages \[1006 kB]

Get:13 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en \[220 kB]

Get:14 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 c-n-f Metadata \[22.3 kB]

Get:15 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 Packages \[50.5 kB]

Get:16 http://security.ubuntu.com/ubuntu jammy-security/multiverse Translation-en \[10.2 kB]

Get:17 http://security.ubuntu.com/ubuntu jammy-security/multiverse amd64 c-n-f Metadata \[376 B]

Get:18 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy/universe Translation-en \[5652 kB]

Get:19 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy/universe amd64 c-n-f Metadata \[286 kB]

Get:20 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 Packages \[217 kB]

Get:21 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy/multiverse Translation-en \[112 kB]

Get:22 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy/multiverse amd64 c-n-f Metadata \[8372 B]

Get:23 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages \[3109 kB]

Get:24 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main Translation-en \[478 kB]

Get:25 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata \[19.0 kB]

Get:26 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 Packages \[4939 kB]

Get:27 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted Translation-en \[921 kB]

Get:28 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/restricted amd64 c-n-f Metadata \[640 B]

Get:29 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages \[1244 kB]

Get:30 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en \[310 kB]

Get:31 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 c-n-f Metadata \[30.0 kB]

Get:32 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 Packages \[57.6 kB]

Get:33 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse Translation-en \[13.2 kB]

Get:34 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/multiverse amd64 c-n-f Metadata \[600 B]

Get:35 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 Packages \[69.4 kB]

Get:36 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/main Translation-en \[11.5 kB]

Get:37 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/main amd64 c-n-f Metadata \[412 B]

Get:38 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/restricted amd64 c-n-f Metadata \[116 B]

Get:39 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 Packages \[30.1 kB]

Get:40 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe Translation-en \[16.6 kB]

Get:41 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/universe amd64 c-n-f Metadata \[672 B]

Get:42 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports/multiverse amd64 c-n-f Metadata \[116 B]

Fetched 42.2 MB in 7s (5632 kB/s)

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

80 packages can be upgraded. Run 'apt list --upgradable' to see them.

ubuntu@dns-lab:~$ sudo apt upgrade -y

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

Get:1 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dpkg amd64 1.21.1ubuntu2.6 \[1239 kB]

Get:2 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libperl5.34 amd64 5.34.0-3ubuntu1.5 \[4797 kB]

Get:3 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl amd64 5.34.0-3ubuntu1.5 \[232 kB]

Get:4 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-base amd64 5.34.0-3ubuntu1.5 \[1761 kB]

Get:5 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 perl-modules-5.34 all 5.34.0-3ubuntu1.5 \[2977 kB]

Get:6 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gcc-12-base amd64 12.3.0-1ubuntu1~22.04.2 \[20.6 kB]

Get:7 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgcc-s1 amd64 12.3.0-1ubuntu1~22.04.2 \[53.9 kB]

Get:8 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libstdc++6 amd64 12.3.0-1ubuntu1~22.04.2 \[699 kB]

Get:9 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc6 amd64 2.35-0ubuntu3.11 \[3235 kB]

Get:10 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libc-bin amd64 2.35-0ubuntu3.11 \[706 kB]

Get:11 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10 amd64 3.10.12-1~22.04.12 \[1949 kB]

Get:12 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssl3 amd64 3.0.2-0ubuntu1.20 \[1905 kB]

Get:13 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10 amd64 3.10.12-1~22.04.12 \[508 kB]

Get:14 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-stdlib amd64 3.10.12-1~22.04.12 \[1849 kB]

Get:15 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3.10-minimal amd64 3.10.12-1~22.04.12 \[2268 kB]

Get:16 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libpython3.10-minimal amd64 3.10.12-1~22.04.12 \[815 kB]

Get:17 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libsqlite3-0 amd64 3.37.2-2ubuntu0.5 \[643 kB]

Get:18 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-data all 2.72.4-0ubuntu2.6 \[4698 B]

Get:19 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-bin amd64 2.72.4-0ubuntu2.6 \[80.9 kB]

Get:20 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libglib2.0-0 amd64 2.72.4-0ubuntu2.6 \[1467 kB]

Get:21 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libxml2 amd64 2.9.13+dfsg-1ubuntu0.10 \[764 kB]

Get:22 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 open-vm-tools amd64 2:12.3.5-3~ubuntu0.22.04.3 \[747 kB]

Get:23 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-client amd64 2.2.27-3ubuntu2.4 \[62.7 kB]

Get:24 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dirmngr amd64 2.2.27-3ubuntu2.4 \[293 kB]

Get:25 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-wks-server amd64 2.2.27-3ubuntu2.4 \[57.5 kB]

Get:26 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-utils amd64 2.2.27-3ubuntu2.4 \[309 kB]

Get:27 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg-agent amd64 2.2.27-3ubuntu2.4 \[209 kB]

Get:28 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpg amd64 2.2.27-3ubuntu2.4 \[518 kB]

Get:29 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgconf amd64 2.2.27-3ubuntu2.4 \[94.5 kB]

Get:30 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg-l10n all 2.2.27-3ubuntu2.4 \[54.7 kB]

Get:31 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gnupg all 2.2.27-3ubuntu2.4 \[315 kB]

Get:32 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgsm amd64 2.2.27-3ubuntu2.4 \[197 kB]

Get:33 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libgnutls30 amd64 3.7.3-4ubuntu1.7 \[967 kB]

Get:34 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 gpgv amd64 2.2.27-3ubuntu2.4 \[137 kB]

Get:35 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 distro-info-data all 0.52ubuntu0.11 \[5444 B]

Get:36 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-ping amd64 3:20211215-1ubuntu0.1 \[43.0 kB]

Get:37 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 locales all 2.35-0ubuntu3.11 \[4247 kB]

Get:38 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 openssl amd64 3.0.2-0ubuntu1.20 \[1185 kB]

Get:39 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client-l10n amd64 37.1ubuntu0~22.04 \[20.7 kB]

Get:40 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-pro-client amd64 37.1ubuntu0~22.04 \[238 kB]

Get:41 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 ubuntu-advantage-tools all 37.1ubuntu0~22.04 \[10.9 kB]

Get:42 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-dnsutils amd64 1:9.18.39-0ubuntu0.22.04.2 \[158 kB]

Get:43 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-host amd64 1:9.18.39-0ubuntu0.22.04.2 \[52.5 kB]

Get:44 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-libs amd64 1:9.18.39-0ubuntu0.22.04.2 \[1262 kB]

Get:45 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 iputils-tracepath amd64 3:20211215-1ubuntu0.1 \[14.2 kB]

Get:46 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 powermgmt-base all 1.36ubuntu0.22.04.1 \[7736 B]

Get:47 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-problem-report all 2.20.11-0ubuntu82.10 \[11.4 kB]

Get:48 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 python3-apport all 2.20.11-0ubuntu82.10 \[89.0 kB]

Get:49 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 apport all 2.20.11-0ubuntu82.10 \[135 kB]

Get:50 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf0 amd64 2.38-4ubuntu2.11 \[103 kB]

Get:51 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libctf-nobfd0 amd64 2.38-4ubuntu2.11 \[108 kB]

Get:52 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-x86-64-linux-gnu amd64 2.38-4ubuntu2.11 \[2324 kB]

Get:53 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libbinutils amd64 2.38-4ubuntu2.11 \[658 kB]

Get:54 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils amd64 2.38-4ubuntu2.11 \[3200 B]

Get:55 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 binutils-common amd64 2.38-4ubuntu2.11 \[223 kB]

Get:56 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libssh-4 amd64 0.9.6-2ubuntu0.22.04.5 \[187 kB]

Get:57 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.21 \[194 kB]

Get:58 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.21 \[290 kB]

Get:59 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl3-gnutls amd64 7.81.0-1ubuntu1.21 \[284 kB]

Get:60 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git-man all 1:2.34.1-1ubuntu1.15 \[955 kB]

Get:61 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 git amd64 1:2.34.1-1ubuntu1.15 \[3166 kB]

Get:62 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 landscape-common amd64 23.02-0ubuntu1~22.04.6 \[88.9 kB]

Get:63 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libudisks2-0 amd64 2.9.4-1ubuntu2.3 \[167 kB]

Get:64 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-163 all 5.15.0-163.173 \[12.4 MB]

Get:65 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-163-generic amd64 5.15.0-163.173 \[2861 kB]

Get:66 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-modules-5.15.0-163-generic amd64 5.15.0-163.173 \[22.7 MB]

Get:67 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-5.15.0-163-generic amd64 5.15.0-163.173 \[11.6 MB]

Get:68 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-virtual amd64 5.15.0.163.158 \[1654 B]

Get:69 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-image-virtual amd64 5.15.0.163.158 \[2434 B]

Get:70 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-virtual amd64 5.15.0.163.158 \[1636 B]

Get:71 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-generic amd64 5.15.0.163.158 \[2328 B]

Get:72 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 needrestart all 3.5-5ubuntu2.5 \[45.5 kB]

Get:73 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 snapd amd64 2.72+ubuntu22.04 \[31.8 MB]

Get:74 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 sosreport amd64 4.9.2-0ubuntu0~22.04.1 \[367 kB]

Get:75 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 systemd-hwe-hwdb all 249.11.6 \[3668 B]

Get:76 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 cloud-init all 25.2-0ubuntu1~22.04.1 \[586 kB]

Fetched 130 MB in 1min 36s (1360 kB/s)

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

ubuntu@dns-lab:~$ ip addr show

1: lo: <LOOPBACK,UP,LOWER\_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000

&nbsp;   link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00

&nbsp;   inet 127.0.0.1/8 scope host lo

&nbsp;      valid\_lft forever preferred\_lft forever

&nbsp;   inet6 ::1/128 scope host

&nbsp;      valid\_lft forever preferred\_lft forever

2: ens3: <BROADCAST,MULTICAST,UP,LOWER\_UP> mtu 8942 qdisc fq\_codel state UP group default qlen 1000

&nbsp;   link/ether fa:16:3e:01:4b:10 brd ff:ff:ff:ff:ff:ff

&nbsp;   altname enp0s3

&nbsp;   inet 192.168.20.20/24 metric 100 brd 192.168.20.255 scope global dynamic ens3

&nbsp;      valid\_lft 43173sec preferred\_lft 43173sec

&nbsp;   inet6 fe80::f816:3eff:fe01:4b10/64 scope link

&nbsp;      valid\_lft forever preferred\_lft forever

ubuntu@dns-lab:~$ ip route show

default via 192.168.20.1 dev ens3 proto dhcp src 192.168.20.20 metric 100

8.8.8.8 via 192.168.20.1 dev ens3 proto dhcp src 192.168.20.20 metric 100

169.254.169.254 via 192.168.20.10 dev ens3 proto dhcp src 192.168.20.20 metric 100

192.168.20.0/24 dev ens3 proto kernel scope link src 192.168.20.20 metric 100

192.168.20.1 dev ens3 proto dhcp scope link src 192.168.20.20 metric 100

192.168.20.10 dev ens3 proto dhcp scope link src 192.168.20.20 metric 100

ubuntu@dns-lab:~$ cat /etc/netplan/\*.yaml

cat: /etc/netplan/50-cloud-init.yaml: Permission denied

ubuntu@dns-lab:~$ sudo bash

root@dns-lab:/home/ubuntu# cat /etc/netplan/\*.yaml

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

&nbsp;               macaddress: fa:16:3e:01:4b:10

&nbsp;           mtu: 8942

&nbsp;           set-name: ens3

root@dns-lab:/home/ubuntu# sudo nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

root@dns-lab:/home/ubuntu# sudo nano /etc/netplan/01-netcfg.yaml

root@dns-lab:/home/ubuntu# sudo netplan try



\*\* (process:10365): WARNING \*\*: 06:39:22.784: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (generate:10367): WARNING \*\*: 06:39:22.788: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.

WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.



\*\* (process:10365): WARNING \*\*: 06:39:23.021: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (process:10365): WARNING \*\*: 06:39:23.111: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (process:10365): WARNING \*\*: 06:39:23.111: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.

Do you want to keep these settings?





Press ENTER before the timeout to accept the new configuration





Changes will revert in 118 seconds

Configuration accepted.

root@dns-lab:/home/ubuntu# ip addr show ens3

2: ens3: <BROADCAST,MULTICAST,UP,LOWER\_UP> mtu 8942 qdisc fq\_codel state UP group default qlen 1000

&nbsp;   link/ether fa:16:3e:01:4b:10 brd ff:ff:ff:ff:ff:ff

&nbsp;   altname enp0s3

&nbsp;   inet 192.168.20.18/24 brd 192.168.20.255 scope global ens3

&nbsp;      valid\_lft forever preferred\_lft forever

&nbsp;   inet 192.168.20.20/24 metric 100 brd 192.168.20.255 scope global secondary dynamic ens3

&nbsp;      valid\_lft 43187sec preferred\_lft 43187sec

&nbsp;   inet6 fe80::f816:3eff:fe01:4b10/64 scope link

&nbsp;      valid\_lft forever preferred\_lft forever

root@dns-lab:/home/ubuntu# ip route show

default via 192.168.20.1 dev ens3 proto static

default via 192.168.20.1 dev ens3 proto dhcp src 192.168.20.20 metric 100

8.8.8.8 via 192.168.20.1 dev ens3 proto dhcp src 192.168.20.20 metric 100

169.254.169.254 via 192.168.20.10 dev ens3 proto dhcp src 192.168.20.20 metric 100

192.168.20.0/24 dev ens3 proto kernel scope link src 192.168.20.18

192.168.20.1 dev ens3 proto dhcp scope link src 192.168.20.20 metric 100

192.168.20.10 dev ens3 proto dhcp scope link src 192.168.20.20 metric 100

root@dns-lab:/home/ubuntu# ping -c 3 192.168.20.1

PING 192.168.20.1 (192.168.20.1) 56(84) bytes of data.

64 bytes from 192.168.20.1: icmp\_seq=1 ttl=254 time=2.43 ms

64 bytes from 192.168.20.1: icmp\_seq=2 ttl=254 time=0.632 ms

^C

--- 192.168.20.1 ping statistics ---

2 packets transmitted, 2 received, 0% packet loss, time 1001ms

rtt min/avg/max/mdev = 0.632/1.530/2.428/0.898 ms

root@dns-lab:/home/ubuntu# ping -c 3 8.8.8.8

PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.

64 bytes from 8.8.8.8: icmp\_seq=1 ttl=117 time=33.3 ms

64 bytes from 8.8.8.8: icmp\_seq=2 ttl=117 time=31.0 ms

^C

--- 8.8.8.8 ping statistics ---

2 packets transmitted, 2 received, 0% packet loss, time 1000ms

rtt min/avg/max/mdev = 30.975/32.147/33.319/1.172 ms

root@dns-lab:/home/ubuntu# cat nano /etc/netplan/01-netcfg.yaml

cat: nano: No such file or directory

network:

&nbsp; version: 2

&nbsp; renderer: networkd

&nbsp; ethernets:

&nbsp;   ens3:

&nbsp;     addresses:

&nbsp;       - 192.168.20.18/24

&nbsp;     routes:

&nbsp;       - to: default

&nbsp;         via: 192.168.20.1

&nbsp;     nameservers:

&nbsp;       addresses:

&nbsp;         - 127.0.0.1

&nbsp;         - 8.8.8.8

&nbsp;     match:

&nbsp;       macaddress: fa:16:3e:01:4b:10

&nbsp;     mtu: 8942

root@dns-lab:/home/ubuntu# cat nano /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

cat: nano: No such file or directory

network: {config: disabled}

root@dns-lab:/home/ubuntu# sudo nano /etc/netplan/01-netcfg.yaml

root@dns-lab:/home/ubuntu# cat /etc/netplan/01-netcfg.yaml

network:

&nbsp; version: 2

&nbsp; renderer: networkd

&nbsp; ethernets:

&nbsp;   ens3:

&nbsp;     addresses:

&nbsp;       - 192.168.20.20/24

&nbsp;     routes:

&nbsp;       - to: default

&nbsp;         via: 192.168.20.1

&nbsp;     nameservers:

&nbsp;       addresses:

&nbsp;         - 127.0.0.1

&nbsp;         - 8.8.8.8

&nbsp;     match:

&nbsp;       macaddress: fa:16:3e:01:4b:10

&nbsp;     mtu: 8942

root@dns-lab:/home/ubuntu# netplan apply



\*\* (generate:10430): WARNING \*\*: 06:42:32.467: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.

WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.



\*\* (process:10428): WARNING \*\*: 06:42:32.683: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (process:10428): WARNING \*\*: 06:42:32.767: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.



\*\* (process:10428): WARNING \*\*: 06:42:32.767: Permissions for /etc/netplan/01-netcfg.yaml are too open. Netplan configuration should NOT be accessible by others.

root@dns-lab:/home/ubuntu# sudo chmod 600 /etc/netplan/01-netcfg.yaml

root@dns-lab:/home/ubuntu# sudo chown root:root /etc/netplan/01-netcfg.yaml

root@dns-lab:/home/ubuntu# sudo rm /etc/netplan/50-cloud-init.yaml 2>/dev/null

root@dns-lab:/home/ubuntu# cat /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

network: {config: disabled}

root@dns-lab:/home/ubuntu# sudo systemctl stop systemd-networkd-wait-online.service

root@dns-lab:/home/ubuntu# sudo systemctl disable systemd-networkd-wait-online.service

Removed /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service.

root@dns-lab:/home/ubuntu# sudo reboot

Connection to 160.191.150.171 closed by remote host.

Connection to 160.191.150.171 closed.

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ping 160.191.150.171

PING 160.191.150.171 (160.191.150.171) 56(84) bytes of data.

64 bytes from 160.191.150.171: icmp\_seq=6 ttl=55 time=41.2 ms

64 bytes from 160.191.150.171: icmp\_seq=7 ttl=55 time=14.5 ms

^C

--- 160.191.150.171 ping statistics ---

7 packets transmitted, 2 received, 71.4286% packet loss, time 6077ms

rtt min/avg/max/mdev = 14.522/27.885/41.248/13.363 ms

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ssh ubuntu@160.191.150.171

ssh: connect to host 160.191.150.171 port 22: Connection refused

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ssh ubuntu@160.191.150.171

ssh: connect to host 160.191.150.171 port 22: Connection refused

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ssh ubuntu@160.191.150.171

\\ssh: connect to host 160.191.150.171 port 22: Connection refused

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ssh ubuntu@160.191.150.171

ssh: connect to host 160.191.150.171 port 22: Connection refused

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ssh ubuntu@160.191.150.171

ssh: connect to host 160.191.150.171 port 22: Connection refused

emaduzzaman@KAZI-EMADUZZAMAN-2700:~$ ssh ubuntu@160.191.150.171

ubuntu@160.191.150.171's password:

Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-163-generic x86\_64)



&nbsp;\* Documentation:  https://help.ubuntu.com

&nbsp;\* Management:     https://landscape.canonical.com

&nbsp;\* Support:        https://ubuntu.com/pro



&nbsp;System information as of Thu Dec  4 06:45:23 UTC 2025



&nbsp; System load:  0.23              Processes:             102

&nbsp; Usage of /:   2.7% of 77.35GB   Users logged in:       0

&nbsp; Memory usage: 5%                IPv4 address for ens3: 192.168.20.20

&nbsp; Swap usage:   0%





Expanded Security Maintenance for Applications is not enabled.



0 updates can be applied immediately.



Enable ESM Apps to receive additional future security updates.

See https://ubuntu.com/esm or run: sudo pro status



New release '24.04.3 LTS' available.

Run 'do-release-upgrade' to upgrade to it.





Last login: Thu Dec  4 06:32:52 2025 from 103.229.83.244

ubuntu@dns-lab:~$ sudo apt update \&\& sudo apt upgrade -y

Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease

Hit:2 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy InRelease

Hit:3 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease

Hit:4 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease

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

ubuntu@dns-lab:~$ ip addr show ens3

2: ens3: <BROADCAST,MULTICAST,UP,LOWER\_UP> mtu 8942 qdisc fq\_codel state UP group default qlen 1000

&nbsp;   link/ether fa:16:3e:01:4b:10 brd ff:ff:ff:ff:ff:ff

&nbsp;   altname enp0s3

&nbsp;   inet 192.168.20.20/24 brd 192.168.20.255 scope global ens3

&nbsp;      valid\_lft forever preferred\_lft forever

&nbsp;   inet6 fe80::f816:3eff:fe01:4b10/64 scope link

&nbsp;      valid\_lft forever preferred\_lft forever

ubuntu@dns-lab:~$ ip route show

default via 192.168.20.1 dev ens3 proto static

192.168.20.0/24 dev ens3 proto kernel scope link src 192.168.20.20

------------------------------------------------------------------------------

------------------------------------------------------------------------------

# \# install and confiure the bind9

ubuntu@dns-lab:~$ sudo apt install bind9 bind9utils bind9-doc dnsutils -y

Reading package lists... Done

Building dependency tree... Done

Reading state information... Done

The following additional packages will be installed:

&nbsp; bind9-utils dns-root-data

Suggested packages:

&nbsp; bind-doc resolvconf

The following NEW packages will be installed:

&nbsp; bind9 bind9-doc bind9-utils bind9utils dns-root-data dnsutils

0 upgraded, 6 newly installed, 0 to remove and 8 not upgraded.

Need to get 3659 kB of archives.

After this operation, 9706 kB of additional disk space will be used.

Get:1 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-utils amd64 1:9.18.39-0ubuntu0.22.04.2 \[162 kB]

Get:2 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 dns-root-data all 2024071801~ubuntu0.22.04.1 \[6132 B]

Get:3 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9 amd64 1:9.18.39-0ubuntu0.22.04.2 \[265 kB]

Get:4 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 bind9-doc all 1:9.18.39-0ubuntu0.22.04.2 \[3218 kB]

Get:5 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 bind9utils all 1:9.18.39-0ubuntu0.22.04.2 \[3920 B]

Get:6 http://kkr-prd01-az2.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 dnsutils all 1:9.18.39-0ubuntu0.22.04.2 \[3924 B]

Fetched 3659 kB in 5s (734 kB/s)

Selecting previously unselected package bind9-utils.

(Reading database ... 94194 files and directories currently installed.)

Preparing to unpack .../0-bind9-utils\_1%3a9.18.39-0ubuntu0.22.04.2\_amd64.deb ...

Unpacking bind9-utils (1:9.18.39-0ubuntu0.22.04.2) ...

Selecting previously unselected package dns-root-data.

Preparing to unpack .../1-dns-root-data\_2024071801~ubuntu0.22.04.1\_all.deb ...

Unpacking dns-root-data (2024071801~ubuntu0.22.04.1) ...

Selecting previously unselected package bind9.

Preparing to unpack .../2-bind9\_1%3a9.18.39-0ubuntu0.22.04.2\_amd64.deb ...

Unpacking bind9 (1:9.18.39-0ubuntu0.22.04.2) ...

Selecting previously unselected package bind9-doc.

Preparing to unpack .../3-bind9-doc\_1%3a9.18.39-0ubuntu0.22.04.2\_all.deb ...

Unpacking bind9-doc (1:9.18.39-0ubuntu0.22.04.2) ...

Selecting previously unselected package bind9utils.

Preparing to unpack .../4-bind9utils\_1%3a9.18.39-0ubuntu0.22.04.2\_all.deb ...

Unpacking bind9utils (1:9.18.39-0ubuntu0.22.04.2) ...

Selecting previously unselected package dnsutils.

Preparing to unpack .../5-dnsutils\_1%3a9.18.39-0ubuntu0.22.04.2\_all.deb ...

Unpacking dnsutils (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up bind9-doc (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up dnsutils (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up dns-root-data (2024071801~ubuntu0.22.04.1) ...

Setting up bind9-utils (1:9.18.39-0ubuntu0.22.04.2) ...

Setting up bind9 (1:9.18.39-0ubuntu0.22.04.2) ...

Adding group `bind' (GID 121) ...

Done.

Adding system user `bind' (UID 113) ...

Adding new user `bind' (UID 113) with group `bind' ...

Not creating home directory `/var/cache/bind'.

wrote key file "/etc/bind/rndc.key"

named-resolvconf.service is a disabled or a static unit, not starting it.

Created symlink /etc/systemd/system/bind9.service → /lib/systemd/system/named.service.

Created symlink /etc/systemd/system/multi-user.target.wants/named.service → /lib/systemd/system/named.service.

Setting up bind9utils (1:9.18.39-0ubuntu0.22.04.2) ...

Processing triggers for man-db (2.10.2-1) ...

Processing triggers for ufw (0.36.1-4ubuntu0.1) ...

Scanning processes...

Scanning linux images...



Running kernel seems to be up-to-date.



No services need to be restarted.



No containers need to be restarted.



No user sessions are running outdated binaries.



No VM guests are running outdated hypervisor (qemu) binaries on this host.

ubuntu@dns-lab:~$ systemctl status named

● named.service - BIND Domain Name Server

&nbsp;    Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (running) since Thu 2025-12-04 06:48:52 UTC; 1min 7s ago

&nbsp;      Docs: man:named(8)

&nbsp;   Process: 1554 ExecStart=/usr/sbin/named $OPTIONS (code=exited, status=0/SUCCESS)

&nbsp;  Main PID: 1555 (named)

&nbsp;     Tasks: 8 (limit: 4646)

&nbsp;    Memory: 24.3M

&nbsp;       CPU: 59ms

&nbsp;    CGroup: /system.slice/named.service

&nbsp;            └─1555 /usr/sbin/named -u bind



Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './DNSKEY/IN': 2001:500:1::53#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './NS/IN': 2001:500:1::53#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './DNSKEY/IN': 2001:503:ba3e::2:30#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './NS/IN': 2001:503:ba3e::2:30#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './DNSKEY/IN': 2001:500:12::d0d#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './NS/IN': 2001:500:12::d0d#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './DNSKEY/IN': 2001:500:2::c#53

Dec 04 06:48:52 dns-lab named\[1555]: network unreachable resolving './NS/IN': 2001:500:2::c#53

Dec 04 06:48:53 dns-lab named\[1555]: managed-keys-zone: Initializing automatic trust anchor management for zone '.'; DNSKEY ID 20326 is now trusted, waiving the normal 30-day waiting period.

Dec 04 06:48:53 dns-lab named\[1555]: managed-keys-zone: Initializing automatic trust anchor management for zone '.'; DNSKEY ID 38696 is now trusted, waiving the normal 30-day waiting period.

ubuntu@dns-lab:~$ sudo nano /etc/bind/named.conf.options

ubuntu@dns-lab:~$ cat /etc/bind/named.conf.options

\#options {

\#       directory "/var/cache/bind";

\#

\#       // If there is a firewall between you and nameservers you want

\#       // to talk to, you may need to fix the firewall to allow multiple

\#       // ports to talk.  See http://www.kb.cert.org/vuls/id/800113



\#       // If your ISP provided one or more IP addresses for stable

\#       // nameservers, you probably want to use them as forwarders.

\#       // Uncomment the following block, and insert the addresses replacing

\#       // the all-0's placeholder.



\#       // forwarders {

\#       //      0.0.0.0;

\#       // };



\#       //========================================================================

\#       // If BIND logs error messages about the root key being expired,

\#       // you will need to update your keys.  See https://www.isc.org/bind-keys

\#       //========================================================================

\#       dnssec-validation auto;

\#

\#       listen-on-v6 { any; };

\#};



options {

&nbsp;   directory "/var/cache/bind";



&nbsp;   // Allow recursion for your network

&nbsp;   recursion yes;

&nbsp;   allow-recursion {

&nbsp;       127.0.0.1;

&nbsp;       192.168.20.0/24;  // Your subnet

&nbsp;   };



&nbsp;   // Listen on all interfaces

&nbsp;   listen-on { any; };

&nbsp;   listen-on-v6 { any; };



&nbsp;   // Allow queries from your network

&nbsp;   allow-query {

&nbsp;       127.0.0.1;

&nbsp;       192.168.20.0/24;

&nbsp;   };



&nbsp;   // Forwarders for external queries (Google DNS)

&nbsp;   forwarders {

&nbsp;       8.8.8.8;

&nbsp;       8.8.4.4;

&nbsp;   };

&nbsp;   forward only;



&nbsp;   // DNSSEC validation

&nbsp;   dnssec-validation auto;



&nbsp;   auth-nxdomain no;    # conform to RFC1035

};

ubuntu@dns-lab:~$ nano /etc/bind/named.conf.local

ubuntu@dns-lab:~$ sudo bash

root@dns-lab:/home/ubuntu# nano /etc/bind/named.conf.local

root@dns-lab:/home/ubuntu# cat /etc/bind/named.conf.local

//

// Do any local configuration here

//



// Consider adding the 1918 zones here, if they are not used in your

// organization

//include "/etc/bind/zones.rfc1918";





// Zone for gelani.com

zone "gelani.com" {

&nbsp;   type master;

&nbsp;   file "/etc/bind/zones/db.gelani.com";

&nbsp;   allow-transfer { none; };

};



// Reverse zone for 192.168.20.0/24

zone "20.168.192.in-addr.arpa" {

&nbsp;   type master;

&nbsp;   file "/etc/bind/zones/db.192.168.20";

&nbsp;   allow-transfer { none; };

};

root@dns-lab:/home/ubuntu# sudo mkdir -p /etc/bind/zones

root@dns-lab:/home/ubuntu# cd /etc/bind

root@dns-lab:/etc/bind# ls

bind.keys  db.0  db.127  db.255  db.empty  db.local  named.conf  named.conf.default-zones  named.conf.local  named.conf.options  rndc.key  zones  zones.rfc1918

root@dns-lab:/etc/bind# nano zones/db.gelani.com

root@dns-lab:/etc/bind# cd zones

root@dns-lab:/etc/bind/zones# ls

db.gelani.com

root@dns-lab:/etc/bind/zones# cat db.gelani.com

$TTL    604800

@       IN      SOA     ns1.gelani.com. admin.gelani.com. (

&nbsp;                             2024120401         ; Serial (YYYYMMDDNN)

&nbsp;                             604800             ; Refresh

&nbsp;                             86400              ; Retry

&nbsp;                             2419200            ; Expire

&nbsp;                             604800 )           ; Negative Cache TTL



; Name servers

@       IN      NS      ns1.gelani.com.



; A records

ns1.gelani.com.         IN      A       192.168.20.18

@                       IN      A       192.168.20.12

www                     IN      CNAME   gelani.com.

mail                    IN      A       192.168.20.12



; MX record

@                       IN      MX      10 mail.gelani.com.



; SPF record

@                       IN      TXT     "v=spf1 ip4:192.168.20.12 -all"

root@dns-lab:/etc/bind/zones# nano db.192.168.20

root@dns-lab:/etc/bind/zones# cat db.192.168.20

$TTL    604800

@       IN      SOA     ns1.gelani.com. admin.gelani.com. (

&nbsp;                             2024120401         ; Serial

&nbsp;                             604800             ; Refresh

&nbsp;                             86400              ; Retry

&nbsp;                             2419200            ; Expire

&nbsp;                             604800 )           ; Negative Cache TTL



; Name servers

@       IN      NS      ns1.gelani.com.



; PTR records

18      IN      PTR     ns1.gelani.com.

12      IN      PTR     gelani.com.

12      IN      PTR     mail.gelani.com.

root@dns-lab:/etc/bind/zones# named-checkconf

root@dns-lab:/etc/bind/zones# named-checkzone gelani.com /etc/bind/zones/db.gelani.com

zone gelani.com/IN: loaded serial 2024120401

OK

root@dns-lab:/etc/bind/zones# named-checkzone 20.168.192.in-addr.arpa /etc/bind/zones/db.192.168.20

zone 20.168.192.in-addr.arpa/IN: loaded serial 2024120401

OK

root@dns-lab:/etc/bind/zones# systemctl restart bind9

root@dns-lab:/etc/bind/zones# systemctl status bind9

● named.service - BIND Domain Name Server

&nbsp;    Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (running) since Thu 2025-12-04 06:58:29 UTC; 6s ago

&nbsp;      Docs: man:named(8)

&nbsp;   Process: 1690 ExecStart=/usr/sbin/named $OPTIONS (code=exited, status=0/SUCCESS)

&nbsp;  Main PID: 1691 (named)

&nbsp;     Tasks: 6 (limit: 4646)

&nbsp;    Memory: 22.3M

&nbsp;       CPU: 34ms

&nbsp;    CGroup: /system.slice/named.service

&nbsp;            └─1691 /usr/sbin/named -u bind



Dec 04 06:58:29 dns-lab named\[1691]: zone 0.in-addr.arpa/IN: loaded serial 1

Dec 04 06:58:29 dns-lab named\[1691]: zone 127.in-addr.arpa/IN: loaded serial 1

Dec 04 06:58:29 dns-lab named\[1691]: zone 255.in-addr.arpa/IN: loaded serial 1

Dec 04 06:58:29 dns-lab named\[1691]: zone gelani.com/IN: loaded serial 2024120401

Dec 04 06:58:29 dns-lab named\[1691]: zone localhost/IN: loaded serial 2

Dec 04 06:58:29 dns-lab named\[1691]: all zones loaded

Dec 04 06:58:29 dns-lab named\[1691]: running

Dec 04 06:58:29 dns-lab systemd\[1]: Started BIND Domain Name Server.

Dec 04 06:58:29 dns-lab named\[1691]: managed-keys-zone: Key 20326 for zone . is now trusted (acceptance timer complete)

Dec 04 06:58:29 dns-lab named\[1691]: managed-keys-zone: Key 38696 for zone . is now trusted (acceptance timer complete)

root@dns-lab:/etc/bind/zones# sudo systemctl enable bind9

Failed to enable unit: Refusing to operate on alias name or linked unit file: bind9.service

root@dns-lab:/etc/bind/zones# sudo systemctl enable named

Synchronizing state of named.service with SysV service script with /lib/systemd/systemd-sysv-install.

Executing: /lib/systemd/systemd-sysv-install enable named

root@dns-lab:/etc/bind/zones# nano /etc/netplan/01-netcfg.yaml

root@dns-lab:/etc/bind/zones# sudo netplan apply

WARNING:root:Cannot call Open vSwitch: ovsdb-server.service is not running.

root@dns-lab:/etc/bind/zones# cat /etc/netplan/01-netcfg.yaml

network:

&nbsp; version: 2

&nbsp; renderer: networkd

&nbsp; ethernets:

&nbsp;   ens3:

&nbsp;     addresses:

&nbsp;       - 192.168.20.20/24

&nbsp;     routes:

&nbsp;       - to: default

&nbsp;         via: 192.168.20.1

&nbsp;     nameservers:

&nbsp;       addresses:

&nbsp;         - 127.0.0.1

&nbsp;         - 8.8.8.8

&nbsp;     match:

&nbsp;       macaddress: fa:16:3e:01:4b:10

&nbsp;     mtu: 8942

root@dns-lab:/etc/bind/zones# dig @localhost gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> @localhost gelani.com

; (1 server found)

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 58247

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: 6d5b82c0b626b95b010000006931323b48f6d0eb5456c491 (good)

;; QUESTION SECTION:

;gelani.com.                    IN      A



;; ANSWER SECTION:

gelani.com.             604800  IN      A       192.168.20.12



;; Query time: 0 msec

;; SERVER: 127.0.0.1#53(localhost) (UDP)

;; WHEN: Thu Dec 04 07:03:23 UTC 2025

;; MSG SIZE  rcvd: 83



root@dns-lab:/etc/bind/zones# dig @localhost www.gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> @localhost www.gelani.com

; (1 server found)

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 56357

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: b85b88e5d0e1f003010000006931324254c13c54262c7e19 (good)

;; QUESTION SECTION:

;www.gelani.com.                        IN      A



;; ANSWER SECTION:

www.gelani.com.         604800  IN      CNAME   gelani.com.

gelani.com.             604800  IN      A       192.168.20.12



;; Query time: 0 msec

;; SERVER: 127.0.0.1#53(localhost) (UDP)

;; WHEN: Thu Dec 04 07:03:30 UTC 2025

;; MSG SIZE  rcvd: 101



root@dns-lab:/etc/bind/zones# dig @localhost mail.gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> @localhost mail.gelani.com

; (1 server found)

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8054

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: 6e71c437b78c49c30100000069313247d3b65ffeae2bfb28 (good)

;; QUESTION SECTION:

;mail.gelani.com.               IN      A



;; ANSWER SECTION:

mail.gelani.com.        604800  IN      A       192.168.20.12



;; Query time: 0 msec

;; SERVER: 127.0.0.1#53(localhost) (UDP)

;; WHEN: Thu Dec 04 07:03:35 UTC 2025

;; MSG SIZE  rcvd: 88



root@dns-lab:/etc/bind/zones# dig @localhost ns1.gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> @localhost ns1.gelani.com

; (1 server found)

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 33639

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: 63d61e63b115c159010000006931324bc5ef0e3e7456636f (good)

;; QUESTION SECTION:

;ns1.gelani.com.                        IN      A



;; ANSWER SECTION:

ns1.gelani.com.         604800  IN      A       192.168.20.18



;; Query time: 0 msec

;; SERVER: 127.0.0.1#53(localhost) (UDP)

;; WHEN: Thu Dec 04 07:03:39 UTC 2025

;; MSG SIZE  rcvd: 87



root@dns-lab:/etc/bind/zones# dig @192.168.20.18 gelani.com

;; communications error to 192.168.20.18#53: timed out

^Croot@dns-lab:/etc/bind/zones# sudo ufw status

Status: inactive

root@dns-lab:/etc/bind/zones#

----------------------------------------------------------------------------------------------------------

# \#changed ip address since the ip address has changed

root@dns-lab:/etc/bind/zones# cat /etc/bind/zones/db.gelani.com

$TTL    604800

@       IN      SOA     ns1.gelani.com. admin.gelani.com. (

&nbsp;                             2024120401         ; Serial (YYYYMMDDNN)

&nbsp;                             604800             ; Refresh

&nbsp;                             86400              ; Retry

&nbsp;                             2419200            ; Expire

&nbsp;                             604800 )           ; Negative Cache TTL



; Name servers

@       IN      NS      ns1.gelani.com.



; A records

ns1.gelani.com.         IN      A       192.168.20.18

@                       IN      A       192.168.20.12

www                     IN      CNAME   gelani.com.

mail                    IN      A       192.168.20.12



; MX record

@                       IN      MX      10 mail.gelani.com.



; SPF record

@                       IN      TXT     "v=spf1 ip4:192.168.20.12 -all"

root@dns-lab:/etc/bind/zones# nano /etc/bind/zones/db.gelani.com

root@dns-lab:/etc/bind/zones# cat /etc/bind/zones/db.gelani.com

$TTL    604800

@       IN      SOA     ns1.gelani.com. admin.gelani.com. (

&nbsp;                             2024120401         ; Serial (YYYYMMDDNN)

&nbsp;                             604800             ; Refresh

&nbsp;                             86400              ; Retry

&nbsp;                             2419200            ; Expire

&nbsp;                             604800 )           ; Negative Cache TTL



; Name servers

@       IN      NS      ns1.gelani.com.



; A records

ns1.gelani.com.         IN      A       192.168.20.20

@                       IN      A       192.168.20.15

www                     IN      CNAME   gelani.com.

mail                    IN      A       192.168.20.15



; MX record

@                       IN      MX      10 mail.gelani.com.



; SPF record

@                       IN      TXT     "v=spf1 ip4:192.168.20.15 -all"

root@dns-lab:/etc/bind/zones# cat /etc/bind/zones/db.192.168.20

$TTL    604800

@       IN      SOA     ns1.gelani.com. admin.gelani.com. (

&nbsp;                             2024120401         ; Serial

&nbsp;                             604800             ; Refresh

&nbsp;                             86400              ; Retry

&nbsp;                             2419200            ; Expire

&nbsp;                             604800 )           ; Negative Cache TTL



; Name servers

@       IN      NS      ns1.gelani.com.



; PTR records

18      IN      PTR     ns1.gelani.com.

12      IN      PTR     gelani.com.

12      IN      PTR     mail.gelani.com.

root@dns-lab:/etc/bind/zones# nano /etc/bind/zones/db.192.168.20

root@dns-lab:/etc/bind/zones# cat /etc/bind/zones/db.192.168.20

$TTL    604800

@       IN      SOA     ns1.gelani.com. admin.gelani.com. (

&nbsp;                             2024120401         ; Serial

&nbsp;                             604800             ; Refresh

&nbsp;                             86400              ; Retry

&nbsp;                             2419200            ; Expire

&nbsp;                             604800 )           ; Negative Cache TTL



; Name servers

@       IN      NS      ns1.gelani.com.



; PTR records

20      IN      PTR     ns1.gelani.com.

15      IN      PTR     gelani.com.

15      IN      PTR     mail.gelani.com.

root@dns-lab:/etc/bind/zones# sudo named-checkzone gelani.com /etc/bind/zones/db.gelani.com

zone gelani.com/IN: loaded serial 2024120401

OK

root@dns-lab:/etc/bind/zones# sudo named-checkzone 20.168.192.in-addr.arpa /etc/bind/zones/db.192.168.20

zone 20.168.192.in-addr.arpa/IN: loaded serial 2024120401

OK

root@dns-lab:/etc/bind/zones# sudo systemctl restart bind9

root@dns-lab:/etc/bind/zones# sudo systemctl status bind9

● named.service - BIND Domain Name Server

&nbsp;    Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor preset: enabled)

&nbsp;    Active: active (running) since Thu 2025-12-04 07:13:52 UTC; 3s ago

&nbsp;      Docs: man:named(8)

&nbsp;   Process: 1953 ExecStart=/usr/sbin/named $OPTIONS (code=exited, status=0/SUCCESS)

&nbsp;  Main PID: 1954 (named)

&nbsp;     Tasks: 6 (limit: 4646)

&nbsp;    Memory: 22.3M

&nbsp;       CPU: 37ms

&nbsp;    CGroup: /system.slice/named.service

&nbsp;            └─1954 /usr/sbin/named -u bind



Dec 04 07:13:52 dns-lab named\[1954]: zone 20.168.192.in-addr.arpa/IN: loaded serial 2024120401

Dec 04 07:13:52 dns-lab named\[1954]: zone 255.in-addr.arpa/IN: loaded serial 1

Dec 04 07:13:52 dns-lab named\[1954]: zone 0.in-addr.arpa/IN: loaded serial 1

Dec 04 07:13:52 dns-lab named\[1954]: zone gelani.com/IN: loaded serial 2024120401

Dec 04 07:13:52 dns-lab named\[1954]: zone localhost/IN: loaded serial 2

Dec 04 07:13:52 dns-lab named\[1954]: all zones loaded

Dec 04 07:13:52 dns-lab named\[1954]: running

Dec 04 07:13:52 dns-lab systemd\[1]: Started BIND Domain Name Server.

Dec 04 07:13:52 dns-lab named\[1954]: managed-keys-zone: Key 20326 for zone . is now trusted (acceptance timer complete)

Dec 04 07:13:52 dns-lab named\[1954]: managed-keys-zone: Key 38696 for zone . is now trusted (acceptance timer complete)

root@dns-lab:/etc/bind/zones# dig @localhost gelani.com



; <<>> DiG 9.18.39-0ubuntu0.22.04.2-Ubuntu <<>> @localhost gelani.com

; (1 server found)

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 29509

;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1



;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 1232

; COOKIE: 7117b0115d426cb901000000693134bde17c3938f28c6846 (good)

;; QUESTION SECTION:

;gelani.com.                    IN      A



;; ANSWER SECTION:

gelani.com.             604800  IN      A       192.168.20.15



;; Query time: 0 msec

;; SERVER: 127.0.0.1#53(localhost) (UDP)

;; WHEN: Thu Dec 04 07:14:05 UTC 2025

;; MSG SIZE  rcvd: 83



root@dns-lab:/etc/bind/zones#
```