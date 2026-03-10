# Project - os automation 101
```
ubuntu@gelani-lab-1:~$ sudo apt update && sudo apt upgrade -y
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease                                 
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Fetched 384 kB in 3s (132 kB/s)   
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
Get more security updates through Ubuntu Pro with 'esm-apps' enabled:
  redis-server libheif1 imagemagick libpathplan4 graphviz libgvpr2 libgvc6
  libopenexr25 libcgraph6 libmagickcore-6.q16-6-extra libcdt5
  libmagickwand-6.q16-6 imagemagick-6.q16 redis-tools libmagickcore-6.q16-6
  liblab-gamut1 imagemagick-6-common libde265-0
Learn more about Ubuntu Pro at https://ubuntu.com/pro
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-lab-1:~$ cd /opt/stack/devstack
ubuntu@gelani-lab-1:/opt/stack/devstack$ source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output}
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd ~/image-factory
ubuntu@gelani-lab-1:~/image-factory$ 

ubuntu@gelani-lab-1:~/image-factory$ sudo apt install -y unzip qemu-utils jq curl
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
curl is already the newest version (7.81.0-1ubuntu1.21).
jq is already the newest version (1.6-2.1ubuntu3.1).
jq set to manually installed.
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.27).
unzip is already the newest version (6.0-26ubuntu3.2).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-lab-1:~/image-factory$ 

ubuntu@gelani-lab-1:~/image-factory$ cd /tmp
ubuntu@gelani-lab-1:/tmp$ curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip
ubuntu@gelani-lab-1:/tmp$ ll
total 15092
drwxrwxrwt 14 root   root       4096 Feb 20 20:09 ./
drwxr-xr-x 19 root   root       4096 Feb 18 23:17 ../
drwxrwxrwt  2 root   root       4096 Feb 18 23:17 .ICE-unix/
drwxrwxrwt  2 root   root       4096 Feb 18 23:17 .Test-unix/
drwxrwxrwt  2 root   root       4096 Feb 18 23:17 .X11-unix/
drwxrwxrwt  2 root   root       4096 Feb 18 23:17 .XIM-unix/
drwxrwxrwt  2 root   root       4096 Feb 18 23:17 .font-unix/
-rw-rw-r--  1 ubuntu ubuntu 15396322 Feb 20 20:09 packer.zip
drwx------  3 root   root       4096 Feb 18 23:17 snap-private-tmp/
drwx------  3 root   root       4096 Feb 18 23:17 systemd-private-06126470241e4a75b95af3c4d30bc956-apache2.service-msO6zp/
drwx------  3 root   root       4096 Feb 18 23:17 systemd-private-06126470241e4a75b95af3c4d30bc956-memcached.service-VcvFLa/
drwx------  3 root   root       4096 Feb 18 23:17 systemd-private-06126470241e4a75b95af3c4d30bc956-redis-server.service-b1WE2U/
drwx------  3 root   root       4096 Feb 18 23:17 systemd-private-06126470241e4a75b95af3c4d30bc956-systemd-logind.service-Bffo3V/
drwx------  3 root   root       4096 Feb 18 23:17 systemd-private-06126470241e4a75b95af3c4d30bc956-systemd-resolved.service-lcXJ4h/
drwx------  3 root   root       4096 Feb 18 23:17 systemd-private-06126470241e4a75b95af3c4d30bc956-systemd-timesyncd.service-7flb51/
ubuntu@gelani-lab-1:/tmp$ unzip -o packer.zip
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
ubuntu@gelani-lab-1:/tmp$ sudo mv -f packer /usr/local/bin/packer
ubuntu@gelani-lab-1:/tmp$ packer version
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ 
ubuntu@gelani-lab-1:/tmp$ openstack token issue
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                                                                                                   |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| expires    | 2026-02-20T21:10:59+0000                                                                                                                                                                |
| id         | gAAAAABpmL_T2ZH1wYRCN1d2KCSI8A-_hORtkNj3DiYI6bArp-N0DieYyh95LxGvg2RiGVcc0MHDawt73pFZ47_P0kKTx0GpTu9N54NLSprvpWqZq1DCUtgDubEayoMXEHK2ZBZE8GLRp2_7PAGe-ebUpjZWDLsx1wSNaIvwDaNjFfQ9MS2c_rk |
| project_id | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                        |
| user_id    | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                        |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack image list
+--------------------------------------+-----------+--------+
| ID                                   | Name      | Status |
+--------------------------------------+-----------+--------+
| e0b0913c-2632-4842-b082-41d3678809e7 | debian-11 | active |
| b0b4ff05-cca4-4c11-80b0-ee75561118be | debian-12 | active |
| 833ca55d-3eac-43b0-ba2a-39934ca1e262 | ubuntu-18 | active |
| a270316d-9b71-481c-9c6d-04bc5d4cb67a | ubuntu-20 | active |
| e3779ce6-af5b-4a18-9611-3c4bffd860c3 | ubuntu-22 | active |
| f604e23e-95b5-481d-8a8a-548264468c1a | ubuntu-24 | active |
+--------------------------------------+-----------+--------+
ubuntu@gelani-lab-1:/tmp$ openstack flavor list
+--------------------------------------+---------------+-------+------+-----------+-------+-----------+
| ID                                   | Name          |   RAM | Disk | Ephemeral | VCPUs | Is Public |
+--------------------------------------+---------------+-------+------+-----------+-------+-----------+
| 1                                    | m1.tiny       |   512 |    1 |         0 |     1 | True      |
| 2                                    | m1.small      |  2048 |   20 |         0 |     1 | True      |
| 3                                    | m1.medium     |  4096 |   40 |         0 |     2 | True      |
| 3f30f309-3592-4282-bb86-69ecd0fe465a | m1.heat_micro |   128 |    1 |         0 |     1 | True      |
| 4                                    | m1.large      |  8192 |   80 |         0 |     4 | True      |
| 42                                   | m1.nano       |   192 |    1 |         0 |     1 | True      |
| 5                                    | m1.xlarge     | 16384 |  160 |         0 |     8 | True      |
| 84                                   | m1.micro      |   256 |    1 |         0 |     1 | True      |
| c1                                   | cirros256     |   256 |    1 |         0 |     1 | True      |
| d1                                   | ds512M        |   512 |    5 |         0 |     1 | True      |
| d2                                   | ds1G          |  1024 |   10 |         0 |     1 | True      |
| d3                                   | ds2G          |  2048 |   10 |         0 |     2 | True      |
| d4                                   | ds4G          |  4096 |   20 |         0 |     4 | True      |
| e6319e09-0735-4a00-af5b-11ea038cc588 | m1.heat_int   |  1024 |   10 |         0 |     2 | True      |
+--------------------------------------+---------------+-------+------+-----------+-------+-----------+
ubuntu@gelani-lab-1:/tmp$ openstack network list
+--------------------------------------+----------+----------------------------------------------------------------------------+
| ID                                   | Name     | Subnets                                                                    |
+--------------------------------------+----------+----------------------------------------------------------------------------+
| 172b9757-3f94-4b3a-8588-aaef9f5d94e3 | public   | 0f51c1e9-b2bb-4546-a208-2f911e514369, 17c9de01-9f5b-422c-b9ce-53cc4a3f2cdc |
| 34be5cb2-fc34-4a8b-b337-41595e361e6d | heat-net | 6914f2f9-8d4e-4138-8a06-b8bbd45bb3bb                                       |
| 68a7ad34-b3e9-48a4-a3cc-c178a4d89ddd | shared   | 13063700-83a4-402f-8cc9-0ca93ac96bf6                                       |
| af7ee1c4-02c6-438b-8784-93690f664a47 | private  | 6adea907-730d-4318-98d5-1908d2d013fc, ee882e21-e946-48f8-9873-826e2c5e68b8 |
+--------------------------------------+----------+----------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack security group list
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| ID                                   | Name    | Description            | Project                          | Tags | Shared |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| 729e61d9-f9db-46aa-bbd7-65cd96517d30 | default | Default security group | 99b288e325e744e6b505eb36ec0f5368 | []   | False  |
| 7af7d747-5547-431c-aefd-12c3c3ceebf9 | default | Default security group | 9fb44e4466264364b4ac3eb936bdc4c2 | []   | False  |
| 86b00061-0f89-4de6-a310-1825932f90ce | default | Default security group | 6e0c493b7e814bb392ca7ea299c182de | []   | False  |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:/tmp$ 
ubuntu@gelani-lab-1:/tmp$ openstack network list -c Name -c ID
+--------------------------------------+----------+
| ID                                   | Name     |
+--------------------------------------+----------+
| 172b9757-3f94-4b3a-8588-aaef9f5d94e3 | public   |
| 34be5cb2-fc34-4a8b-b337-41595e361e6d | heat-net |
| 68a7ad34-b3e9-48a4-a3cc-c178a4d89ddd | shared   |
| af7ee1c4-02c6-438b-8784-93690f664a47 | private  |
+--------------------------------------+----------+
ubuntu@gelani-lab-1:/tmp$ openstack security group create packer-build-sg
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                        |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-02-20T20:14:44Z                                                                                                                                                         |
| description     | packer-build-sg                                                                                                                                                              |
| id              | d1c13b85-3231-4fce-9a5f-2d2205dafc18                                                                                                                                         |
| is_shared       | False                                                                                                                                                                        |
| name            | packer-build-sg                                                                                                                                                              |
| project_id      | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                             |
| revision_number | 1                                                                                                                                                                            |
| rules           | created_at='2026-02-20T20:14:44Z', direction='egress', ethertype='IPv4', id='7fcb5159-7e43-4f13-9aeb-0c389464a586', standard_attr_id='97', updated_at='2026-02-20T20:14:44Z' |
|                 | created_at='2026-02-20T20:14:44Z', direction='egress', ethertype='IPv6', id='e8720332-9210-492d-97c5-24e1975c91e5', standard_attr_id='98', updated_at='2026-02-20T20:14:44Z' |
| stateful        | True                                                                                                                                                                         |
| tags            | []                                                                                                                                                                           |
| updated_at      | 2026-02-20T20:14:44Z                                                                                                                                                         |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack security group rule create --proto tcp --dst-port 22 packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-02-20T20:14:56Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 89ffa65a-029f-4259-bad4-fe88b9fcb039 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 9fb44e4466264364b4ac3eb936bdc4c2     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | d1c13b85-3231-4fce-9a5f-2d2205dafc18 |
| updated_at              | 2026-02-20T20:14:56Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack security group rule create --proto icmp packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-02-20T20:15:06Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | d7b8d1be-f4b4-4eb9-8be8-7e54f3a7bcab |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 9fb44e4466264364b4ac3eb936bdc4c2     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | d1c13b85-3231-4fce-9a5f-2d2205dafc18 |
| updated_at              | 2026-02-20T20:15:06Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/tmp$ 

ubuntu@gelani-lab-1:/tmp$ openstack network list -c Name -c ID
+--------------------------------------+----------+
| ID                                   | Name     |
+--------------------------------------+----------+
| 172b9757-3f94-4b3a-8588-aaef9f5d94e3 | public   |
| 34be5cb2-fc34-4a8b-b337-41595e361e6d | heat-net |
| 68a7ad34-b3e9-48a4-a3cc-c178a4d89ddd | shared   |
| af7ee1c4-02c6-438b-8784-93690f664a47 | private  |
+--------------------------------------+----------+
ubuntu@gelani-lab-1:/tmp$ openstack security group create packer-build-sg
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                        |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-02-20T20:14:44Z                                                                                                                                                         |
| description     | packer-build-sg                                                                                                                                                              |
| id              | d1c13b85-3231-4fce-9a5f-2d2205dafc18                                                                                                                                         |
| is_shared       | False                                                                                                                                                                        |
| name            | packer-build-sg                                                                                                                                                              |
| project_id      | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                             |
| revision_number | 1                                                                                                                                                                            |
| rules           | created_at='2026-02-20T20:14:44Z', direction='egress', ethertype='IPv4', id='7fcb5159-7e43-4f13-9aeb-0c389464a586', standard_attr_id='97', updated_at='2026-02-20T20:14:44Z' |
|                 | created_at='2026-02-20T20:14:44Z', direction='egress', ethertype='IPv6', id='e8720332-9210-492d-97c5-24e1975c91e5', standard_attr_id='98', updated_at='2026-02-20T20:14:44Z' |
| stateful        | True                                                                                                                                                                         |
| tags            | []                                                                                                                                                                           |
| updated_at      | 2026-02-20T20:14:44Z                                                                                                                                                         |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack security group rule create --proto tcp --dst-port 22 packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-02-20T20:14:56Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 89ffa65a-029f-4259-bad4-fe88b9fcb039 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 9fb44e4466264364b4ac3eb936bdc4c2     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | d1c13b85-3231-4fce-9a5f-2d2205dafc18 |
| updated_at              | 2026-02-20T20:14:56Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack security group rule create --proto icmp packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-02-20T20:15:06Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | d7b8d1be-f4b4-4eb9-8be8-7e54f3a7bcab |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 9fb44e4466264364b4ac3eb936bdc4c2     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | d1c13b85-3231-4fce-9a5f-2d2205dafc18 |
| updated_at              | 2026-02-20T20:15:06Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/tmp$ mkdir -p ~/.ssh
ubuntu@gelani-lab-1:/tmp$ ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:XNrAF+P1S9YTykHegck52H5p9ssa7U/Dbdoubn18dTM ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
|          o *o+o |
|       . . =oO+.o|
|        o + .+=oo|
|       . *   + *.|
|        S .   = .|
|              oE=|
|             ..*X|
|              =B*|
|             +++B|
+----[SHA256]-----+
ubuntu@gelani-lab-1:/tmp$ openstack keypair create --public-key ~/.ssh/packer_build_key.pub packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | None                                            |
| fingerprint | 42:5c:79:3e:9c:1a:ea:18:c8:5a:e5:31:a3:4f:0d:d7 |
| id          | packer-build-key                                |
| is_deleted  | None                                            |
| name        | packer-build-key                                |
| type        | ssh                                             |
| user_id     | 09805ebaab704a8cbf99fdc8a0c1859d                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:/tmp$ openstack keypair list | grep packer-build-key
| packer-build-key | 42:5c:79:3e:9c:1a:ea:18:c8:5a:e5:31:a3:4f:0d:d7 | ssh  |
ubuntu@gelani-lab-1:/tmp$ mkdir -p ~/images/base image
ubuntu@gelani-lab-1:/tmp$ cd '/home/ubuntu/images/base'/
ubuntu@gelani-lab-1:~/images/base$ ls
ubuntu@gelani-lab-1:~/images/base$ ls
ubuntu@gelani-lab-1:~/images/base$ cd ..
ubuntu@gelani-lab-1:~/images$ ls
base  bionic-server-cloudimg-amd64.img  debian-11.11.0-amd64-netinst.iso  debian-11.qcow2  debian-12.qcow2  jammy.img  noble.img  ubuntu-20.04.qcow2
ubuntu@gelani-lab-1:~/images$ ll
total 3503976
drwxrwxr-x  3 ubuntu ubuntu      4096 Feb 20 20:17 ./
drwxr-x--- 10 ubuntu ubuntu      4096 Feb 20 20:08 ../
drwxrwxr-x  2 ubuntu ubuntu      4096 Feb 20 20:17 base/
-rw-rw-r--  1 ubuntu ubuntu 405667840 Jun  7  2023 bionic-server-cloudimg-amd64.img
-rw-rw-r--  1 ubuntu ubuntu 408944640 Aug 31  2024 debian-11.11.0-amd64-netinst.iso
-rw-rw-r--  1 ubuntu ubuntu 360448000 Feb 12 19:49 debian-11.qcow2
-rw-rw-r--  1 ubuntu ubuntu 446480384 Feb 10 14:51 debian-12.qcow2
-rw-rw-r--  1 ubuntu ubuntu 689883648 Feb 17 12:16 jammy.img
-rw-rw-r--  1 ubuntu ubuntu 628612608 Feb 16 13:15 noble.img
-rw-r--r--  1 root   root   647992832 Jun 25  2025 ubuntu-20.04.qcow2
ubuntu@gelani-lab-1:~/images$ mv base base-image
ubuntu@gelani-lab-1:~/images$ ll
total 3503976
drwxrwxr-x  3 ubuntu ubuntu      4096 Feb 20 20:18 ./
drwxr-x--- 10 ubuntu ubuntu      4096 Feb 20 20:08 ../
drwxrwxr-x  2 ubuntu ubuntu      4096 Feb 20 20:17 base-image/
-rw-rw-r--  1 ubuntu ubuntu 405667840 Jun  7  2023 bionic-server-cloudimg-amd64.img
-rw-rw-r--  1 ubuntu ubuntu 408944640 Aug 31  2024 debian-11.11.0-amd64-netinst.iso
-rw-rw-r--  1 ubuntu ubuntu 360448000 Feb 12 19:49 debian-11.qcow2
-rw-rw-r--  1 ubuntu ubuntu 446480384 Feb 10 14:51 debian-12.qcow2
-rw-rw-r--  1 ubuntu ubuntu 689883648 Feb 17 12:16 jammy.img
-rw-rw-r--  1 ubuntu ubuntu 628612608 Feb 16 13:15 noble.img
-rw-r--r--  1 root   root   647992832 Jun 25  2025 ubuntu-20.04.qcow2
ubuntu@gelani-lab-1:~/images$ cd base-image/
ubuntu@gelani-lab-1:~/images/base-image$ wget -O jammy.img https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
qemu-img info jammy.img | head
--2026-02-20 20:18:47--  https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 690172416 (658M) [application/octet-stream]
Saving to: ‘jammy.img’

jammy.img                                                  100%[========================================================================================================================================>] 658.20M  15.5MB/s    in 49s     

2026-02-20 20:19:37 (13.4 MB/s) - ‘jammy.img’ saved [690172416/690172416]

image: jammy.img
file format: qcow2
virtual size: 2.2 GiB (2361393152 bytes)
disk size: 658 MiB
cluster_size: 65536
Format specific information:
    compat: 0.10
    compression type: zlib
    refcount bits: 16
ubuntu@gelani-lab-1:~/images/base-image$ 
ubuntu@gelani-lab-1:~/images/base-image$ openstack image create ubuntu-22.04-base \
  --file ~/images/jammy.img \
  --disk-format qcow2 \
  --container-format bare \
  --public
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                                                 |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 0a1efc206452806dcee4835fc0ef5d57                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                  |
| created_at       | 2026-02-20T20:20:37Z                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                 |
| file             | /v2/images/e348ebc2-e817-4f57-8ba5-6b55551a72db/file                                                                                                                                                                  |
| id               | e348ebc2-e817-4f57-8ba5-6b55551a72db                                                                                                                                                                                  |
| min_disk         | 0                                                                                                                                                                                                                     |
| min_ram          | 0                                                                                                                                                                                                                     |
| name             | ubuntu-22.04-base                                                                                                                                                                                                     |
| owner            | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                                      |
| properties       | os_hash_algo='sha512', os_hash_value='5c182b80e5f3d3d870eed96348cc4746c093b3b34310ef77c2a37026d20729e45aaa670f78296ecc1981313a8ffcaa77ccc8f3daf39e5aabc606b2b6a011e600', os_hidden='False',                           |
|                  | owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-22.04-base', owner_specified.openstack.sha256=''                                                                                    |
| protected        | False                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                     |
| size             | 689883648                                                                                                                                                                                                             |
| status           | active                                                                                                                                                                                                                |
| tags             |                                                                                                                                                                                                                       |
| updated_at       | 2026-02-20T20:20:45Z                                                                                                                                                                                                  |
| virtual_size     | 2361393152                                                                                                                                                                                                            |
| visibility       | public                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image show ubuntu-22.04-base -c status -c disk_format -c size
+-------------+-----------+
| Field       | Value     |
+-------------+-----------+
| disk_format | qcow2     |
| size        | 689883648 |
| status      | active    |
+-------------+-----------+
ubuntu@gelani-lab-1:~/images/base-image$ cat > ~/image-factory/scripts/provision.sh <<'EOF'
#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

# Always update the VM fully
apt-get update
apt-get -y dist-upgrade

# Useful baseline packages for cloud VMs
apt-get install -y \
  qemu-guest-agent \
  cloud-init \
  curl wget vim net-tools \
  ca-certificates

systemctl enable qemu-guest-agent || true

# Optional: clean old kernels (keeps one fallback)
apt-get -y autoremove --purge
EOF
chmod +x ~/image-factory/scripts/provision.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat > ~/image-factory/scripts/cleanup.sh <<'EOF'
#!/usr/bin/env bash
set -euxo pipefail

# Remove machine identity and cloud-init state so every new VM is "fresh"
cloud-init clean --logs || true
truncate -s 0 /etc/machine-id || true
rm -f /var/lib/dbus/machine-id || true
ln -sf /etc/machine-id /var/lib/dbus/machine-id || true

# Clear temp + logs (safe cleanup)
rm -rf /tmp/* /var/tmp/* || true
find /var/log -type f -name "*.log" -exec truncate -s 0 {} \; || true

# Clean apt cache
apt-get clean
EOF
chmod +x ~/image-factory/scripts/cleanup.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat > ~/image-factory/packer/ubuntu-22.04.pkr.hcl <<'EOF'
packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

variable "network_name" {
  type = string
}

source "openstack" "ubuntu2204" {
  image_name          = "ubuntu-22.04-{{timestamp}}"
  source_image_name   = "ubuntu-22.04-base"
  flavor              = "m1.small"
  networks            = [var.network_name]
  security_groups     = ["packer-build-sg"]
  ssh_username        = "ubuntu"
  ssh_private_key_file = "~/.ssh/packer_build_key"
  keypair_name        = "packer-build-key"

  # This tells packer to create an image in Glance after provisioning
  use_floating_ip     = false
  floating_ip_pool    = ""
}

build {
  sources = ["source.openstack.ubuntu2204"]

  provisioner "shell" {
    script = "../scripts/provision.sh"
  }

  provisioner "shell" {
    script = "../scripts/cleanup.sh"
  }
}
EOF
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/image-factory/packer
packer init .
Installed plugin github.com/hashicorp/openstack v1.1.3 in "/home/ubuntu/.config/packer/plugins/github.com/hashicorp/openstack/packer-plugin-openstack_v1.1.3_x5.0_linux_amd64"
ubuntu@gelani-lab-1:~/image-factory/packer$ 
ubuntu@gelani-lab-1:~/image-factory/packer$ packer validate -var "network_name=private" ubuntu-22.04.pkr.hcl
Error: Unsupported argument

  on ubuntu-22.04.pkr.hcl line 22:
  (source code not available)

An argument named "keypair_name" is not expected here.


ubuntu@gelani-lab-1:~/image-factory/packer$ nano ~/image-factory/packer/ubuntu-22.04.pkr.hcl
ubuntu@gelani-lab-1:~/image-factory/packer$ cat ~/image-factory/packer/ubuntu-22.04.pkr.hcl
packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

variable "network_name" {
  type = string
}

source "openstack" "ubuntu2204" {
  image_name          = "ubuntu-22.04-{{timestamp}}"
  source_image_name   = "ubuntu-22.04-base"
  flavor              = "m1.small"
  networks            = [var.network_name]
  security_groups     = ["packer-build-sg"]
  ssh_username        = "ubuntu"
  ssh_private_key_file = "~/.ssh/packer_build_key"
  keypair_name        = "packer-build-key"

  # This tells packer to create an image in Glance after provisioning
  use_floating_ip     = false
  floating_ip_pool    = ""
}

build {
  sources = ["source.openstack.ubuntu2204"]

  provisioner "shell" {
    script = "../scripts/provision.sh"
  }

  provisioner "shell" {
    script = "../scripts/cleanup.sh"
  }
}
ubuntu@gelani-lab-1:~/image-factory/packer$ 
ubuntu@gelani-lab-1:~$ openstack server list
+--------------------------------------+-----------------------------+---------+---------------------------------------------------------+--------------------------+----------+
| ID                                   | Name                        | Status  | Networks                                                | Image                    | Flavor   |
+--------------------------------------+-----------------------------+---------+---------------------------------------------------------+--------------------------+----------+
| 72deda1f-9cda-40d3-9a99-a1375fe0cb9d | debian-11                   | ACTIVE  | private=10.0.0.2, fdf9:52f7:7011:0:f816:3eff:fe30:33c5  | N/A (booted from volume) | m1.small |
| ebe43162-2f88-4e8e-ae1e-562ddb99617b | debian-12                   | ACTIVE  | private=10.0.0.6, fdf9:52f7:7011:0:f816:3eff:fee3:8781  | N/A (booted from volume) | m1.small |
| f9ad44b2-287d-449f-8d23-e52c0f9c8326 | ubuntu-18                   | ACTIVE  | private=10.0.0.57, fdf9:52f7:7011:0:f816:3eff:fedf:59a6 | N/A (booted from volume) | m1.small |
| 29797316-d0fb-4df3-9e4d-25c1dd67b06d | ubuntu-20                   | ACTIVE  | private=10.0.0.27, fdf9:52f7:7011:0:f816:3eff:fe3f:edc  | N/A (booted from volume) | m1.small |
| 3dc5117a-a0fe-42e4-a50e-f38d49c707c1 | ubuntu-24                   | ACTIVE  | private=10.0.0.47, fdf9:52f7:7011:0:f816:3eff:fe93:908a | N/A (booted from volume) | m1.small |
| b2c7ccc8-c904-4602-abac-1f8f732ac767 | ubuntu-22-first-ceph-boot-3 | SHUTOFF | private=10.0.0.20, fdf9:52f7:7011:0:f816:3eff:fede:1902 | N/A (booted from volume) | m1.small |
| e4964275-c4c0-4ac6-a664-01442f705c5a | ubuntu-22-first-ceph-boot-2 | SHUTOFF | private=10.0.0.43, fdf9:52f7:7011:0:f816:3eff:fe03:52f5 | N/A (booted from volume) | m1.small |
| acc655de-8e77-4061-86c1-056599768834 | ubuntu-22-first-ceph-boot-1 | SHUTOFF | private=10.0.0.53, fdf9:52f7:7011:0:f816:3eff:fed4:2164 | N/A (booted from volume) | m1.small |
+--------------------------------------+-----------------------------+---------+---------------------------------------------------------+--------------------------+----------+
ubuntu@gelani-lab-1:~$ openstack console url show ubuntu-24
+----------+----------------------------------------------------------------------------------------------+
| Field    | Value                                                                                        |
+----------+----------------------------------------------------------------------------------------------+
| protocol | vnc                                                                                          |
| type     | novnc                                                                                        |
| url      | http://192.168.95.93:6080/vnc_lite.html?path=%3Ftoken%3D6c932541-3707-467a-92db-2447fbb72d5a |
+----------+----------------------------------------------------------------------------------------------+
```
# Study and Preparation Before the project
## Create a new vm to check the kerenl related stuffs
```
ubuntu@gelani-lab-1:~$ openstack image list
+--------------------------------------+-----------+--------+
| ID                                   | Name      | Status |
+--------------------------------------+-----------+--------+
| 151fa56a-92e5-4a05-82bb-f4472394d3d9 | alma-10   | active |
| f339488c-2c82-4e7d-ab70-d57a4d2c1ade | cirros    | active |
| a05bfffb-5b9a-468e-b9a7-45e541d6e1c7 | debian-11 | active |
| 8c2f2ee0-458e-4370-8cfa-e5e145402142 | debian-12 | active |
| 5a2209bd-847e-4948-87e2-e66b1109f4eb | fedora-40 | active |
| fbb9bfc0-3dc0-4f20-b230-e046473fe629 | rocky-9   | active |
| 9bd72412-c33b-49a4-8917-396c9dd3741f | ubuntu-18 | active |
| b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb | ubuntu-20 | active |
| c218d57e-3393-4283-8a6c-fe74551e9ea2 | ubuntu-22 | active |
| b522ceff-bea1-465d-9dbb-ebb567769ef4 | ubuntu-24 | active |
+--------------------------------------+-----------+--------+
ubuntu@gelani-lab-1:~$ cd raw-image/
ubuntu@gelani-lab-1:~/raw-image$ ls
alma-10.qcow2  bionic-server-cloudimg-amd64.img  cirros.img                        debian-11.qcow2  fedora-40.qcow2  noble.img      ubuntu-20.04.qcow2
base-image     cirros-0.6.3-x86_64-disk.img      debian-11.11.0-amd64-netinst.iso  debian-12.qcow2  jammy.img        rocky-9.qcow2
ubuntu@gelani-lab-1:~/raw-image$ openstack image create ubuntu-24-test   --file ubuntu-24.qcow2  --disk-format qcow2   --container-format bare   --public
'ubuntu-24.qcow2' is not a valid file
ubuntu@gelani-lab-1:~/raw-image$ ls
alma-10.qcow2  bionic-server-cloudimg-amd64.img  cirros.img                        debian-11.qcow2  fedora-40.qcow2  noble.img      ubuntu-20.04.qcow2
base-image     cirros-0.6.3-x86_64-disk.img      debian-11.11.0-amd64-netinst.iso  debian-12.qcow2  jammy.img        rocky-9.qcow2
ubuntu@gelani-lab-1:~/raw-image$ cd base-image/
ubuntu@gelani-lab-1:~/raw-image/base-image$ ls
jammy.img
ubuntu@gelani-lab-1:~/raw-image/base-image$ cd ..
ubuntu@gelani-lab-1:~/raw-image$ rm base-image/
rm: cannot remove 'base-image/': Is a directory
ubuntu@gelani-lab-1:~/raw-image$ rm -r base-image/
ubuntu@gelani-lab-1:~/raw-image$ ls
alma-10.qcow2  bionic-server-cloudimg-amd64.img  cirros-0.6.3-x86_64-disk.img  cirros.img  debian-11.11.0-amd64-netinst.iso  debian-11.qcow2  debian-12.qcow2  fedora-40.qcow2  jammy.img  noble.img  rocky-9.qcow2  ubuntu-20.04.qcow2
ubuntu@gelani-lab-1:~/raw-image$ openstack image create ubuntu-24-test-os-automation-project   --file ubuntu-24.qcow2  --disk-format qcow2   --container-format bare   --public
'ubuntu-24.qcow2' is not a valid file
ubuntu@gelani-lab-1:~/raw-image$ mv noble.img noble.qcow2
ubuntu@gelani-lab-1:~/raw-image$ ls
alma-10.qcow2  bionic-server-cloudimg-amd64.img  cirros-0.6.3-x86_64-disk.img  cirros.img  debian-11.11.0-amd64-netinst.iso  debian-11.qcow2  debian-12.qcow2  fedora-40.qcow2  jammy.img  noble.qcow2  rocky-9.qcow2  ubuntu-20.04.qcow2
ubuntu@gelani-lab-1:~/raw-image$ openstack image create ubuntu-24-test-os-automation-project   --file noble.qcow2  --disk-format qcow2   --container-format bare   --public
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                                                 |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 90b203ff0ba04640bde95dd6b57f8201                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                  |
| created_at       | 2026-03-10T11:43:07Z                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                 |
| file             | /v2/images/ea3b9ae8-c81a-4198-a2a3-4936599f84c7/file                                                                                                                                                                  |
| id               | ea3b9ae8-c81a-4198-a2a3-4936599f84c7                                                                                                                                                                                  |
| min_disk         | 0                                                                                                                                                                                                                     |
| min_ram          | 0                                                                                                                                                                                                                     |
| name             | ubuntu-24-test-os-automation-project                                                                                                                                                                                  |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                      |
| properties       | os_hash_algo='sha512', os_hash_value='573490ee77f021a381db402fff4cfb9b610479284dced62197e4ca799462439edf1fb95f94f4ccdeaa09d68955342f2332ac36a9c418b057edc4d3f17b832ab8', os_hidden='False',                           |
|                  | owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24-test-os-automation-project', owner_specified.openstack.sha256=''                                                                 |
| protected        | False                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                     |
| size             | 628612608                                                                                                                                                                                                             |
| status           | active                                                                                                                                                                                                                |
| tags             |                                                                                                                                                                                                                       |
| updated_at       | 2026-03-10T11:43:18Z                                                                                                                                                                                                  |
| virtual_size     | 3758096384                                                                                                                                                                                                            |
| visibility       | public                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ openstack image list
+--------------------------------------+--------------------------------------+--------+
| ID                                   | Name                                 | Status |
+--------------------------------------+--------------------------------------+--------+
| 151fa56a-92e5-4a05-82bb-f4472394d3d9 | alma-10                              | active |
| f339488c-2c82-4e7d-ab70-d57a4d2c1ade | cirros                               | active |
| a05bfffb-5b9a-468e-b9a7-45e541d6e1c7 | debian-11                            | active |
| 8c2f2ee0-458e-4370-8cfa-e5e145402142 | debian-12                            | active |
| 5a2209bd-847e-4948-87e2-e66b1109f4eb | fedora-40                            | active |
| fbb9bfc0-3dc0-4f20-b230-e046473fe629 | rocky-9                              | active |
| 9bd72412-c33b-49a4-8917-396c9dd3741f | ubuntu-18                            | active |
| b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb | ubuntu-20                            | active |
| c218d57e-3393-4283-8a6c-fe74551e9ea2 | ubuntu-22                            | active |
| b522ceff-bea1-465d-9dbb-ebb567769ef4 | ubuntu-24                            | active |
| ea3b9ae8-c81a-4198-a2a3-4936599f84c7 | ubuntu-24-test-os-automation-project | active |
+--------------------------------------+--------------------------------------+--------+
ubuntu@gelani-lab-1:~/raw-image$ openstack volume type list
+--------------------------------------+-------------+-----------+
| ID                                   | Name        | Is Public |
+--------------------------------------+-------------+-----------+
| 67bc2259-3afb-4a0f-a065-fdc7a53e905c | ceph        | True      |
| 08a13653-2387-4764-a42b-f334dfba6074 | lvmdriver-1 | True      |
+--------------------------------------+-------------+-----------+
ubuntu@gelani-lab-1:~/raw-image$ openstack image create ubuntu-24-test-os-automation-project   --file ubuntu-24-test-os-automation-project.qcow2  --disk-format qcow2   --container-format bare   --public
'ubuntu-24-test-os-automation-project.qcow2' is not a valid file
ubuntu@gelani-lab-1:~/raw-image$ openstack volume create   --image ubuntu-24-test-os-automation-project   --size 15   --type ceph  ubuntu-24-test-os-automation-project
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-03-10T11:46:26.773107           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | fb0df5a4-61ff-4164-9143-d34742096a4b |
| multiattach                    | False                                |
| name                           | ubuntu-24-test-os-automation-project |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 15                                   |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 270824ef176044a2a8b64a8337e2f00a     |
| volume_type_id                 | 67bc2259-3afb-4a0f-a065-fdc7a53e905c |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ openstack volume list
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| ID                                   | Name                                 | Status      | Size | Attached to                        |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | downloading |   15 |                                    |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | in-use      |   20 | Attached to alma-10 on /dev/vda    |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | in-use      |   10 | Attached to ubuntu-20 on /dev/vda  |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | in-use      |   10 | Attached to ubuntu-18 on /dev/vda  |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | in-use      |   19 | Attached to debian-12 on /dev/vda  |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | in-use      |   19 | Attached to debian-11 on /dev/vda  |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | in-use      |   15 | Attached to ubuntu-24 on /dev/vda  |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | in-use      |   10 | Attached to ubuntu-22 on /dev/vda  |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ openstack volume list
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| ID                                   | Name                                 | Status      | Size | Attached to                        |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | downloading |   15 |                                    |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | in-use      |   20 | Attached to alma-10 on /dev/vda    |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | in-use      |   10 | Attached to ubuntu-20 on /dev/vda  |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | in-use      |   10 | Attached to ubuntu-18 on /dev/vda  |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | in-use      |   19 | Attached to debian-12 on /dev/vda  |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | in-use      |   19 | Attached to debian-11 on /dev/vda  |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | in-use      |   15 | Attached to ubuntu-24 on /dev/vda  |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | in-use      |   10 | Attached to ubuntu-22 on /dev/vda  |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ openstack volume list
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| ID                                   | Name                                 | Status      | Size | Attached to                        |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | downloading |   15 |                                    |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | in-use      |   20 | Attached to alma-10 on /dev/vda    |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | in-use      |   10 | Attached to ubuntu-20 on /dev/vda  |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | in-use      |   10 | Attached to ubuntu-18 on /dev/vda  |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | in-use      |   19 | Attached to debian-12 on /dev/vda  |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | in-use      |   19 | Attached to debian-11 on /dev/vda  |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | in-use      |   15 | Attached to ubuntu-24 on /dev/vda  |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | in-use      |   10 | Attached to ubuntu-22 on /dev/vda  |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ openstack volume list
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| ID                                   | Name                                 | Status      | Size | Attached to                        |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | downloading |   15 |                                    |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | in-use      |   20 | Attached to alma-10 on /dev/vda    |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | in-use      |   10 | Attached to ubuntu-20 on /dev/vda  |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | in-use      |   10 | Attached to ubuntu-18 on /dev/vda  |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | in-use      |   19 | Attached to debian-12 on /dev/vda  |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | in-use      |   19 | Attached to debian-11 on /dev/vda  |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | in-use      |   15 | Attached to ubuntu-24 on /dev/vda  |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | in-use      |   10 | Attached to ubuntu-22 on /dev/vda  |
+--------------------------------------+--------------------------------------+-------------+------+------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ openstack volume list
+--------------------------------------+--------------------------------------+-----------+------+------------------------------------+
| ID                                   | Name                                 | Status    | Size | Attached to                        |
+--------------------------------------+--------------------------------------+-----------+------+------------------------------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | available |   15 |                                    |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | in-use    |   20 | Attached to alma-10 on /dev/vda    |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | in-use    |   10 | Attached to ubuntu-20 on /dev/vda  |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | in-use    |   10 | Attached to ubuntu-18 on /dev/vda  |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | in-use    |   19 | Attached to debian-12 on /dev/vda  |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | in-use    |   19 | Attached to debian-11 on /dev/vda  |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | in-use    |   15 | Attached to ubuntu-24 on /dev/vda  |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | in-use    |   10 | Attached to ubuntu-22 on /dev/vda  |
+--------------------------------------+--------------------------------------+-----------+------+------------------------------------+
ubuntu@gelani-lab-1:~/raw-image$ cd ~/cloudinit-userdata/
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ls
cloud-init-net.yaml  cloud-init-ok.yaml  cloud-init.yaml
ubuntu@gelani-lab-1:~/cloudinit-userdata$ pwd
/home/ubuntu/cloudinit-userdata
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server create   --flavor m1.small   --volume ubuntu-24-test-os-automation-project   --network private   --user-data /home/ubuntu/cloudinit-userdata/cloud-init.yaml   --config-drive true   ubuntu-24-test-os-automation-project
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ubuntu-24-test-os-automation-project                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-1yojj21s                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | I2Nsb3VkLWNvbmZpZwpwYXNzd29yZDogMTIzNDU2NzgKY2hwYXNzd2Q6IHsgZXhwaXJlOiBGYWxzZSB9CnNzaF9wd2F1dGg6IFRydWUK                                                                                           |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | Di35pceGXg3Q                                                                                                                                                                                       |
| config_drive                        | True                                                                                                                                                                                               |
| created                             | 2026-03-10T11:50:51Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='20', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.small', is_disabled=, is_public='True', location=, name='m1.small', original_name='m1.small', ram='2048',        |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | 180216ab-6e58-4062-8400-e31bd488781d                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ubuntu-24-test-os-automation-project                                                                                                                                                               |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-03-10T11:50:51Z                                                                                                                                                                               |
| user_id                             | 270824ef176044a2a8b64a8337e2f00a                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ watch -n2 openstack server list
ubuntu@gelani-lab-1:~/cloudinit-userdata$ Every 2.0s: openstack server list                                                                                                                                                                     gelani-lab-1: Tue Mar 10 11:51:12 2026

+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+
| ID                                   | Name                                 | Status  | Networks                         | Image                    | Flavor   |
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+
| 180216ab-6e58-4062-8400-e31bd488781d | ubuntu-24-test-os-automation-project | ACTIVE  | private=10.0.0.132               | N/A (booted from volume) | m1.small |
| 36c88e9c-7e00-4849-af6f-6a45d0e0f9fc | alma-10                              | SHUTOFF | private=10.0.0.158, 172.24.4.33  | N/A (booted from volume) | m1.small |
| 2e339260-569d-40fb-94f2-ff26d68fa74d | debian-11                            | ACTIVE  | private=10.0.0.88, 172.24.4.190  | N/A (booted from volume) | m1.small |
| abcff3fe-3f6d-48fd-baba-a7565e71f26a | ubuntu-20                            | SHUTOFF | private=10.0.0.198, 172.24.4.18  | N/A (booted from volume) | m1.small |
| 61564dab-c835-420d-82a9-b4b6672480b0 | ubuntu-18                            | SHUTOFF | private=10.0.0.21, 172.24.4.59   | N/A (booted from volume) | m1.small |
| f7827631-9878-4000-bff5-cc4f08624f37 | debian-12                            | SHUTOFF | private=10.0.0.11, 172.24.4.136  | N/A (booted from volume) | m1.small |
| 215e7781-a397-4655-9cab-f42d0b5296fd | ubuntu-24                            | SHUTOFF | private=10.0.0.37, 172.24.4.118  | N/A (booted from volume) | m1.small |
| dc6a0c5a-ba77-4c9b-83c5-cf71469738e7 | ubuntu-22                            | SHUTOFF | private=10.0.0.149, 172.24.4.108 | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+
Every: command not found
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+: command not found
-bash: syntax error near unexpected token `|'
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+: command not found
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
-bash: syntax error near unexpected token `|'
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+: command not found
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ FIP=$(openstack floating ip create public -f value -c floating_ip_address)
openstack server add floating ip ubuntu-24-test-os-automation-project $FIP
echo "Floating IP: $FIP"
Floating IP: 172.24.4.41
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ping 172.24.4.41
PING 172.24.4.41 (172.24.4.41) 56(84) bytes of data.
64 bytes from 172.24.4.41: icmp_seq=1 ttl=63 time=1.64 ms
64 bytes from 172.24.4.41: icmp_seq=2 ttl=63 time=0.750 ms
^C
--- 172.24.4.41 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 0.750/1.194/1.639/0.444 ms
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ssh ubuntu@172.24.4.41
The authenticity of host '172.24.4.41 (172.24.4.41)' can't be established.
ED25519 key fingerprint is SHA256:4X6J4KdIg6WeoZK5oXr6Pi8qvl7SiEIfVzf5PveC5xE.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.24.4.41' (ED25519) to the list of known hosts.
ubuntu@172.24.4.41's password: 
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-100-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Mar 10 11:53:09 UTC 2026

  System load:  0.18               Processes:             96
  Usage of /:   12.0% of 13.49GB   Users logged in:       0
  Memory usage: 8%                 IPv4 address for ens3: 10.0.0.132
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
```
**Note: Created new vm and it works fine with no privous net issue and other stuffs occured!**
### Check and study on the kernel related stuffs
```
ubuntu@ubuntu-24-test-os-automation-project:~$ uname -r
6.8.0-100-generic
ubuntu@ubuntu-24-test-os-automation-project:~$ sudo apt update && sudo apt upgrade -y
Get:1 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]             
Hit:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble InRelease                               
Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]              
Get:4 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1,504 kB]
Get:5 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [241 kB]
Get:6 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.5 kB]
Get:7 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [10.1 kB]
Get:8 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [976 kB]
Get:9 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
Get:10 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [218 kB] 
Get:11 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.1 kB]     
Get:12 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [20.6 kB]     
Get:13 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2,599 kB]
Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [600 kB]  
Get:15 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B] 
Get:16 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [544 B]
Get:17 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]
Get:18 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6,732 B]
Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
Get:20 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
Get:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
Get:22 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe Translation-en [5,982 kB]
Get:23 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Components [3,871 kB]
Get:24 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 c-n-f Metadata [301 kB]                                                                                                                                           
Get:25 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages [269 kB]                                                                                                                                               
Get:26 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse Translation-en [118 kB]                                                                                                                                               
Get:27 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Components [35.0 kB]                                                                                                                                            
Get:28 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 c-n-f Metadata [8,328 B]                                                                                                                                        
Get:29 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1,806 kB]                                                                                                                                           
Get:30 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main Translation-en [332 kB]                                                                                                                                             
Get:31 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [177 kB]                                                                                                                                           
Get:32 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 c-n-f Metadata [16.7 kB]                                                                                                                                      
Get:33 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1,564 kB]                                                                                                                                       
Get:34 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [318 kB]                                                                                                                                         
Get:35 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]                                                                                                                                       
Get:36 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 c-n-f Metadata [32.9 kB]                                                                                                                                  
Get:37 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [2,748 kB]                                                                                                                                     
Get:38 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted Translation-en [632 kB]                                                                                                                                       
Get:39 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]                                                                                                                                      
Get:40 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 c-n-f Metadata [556 B]                                                                                                                                  
Get:41 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [32.1 kB]                                                                                                                                      
Get:42 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse Translation-en [7,044 B]                                                                                                                                      
Get:43 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]                                                                                                                                      
Get:44 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 c-n-f Metadata [496 B]                                                                                                                                  
Get:45 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Packages [40.4 kB]                                                                                                                                          
Get:46 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main Translation-en [9,208 B]                                                                                                                                          
Get:47 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7,312 B]                                                                                                                                        
Get:48 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 c-n-f Metadata [368 B]                                                                                                                                      
Get:49 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [29.5 kB]                                                                                                                                      
Get:50 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [17.9 kB]                                                                                                                                      
Get:51 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [10.5 kB]                                                                                                                                    
Get:52 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 c-n-f Metadata [1,444 B]                                                                                                                                
Get:53 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [216 B]                                                                                                                                    
Get:54 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 c-n-f Metadata [116 B]                                                                                                                                
Get:55 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]                                                                                                                                    
Get:56 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 c-n-f Metadata [116 B]                                                                                                                                
Fetched 40.5 MB in 12s (3,322 kB/s)                                                                                                                                                                                                        
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
26 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
The following NEW packages will be installed:
  linux-headers-6.8.0-101 linux-headers-6.8.0-101-generic linux-image-6.8.0-101-generic linux-modules-6.8.0-101-generic linux-tools-6.8.0-101 linux-tools-6.8.0-101-generic
The following packages will be upgraded:
  cloud-init curl gcc-14-base libcurl3t64-gnutls libcurl4t64 libgcc-s1 libgnutls30t64 libnss3 libpython3.12-minimal libpython3.12-stdlib libpython3.12t64 libssh-4 libstdc++6 linux-base linux-headers-generic linux-headers-virtual
  linux-image-virtual linux-libc-dev linux-tools-common linux-virtual python3-software-properties python3.12 python3.12-minimal software-properties-common sosreport systemd-hwe-hwdb
26 upgraded, 6 newly installed, 0 to remove and 0 not upgraded.
20 standard LTS security updates
Need to get 95.0 MB of archives.
After this operation, 190 MB of additional disk space will be used.
Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12t64 amd64 3.12.3-1ubuntu0.12 [2,345 kB]
Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12 amd64 3.12.3-1ubuntu0.12 [651 kB]
Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-stdlib amd64 3.12.3-1ubuntu0.12 [2,069 kB]
Get:4 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12-minimal amd64 3.12.3-1ubuntu0.12 [2,334 kB]
Get:5 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-minimal amd64 3.12.3-1ubuntu0.12 [837 kB]
Get:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 gcc-14-base amd64 14.2.0-4ubuntu2~24.04.1 [51.0 kB]
Get:7 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libstdc++6 amd64 14.2.0-4ubuntu2~24.04.1 [792 kB]
Get:8 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgcc-s1 amd64 14.2.0-4ubuntu2~24.04.1 [78.4 kB]
Get:9 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgnutls30t64 amd64 3.8.3-1.1ubuntu3.5 [1,001 kB]
Get:10 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 systemd-hwe-hwdb all 255.1.7 [3,716 B]
Get:11 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libssh-4 amd64 0.10.6-2ubuntu0.3 [190 kB]
Get:12 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 curl amd64 8.5.0-2ubuntu10.7 [227 kB]
Get:13 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libcurl4t64 amd64 8.5.0-2ubuntu10.7 [342 kB]
Get:14 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libcurl3t64-gnutls amd64 8.5.0-2ubuntu10.7 [334 kB]
Get:15 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libnss3 amd64 2:3.98-1ubuntu0.1 [1,445 kB]
Get:16 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-base all 4.5ubuntu9+24.04.2 [19.6 kB]
Get:17 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-headers-6.8.0-101 all 6.8.0-101.101 [14.1 MB]
Get:18 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-headers-6.8.0-101-generic amd64 6.8.0-101.101 [4,287 kB]
Get:19 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-modules-6.8.0-101-generic amd64 6.8.0-101.101 [39.6 MB]
Get:20 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-image-6.8.0-101-generic amd64 6.8.0-101.101 [14.8 MB]                                                                                                   
Get:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-virtual amd64 6.8.0-101.101 [1,700 B]                                                                                                                   
Get:22 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-image-virtual amd64 6.8.0-101.101 [11.1 kB]                                                                                                             
Get:23 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-headers-virtual amd64 6.8.0-101.101 [1,648 B]                                                                                                           
Get:24 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-headers-generic amd64 6.8.0-101.101 [11.0 kB]                                                                                                           
Get:25 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-libc-dev amd64 6.8.0-101.101 [2,042 kB]                                                                                                                 
Get:26 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-tools-common all 6.8.0-101.101 [881 kB]                                                                                                                 
Get:27 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-tools-6.8.0-101 amd64 6.8.0-101.101 [5,541 kB]                                                                                                          
Get:28 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-tools-6.8.0-101-generic amd64 6.8.0-101.101 [1,818 B]                                                                                                   
Get:29 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 software-properties-common all 0.99.49.4 [14.4 kB]                                                                                                            
Get:30 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3-software-properties all 0.99.49.4 [30.0 kB]                                                                                                           
Get:31 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 sosreport amd64 4.10.2-0ubuntu0~24.04.1 [381 kB]                                                                                                              
Get:32 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 cloud-init all 25.3-0ubuntu1~24.04.1 [628 kB]                                                                                                                 
Fetched 95.0 MB in 9s (11.1 MB/s)                                                                                                                                                                                                          
Extracting templates from packages: 100%
Preconfiguring packages ...
(Reading database ... 74832 files and directories currently installed.)
Preparing to unpack .../0-libpython3.12t64_3.12.3-1ubuntu0.12_amd64.deb ...
Unpacking libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
Preparing to unpack .../1-python3.12_3.12.3-1ubuntu0.12_amd64.deb ...
Unpacking python3.12 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
Preparing to unpack .../2-libpython3.12-stdlib_3.12.3-1ubuntu0.12_amd64.deb ...
Unpacking libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
Preparing to unpack .../3-python3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
Unpacking python3.12-minimal (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
Preparing to unpack .../4-libpython3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
Unpacking libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
Preparing to unpack .../5-gcc-14-base_14.2.0-4ubuntu2~24.04.1_amd64.deb ...
Unpacking gcc-14-base:amd64 (14.2.0-4ubuntu2~24.04.1) over (14.2.0-4ubuntu2~24.04) ...
Setting up gcc-14-base:amd64 (14.2.0-4ubuntu2~24.04.1) ...
(Reading database ... 74832 files and directories currently installed.)
Preparing to unpack .../libstdc++6_14.2.0-4ubuntu2~24.04.1_amd64.deb ...
Unpacking libstdc++6:amd64 (14.2.0-4ubuntu2~24.04.1) over (14.2.0-4ubuntu2~24.04) ...
Setting up libstdc++6:amd64 (14.2.0-4ubuntu2~24.04.1) ...
(Reading database ... 74832 files and directories currently installed.)
Preparing to unpack .../libgcc-s1_14.2.0-4ubuntu2~24.04.1_amd64.deb ...
Unpacking libgcc-s1:amd64 (14.2.0-4ubuntu2~24.04.1) over (14.2.0-4ubuntu2~24.04) ...
Setting up libgcc-s1:amd64 (14.2.0-4ubuntu2~24.04.1) ...
(Reading database ... 74832 files and directories currently installed.)
Preparing to unpack .../libgnutls30t64_3.8.3-1.1ubuntu3.5_amd64.deb ...
Unpacking libgnutls30t64:amd64 (3.8.3-1.1ubuntu3.5) over (3.8.3-1.1ubuntu3.4) ...
Setting up libgnutls30t64:amd64 (3.8.3-1.1ubuntu3.5) ...
(Reading database ... 74832 files and directories currently installed.)
Preparing to unpack .../00-systemd-hwe-hwdb_255.1.7_all.deb ...
Unpacking systemd-hwe-hwdb (255.1.7) over (255.1.6) ...
Preparing to unpack .../01-libssh-4_0.10.6-2ubuntu0.3_amd64.deb ...
Unpacking libssh-4:amd64 (0.10.6-2ubuntu0.3) over (0.10.6-2ubuntu0.2) ...
Preparing to unpack .../02-curl_8.5.0-2ubuntu10.7_amd64.deb ...
Unpacking curl (8.5.0-2ubuntu10.7) over (8.5.0-2ubuntu10.6) ...
Preparing to unpack .../03-libcurl4t64_8.5.0-2ubuntu10.7_amd64.deb ...
Unpacking libcurl4t64:amd64 (8.5.0-2ubuntu10.7) over (8.5.0-2ubuntu10.6) ...
Preparing to unpack .../04-libcurl3t64-gnutls_8.5.0-2ubuntu10.7_amd64.deb ...
Unpacking libcurl3t64-gnutls:amd64 (8.5.0-2ubuntu10.7) over (8.5.0-2ubuntu10.6) ...
Preparing to unpack .../05-libnss3_2%3a3.98-1ubuntu0.1_amd64.deb ...
Unpacking libnss3:amd64 (2:3.98-1ubuntu0.1) over (2:3.98-1build1) ...
Preparing to unpack .../06-linux-base_4.5ubuntu9+24.04.2_all.deb ...
Unpacking linux-base (4.5ubuntu9+24.04.2) over (4.5ubuntu9+24.04.1) ...
Selecting previously unselected package linux-headers-6.8.0-101.
Preparing to unpack .../07-linux-headers-6.8.0-101_6.8.0-101.101_all.deb ...
Unpacking linux-headers-6.8.0-101 (6.8.0-101.101) ...
Selecting previously unselected package linux-headers-6.8.0-101-generic.
Preparing to unpack .../08-linux-headers-6.8.0-101-generic_6.8.0-101.101_amd64.deb ...
Unpacking linux-headers-6.8.0-101-generic (6.8.0-101.101) ...
Selecting previously unselected package linux-modules-6.8.0-101-generic.
Preparing to unpack .../09-linux-modules-6.8.0-101-generic_6.8.0-101.101_amd64.deb ...
Unpacking linux-modules-6.8.0-101-generic (6.8.0-101.101) ...
Selecting previously unselected package linux-image-6.8.0-101-generic.
Preparing to unpack .../10-linux-image-6.8.0-101-generic_6.8.0-101.101_amd64.deb ...
Unpacking linux-image-6.8.0-101-generic (6.8.0-101.101) ...
Preparing to unpack .../11-linux-virtual_6.8.0-101.101_amd64.deb ...
Unpacking linux-virtual (6.8.0-101.101) over (6.8.0-100.100) ...
Preparing to unpack .../12-linux-image-virtual_6.8.0-101.101_amd64.deb ...
Unpacking linux-image-virtual (6.8.0-101.101) over (6.8.0-100.100) ...
Preparing to unpack .../13-linux-headers-virtual_6.8.0-101.101_amd64.deb ...
Unpacking linux-headers-virtual (6.8.0-101.101) over (6.8.0-100.100) ...
Preparing to unpack .../14-linux-headers-generic_6.8.0-101.101_amd64.deb ...
Unpacking linux-headers-generic (6.8.0-101.101) over (6.8.0-100.100) ...
Preparing to unpack .../15-linux-libc-dev_6.8.0-101.101_amd64.deb ...
Unpacking linux-libc-dev:amd64 (6.8.0-101.101) over (6.8.0-100.100) ...
Preparing to unpack .../16-linux-tools-common_6.8.0-101.101_all.deb ...
Unpacking linux-tools-common (6.8.0-101.101) over (6.8.0-100.100) ...
Selecting previously unselected package linux-tools-6.8.0-101.
Preparing to unpack .../17-linux-tools-6.8.0-101_6.8.0-101.101_amd64.deb ...
Unpacking linux-tools-6.8.0-101 (6.8.0-101.101) ...
Selecting previously unselected package linux-tools-6.8.0-101-generic.
Preparing to unpack .../18-linux-tools-6.8.0-101-generic_6.8.0-101.101_amd64.deb ...
Unpacking linux-tools-6.8.0-101-generic (6.8.0-101.101) ...
Preparing to unpack .../19-software-properties-common_0.99.49.4_all.deb ...
Unpacking software-properties-common (0.99.49.4) over (0.99.49.3) ...
Preparing to unpack .../20-python3-software-properties_0.99.49.4_all.deb ...
Unpacking python3-software-properties (0.99.49.4) over (0.99.49.3) ...
Preparing to unpack .../21-sosreport_4.10.2-0ubuntu0~24.04.1_amd64.deb ...
Unpacking sosreport (4.10.2-0ubuntu0~24.04.1) over (4.9.2-0ubuntu0~24.04.1) ...
Preparing to unpack .../22-cloud-init_25.3-0ubuntu1~24.04.1_all.deb ...
Unpacking cloud-init (25.3-0ubuntu1~24.04.1) over (25.2-0ubuntu1~24.04.1) ...
Setting up cloud-init (25.3-0ubuntu1~24.04.1) ...
Setting up linux-base (4.5ubuntu9+24.04.2) ...
Setting up linux-headers-6.8.0-101 (6.8.0-101.101) ...
Setting up libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) ...
Setting up linux-libc-dev:amd64 (6.8.0-101.101) ...
Setting up libnss3:amd64 (2:3.98-1ubuntu0.1) ...
Setting up python3-software-properties (0.99.49.4) ...
Setting up linux-modules-6.8.0-101-generic (6.8.0-101.101) ...
Setting up linux-headers-6.8.0-101-generic (6.8.0-101.101) ...
Setting up libssh-4:amd64 (0.10.6-2ubuntu0.3) ...
Setting up sosreport (4.10.2-0ubuntu0~24.04.1) ...
Setting up systemd-hwe-hwdb (255.1.7) ...
Setting up linux-tools-common (6.8.0-101.101) ...
Setting up python3.12-minimal (3.12.3-1ubuntu0.12) ...
Setting up libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) ...
Setting up libcurl4t64:amd64 (8.5.0-2ubuntu10.7) ...
Setting up python3.12 (3.12.3-1ubuntu0.12) ...
Setting up libcurl3t64-gnutls:amd64 (8.5.0-2ubuntu10.7) ...
Setting up linux-headers-generic (6.8.0-101.101) ...
Setting up software-properties-common (0.99.49.4) ...
Setting up linux-image-6.8.0-101-generic (6.8.0-101.101) ...
I: /boot/vmlinuz is now a symlink to vmlinuz-6.8.0-101-generic
I: /boot/initrd.img is now a symlink to initrd.img-6.8.0-101-generic
Setting up libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) ...
Setting up linux-tools-6.8.0-101 (6.8.0-101.101) ...
Setting up curl (8.5.0-2ubuntu10.7) ...
Setting up linux-image-virtual (6.8.0-101.101) ...
Setting up linux-tools-6.8.0-101-generic (6.8.0-101.101) ...
Setting up linux-headers-virtual (6.8.0-101.101) ...
Setting up linux-virtual (6.8.0-101.101) ...
Processing triggers for udev (255.4-1ubuntu8.12) ...
Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
Processing triggers for rsyslog (8.2312.0-3ubuntu9.1) ...
Processing triggers for systemd (255.4-1ubuntu8.12) ...
Processing triggers for man-db (2.12.0-4build2) ...
Processing triggers for dbus (1.14.10-4ubuntu4.1) ...
Processing triggers for linux-image-6.8.0-101-generic (6.8.0-101.101) ...
/etc/kernel/postinst.d/initramfs-tools:
update-initramfs: Generating /boot/initrd.img-6.8.0-101-generic
/etc/kernel/postinst.d/zz-update-grub:
Sourcing file `/etc/default/grub'
Sourcing file `/etc/default/grub.d/50-cloudimg-settings.cfg'
Generating grub configuration file ...
Found linux image: /boot/vmlinuz-6.8.0-101-generic
Found initrd image: /boot/initrd.img-6.8.0-101-generic
Found linux image: /boot/vmlinuz-6.8.0-100-generic
Found initrd image: /boot/initrd.img-6.8.0-100-generic
Warning: os-prober will not be executed to detect other bootable partitions.
Systems on them will not be added to the GRUB boot configuration.
Check GRUB_DISABLE_OS_PROBER documentation entry.
Adding boot menu entry for UEFI Firmware Settings ...
done
Scanning processes...                                                                                                                                                                                                                       
Scanning candidates...                                                                                                                                                                                                                      
Scanning linux images...                                                                                                                                                                                                                    

Pending kernel upgrade!
Running kernel version:
  6.8.0-100-generic
Diagnostics:
  The currently running kernel version is not the expected kernel version 6.8.0-101-generic.

Restarting the system to load the new kernel will not be handled automatically, so you should consider rebooting.

Restarting services...
 systemctl restart multipathd.service packagekit.service udisks2.service

Service restarts being deferred:
 systemctl restart unattended-upgrades.service

No containers need to be restarted.

User sessions running outdated binaries:
 ubuntu @ session #1: apt[1503]

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@ubuntu-24-test-os-automation-project:~$ uname -r
6.8.0-100-generic
ubuntu@ubuntu-24-test-os-automation-project:~$ uname -r
6.8.0-100-generic
ubuntu@ubuntu-24-test-os-automation-project:~$ uname -r
6.8.0-100-generic
ubuntu@ubuntu-24-test-os-automation-project:~$ uname -r
6.8.0-100-generic
ubuntu@ubuntu-24-test-os-automation-project:~$ sudo reboot

Broadcast message from root@ubuntu-24-test-os-automation-project on pts/1 (Tue 2026-03-10 11:57:49 UTC):

The system will reboot now!

ubuntu@ubuntu-24-test-os-automation-project:~$ Connection to 172.24.4.41 closed by remote host.
Connection to 172.24.4.41 closed.
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ping 172.24.4.41
PING 172.24.4.41 (172.24.4.41) 56(84) bytes of data.
64 bytes from 172.24.4.41: icmp_seq=21 ttl=63 time=1.48 ms
64 bytes from 172.24.4.41: icmp_seq=22 ttl=63 time=0.976 ms
64 bytes from 172.24.4.41: icmp_seq=23 ttl=63 time=5.04 ms
^C
--- 172.24.4.41 ping statistics ---
23 packets transmitted, 3 received, 86.9565% packet loss, time 22487ms
rtt min/avg/max/mdev = 0.976/2.497/5.037/1.807 ms
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ssh ubuntu@172.24.4.41
ubuntu@172.24.4.41's password: 
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Mar 10 11:58:21 UTC 2026

  System load:  0.87               Processes:             99
  Usage of /:   15.5% of 13.49GB   Users logged in:       0
  Memory usage: 9%                 IPv4 address for ens3: 10.0.0.132
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Tue Mar 10 11:53:10 2026 from 172.24.4.1
ubuntu@ubuntu-24-test-os-automation-project:~$ uname -r
6.8.0-101-generic
ubuntu@ubuntu-24-test-os-automation-project:~$ dpkg --list | grep linux-image
ii  linux-image-6.8.0-100-generic   6.8.0-100.100                           amd64        Signed kernel image generic
ii  linux-image-6.8.0-101-generic   6.8.0-101.101                           amd64        Signed kernel image generic
ii  linux-image-virtual             6.8.0-101.101                           amd64        Virtual Linux kernel image
ubuntu@ubuntu-24-test-os-automation-project:~$ apt policy linux-image-virtual linux-generic linux-generic-hwe-24.04
linux-image-virtual:
  Installed: 6.8.0-101.101
  Candidate: 6.8.0-101.101
  Version table:
 *** 6.8.0-101.101 500
        500 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages
        100 /var/lib/dpkg/status
     6.8.0-31.31 500
        500 http://nova.clouds.archive.ubuntu.com/ubuntu noble/main amd64 Packages
linux-generic:
  Installed: (none)
  Candidate: 6.8.0-101.101
  Version table:
     6.8.0-101.101 500
        500 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages
     6.8.0-31.31 500
        500 http://nova.clouds.archive.ubuntu.com/ubuntu noble/main amd64 Packages
linux-generic-hwe-24.04:
  Installed: (none)
  Candidate: 6.17.0-14.14~24.04.1
  Version table:
     6.17.0-14.14~24.04.1 500
        500 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages
        500 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages
     6.8.0-31.31 500
        500 http://nova.clouds.archive.ubuntu.com/ubuntu noble/main amd64 Packages
ubuntu@ubuntu-24-test-os-automation-project:~$ 

ubuntu@ubuntu-24-test-os-automation-project:~$ cat /etc/os-release 
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo
ubuntu@ubuntu-24-test-os-automation-project:~$ sudo apt update && sudo apt upgrade -y
Hit:1 http://security.ubuntu.com/ubuntu noble-security InRelease                      
Hit:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble InRelease                    
Hit:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:4 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@ubuntu-24-test-os-automation-project:~$ cat /etc/os-release 
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
VERSION_CODENAME=noble
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=noble
LOGO=ubuntu-logo
ubuntu@ubuntu-24-test-os-automation-project:~$ 
ubuntu@ubuntu-24-test-os-automation-project:~$ exit
logout
Connection to 172.24.4.41 closed.
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server list
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+
| ID                                   | Name                                 | Status  | Networks                         | Image                    | Flavor   |
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+
| 180216ab-6e58-4062-8400-e31bd488781d | ubuntu-24-test-os-automation-project | ACTIVE  | private=10.0.0.132, 172.24.4.41  | N/A (booted from volume) | m1.small |
| 36c88e9c-7e00-4849-af6f-6a45d0e0f9fc | alma-10                              | SHUTOFF | private=10.0.0.158, 172.24.4.33  | N/A (booted from volume) | m1.small |
| 2e339260-569d-40fb-94f2-ff26d68fa74d | debian-11                            | ACTIVE  | private=10.0.0.88, 172.24.4.190  | N/A (booted from volume) | m1.small |
| abcff3fe-3f6d-48fd-baba-a7565e71f26a | ubuntu-20                            | SHUTOFF | private=10.0.0.198, 172.24.4.18  | N/A (booted from volume) | m1.small |
| 61564dab-c835-420d-82a9-b4b6672480b0 | ubuntu-18                            | SHUTOFF | private=10.0.0.21, 172.24.4.59   | N/A (booted from volume) | m1.small |
| f7827631-9878-4000-bff5-cc4f08624f37 | debian-12                            | SHUTOFF | private=10.0.0.11, 172.24.4.136  | N/A (booted from volume) | m1.small |
| 215e7781-a397-4655-9cab-f42d0b5296fd | ubuntu-24                            | SHUTOFF | private=10.0.0.37, 172.24.4.118  | N/A (booted from volume) | m1.small |
| dc6a0c5a-ba77-4c9b-83c5-cf71469738e7 | ubuntu-22                            | SHUTOFF | private=10.0.0.149, 172.24.4.108 | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------------------+---------+----------------------------------+--------------------------+----------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ 
```
#### Clear the system (deleting the existing test virtual machines and volumes)
```
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server list -f value -c ID | xargs -r -n1 openstack server delete
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server list

ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume list
+--------------------------------------+--------------------------------------+-----------+------+-------------+
| ID                                   | Name                                 | Status    | Size | Attached to |
+--------------------------------------+--------------------------------------+-----------+------+-------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | available |   15 |             |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | available |   20 |             |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | available |   10 |             |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | available |   10 |             |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | available |   19 |             |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | available |   19 |             |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | available |   15 |             |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | available |   10 |             |
+--------------------------------------+--------------------------------------+-----------+------+-------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server list -f value -c ID | xargs -r -n1 openstack server delete
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume list
+--------------------------------------+--------------------------------------+-----------+------+-------------+
| ID                                   | Name                                 | Status    | Size | Attached to |
+--------------------------------------+--------------------------------------+-----------+------+-------------+
| fb0df5a4-61ff-4164-9143-d34742096a4b | ubuntu-24-test-os-automation-project | available |   15 |             |
| 5439f4a7-213e-46e8-b525-1ee7ae5eb146 | alma-10                              | available |   20 |             |
| 87bb916a-0c97-46cb-9ab2-5ef7f2ddeda8 | ubuntu-20                            | available |   10 |             |
| bd27db9b-fcd0-4086-999b-453a0b600406 | ubuntu-18                            | available |   10 |             |
| 5f69af3a-15dd-4015-a513-e06dc7ab5dc1 | debian-12                            | available |   19 |             |
| 3bacc120-4199-4931-b2a3-3abf85732a84 | debian-11                            | available |   19 |             |
| b0324125-036e-449d-80e3-bf8387f7afc7 | ubuntu-24                            | available |   15 |             |
| 8ba791b3-5bf9-4b4f-8e23-603c1d216f28 | ubuntu-22                            | available |   10 |             |
+--------------------------------------+--------------------------------------+-----------+------+-------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume list -f value -c ID | xargs -r -n1 openstack volume delete
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume list

ubuntu@gelani-lab-1:~/cloudinit-userdata$ 
```
# created a new vm to test ceph backend again
```
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack image list
+--------------------------------------+--------------------------------------+--------+
| ID                                   | Name                                 | Status |
+--------------------------------------+--------------------------------------+--------+
| 151fa56a-92e5-4a05-82bb-f4472394d3d9 | alma-10                              | active |
| f339488c-2c82-4e7d-ab70-d57a4d2c1ade | cirros                               | active |
| a05bfffb-5b9a-468e-b9a7-45e541d6e1c7 | debian-11                            | active |
| 8c2f2ee0-458e-4370-8cfa-e5e145402142 | debian-12                            | active |
| 5a2209bd-847e-4948-87e2-e66b1109f4eb | fedora-40                            | active |
| fbb9bfc0-3dc0-4f20-b230-e046473fe629 | rocky-9                              | active |
| 9bd72412-c33b-49a4-8917-396c9dd3741f | ubuntu-18                            | active |
| b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb | ubuntu-20                            | active |
| c218d57e-3393-4283-8a6c-fe74551e9ea2 | ubuntu-22                            | active |
| b522ceff-bea1-465d-9dbb-ebb567769ef4 | ubuntu-24                            | active |
| ea3b9ae8-c81a-4198-a2a3-4936599f84c7 | ubuntu-24-test-os-automation-project | active |
+--------------------------------------+--------------------------------------+--------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume create   --image ubuntu-24   --size 10   --type ceph   ubuntu-24
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-03-10T13:31:13.110309           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | 1b0e378c-ac45-4e6b-bb70-e506e37137f0 |
| multiattach                    | False                                |
| name                           | ubuntu-24                            |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 10                                   |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 270824ef176044a2a8b64a8337e2f00a     |
| volume_type_id                 | 67bc2259-3afb-4a0f-a065-fdc7a53e905c |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume show ubuntu-24 -c status -c bootable
+----------+-------------+
| Field    | Value       |
+----------+-------------+
| bootable | False       |
| status   | downloading |
+----------+-------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ watch -n2 openstack volume list
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server create   --flavor m1.small   --volume ubuntu-24   --network private   --user-data /home/ubuntu/cloudinit-userdata/cloud-init.yaml   --config-drive true   ubuntu-24
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ubuntu-24                                                                                                                                                                                          |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-vi0h2l2f                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | I2Nsb3VkLWNvbmZpZwpwYXNzd29yZDogMTIzNDU2NzgKY2hwYXNzd2Q6IHsgZXhwaXJlOiBGYWxzZSB9CnNzaF9wd2F1dGg6IFRydWUK                                                                                           |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | kyQ6NBCekovi                                                                                                                                                                                       |
| config_drive                        | True                                                                                                                                                                                               |
| created                             | 2026-03-10T13:32:26Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='20', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.small', is_disabled=, is_public='True', location=, name='m1.small', original_name='m1.small', ram='2048',        |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | 1c55a99f-bf09-4ead-8682-137466061782                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ubuntu-24                                                                                                                                                                                          |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-03-10T13:32:26Z                                                                                                                                                                               |
| user_id                             | 270824ef176044a2a8b64a8337e2f00a                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ watch -n2 openstack server list
ubuntu@gelani-lab-1:~/cloudinit-userdata$ FIP=$(openstack floating ip create public -f value -c floating_ip_address)
openstack server add floating ip ubuntu-24 $FIP
echo "Floating IP: $FIP"
Floating IP: 172.24.4.192
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ping 172.24.4.192
PING 172.24.4.192 (172.24.4.192) 56(84) bytes of data.
64 bytes from 172.24.4.192: icmp_seq=1 ttl=63 time=2.57 ms
64 bytes from 172.24.4.192: icmp_seq=2 ttl=63 time=0.831 ms
^C
--- 172.24.4.192 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 0.831/1.699/2.568/0.868 ms
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server show ubuntu-24 \
  -c name -c image -c volumes_attached
+------------------+--------------------------------------------------------------------------+
| Field            | Value                                                                    |
+------------------+--------------------------------------------------------------------------+
| image            | N/A (booted from volume)                                                 |
| name             | ubuntu-24                                                                |
| volumes_attached | delete_on_termination='False', id='1b0e378c-ac45-4e6b-bb70-e506e37137f0' |
+------------------+--------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd info volume-b0324125-036e-449d-80e3-bf8387f7afc7
rbd: error opening default pool 'rbd'
Ensure that the default pool has been created or specify an alternate pool name.
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume list
+--------------------------------------+-----------+--------+------+------------------------------------+
| ID                                   | Name      | Status | Size | Attached to                        |
+--------------------------------------+-----------+--------+------+------------------------------------+
| 1b0e378c-ac45-4e6b-bb70-e506e37137f0 | ubuntu-24 | in-use |   10 | Attached to ubuntu-24 on /dev/vda  |
+--------------------------------------+-----------+--------+------+------------------------------------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd info volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
rbd: error opening default pool 'rbd'
Ensure that the default pool has been created or specify an alternate pool name.
ubuntu@gelani-lab-1:~/cloudinit-userdata$ sudo grep -R "rbd_pool" /etc/cinder/cinder.conf /etc/kolla/cinder-volume/cinder.conf 2>/dev/null
/etc/cinder/cinder.conf:#rbd_pool = volume
/etc/cinder/cinder.conf:rbd_pool = volume
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd info volumes/volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
rbd: error opening pool 'volumes': (2) No such file or directory
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd --pool volumes info volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
rbd: error opening pool 'volumes': (2) No such file or directory
ubuntu@gelani-lab-1:~/cloudinit-userdata$ ceph osd lspools
1 .mgr
2 volume
3 images
4 vms
5 backups
6 rgw.meta
7 rgw.control
8 rgw.log
9 rgw.buckets.data
10 rgw.buckets.index
11 .rgw.root
12 gelani-zone.rgw.log
13 gelani-zone.rgw.control
14 gelani-zone.rgw.meta
15 gelani-zone.rgw.buckets.index
16 gelani-zone.rgw.buckets.data
17 gelani-zone.rgw.buckets.non-ec
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd pool ls
error: unknown option 'pool ls'

usage: rbd <command> ...

Command-line interface for managing Ceph RBD images.

Positional arguments:
  <command>
    bench                             Simple benchmark.
    children                          Display children of an image or its
                                      snapshot.
    clone                             Clone a snapshot into a CoW child image.
    config global get                 Get a global-level configuration override.
    config global list (... ls)       List global-level configuration overrides.
    config global remove (... rm)     Remove a global-level configuration
                                      override.
    config global set                 Set a global-level configuration override.
    config image get                  Get an image-level configuration override.
    config image list (... ls)        List image-level configuration overrides.
    config image remove (... rm)      Remove an image-level configuration
                                      override.
    config image set                  Set an image-level configuration override.
    config pool get                   Get a pool-level configuration override.
    config pool list (... ls)         List pool-level configuration overrides.
    config pool remove (... rm)       Remove a pool-level configuration
                                      override.
    config pool set                   Set a pool-level configuration override.
    copy (cp)                         Copy src image to dest.
    create                            Create an empty image.
    deep copy (deep cp)               Deep copy (including snapshots) src image
                                      to dest.
    device attach                     Attach image to device.
    device detach                     Detach image from device.
    device list (showmapped)          List mapped rbd images.
    device map (map)                  Map an image to a block device.
    device unmap (unmap)              Unmap a rbd device.
    diff                              Print extents that differ since a
                                      previous snap, or image creation.
    disk-usage (du)                   Show disk usage stats for pool, image or
                                      snapshot.
    encryption format                 Format image to an encrypted format.
    export                            Export image to file.
    export-diff                       Export incremental diff to file.
    feature disable                   Disable the specified image feature.
    feature enable                    Enable the specified image feature.
    flatten                           Fill clone with parent data (make it
                                      independent).
    group create                      Create a group.
    group image add                   Add an image to a group.
    group image list (... ls)         List images in a group.
    group image remove (... rm)       Remove an image from a group.
    group list (group ls)             List rbd groups.
    group remove (group rm)           Delete a group.
    group rename                      Rename a group within its pool or
                                      namespace.
    group snap create                 Make a snapshot of a group.
    group snap list (... ls)          List snapshots of a group.
    group snap remove (... rm)        Remove a snapshot from a group.
    group snap rename                 Rename group's snapshot.
    group snap rollback               Rollback group to snapshot.
    image-meta get                    Image metadata get the value associated
                                      with the key.
    image-meta list (image-meta ls)   Image metadata list keys with values.
    image-meta remove (image-meta rm) Image metadata remove the key and value
                                      associated.
    image-meta set                    Image metadata set key with value.
    import                            Import image from file.
    import-diff                       Import an incremental diff.
    info                              Show information about image size,
                                      striping, etc.
    journal client disconnect         Flag image journal client as disconnected.
    journal export                    Export image journal.
    journal import                    Import image journal.
    journal info                      Show information about image journal.
    journal inspect                   Inspect image journal for structural
                                      errors.
    journal reset                     Reset image journal.
    journal status                    Show status of image journal.
    list (ls)                         List rbd images.
    lock add                          Take a lock on an image.
    lock list (lock ls)               Show locks held on an image.
    lock remove (lock rm)             Release a lock on an image.
    merge-diff                        Merge two diff exports together.
    migration abort                   Cancel interrupted image migration.
    migration commit                  Commit image migration.
    migration execute                 Execute image migration.
    migration prepare                 Prepare image migration.
    mirror image demote               Demote an image to non-primary for RBD
                                      mirroring.
    mirror image disable              Disable RBD mirroring for an image.
    mirror image enable               Enable RBD mirroring for an image.
    mirror image promote              Promote an image to primary for RBD
                                      mirroring.
    mirror image resync               Force resync to primary image for RBD
                                      mirroring.
    mirror image snapshot             Create RBD mirroring image snapshot.
    mirror image status               Show RBD mirroring status for an image.
    mirror pool demote                Demote all primary images in a pool or
                                      namespace.
    mirror pool disable               Disable RBD mirroring in a pool or
                                      namespace.
    mirror pool enable                Enable RBD mirroring in a pool or
                                      namespace.
    mirror pool info                  Show mirroring configuration for a pool
                                      or namespace.
    mirror pool peer add              Add a mirroring peer to a pool.
    mirror pool peer bootstrap create Create a peer bootstrap token to import
                                      in a remote cluster
    mirror pool peer bootstrap import Import a peer bootstrap token created
                                      from a remote cluster
    mirror pool peer remove           Remove a mirroring peer from a pool.
    mirror pool peer set              Update mirroring peer settings.
    mirror pool promote               Promote all non-primary images in a pool
                                      or namespace.
    mirror pool status                Show status for all mirrored images in a
                                      pool or namespace.
    mirror snapshot schedule add      Add mirror snapshot schedule.
    mirror snapshot schedule list (... ls)
                                      List mirror snapshot schedule.
    mirror snapshot schedule remove (... rm)
                                      Remove mirror snapshot schedule.
    mirror snapshot schedule status   Show mirror snapshot schedule status.
    namespace create                  Create an RBD image namespace.
    namespace list (namespace ls)     List RBD image namespaces.
    namespace remove (namespace rm)   Remove an RBD image namespace.
    object-map check                  Verify the object map is correct.
    object-map rebuild                Rebuild an invalid object map.
    perf image iostat                 Display image IO statistics.
    perf image iotop                  Display a top-like IO monitor.
    persistent-cache flush            Flush persistent cache.
    persistent-cache invalidate       Invalidate (discard) existing / dirty
                                      persistent cache.
    pool init                         Initialize pool for use by RBD.
    pool stats                        Display pool statistics.
    remove (rm)                       Delete an image.
    rename (mv)                       Rename an image within its pool or
                                      namespace.
    resize                            Resize (expand or shrink) image.
    snap create (snap add)            Create a snapshot.
    snap limit clear                  Remove snapshot limit.
    snap limit set                    Limit the number of snapshots.
    snap list (snap ls)               Dump list of image snapshots.
    snap protect                      Prevent a snapshot from being deleted.
    snap purge                        Delete all unprotected snapshots.
    snap remove (snap rm)             Delete a snapshot.
    snap rename                       Rename a snapshot.
    snap rollback (snap revert)       Rollback image to snapshot.
    snap unprotect                    Allow a snapshot to be deleted.
    sparsify                          Reclaim space for zeroed image extents.
    status                            Show the status of this image.
    trash list (trash ls)             List trash images.
    trash move (trash mv)             Move an image to the trash.
    trash purge                       Remove all expired images from trash.
    trash purge schedule add          Add trash purge schedule.
    trash purge schedule list (... ls)
                                      List trash purge schedule.
    trash purge schedule remove (... rm)
                                      Remove trash purge schedule.
    trash purge schedule status       Show trash purge schedule status.
    trash remove (trash rm)           Remove an image from trash.
    trash restore                     Restore an image from trash.
    watch                             Watch events on image.

Optional arguments:
  -c [ --conf ] arg                   path to cluster configuration
  --cluster arg                       cluster name
  --id arg                            client id (without 'client.' prefix)
  -n [ --name ] arg                   client name
  -m [ --mon_host ] arg               monitor host
  -K [ --keyfile ] arg                path to secret key
  -k [ --keyring ] arg                path to keyring

See 'rbd help <command>' for help on a specific command.
ubuntu@gelani-lab-1:~/cloudinit-userdata$ for p in $(rbd pool ls); do
  echo "== $p =="
  rbd ls "$p" | grep 1b0e378c-ac45-4e6b-bb70-e506e37137f0 && break
done
error: unknown option 'pool ls'

== usage: ==
rbd: error opening pool 'usage:': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== rbd ==
rbd: error opening default pool 'rbd'
Ensure that the default pool has been created or specify an alternate pool name.
rbd: listing images failed: (2) No such file or directory
== <command> ==
rbd: error opening pool '<command>': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== ... ==
rbd: error opening pool '...': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Command-line ==
rbd: error opening pool 'Command-line': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== interface ==
rbd: error opening pool 'interface': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== for ==
rbd: error opening pool 'for': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== managing ==
rbd: error opening pool 'managing': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Ceph ==
rbd: error opening pool 'Ceph': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== RBD ==
rbd: error opening pool 'RBD': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== images. ==
rbd: error opening pool 'images.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Positional ==
rbd: error opening pool 'Positional': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== arguments: ==
rbd: error opening pool 'arguments:': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== <command> ==
rbd: error opening pool '<command>': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== bench ==
rbd: error opening pool 'bench': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Simple ==
rbd: error opening pool 'Simple': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== benchmark. ==
rbd: error opening pool 'benchmark.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== children ==
rbd: error opening pool 'children': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Display ==
rbd: error opening pool 'Display': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== children ==
rbd: error opening pool 'children': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== of ==
rbd: error opening pool 'of': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== an ==
rbd: error opening pool 'an': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== image ==
rbd: error opening pool 'image': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== or ==
rbd: error opening pool 'or': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== its ==
rbd: error opening pool 'its': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== snapshot. ==
rbd: error opening pool 'snapshot.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== clone ==
rbd: error opening pool 'clone': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Clone ==
rbd: error opening pool 'Clone': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== a ==
rbd: error opening pool 'a': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== snapshot ==
rbd: error opening pool 'snapshot': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== into ==
rbd: error opening pool 'into': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== a ==
rbd: error opening pool 'a': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== CoW ==
rbd: error opening pool 'CoW': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== child ==
rbd: error opening pool 'child': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== image. ==
rbd: error opening pool 'image.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== config ==
rbd: error opening pool 'config': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global ==
rbd: error opening pool 'global': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== get ==
rbd: error opening pool 'get': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Get ==
rbd: error opening pool 'Get': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== a ==
rbd: error opening pool 'a': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global-level ==
rbd: error opening pool 'global-level': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== configuration ==
rbd: error opening pool 'configuration': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== override. ==
rbd: error opening pool 'override.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== config ==
rbd: error opening pool 'config': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global ==
rbd: error opening pool 'global': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== list ==
rbd: error opening pool 'list': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== (... ==
rbd: error opening pool '(...': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== ls) ==
rbd: error opening pool 'ls)': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== List ==
rbd: error opening pool 'List': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global-level ==
rbd: error opening pool 'global-level': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== configuration ==
rbd: error opening pool 'configuration': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== overrides. ==
rbd: error opening pool 'overrides.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== config ==
rbd: error opening pool 'config': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global ==
rbd: error opening pool 'global': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== remove ==
rbd: error opening pool 'remove': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== (... ==
rbd: error opening pool '(...': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== rm) ==
rbd: error opening pool 'rm)': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Remove ==
rbd: error opening pool 'Remove': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== a ==
rbd: error opening pool 'a': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global-level ==
rbd: error opening pool 'global-level': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== configuration ==
rbd: error opening pool 'configuration': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== override. ==
rbd: error opening pool 'override.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== config ==
rbd: error opening pool 'config': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global ==
rbd: error opening pool 'global': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== set ==
rbd: error opening pool 'set': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Set ==
rbd: error opening pool 'Set': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== a ==
rbd: error opening pool 'a': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== global-level ==
rbd: error opening pool 'global-level': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== configuration ==
rbd: error opening pool 'configuration': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== override. ==
rbd: error opening pool 'override.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== config ==
rbd: error opening pool 'config': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== image ==
rbd: error opening pool 'image': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== get ==
rbd: error opening pool 'get': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== Get ==
rbd: error opening pool 'Get': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== an ==
rbd: error opening pool 'an': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== image-level ==
rbd: error opening pool 'image-level': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== configuration ==
rbd: error opening pool 'configuration': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== override. ==
rbd: error opening pool 'override.': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== config ==
rbd: error opening pool 'config': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== image ==
rbd: error opening pool 'image': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== list ==
rbd: error opening pool 'list': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
== (... ==
rbd: error opening pool '(...': (2) No such file or directory
^C
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd info volumes/volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
rbd: error opening pool 'volumes': (2) No such file or directory
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd ls volume | grep 1b0e378c-ac45-4e6b-bb70-e506e37137f0
volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
ubuntu@gelani-lab-1:~/cloudinit-userdata$ for p in $(ceph osd lspools | awk '{print $2}'); do
  echo "== $p =="
  rbd ls "$p" 2>/dev/null | grep 1b0e378c-ac45-4e6b-bb70-e506e37137f0 && break
done
== .mgr ==
== volume ==
volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
ubuntu@gelani-lab-1:~/cloudinit-userdata$ rbd --pool volume info volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0
rbd image 'volume-1b0e378c-ac45-4e6b-bb70-e506e37137f0':
        size 10 GiB in 2560 objects
        order 22 (4 MiB objects)
        snapshot_count: 0
        id: a2341ec95aa92
        block_name_prefix: rbd_data.a2341ec95aa92
        format: 2
        features: layering, exclusive-lock, object-map, fast-diff, deep-flatten
        op_features: 
        flags: 
        create_timestamp: Tue Mar 10 13:31:24 2026
        access_timestamp: Tue Mar 10 13:34:36 2026
        modify_timestamp: Tue Mar 10 13:36:13 2026
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server list
+--------------------------------------+-----------+--------+----------------------------------+--------------------------+----------+
| ID                                   | Name      | Status | Networks                         | Image                    | Flavor   |
+--------------------------------------+-----------+--------+----------------------------------+--------------------------+----------+
| 1c55a99f-bf09-4ead-8682-137466061782 | ubuntu-24 | ACTIVE | private=10.0.0.143, 172.24.4.192 | N/A (booted from volume) | m1.small |
+--------------------------------------+-----------+--------+----------------------------------+--------------------------+----------+
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack server delete ubuntu-24
ubuntu@gelani-lab-1:~/cloudinit-userdata$ openstack volume delete ubuntu-24
ubuntu@gelani-lab-1:~/cloudinit-userdata$ 
```
# The real project begains:
## Goal of this first implementation:
* keep Glance on Ceph
* use Packer to create a golden image
* that image is:
    * updated
    *  cleaned
    *  reusable

**Then new VM will launch from it** 
### clear the home direcotry first
```
ubuntu@gelani-lab-1:~/cloudinit-userdata$ cd ~
ubuntu@gelani-lab-1:~$ ls
cloudinit-userdata  image-factory  raw-image
ubuntu@gelani-lab-1:~$ mv image-factory image-factory-old-files-not-used
ubuntu@gelani-lab-1:~$ ls
cloudinit-userdata  image-factory-old-files-not-used  raw-image
```
# The actual start:
## create project folders
```
ubuntu@gelani-lab-1:~$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output,logs}
tree ~/image-factory
/home/ubuntu/image-factory
├── cloud-init
├── logs
├── output
├── packer
└── scripts

5 directories, 0 files
```
## install required packages and verify 
```
ubuntu@gelani-lab-1:~$ sudo apt update
sudo apt install -y unzip qemu-utils jq curl wget
Hit:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease     
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease
Get:4 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Fetched 129 kB in 5s (25.3 kB/s)   
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
curl is already the newest version (7.81.0-1ubuntu1.22).
jq is already the newest version (1.6-2.1ubuntu3.1).
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.28).
unzip is already the newest version (6.0-26ubuntu3.2).
wget is already the newest version (1.21.2-2ubuntu1.1).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-lab-1:~$ qemu-img --version
qemu-img version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.28)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
ubuntu@gelani-lab-1:~$ jq --version
jq-1.6
ubuntu@gelani-lab-1:~$ curl --version | head -n 1
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
ubuntu@gelani-lab-1:~$ packer version
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
```
### Little clenning (I have tried some test install priviously so clean up that)
```
ubuntu@gelani-lab-1:~$ ll
total 140
drwxr-x--- 11 ubuntu ubuntu  4096 Mar 10 14:16 ./
drwxr-xr-x  3 root   root    4096 Jan 19 10:56 ../
-rw-------  1 ubuntu ubuntu 72322 Mar 10 10:41 .bash_history
-rw-r--r--  1 ubuntu ubuntu   220 Jan  6  2022 .bash_logout
-rw-r--r--  1 ubuntu ubuntu  3771 Jan  6  2022 .bashrc
drwx------  3 ubuntu ubuntu  4096 Jan 31 14:00 .cache/
drwxrwxr-x  6 ubuntu ubuntu  4096 Feb 26 19:54 .config/
drwxrwxr-x  3 ubuntu ubuntu  4096 Feb 15 06:14 .glanceclient/
-rw-------  1 ubuntu ubuntu    20 Feb 18 06:37 .lesshst
drwxrwxr-x  3 ubuntu ubuntu  4096 Feb 17 10:51 .local/
-rw-------  1 ubuntu ubuntu   803 Feb 15 10:01 .mysql_history
-rw-r--r--  1 ubuntu ubuntu   807 Jan  6  2022 .profile
drwx------  2 ubuntu ubuntu  4096 Mar 10 11:53 .ssh/
-rw-r--r--  1 ubuntu ubuntu     0 Jan 19 10:58 .sudo_as_admin_successful
-rw-rw-r--  1 ubuntu ubuntu   408 Feb 26 05:49 .wget-hsts
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 10 11:08 cloudinit-userdata/
drwxrwxr-x  7 ubuntu ubuntu  4096 Mar 10 14:16 image-factory/
drwxrwxr-x  6 ubuntu ubuntu  4096 Feb 20 20:08 image-factory-old-files-not-used/
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 10 11:42 raw-image/
ubuntu@gelani-lab-1:~$ sudo rm image-factory-old-files-not-used/
rm: cannot remove 'image-factory-old-files-not-used/': Is a directory
ubuntu@gelani-lab-1:~$ sudo rm -r image-factory-old-files-not-used/
ubuntu@gelani-lab-1:~$ ls
cloudinit-userdata  image-factory  raw-image
```
## prepare the base Ubuntu 24.04 image & upload this as OpenStack base image
```
ubuntu@gelani-lab-1:~$ mkdir -p ~/images/base-image
cd ~/images/base-image
pwd
/home/ubuntu/images/base-image
ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-10 14:19:03--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.37, 185.125.190.40, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.37|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629048832 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                  100%[========================================================================================================================================>] 599.91M  16.7MB/s    in 42s     

2026-03-10 14:19:46 (14.2 MB/s) - ‘noble.img’ saved [629048832/629048832]

ubuntu@gelani-lab-1:~/images/base-image$ ls -lh noble.img
-rw-rw-r-- 1 ubuntu ubuntu 600M Feb 25 13:19 noble.img
ubuntu@gelani-lab-1:~/images/base-image$ qemu-img info noble.img
image: noble.img
file format: qcow2
virtual size: 3.5 GiB (3758096384 bytes)
disk size: 600 MiB
cluster_size: 65536
Format specific information:
    compat: 1.1
    compression type: zlib
    lazy refcounts: false
    refcount bits: 16
    corrupt: false
    extended l2: false
ubuntu@gelani-lab-1:~/images/base-image$ openstack image list | grep ubuntu-24.04-base
ubuntu@gelani-lab-1:~/images/base-image$ openstack image create ubuntu-24.04-base \
  --file ~/images/base-image/noble.img \
  --disk-format qcow2 \
  --container-format bare \
  --public
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                                                 |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 46063c6f375646b634adb52b3681102d                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                  |
| created_at       | 2026-03-10T15:01:48Z                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                 |
| file             | /v2/images/be415f83-0c94-4c5e-b351-416fbe719f45/file                                                                                                                                                                  |
| id               | be415f83-0c94-4c5e-b351-416fbe719f45                                                                                                                                                                                  |
| min_disk         | 0                                                                                                                                                                                                                     |
| min_ram          | 0                                                                                                                                                                                                                     |
| name             | ubuntu-24.04-base                                                                                                                                                                                                     |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                      |
| properties       | os_hash_algo='sha512', os_hash_value='cd4d8a156272c8a250a29ec95cd174ee3e0dfb67609b1787a83299909227e678dd74d19a7f212b9d742c08a10023237f421830bccad00bc937801e2739f94725', os_hidden='False',                           |
|                  | owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256=''                                                                                    |
| protected        | False                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                     |
| size             | 629048832                                                                                                                                                                                                             |
| status           | active                                                                                                                                                                                                                |
| tags             |                                                                                                                                                                                                                       |
| updated_at       | 2026-03-10T15:01:58Z                                                                                                                                                                                                  |
| virtual_size     | 3758096384                                                                                                                                                                                                            |
| visibility       | public                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image list
+--------------------------------------+--------------------------------------+--------+
| ID                                   | Name                                 | Status |
+--------------------------------------+--------------------------------------+--------+
| 151fa56a-92e5-4a05-82bb-f4472394d3d9 | alma-10                              | active |
| f339488c-2c82-4e7d-ab70-d57a4d2c1ade | cirros                               | active |
| a05bfffb-5b9a-468e-b9a7-45e541d6e1c7 | debian-11                            | active |
| 8c2f2ee0-458e-4370-8cfa-e5e145402142 | debian-12                            | active |
| 5a2209bd-847e-4948-87e2-e66b1109f4eb | fedora-40                            | active |
| fbb9bfc0-3dc0-4f20-b230-e046473fe629 | rocky-9                              | active |
| 9bd72412-c33b-49a4-8917-396c9dd3741f | ubuntu-18                            | active |
| b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb | ubuntu-20                            | active |
| c218d57e-3393-4283-8a6c-fe74551e9ea2 | ubuntu-22                            | active |
| b522ceff-bea1-465d-9dbb-ebb567769ef4 | ubuntu-24                            | active |
| ea3b9ae8-c81a-4198-a2a3-4936599f84c7 | ubuntu-24-test-os-automation-project | active |
| be415f83-0c94-4c5e-b351-416fbe719f45 | ubuntu-24.04-base                    | active |
+--------------------------------------+--------------------------------------+--------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image show ubuntu-24.04-base -c id -c name -c status -c disk_format -c size
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| disk_format | qcow2                                |
| id          | be415f83-0c94-4c5e-b351-416fbe719f45 |
| name        | ubuntu-24.04-base                    |
| size        | 629048832                            |
| status      | active                               |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ rbd ls -p images | grep be415f83-0c94-4c5e-b351-416fbe719f45
be415f83-0c94-4c5e-b351-416fbe719f45
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group list | grep packer-build-sg
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group create packer-build-sg
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                         |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-10T15:03:15Z                                                                                                                                                          |
| description     | packer-build-sg                                                                                                                                                               |
| id              | 488d0770-7c58-45fa-ae6e-69e7ee7a0476                                                                                                                                          |
| is_shared       | False                                                                                                                                                                         |
| name            | packer-build-sg                                                                                                                                                               |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                              |
| revision_number | 1                                                                                                                                                                             |
| rules           | created_at='2026-03-10T15:03:15Z', direction='egress', ethertype='IPv4', id='1e0efca5-a0a8-4a06-ba0c-a2736892f14e', standard_attr_id='138', updated_at='2026-03-10T15:03:15Z' |
|                 | created_at='2026-03-10T15:03:15Z', direction='egress', ethertype='IPv6', id='ae5b645c-fa2a-4e89-99ae-dbbe04d0e1fa', standard_attr_id='139', updated_at='2026-03-10T15:03:15Z' |
| stateful        | True                                                                                                                                                                          |
| tags            | []                                                                                                                                                                            |
| updated_at      | 2026-03-10T15:03:15Z                                                                                                                                                          |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group rule create --proto tcp --dst-port 22 packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-10T15:03:24Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 2aabe56d-79df-4d10-ae91-b0e614efc3d9 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | 488d0770-7c58-45fa-ae6e-69e7ee7a0476 |
| updated_at              | 2026-03-10T15:03:24Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group rule create --proto icmp packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-10T15:03:34Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | a9e8ad64-90c8-419b-a1c9-4cccbe0a7338 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | 488d0770-7c58-45fa-ae6e-69e7ee7a0476 |
| updated_at              | 2026-03-10T15:03:34Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group show packer-build-sg
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-10T15:03:15Z                                                                                                                                                                                                   |
| description     | packer-build-sg                                                                                                                                                                                                        |
| id              | 488d0770-7c58-45fa-ae6e-69e7ee7a0476                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | packer-build-sg                                                                                                                                                                                                        |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                                                      |
| rules           | created_at='2026-03-10T15:03:15Z', direction='egress', ethertype='IPv4', id='1e0efca5-a0a8-4a06-ba0c-a2736892f14e', standard_attr_id='138', updated_at='2026-03-10T15:03:15Z'                                          |
|                 | created_at='2026-03-10T15:03:24Z', direction='ingress', ethertype='IPv4', id='2aabe56d-79df-4d10-ae91-b0e614efc3d9', normalized_cidr='0.0.0.0/0', port_range_max='22', port_range_min='22', protocol='tcp',            |
|                 | remote_ip_prefix='0.0.0.0/0', standard_attr_id='140', updated_at='2026-03-10T15:03:24Z'                                                                                                                                |
|                 | created_at='2026-03-10T15:03:34Z', direction='ingress', ethertype='IPv4', id='a9e8ad64-90c8-419b-a1c9-4cccbe0a7338', normalized_cidr='0.0.0.0/0', protocol='icmp', remote_ip_prefix='0.0.0.0/0',                       |
|                 | standard_attr_id='141', updated_at='2026-03-10T15:03:34Z'                                                                                                                                                              |
|                 | created_at='2026-03-10T15:03:15Z', direction='egress', ethertype='IPv6', id='ae5b645c-fa2a-4e89-99ae-dbbe04d0e1fa', standard_attr_id='139', updated_at='2026-03-10T15:03:15Z'                                          |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-03-10T15:03:34Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
```
## prepare build access for Packer
```
ubuntu@gelani-lab-1:~/images/base-image$ mkdir -p ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
/home/ubuntu/.ssh/packer_build_key already exists.
Overwrite (y/n)? y^C
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/.ssh
ubuntu@gelani-lab-1:~/.ssh$ ll
total 32
drwx------  2 ubuntu ubuntu 4096 Mar 10 11:53 ./
drwxr-x--- 11 ubuntu ubuntu 4096 Mar 10 14:18 ../
-rw-------  1 ubuntu ubuntu  399 Feb 18 04:44 authorized_keys
-rw-------  1 ubuntu ubuntu 4782 Mar 10 11:53 known_hosts
-rw-------  1 ubuntu ubuntu 3946 Mar 10 11:53 known_hosts.old
-rw-------  1 ubuntu ubuntu  411 Feb 20 20:16 packer_build_key
-rw-r--r--  1 ubuntu ubuntu  101 Feb 20 20:16 packer_build_key.pub
ubuntu@gelani-lab-1:~/.ssh$ rm -r packer_build_key
ubuntu@gelani-lab-1:~/.ssh$ ll
total 28
drwx------  2 ubuntu ubuntu 4096 Mar 10 15:04 ./
drwxr-x--- 11 ubuntu ubuntu 4096 Mar 10 14:18 ../
-rw-------  1 ubuntu ubuntu  399 Feb 18 04:44 authorized_keys
-rw-------  1 ubuntu ubuntu 4782 Mar 10 11:53 known_hosts
-rw-------  1 ubuntu ubuntu 3946 Mar 10 11:53 known_hosts.old
-rw-r--r--  1 ubuntu ubuntu  101 Feb 20 20:16 packer_build_key.pub
ubuntu@gelani-lab-1:~/.ssh$ rm -r packer_build_key.pub 
ubuntu@gelani-lab-1:~/.ssh$ ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:wruMahUMNJ1x5DN1f12oUWUDAKPO42Hjw4KAqiSDTVM ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
| .o..+o .oo..oo++|
|  ..oo ...... .oo|
|   oE +.    .o. .|
|.  .o.oo    ..   |
|..o  .oBS        |
|oo..o =o+        |
|=..o ..=         |
|+..  o...        |
|..... o          |
+----[SHA256]-----+
ubuntu@gelani-lab-1:~/.ssh$ ls -l ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
-rw------- 1 ubuntu ubuntu 411 Mar 10 15:04 /home/ubuntu/.ssh/packer_build_key
-rw-r--r-- 1 ubuntu ubuntu 101 Mar 10 15:04 /home/ubuntu/.ssh/packer_build_key.pub
ubuntu@gelani-lab-1:~/.ssh$ openstack keypair list | grep packer-build-key
ubuntu@gelani-lab-1:~/.ssh$ openstack keypair create --public-key ~/.ssh/packer_build_key.pub packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | None                                            |
| fingerprint | 70:e3:7a:c1:77:f9:39:bf:dc:0b:1c:21:57:d7:76:b8 |
| id          | packer-build-key                                |
| is_deleted  | None                                            |
| name        | packer-build-key                                |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/.ssh$ openstack keypair show packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | 2026-03-10T15:04:56.000000                      |
| fingerprint | 70:e3:7a:c1:77:f9:39:bf:dc:0b:1c:21:57:d7:76:b8 |
| id          | packer-build-key                                |
| is_deleted  | False                                           |
| name        | packer-build-key                                |
| private_key | None                                            |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
```
## create the scripts that prepare the golden image
```
ubuntu@gelani-lab-1:~/.ssh$ nano ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ chmod +x ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ ls -l ~/image-factory/scripts/provision-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 351 Mar 10 15:05 /home/ubuntu/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ nano ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ chmod +x ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ ls -l ~/image-factory/scripts/cleanup-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 316 Mar 10 15:05 /home/ubuntu/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/.ssh$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
packer {
  required_plugins {
    openstack = {
      version = ">= 1.1.0"
      source  = "github.com/hashicorp/openstack"
    }
  }
}

variable "network_name" {
  type    = string
  default = "private"
}

source "openstack" "ubuntu2404" {
  image_name            = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name     = "ubuntu-24.04-base"
  flavor                = "m1.small"
  networks              = [var.network_name]
  security_groups       = ["packer-build-sg"]

  ssh_username          = "ubuntu"
  ssh_private_key_file  = "~/.ssh/packer_build_key"
  ssh_keypair_name      = "packer-build-key"
  ssh_timeout           = "20m"
  ssh_interface         = "private"
  ssh_ip_version        = "4"

  image_visibility      = "public"
  image_tags            = ["ubuntu", "24.04", "golden", "automated"]

  metadata = {
    os_distro    = "ubuntu"
    os_version   = "24.04"
    build_method = "packer"
    purpose      = "golden-image"
  }
}

build {
  sources = ["source.openstack.ubuntu2404"]

  provisioner "shell" {
    script = "../scripts/provision-ubuntu.sh"
  }

  provisioner "shell" {
    script = "../scripts/cleanup-ubuntu.sh"
  }
}
```
## initialize and validate Packer
```
ubuntu@gelani-lab-1:~/.ssh$ cd ~/image-factory/packer
packer init .
ubuntu@gelani-lab-1:~/image-factory/packer$ packer validate -var "network_name=private" ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer build -var "network_name=private" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: be415f83-0c94-4c5e-b351-416fbe719f45
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}
==> openstack.ubuntu2404: Terminating the source server:  ...
==> openstack.ubuntu2404: Error terminating server, may still be around: Resource not found
Build 'openstack.ubuntu2404' errored after 158 milliseconds 376 microseconds: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Wait completed after 158 milliseconds 467 microseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Builds finished but no artifacts were created.
```
**Note: Here a issue occurs: Bad networks format: network uuid is not in proper format (private)**
That means in this Packer OpenStack builder, the networks field wants the network UUID, not the network name.
***Solution***
1. Step 1: get the UUID of the private network
2. Step 2: run Packer using the UUID
```
ubuntu@gelani-lab-1:~/image-factory/packer$ cd /opt/stack/devstack
source openrc admin admin
openstack network list
+--------------------------------------+----------+--------------------------------------+
| ID                                   | Name     | Subnets                              |
+--------------------------------------+----------+--------------------------------------+
| a374dd2e-853a-41eb-88ca-b5730143b548 | private  | bd0d784b-b8ff-4577-998d-a546756f7b8b |
| abd82ede-929d-4f72-a034-e27922dda38f | public   | 65d17f74-a22e-452f-982f-5d641c6c6c57 |
| e83ed974-4855-4c7b-bfb6-949d6c49e829 | shared   | bbc63ac2-84de-4309-9a01-8f69e17a63c1 |
| ee6db446-7789-4b4e-9851-b4335a721c56 | heat-net |                                      |
+--------------------------------------+----------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd ~/image-factory/packer
packer build -var "network_name=a374dd2e-853a-41eb-88ca-b5730143b548" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: be415f83-0c94-4c5e-b351-416fbe719f45
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
    openstack.ubuntu2404: Server ID: a4324b43-d94b-4d88-b084-b1f0dcd39e81
==> openstack.ubuntu2404: Waiting for server to become ready...
    openstack.ubuntu2404: Floating IP not required
==> openstack.ubuntu2404: Using SSH communicator to connect: 10.0.0.36
==> openstack.ubuntu2404: Waiting for SSH to become available...
```
**Note: It got stuck at SSH to become available**
```
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd ~/image-factory/packer
packer build -var "network_name=a374dd2e-853a-41eb-88ca-b5730143b548" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: be415f83-0c94-4c5e-b351-416fbe719f45
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
    openstack.ubuntu2404: Server ID: a4324b43-d94b-4d88-b084-b1f0dcd39e81
==> openstack.ubuntu2404: Waiting for server to become ready...
    openstack.ubuntu2404: Floating IP not required
==> openstack.ubuntu2404: Using SSH communicator to connect: 10.0.0.36
==> openstack.ubuntu2404: Waiting for SSH to become available...
Cancelling build after receiving interrupt
==> openstack.ubuntu2404: Terminating the source server: a4324b43-d94b-4d88-b084-b1f0dcd39e81 ...
Build 'openstack.ubuntu2404' finished after 14 minutes 28 seconds.

==> Wait completed after 14 minutes 28 seconds
Cleanly cancelled builds after being interrupted.
ubuntu@gelani-lab-1:~/image-factory/packer$ ^C
```

