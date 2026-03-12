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
**root-cause:**
Packer is trying to SSH to the private IP 10.0.0.36, but from host side that path is not reachable. So it just waits forever here:
*Using SSH communicator to connect: 10.0.0.36*
*Waiting for SSH to become available...*

**Solution**
* make Packer assign a floating IP
* make Packer SSH through that floating IP
***Packer handle the floating IP automatically, instead of manually creating one with openstack floating ip create every time***

**What to change**
***In Packer template, change it so that:***
* it launches on your private/internal network
* it allocates floating IP from public
* it connects over public IP

### Applied the changes

```
ubuntu@gelani-lab-1:~$ cd /opt/stack/devstack
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
ubuntu@gelani-lab-1:/opt/stack/devstack$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
ubuntu@gelani-lab-1:/opt/stack/devstack$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:/opt/stack/devstack$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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

  ssh_interface         = "public"
  ssh_ip_version        = "4"

  floating_ip_network   = "public"
  instance_floating_ip_net = "private"

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
ubuntu@gelani-lab-1:/opt/stack/devstack$ 

ubuntu@gelani-lab-1:~$ cd /opt/stack/devstack
ubuntu@gelani-lab-1:/opt/stack/devstack$ source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd ~/image-factory/packer
packer validate -var "network_name=private" ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build -var "network_name=private" ubuntu-24.04.pkr.hcl
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
Build 'openstack.ubuntu2404' errored after 232 milliseconds 985 microseconds: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Wait completed after 233 milliseconds 52 microseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Builds finished but no artifacts were created.
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build -var "network_name=private" ubuntu-24.04.pkr.hcl
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
Build 'openstack.ubuntu2404' errored after 112 milliseconds 748 microseconds: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Wait completed after 112 milliseconds 820 microseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Builds finished but no artifacts were created.
```
***issue: first problem fiexed, and now Packer is telling Bad networks format: network uuid is not in proper format (private)***
***root-casue-analysis***
That means for the OpenStack builder, the networks field does not want the network name here — it wants the network UUID. The official Packer OpenStack builder docs say networks is “a list of networks by UUID to attach to this instance,” while floating_ip_network can be ID or name, and instance_floating_ip_net is the ID of the attached network used for floating-IP association.
**fixing-steps**
* will use:
  * the private network UUID for network_name
  * the public network name or UUID for floating_ip_network
  * the private network UUID for instance_floating_ip_net
**from openstack network list, these are the values:**
***private = a374dd2e-853a-41eb-88ca-b5730143b548***
***public = abd82ede-929d-4f72-a034-e27922dda38f***
### Apply the fixing:
```
ubuntu@gelani-lab-1:~/image-factory/packer$ cd /opt/stack/devstack
source openrc admin admin
watch -n 2 "openstack server list; echo; openstack floating ip list"
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack network list
+--------------------------------------+----------+--------------------------------------+
| ID                                   | Name     | Subnets                              |
+--------------------------------------+----------+--------------------------------------+
| a374dd2e-853a-41eb-88ca-b5730143b548 | private  | bd0d784b-b8ff-4577-998d-a546756f7b8b |
| abd82ede-929d-4f72-a034-e27922dda38f | public   | 65d17f74-a22e-452f-982f-5d641c6c6c57 |
| e83ed974-4855-4c7b-bfb6-949d6c49e829 | shared   | bbc63ac2-84de-4309-9a01-8f69e17a63c1 |
| ee6db446-7789-4b4e-9851-b4335a721c56 | heat-net |                                      |
+--------------------------------------+----------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:/opt/stack/devstack$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
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

  ssh_interface         = "public"
  ssh_ip_version        = "4"

  floating_ip_network   = "public"
  instance_floating_ip_net = "private"

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
ubuntu@gelani-lab-1:/opt/stack/devstack$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:/opt/stack/devstack$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}
source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd ~/image-factory/packer
packer validate ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: be415f83-0c94-4c5e-b351-416fbe719f45
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
    openstack.ubuntu2404: Server ID: b79c18b6-d38a-460e-8a1b-c1b85363a520
==> openstack.ubuntu2404: Waiting for server to become ready...
==> openstack.ubuntu2404: Creating floating IP using network abd82ede-929d-4f72-a034-e27922dda38f ...
    openstack.ubuntu2404: Created floating IP: 'd7b8a2cb-e7c4-4cd2-a270-c3d1638aeb9f' (172.24.4.29)
==> openstack.ubuntu2404: Associating floating IP 'd7b8a2cb-e7c4-4cd2-a270-c3d1638aeb9f' (172.24.4.29) with instance port...
    openstack.ubuntu2404: Added floating IP 'd7b8a2cb-e7c4-4cd2-a270-c3d1638aeb9f' (172.24.4.29) to instance!
==> openstack.ubuntu2404: Using SSH communicator to connect: 172.24.4.29
==> openstack.ubuntu2404: Waiting for SSH to become available...
==> openstack.ubuntu2404: Connected to SSH!
==> openstack.ubuntu2404: Provisioning with shell script: ../scripts/provision-ubuntu.sh
==> openstack.ubuntu2404: + export DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + apt-get update
    openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
==> openstack.ubuntu2404: E: Unable to lock directory /var/lib/apt/lists/
==> openstack.ubuntu2404: Provisioning step had errors: Running the cleanup provisioner, if present...
==> openstack.ubuntu2404: Deleted temporary floating IP 'd7b8a2cb-e7c4-4cd2-a270-c3d1638aeb9f' (172.24.4.29)
==> openstack.ubuntu2404: Terminating the source server: b79c18b6-d38a-460e-8a1b-c1b85363a520 ...
Build 'openstack.ubuntu2404' errored after 48 seconds 781 milliseconds: Script exited with non-zero exit status: 100. Allowed exit codes are: [0]

==> Wait completed after 48 seconds 781 milliseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Script exited with non-zero exit status: 100. Allowed exit codes are: [0]

==> Builds finished but no artifacts were created.
```
### Manually check if there is any error in the system:
```
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server create \
  --image ubuntu-24.04-base \
  --flavor m1.small \
  --network a374dd2e-853a-41eb-88ca-b5730143b548 \
  --security-group packer-build-sg \
  --key-name packer-build-key \
  packer-manual-test
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                              |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | packer-manual-test                                                                                                                                                 |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-7ac0l5kd                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                |
| adminPass                           | fi6CH3upupDK                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                               |
| created                             | 2026-03-10T17:02:34Z                                                                                                                                               |
| description                         | None                                                                                                                                                               |
| flavor                              | description=, disk='20', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.small', is_disabled=, is_public='True', location=, name='m1.small',              |
|                                     | original_name='m1.small', ram='2048', rxtx_factor=, swap='0', vcpus='1'                                                                                            |
| hostId                              | None                                                                                                                                                               |
| host_status                         | None                                                                                                                                                               |
| id                                  | e1207298-2bca-4037-acf6-d433a861c3fd                                                                                                                               |
| image                               | ubuntu-24.04-base (be415f83-0c94-4c5e-b351-416fbe719f45)                                                                                                           |
| key_name                            | packer-build-key                                                                                                                                                   |
| locked                              | None                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                               |
| name                                | packer-manual-test                                                                                                                                                 |
| pinned_availability_zone            | None                                                                                                                                                               |
| progress                            | None                                                                                                                                                               |
| project_id                          | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                   |
| properties                          | None                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                    |
| security_groups                     | name='488d0770-7c58-45fa-ae6e-69e7ee7a0476'                                                                                                                        |
| server_groups                       | None                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                              |
| tags                                |                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                               |
| updated                             | 2026-03-10T17:02:34Z                                                                                                                                               |
| user_id                             | 270824ef176044a2a8b64a8337e2f00a                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                    |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list
+--------------------------------------+--------------------+--------+-------------------+-------------------+----------+
| ID                                   | Name               | Status | Networks          | Image             | Flavor   |
+--------------------------------------+--------------------+--------+-------------------+-------------------+----------+
| e1207298-2bca-4037-acf6-d433a861c3fd | packer-manual-test | ACTIVE | private=10.0.0.60 | ubuntu-24.04-base | m1.small |
+--------------------------------------+--------------------+--------+-------------------+-------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ FIP=$(openstack floating ip create public -f value -c floating_ip_address)
openstack server add floating ip packer-manual-test "$FIP"
echo "$FIP"
172.24.4.50
ubuntu@gelani-lab-1:~/image-factory/packer$ ping 172.24.4.50
PING 172.24.4.50 (172.24.4.50) 56(84) bytes of data.
64 bytes from 172.24.4.50: icmp_seq=1 ttl=63 time=4.46 ms
64 bytes from 172.24.4.50: icmp_seq=2 ttl=63 time=0.793 ms
64 bytes from 172.24.4.50: icmp_seq=3 ttl=63 time=0.368 ms
64 bytes from 172.24.4.50: icmp_seq=4 ttl=63 time=0.326 ms
^C
--- 172.24.4.50 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3046ms
rtt min/avg/max/mdev = 0.326/1.486/4.457/1.725 ms
ubuntu@gelani-lab-1:~/image-factory/packer$ ssh -i ~/.ssh/packer_build_key ubuntu@"$FIP"
The authenticity of host '172.24.4.50 (172.24.4.50)' can't be established.
ED25519 key fingerprint is SHA256:ZtX+SLXJVyUmIB6F4eAfcPKv4TTq3oe7YbAn1/UA4JI.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.24.4.50' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Mar 10 17:03:28 UTC 2026

  System load:  0.51              Processes:             100
  Usage of /:   8.9% of 18.33GB   Users logged in:       0
  Memory usage: 8%                IPv4 address for ens3: 10.0.0.60
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

ubuntu@packer-manual-test:~$ sudo apt update sudo apt upgrade -y
E: The update command takes no arguments
ubuntu@packer-manual-test:~$ ping google.com
PING google.com (142.251.223.110) 56(84) bytes of data.
64 bytes from tzdela-ar-in-f14.1e100.net (142.251.223.110): icmp_seq=1 ttl=114 time=49.5 ms
64 bytes from tzdela-ar-in-f14.1e100.net (142.251.223.110): icmp_seq=2 ttl=114 time=47.4 ms
^C
--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1012ms
rtt min/avg/max/mdev = 47.429/48.459/49.489/1.030 ms
ubuntu@packer-manual-test:~$ sudo apt update && sudo apt upgrade -y
Get:1 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
Hit:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble InRelease
Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
Get:4 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1504 kB]
Get:5 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [241 kB]
Get:6 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.5 kB]          
Get:7 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [10.1 kB]        
Get:8 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [976 kB]
Get:9 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [218 kB]  
Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.2 kB]    
Get:11 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [20.6 kB]     
Get:12 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2599 kB]         
Get:13 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [600 kB]         
Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]     
Get:15 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [544 B] 
Get:16 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]     
Get:17 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6732 B]      
Get:18 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
Get:20 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]                                                                                                                     
Get:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]                                                                                                                
28% [21 Packages 574 kB/15.0 MB 4%]                                                                                                                                                   6475 B/s 1h 25min 31s^C
ubuntu@packer-manual-test:~$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@packer-manual-test:~$ exit
logout
Connection to 172.24.4.50 closed.
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| ID                                   | Name               | Status | Networks                       | Image             | Flavor   |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| e1207298-2bca-4037-acf6-d433a861c3fd | packer-manual-test | ACTIVE | private=10.0.0.60, 172.24.4.50 | ubuntu-24.04-base | m1.small |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list -f value -c ID | xargs -r -n1 openstack server delete

openstack server list
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| ID                                   | Name               | Status | Networks                       | Image             | Flavor   |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| e1207298-2bca-4037-acf6-d433a861c3fd | packer-manual-test | ACTIVE | private=10.0.0.60, 172.24.4.50 | ubuntu-24.04-base | m1.small |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list -f value -c ID | xargs -r -n1 openstack volume delete

openstack server list

ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list

ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list

ubuntu@gelani-lab-1:~/image-factory/packer$ openstack image list
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
```
**issue: permisssion error**
***details:***
OpenStack side is working now:
* Packer can launch the VM
* it can allocate and attach a floating IP
* it can SSH into the VM
* manual test also proves network and SSH are fine

***So the current failure is not networking anymore***
***It is a permissions problem inside the guest OS***

***The exact error says:**
```
E: Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)
E: Unable to lock directory /var/lib/apt/lists/
```
**fixing-steps:**
* need to edit the script and run packer as sudo
### fixing the permission issue but first little clening by deleting manually created server and volume:
```
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| ID                                   | Name               | Status | Networks                       | Image             | Flavor   |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| e1207298-2bca-4037-acf6-d433a861c3fd | packer-manual-test | ACTIVE | private=10.0.0.60, 172.24.4.50 | ubuntu-24.04-base | m1.small |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list -f value -c ID | xargs -r -n1 openstack server delete

openstack server list
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| ID                                   | Name               | Status | Networks                       | Image             | Flavor   |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
| e1207298-2bca-4037-acf6-d433a861c3fd | packer-manual-test | ACTIVE | private=10.0.0.60, 172.24.4.50 | ubuntu-24.04-base | m1.small |
+--------------------------------------+--------------------+--------+--------------------------------+-------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list -f value -c ID | xargs -r -n1 openstack volume delete

openstack server list

ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list

ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list

ubuntu@gelani-lab-1:~/image-factory/packer$ openstack image list
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
ubuntu@gelani-lab-1:~/image-factory/packer$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/image-factory/packer$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}
source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
ubuntu@gelani-lab-1:~/image-factory/packer$ # this is raw without edit , now i will edit
ubuntu@gelani-lab-1:~/image-factory/packer$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/image-factory/packer$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}
source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/provision-ubuntu.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/cleanup-ubuntu.sh"
  }
}
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer validate ubuntu-24.04.pkr.hcl
The configuration is valid.
```
### final packer initialization and validate run
```
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: be415f83-0c94-4c5e-b351-416fbe719f45
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
    openstack.ubuntu2404: Server ID: 3ab9ed71-f7a3-4711-b902-990061a9605f
==> openstack.ubuntu2404: Waiting for server to become ready...
==> openstack.ubuntu2404: Creating floating IP using network abd82ede-929d-4f72-a034-e27922dda38f ...
    openstack.ubuntu2404: Created floating IP: '3ed6ff00-9455-4b51-9f66-18d11a8548fd' (172.24.4.36)
==> openstack.ubuntu2404: Associating floating IP '3ed6ff00-9455-4b51-9f66-18d11a8548fd' (172.24.4.36) with instance port...
    openstack.ubuntu2404: Added floating IP '3ed6ff00-9455-4b51-9f66-18d11a8548fd' (172.24.4.36) to instance!
==> openstack.ubuntu2404: Using SSH communicator to connect: 172.24.4.36
==> openstack.ubuntu2404: Waiting for SSH to become available...
==> openstack.ubuntu2404: Connected to SSH!
==> openstack.ubuntu2404: Provisioning with shell script: ../scripts/provision-ubuntu.sh
==> openstack.ubuntu2404: + export DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + apt-get update
    openstack.ubuntu2404: Get:1 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
    openstack.ubuntu2404: Hit:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble InRelease
    openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
    openstack.ubuntu2404: Get:4 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1504 kB]
    openstack.ubuntu2404: Get:5 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [241 kB]
    openstack.ubuntu2404: Get:6 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.5 kB]
    openstack.ubuntu2404: Get:7 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [10.1 kB]
    openstack.ubuntu2404: Get:8 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [976 kB]
    openstack.ubuntu2404: Get:9 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [218 kB]
    openstack.ubuntu2404: Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.2 kB]
    openstack.ubuntu2404: Get:11 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [20.6 kB]
    openstack.ubuntu2404: Get:12 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2599 kB]
    openstack.ubuntu2404: Get:13 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [600 kB]
    openstack.ubuntu2404: Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]
    openstack.ubuntu2404: Get:15 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [544 B]
    openstack.ubuntu2404: Get:16 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]
    openstack.ubuntu2404: Get:17 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6732 B]
    openstack.ubuntu2404: Get:18 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
    openstack.ubuntu2404: Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
    openstack.ubuntu2404: Get:20 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
    openstack.ubuntu2404: Get:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
    openstack.ubuntu2404: Ign:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
    openstack.ubuntu2404: Get:22 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe Translation-en [5982 kB]
    openstack.ubuntu2404: Get:23 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Components [3871 kB]
    openstack.ubuntu2404: Get:24 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 c-n-f Metadata [301 kB]
    openstack.ubuntu2404: Get:25 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages [269 kB]
    openstack.ubuntu2404: Get:26 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse Translation-en [118 kB]
    openstack.ubuntu2404: Get:27 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Components [35.0 kB]
    openstack.ubuntu2404: Get:28 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 c-n-f Metadata [8328 B]
    openstack.ubuntu2404: Get:29 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1807 kB]
    openstack.ubuntu2404: Get:30 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main Translation-en [332 kB]
    openstack.ubuntu2404: Get:31 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [177 kB]
    openstack.ubuntu2404: Get:32 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 c-n-f Metadata [16.7 kB]
    openstack.ubuntu2404: Get:33 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1565 kB]
    openstack.ubuntu2404: Ign:33 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages
    openstack.ubuntu2404: Get:34 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [318 kB]
    openstack.ubuntu2404: Get:35 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]
    openstack.ubuntu2404: Get:36 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 c-n-f Metadata [32.9 kB]
    openstack.ubuntu2404: Get:37 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [2748 kB]
    openstack.ubuntu2404: Get:38 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted Translation-en [632 kB]
    openstack.ubuntu2404: Get:39 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
    openstack.ubuntu2404: Get:40 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 c-n-f Metadata [556 B]
    openstack.ubuntu2404: Get:41 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [32.1 kB]
    openstack.ubuntu2404: Get:42 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse Translation-en [7044 B]
    openstack.ubuntu2404: Get:43 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
    openstack.ubuntu2404: Get:44 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 c-n-f Metadata [496 B]
    openstack.ubuntu2404: Get:45 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Packages [40.4 kB]
    openstack.ubuntu2404: Get:46 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main Translation-en [9208 B]
    openstack.ubuntu2404: Get:47 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7284 B]
    openstack.ubuntu2404: Get:48 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 c-n-f Metadata [368 B]
    openstack.ubuntu2404: Get:49 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [29.5 kB]
    openstack.ubuntu2404: Get:50 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [17.9 kB]
    openstack.ubuntu2404: Get:51 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [10.5 kB]
    openstack.ubuntu2404: Get:52 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 c-n-f Metadata [1444 B]
    openstack.ubuntu2404: Get:53 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [212 B]
    openstack.ubuntu2404: Get:54 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 c-n-f Metadata [116 B]
    openstack.ubuntu2404: Get:55 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]
    openstack.ubuntu2404: Get:56 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 c-n-f Metadata [116 B]
    openstack.ubuntu2404: Get:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
    openstack.ubuntu2404: Ign:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
    openstack.ubuntu2404: Get:33 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1565 kB]
    openstack.ubuntu2404: Get:21 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
    openstack.ubuntu2404: Fetched 28.2 MB in 17min 54s (26.3 kB/s)
    openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: + apt-get -y dist-upgrade
    openstack.ubuntu2404: Reading package lists...
    openstack.ubuntu2404: Building dependency tree...
    openstack.ubuntu2404: Reading state information...
    openstack.ubuntu2404: Calculating upgrade...
    openstack.ubuntu2404: The following packages will be upgraded:
    openstack.ubuntu2404:   libnftables1 libnss3 libpython3.12-minimal libpython3.12-stdlib
    openstack.ubuntu2404:   libpython3.12t64 linux-base nftables python3.12 python3.12-minimal sosreport
    openstack.ubuntu2404: 10 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
    openstack.ubuntu2404: Need to get 10.5 MB of archives.
    openstack.ubuntu2404: After this operation, 266 kB of additional disk space will be used.
    openstack.ubuntu2404: Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12t64 amd64 3.12.3-1ubuntu0.12 [2345 kB]
    openstack.ubuntu2404: Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12 amd64 3.12.3-1ubuntu0.12 [651 kB]
    openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-stdlib amd64 3.12.3-1ubuntu0.12 [2069 kB]
    openstack.ubuntu2404: Get:4 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12-minimal amd64 3.12.3-1ubuntu0.12 [2334 kB]
    openstack.ubuntu2404: Get:5 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-minimal amd64 3.12.3-1ubuntu0.12 [837 kB]
    openstack.ubuntu2404: Get:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 nftables amd64 1.0.9-1ubuntu0.1 [69.8 kB]
    openstack.ubuntu2404: Get:7 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libnftables1 amd64 1.0.9-1ubuntu0.1 [359 kB]
    openstack.ubuntu2404: Get:8 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libnss3 amd64 2:3.98-1ubuntu0.1 [1445 kB]
    openstack.ubuntu2404: Get:9 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 linux-base all 4.5ubuntu9+24.04.2 [19.6 kB]
    openstack.ubuntu2404: Get:10 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 sosreport amd64 4.10.2-0ubuntu0~24.04.1 [381 kB]
    openstack.ubuntu2404: Preconfiguring packages ...
    openstack.ubuntu2404: Fetched 10.5 MB in 7s (1551 kB/s)
    openstack.ubuntu2404: (Reading database ... 74832 files and directories currently installed.)
    openstack.ubuntu2404: Preparing to unpack .../0-libpython3.12t64_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../1-python3.12_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking python3.12 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../2-libpython3.12-stdlib_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../3-python3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking python3.12-minimal (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../4-libpython3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../5-nftables_1.0.9-1ubuntu0.1_amd64.deb ...
    openstack.ubuntu2404: Unpacking nftables (1.0.9-1ubuntu0.1) over (1.0.9-1build1) ...
    openstack.ubuntu2404: Preparing to unpack .../6-libnftables1_1.0.9-1ubuntu0.1_amd64.deb ...
    openstack.ubuntu2404: Unpacking libnftables1:amd64 (1.0.9-1ubuntu0.1) over (1.0.9-1build1) ...
    openstack.ubuntu2404: Preparing to unpack .../7-libnss3_2%3a3.98-1ubuntu0.1_amd64.deb ...
    openstack.ubuntu2404: Unpacking libnss3:amd64 (2:3.98-1ubuntu0.1) over (2:3.98-1build1) ...
    openstack.ubuntu2404: Preparing to unpack .../8-linux-base_4.5ubuntu9+24.04.2_all.deb ...
    openstack.ubuntu2404: Unpacking linux-base (4.5ubuntu9+24.04.2) over (4.5ubuntu9+24.04.1) ...
    openstack.ubuntu2404: Preparing to unpack .../9-sosreport_4.10.2-0ubuntu0~24.04.1_amd64.deb ...
    openstack.ubuntu2404: Unpacking sosreport (4.10.2-0ubuntu0~24.04.1) over (4.9.2-0ubuntu0~24.04.1) ...
    openstack.ubuntu2404: Setting up libnftables1:amd64 (1.0.9-1ubuntu0.1) ...
    openstack.ubuntu2404: Setting up linux-base (4.5ubuntu9+24.04.2) ...
    openstack.ubuntu2404: Setting up nftables (1.0.9-1ubuntu0.1) ...
    openstack.ubuntu2404: Setting up libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up libnss3:amd64 (2:3.98-1ubuntu0.1) ...
    openstack.ubuntu2404: Setting up sosreport (4.10.2-0ubuntu0~24.04.1) ...
    openstack.ubuntu2404: Setting up python3.12-minimal (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up python3.12 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Processing triggers for systemd (255.4-1ubuntu8.12) ...
    openstack.ubuntu2404: Processing triggers for man-db (2.12.0-4build2) ...
    openstack.ubuntu2404: Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Running kernel seems to be up-to-date.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Restarting services...
==> openstack.ubuntu2404:  systemctl restart udisks2.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Service restarts being deferred:
==> openstack.ubuntu2404:  systemctl restart unattended-upgrades.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No containers need to be restarted.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No user sessions are running outdated binaries.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No VM guests are running outdated hypervisor (qemu) binaries on this host.
==> openstack.ubuntu2404: + apt-get install -y qemu-guest-agent cloud-init curl wget vim net-tools ca-certificates
    openstack.ubuntu2404: Reading package lists...
    openstack.ubuntu2404: Building dependency tree...
    openstack.ubuntu2404: Reading state information...
    openstack.ubuntu2404: cloud-init is already the newest version (25.3-0ubuntu1~24.04.1).
    openstack.ubuntu2404: curl is already the newest version (8.5.0-2ubuntu10.7).
    openstack.ubuntu2404: curl set to manually installed.
    openstack.ubuntu2404: wget is already the newest version (1.21.4-1ubuntu4.1).
    openstack.ubuntu2404: wget set to manually installed.
    openstack.ubuntu2404: vim is already the newest version (2:9.1.0016-1ubuntu7.9).
    openstack.ubuntu2404: vim set to manually installed.
    openstack.ubuntu2404: ca-certificates is already the newest version (20240203).
    openstack.ubuntu2404: ca-certificates set to manually installed.
    openstack.ubuntu2404: The following additional packages will be installed:
    openstack.ubuntu2404:   liburing2
    openstack.ubuntu2404: The following NEW packages will be installed:
    openstack.ubuntu2404:   liburing2 net-tools qemu-guest-agent
    openstack.ubuntu2404: 0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
    openstack.ubuntu2404: Need to get 616 kB of archives.
    openstack.ubuntu2404: After this operation, 2113 kB of additional disk space will be used.
    openstack.ubuntu2404: Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liburing2 amd64 2.5-1build1 [21.1 kB]
    openstack.ubuntu2404: Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 qemu-guest-agent amd64 1:8.2.2+ds-0ubuntu1.13 [390 kB]
    openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 net-tools amd64 2.10-0.1ubuntu4.4 [204 kB]
    openstack.ubuntu2404: Fetched 616 kB in 2s (386 kB/s)
    openstack.ubuntu2404: Selecting previously unselected package liburing2:amd64.
    openstack.ubuntu2404: (Reading database ... 75035 files and directories currently installed.)
    openstack.ubuntu2404: Preparing to unpack .../liburing2_2.5-1build1_amd64.deb ...
    openstack.ubuntu2404: Unpacking liburing2:amd64 (2.5-1build1) ...
    openstack.ubuntu2404: Selecting previously unselected package qemu-guest-agent.
    openstack.ubuntu2404: Preparing to unpack .../qemu-guest-agent_1%3a8.2.2+ds-0ubuntu1.13_amd64.deb ...
    openstack.ubuntu2404: Unpacking qemu-guest-agent (1:8.2.2+ds-0ubuntu1.13) ...
    openstack.ubuntu2404: Selecting previously unselected package net-tools.
    openstack.ubuntu2404: Preparing to unpack .../net-tools_2.10-0.1ubuntu4.4_amd64.deb ...
    openstack.ubuntu2404: Unpacking net-tools (2.10-0.1ubuntu4.4) ...
    openstack.ubuntu2404: Setting up net-tools (2.10-0.1ubuntu4.4) ...
    openstack.ubuntu2404: Setting up liburing2:amd64 (2.5-1build1) ...
    openstack.ubuntu2404: Setting up qemu-guest-agent (1:8.2.2+ds-0ubuntu1.13) ...
    openstack.ubuntu2404: qemu-guest-agent.service is a disabled or a static unit, not starting it.
    openstack.ubuntu2404: Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
    openstack.ubuntu2404: Processing triggers for man-db (2.12.0-4build2) ...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Running kernel seems to be up-to-date.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Restarting services...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Service restarts being deferred:
==> openstack.ubuntu2404:  systemctl restart unattended-upgrades.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No containers need to be restarted.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No user sessions are running outdated binaries.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No VM guests are running outdated hypervisor (qemu) binaries on this host.
==> openstack.ubuntu2404: + systemctl enable qemu-guest-agent
==> openstack.ubuntu2404: Synchronizing state of qemu-guest-agent.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
==> openstack.ubuntu2404: Executing: /usr/lib/systemd/systemd-sysv-install enable qemu-guest-agent
==> openstack.ubuntu2404: The unit files have no installation config (WantedBy=, RequiredBy=, UpheldBy=,
==> openstack.ubuntu2404: Also=, or Alias= settings in the [Install] section, and DefaultInstance= for
==> openstack.ubuntu2404: template units). This means they are not meant to be enabled or disabled using systemctl.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Possible reasons for having these kinds of units are:
==> openstack.ubuntu2404: • A unit may be statically enabled by being symlinked from another unit's
==> openstack.ubuntu2404:   .wants/, .requires/, or .upholds/ directory.
==> openstack.ubuntu2404: • A unit's purpose may be to act as a helper for some other unit which has
==> openstack.ubuntu2404:   a requirement dependency on it.
==> openstack.ubuntu2404: • A unit may be started when needed via activation (socket, path, timer,
==> openstack.ubuntu2404:   D-Bus, udev, scripted systemctl call, ...).
==> openstack.ubuntu2404: • In case of template units, the unit is meant to be enabled with some
==> openstack.ubuntu2404:   instance name specified.
==> openstack.ubuntu2404: + systemctl enable ssh
==> openstack.ubuntu2404: Synchronizing state of ssh.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
==> openstack.ubuntu2404: Executing: /usr/lib/systemd/systemd-sysv-install enable ssh
==> openstack.ubuntu2404: Created symlink /etc/systemd/system/sshd.service → /usr/lib/systemd/system/ssh.service.
==> openstack.ubuntu2404: Created symlink /etc/systemd/system/multi-user.target.wants/ssh.service → /usr/lib/systemd/system/ssh.service.
==> openstack.ubuntu2404: + apt-get -y autoremove --purge
    openstack.ubuntu2404: Reading package lists...
    openstack.ubuntu2404: Building dependency tree...
    openstack.ubuntu2404: Reading state information...
==> openstack.ubuntu2404: + apt-get clean
    openstack.ubuntu2404: 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
==> openstack.ubuntu2404: Provisioning with shell script: ../scripts/cleanup-ubuntu.sh
==> openstack.ubuntu2404: + cloud-init clean --logs
==> openstack.ubuntu2404: + truncate -s 0 /etc/machine-id
==> openstack.ubuntu2404: + rm -f /var/lib/dbus/machine-id
==> openstack.ubuntu2404: + ln -sf /etc/machine-id /var/lib/dbus/machine-id
==> openstack.ubuntu2404: + rm -rf /tmp/script_8692.sh /tmp/snap-private-tmp /tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-ModemManager.service-0ZrCUK /tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-polkit.service-6jBdKQ /tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-systemd-logind.service-23FMbW /tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-systemd-resolved.service-U0BoDf /tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-systemd-timesyncd.service-FV9vt1 /var/tmp/cloud-init /var/tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-ModemManager.service-yVQKTj /var/tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-polkit.service-gQyuOE /var/tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-systemd-logind.service-AuegkF /var/tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-systemd-resolved.service-Ay0U3e /var/tmp/systemd-private-32073ca1054d4cd28ed05aadf13fa143-systemd-timesyncd.service-HtatEu
==> openstack.ubuntu2404: + find /var/log -type f -exec truncate -s 0 '{}' ';'
==> openstack.ubuntu2404: + apt-get clean
==> openstack.ubuntu2404: + sync
==> openstack.ubuntu2404: Stopping server: 3ab9ed71-f7a3-4711-b902-990061a9605f ...
    openstack.ubuntu2404: Waiting for server to stop: 3ab9ed71-f7a3-4711-b902-990061a9605f ...
==> openstack.ubuntu2404: Creating the image: ubuntu-24.04-2026-03-10-1724
    openstack.ubuntu2404: Image: ca73743e-149c-4999-89fe-87fd7174515d
==> openstack.ubuntu2404: Waiting for image ubuntu-24.04-2026-03-10-1724 (image id: ca73743e-149c-4999-89fe-87fd7174515d) to become ready...
==> openstack.ubuntu2404: Updating image tags to ubuntu, 24.04, golden, automated
==> openstack.ubuntu2404: Updating image visibility to public
==> openstack.ubuntu2404: Deleted temporary floating IP '3ed6ff00-9455-4b51-9f66-18d11a8548fd' (172.24.4.36)
==> openstack.ubuntu2404: Terminating the source server: 3ab9ed71-f7a3-4711-b902-990061a9605f ...
Build 'openstack.ubuntu2404' finished after 22 minutes 58 seconds.

==> Wait completed after 22 minutes 58 seconds

==> Builds finished. The artifacts of successful builds are:
--> openstack.ubuntu2404: An image was created: ca73743e-149c-4999-89fe-87fd7174515d
ubuntu@gelani-lab-1:~/image-factory/packer$ 
```
**first automated golden image build is successful**
Packer successfully:
  * launched a temporary VM from ubuntu-24.04-base
  * attached a floating IP
  * SSHed into it
  * ran provision script
  * ran cleanup script
  * shut the VM down
  * created a new Glance image
  * removed the temporary VM

***And the final artifact is:***
  * Image name: ubuntu-24.04-2026-03-10-1724
  * Image ID: ca73743e-149c-4999-89fe-87fd7174515d

### verification
```
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack image list | grep ubuntu-24.04
| ca73743e-149c-4999-89fe-87fd7174515d | ubuntu-24.04-2026-03-10-1724         | active |
| be415f83-0c94-4c5e-b351-416fbe719f45 | ubuntu-24.04-base                    | active |
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack image show ca73743e-149c-4999-89fe-87fd7174515d
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                 |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 3a8bb168243910a4c36405b22b1225af                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                  |
| created_at       | 2026-03-10T17:44:02Z                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                 |
| file             | /v2/images/ca73743e-149c-4999-89fe-87fd7174515d/file                                                                                                                                  |
| id               | ca73743e-149c-4999-89fe-87fd7174515d                                                                                                                                                  |
| min_disk         | 20                                                                                                                                                                                    |
| min_ram          | 0                                                                                                                                                                                     |
| name             | ubuntu-24.04-2026-03-10-1724                                                                                                                                                          |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                      |
| properties       | base_image_ref='be415f83-0c94-4c5e-b351-416fbe719f45', boot_roles='admin,member,manager,reader', build_method='packer', hw_cdrom_bus='ide', hw_disk_bus='virtio',                     |
|                  | hw_machine_type='pc', hw_video_model='virtio', hw_vif_model='virtio', image_location='snapshot', image_state='available', image_type='image',                                         |
|                  | instance_uuid='3ab9ed71-f7a3-4711-b902-990061a9605f', os_distro='ubuntu', os_hash_algo='sha512',                                                                                      |
|                  | os_hash_value='d63a617bff987d4ea1fcb4c5d38eddb8c8569ad6ce091f42be13de76d7e8b597cc320ef0398cc70e4e7210d888eb2641e8b574bcbac986a849d3420d81d03157', os_hidden='False',                  |
|                  | os_version='24.04', owner_project_name='admin', owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256='',   |
|                  | owner_user_name='admin', purpose='golden-image', user_id='270824ef176044a2a8b64a8337e2f00a'                                                                                           |
| protected        | False                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                     |
| size             | 2571763712                                                                                                                                                                            |
| status           | active                                                                                                                                                                                |
| tags             | 24.04, automated, golden, ubuntu                                                                                                                                                      |
| updated_at       | 2026-03-10T17:47:18Z                                                                                                                                                                  |
| virtual_size     | 21474836480                                                                                                                                                                           |
| visibility       | public                                                                                                                                                                                |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ rbd ls -p images
151fa56a-92e5-4a05-82bb-f4472394d3d9
5a2209bd-847e-4948-87e2-e66b1109f4eb
8c2f2ee0-458e-4370-8cfa-e5e145402142
9bd72412-c33b-49a4-8917-396c9dd3741f
a05bfffb-5b9a-468e-b9a7-45e541d6e1c7
b522ceff-bea1-465d-9dbb-ebb567769ef4
b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb
be415f83-0c94-4c5e-b351-416fbe719f45
c218d57e-3393-4283-8a6c-fe74551e9ea2
ca73743e-149c-4999-89fe-87fd7174515d
ea3b9ae8-c81a-4198-a2a3-4936599f84c7
f339488c-2c82-4e7d-ab70-d57a4d2c1ade
fbb9bfc0-3dc0-4f20-b230-e046473fe629
ubuntu@gelani-lab-1:~/image-factory/packer$ rbd ls -p images | grep ca73743e-149c-4999-89fe-87fd7174515d
ca73743e-149c-4999-89fe-87fd7174515d
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume type list
+--------------------------------------+-------------+-----------+
| ID                                   | Name        | Is Public |
+--------------------------------------+-------------+-----------+
| 67bc2259-3afb-4a0f-a065-fdc7a53e905c | ceph        | True      |
| 08a13653-2387-4764-a42b-f334dfba6074 | lvmdriver-1 | True      |
+--------------------------------------+-------------+-----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume create \
  --image ca73743e-149c-4999-89fe-87fd7174515d \
  --size 15 \
  --type ceph \
  ubuntu-24-golden-test-vol
BadRequestException: 400: Client Error for url: http://192.168.95.23/volume/v3/volumes, Invalid input received: Volume size 15GB cannot be smaller than the image minDisk size 20GB.
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume create   --image ca73743e-149c-4999-89fe-87fd7174515d   --size 20   --type ceph   ubuntu-24-golden-test-vol
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-03-10T18:09:29.926848           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c |
| multiattach                    | False                                |
| name                           | ubuntu-24-golden-test-vol            |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 20                                   |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 270824ef176044a2a8b64a8337e2f00a     |
| volume_type_id                 | 67bc2259-3afb-4a0f-a065-fdc7a53e905c |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+----------+------+-------------+
| ID                                   | Name                      | Status   | Size | Attached to |
+--------------------------------------+---------------------------+----------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | creating |   20 |             |
+--------------------------------------+---------------------------+----------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+----------+------+-------------+
| ID                                   | Name                      | Status   | Size | Attached to |
+--------------------------------------+---------------------------+----------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | creating |   20 |             |
+--------------------------------------+---------------------------+----------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+----------+------+-------------+
| ID                                   | Name                      | Status   | Size | Attached to |
+--------------------------------------+---------------------------+----------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | creating |   20 |             |
+--------------------------------------+---------------------------+----------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+----------+------+-------------+
| ID                                   | Name                      | Status   | Size | Attached to |
+--------------------------------------+---------------------------+----------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | creating |   20 |             |
+--------------------------------------+---------------------------+----------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
^[[Aubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-------------+------+-------------+
| ID                                   | Name                      | Status      | Size | Attached to |
+--------------------------------------+---------------------------+-------------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | downloading |   20 |             |
+--------------------------------------+---------------------------+-------------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack volume list
+--------------------------------------+---------------------------+-----------+------+-------------+
| ID                                   | Name                      | Status    | Size | Attached to |
+--------------------------------------+---------------------------+-----------+------+-------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | available |   20 |             |
+--------------------------------------+---------------------------+-----------+------+-------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server create \
  --flavor m1.small \
  --volume ubuntu-24-golden-test-vol \
  --network a374dd2e-853a-41eb-88ca-b5730143b548 \
  --security-group default \
  --key-name packer-build-key \
  ubuntu-24-golden-test-vm
More than one SecurityGroup exists with the name 'default'.
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack securityGroup list
openstack: 'securityGroup list' is not an openstack command. See 'openstack --help'.
Did you mean one of these?
  security group create
  security group delete
  security group list
  security group rule create
  security group rule delete
  security group rule list
  security group rule show
  security group set
  security group show
  security group unset
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack security group list
+--------------------------------------+-----------------+------------------------+----------------------------------+------+--------+
| ID                                   | Name            | Description            | Project                          | Tags | Shared |
+--------------------------------------+-----------------+------------------------+----------------------------------+------+--------+
| 488d0770-7c58-45fa-ae6e-69e7ee7a0476 | packer-build-sg | packer-build-sg        | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
| a930250a-f00d-4da3-99b7-cb727a78fc8e | default         | Default security group | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
| f20af708-65a7-4a7a-a4a7-899a97fd2406 | default         | Default security group | 74a530ca6d4142cbbdcf25dd6b640a81 | []   | False  |
+--------------------------------------+-----------------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack security group show a930250a-f00d-4da3-99b7-cb727a78fc8e
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                  |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-02-25T04:15:52Z                                                                                                                                                                   |
| description     | Default security group                                                                                                                                                                 |
| id              | a930250a-f00d-4da3-99b7-cb727a78fc8e                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                  |
| name            | default                                                                                                                                                                                |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                      |
| rules           | belongs_to_default_sg='True', created_at='2026-02-25T04:18:56Z', direction='ingress', ethertype='IPv4', id='13ae1f89-d0a7-4789-bb31-b0381b9c1ebc', normalized_cidr='0.0.0.0/0',        |
|                 | protocol='icmp', remote_ip_prefix='0.0.0.0/0', standard_attr_id='102', updated_at='2026-02-25T04:18:56Z'                                                                               |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='egress', ethertype='IPv6', id='1cc08382-9935-4268-8d8e-ef2272673118', standard_attr_id='100',              |
|                 | updated_at='2026-02-25T04:15:52Z'                                                                                                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='egress', ethertype='IPv4', id='44eb3743-a3a1-42dd-b0c7-73d92e5bf66e', standard_attr_id='99',               |
|                 | updated_at='2026-02-25T04:15:52Z'                                                                                                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:19:06Z', direction='ingress', ethertype='IPv4', id='aa0f2374-c19f-47b7-975a-7647f31e9e0d', normalized_cidr='0.0.0.0/0',        |
|                 | port_range_max='22', port_range_min='22', protocol='tcp', remote_ip_prefix='0.0.0.0/0', standard_attr_id='103', updated_at='2026-02-25T04:19:06Z'                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='ingress', ethertype='IPv4', id='bceeba9b-23c3-409f-a139-6b9099e09591',                                     |
|                 | remote_group_id='a930250a-f00d-4da3-99b7-cb727a78fc8e', standard_attr_id='101', updated_at='2026-02-25T04:15:52Z'                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='ingress', ethertype='IPv6', id='eca1134d-12ed-47d5-8a55-ec57e4132bf0',                                     |
|                 | remote_group_id='a930250a-f00d-4da3-99b7-cb727a78fc8e', standard_attr_id='98', updated_at='2026-02-25T04:15:52Z'                                                                       |
| stateful        | True                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                     |
| updated_at      | 2026-02-25T04:19:06Z                                                                                                                                                                   |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack security group show f20af708-65a7-4a7a-a4a7-899a97fd2406
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                  |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-02-25T04:22:34Z                                                                                                                                                                   |
| description     | Default security group                                                                                                                                                                 |
| id              | f20af708-65a7-4a7a-a4a7-899a97fd2406                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                  |
| name            | default                                                                                                                                                                                |
| project_id      | 74a530ca6d4142cbbdcf25dd6b640a81                                                                                                                                                       |
| revision_number | 1                                                                                                                                                                                      |
| rules           | belongs_to_default_sg='True', created_at='2026-02-25T04:22:34Z', direction='egress', ethertype='IPv4', id='0999214f-966a-488b-9874-6f0e6c389bb2', standard_attr_id='107',              |
|                 | updated_at='2026-02-25T04:22:34Z'                                                                                                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:22:34Z', direction='ingress', ethertype='IPv4', id='2c530846-e65f-4dc8-b546-9369365181f5',                                     |
|                 | remote_group_id='f20af708-65a7-4a7a-a4a7-899a97fd2406', standard_attr_id='109', updated_at='2026-02-25T04:22:34Z'                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:22:34Z', direction='egress', ethertype='IPv6', id='acd1d597-1aa2-4e29-8af8-0f0539988bfa', standard_attr_id='108',              |
|                 | updated_at='2026-02-25T04:22:34Z'                                                                                                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:22:34Z', direction='ingress', ethertype='IPv6', id='b5c65299-2848-4f15-84d1-fb0ec8b5d218',                                     |
|                 | remote_group_id='f20af708-65a7-4a7a-a4a7-899a97fd2406', standard_attr_id='106', updated_at='2026-02-25T04:22:34Z'                                                                      |
| stateful        | True                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                     |
| updated_at      | 2026-02-25T04:22:34Z                                                                                                                                                                   |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack security group delete f20af708-65a7-4a7a-a4a7-899a97fd2406
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack security group list
+--------------------------------------+-----------------+------------------------+----------------------------------+------+--------+
| ID                                   | Name            | Description            | Project                          | Tags | Shared |
+--------------------------------------+-----------------+------------------------+----------------------------------+------+--------+
| 488d0770-7c58-45fa-ae6e-69e7ee7a0476 | packer-build-sg | packer-build-sg        | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
| a930250a-f00d-4da3-99b7-cb727a78fc8e | default         | Default security group | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
+--------------------------------------+-----------------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server create   --flavor m1.small   --volume ubuntu-24-golden-test-vol   --network a374dd2e-853a-41eb-88ca-b5730143b548   --security-group default   --key-name packer-build-key   ubuntu-24-golden-test-vm
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                              |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ubuntu-24-golden-test-vm                                                                                                                                           |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-u696yvwo                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                |
| adminPass                           | dVXJSdua9KSu                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                               |
| created                             | 2026-03-10T18:12:54Z                                                                                                                                               |
| description                         | None                                                                                                                                                               |
| flavor                              | description=, disk='20', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.small', is_disabled=, is_public='True', location=, name='m1.small',              |
|                                     | original_name='m1.small', ram='2048', rxtx_factor=, swap='0', vcpus='1'                                                                                            |
| hostId                              | None                                                                                                                                                               |
| host_status                         | None                                                                                                                                                               |
| id                                  | 42a270e1-c738-46e4-ac88-78f4b1888114                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                           |
| key_name                            | packer-build-key                                                                                                                                                   |
| locked                              | None                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                               |
| name                                | ubuntu-24-golden-test-vm                                                                                                                                           |
| pinned_availability_zone            | None                                                                                                                                                               |
| progress                            | None                                                                                                                                                               |
| project_id                          | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                   |
| properties                          | None                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                    |
| security_groups                     | name='a930250a-f00d-4da3-99b7-cb727a78fc8e'                                                                                                                        |
| server_groups                       | None                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                              |
| tags                                |                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                               |
| updated                             | 2026-03-10T18:12:54Z                                                                                                                                               |
| user_id                             | 270824ef176044a2a8b64a8337e2f00a                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                    |
+-------------------------------------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
| ID                                   | Name                     | Status | Networks | Image                    | Flavor   |
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
| 42a270e1-c738-46e4-ac88-78f4b1888114 | ubuntu-24-golden-test-vm | BUILD  |          | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
| ID                                   | Name                     | Status | Networks | Image                    | Flavor   |
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
| 42a270e1-c738-46e4-ac88-78f4b1888114 | ubuntu-24-golden-test-vm | BUILD  |          | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack server list
+--------------------------------------+--------------------------+--------+-------------------+--------------------------+----------+
| ID                                   | Name                     | Status | Networks          | Image                    | Flavor   |
+--------------------------------------+--------------------------+--------+-------------------+--------------------------+----------+
| 42a270e1-c738-46e4-ac88-78f4b1888114 | ubuntu-24-golden-test-vm | ACTIVE | private=10.0.0.48 | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------+--------+-------------------+--------------------------+----------+
ubuntu@gelani-lab-1:~/image-factory/packer$ FIP=$(openstack floating ip create public -f value -c floating_ip_address)
openstack server add floating ip ubuntu-24-golden-test-vm "$FIP"
echo "$FIP"
172.24.4.105
ubuntu@gelani-lab-1:~/image-factory/packer$ ping 172.24.4.105
PING 172.24.4.105 (172.24.4.105) 56(84) bytes of data.
64 bytes from 172.24.4.105: icmp_seq=4 ttl=63 time=1.19 ms
^C
--- 172.24.4.105 ping statistics ---
7 packets transmitted, 1 received, 85.7143% packet loss, time 6093ms
rtt min/avg/max/mdev = 1.194/1.194/1.194/0.000 ms
ubuntu@gelani-lab-1:~/image-factory/packer$ ^C
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack security group show a930250a-f00d-4da3-99b7-cb727a78fc8e
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                  |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-02-25T04:15:52Z                                                                                                                                                                   |
| description     | Default security group                                                                                                                                                                 |
| id              | a930250a-f00d-4da3-99b7-cb727a78fc8e                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                  |
| name            | default                                                                                                                                                                                |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                      |
| rules           | belongs_to_default_sg='True', created_at='2026-02-25T04:18:56Z', direction='ingress', ethertype='IPv4', id='13ae1f89-d0a7-4789-bb31-b0381b9c1ebc', normalized_cidr='0.0.0.0/0',        |
|                 | protocol='icmp', remote_ip_prefix='0.0.0.0/0', standard_attr_id='102', updated_at='2026-02-25T04:18:56Z'                                                                               |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='egress', ethertype='IPv6', id='1cc08382-9935-4268-8d8e-ef2272673118', standard_attr_id='100',              |
|                 | updated_at='2026-02-25T04:15:52Z'                                                                                                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='egress', ethertype='IPv4', id='44eb3743-a3a1-42dd-b0c7-73d92e5bf66e', standard_attr_id='99',               |
|                 | updated_at='2026-02-25T04:15:52Z'                                                                                                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:19:06Z', direction='ingress', ethertype='IPv4', id='aa0f2374-c19f-47b7-975a-7647f31e9e0d', normalized_cidr='0.0.0.0/0',        |
|                 | port_range_max='22', port_range_min='22', protocol='tcp', remote_ip_prefix='0.0.0.0/0', standard_attr_id='103', updated_at='2026-02-25T04:19:06Z'                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='ingress', ethertype='IPv4', id='bceeba9b-23c3-409f-a139-6b9099e09591',                                     |
|                 | remote_group_id='a930250a-f00d-4da3-99b7-cb727a78fc8e', standard_attr_id='101', updated_at='2026-02-25T04:15:52Z'                                                                      |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='ingress', ethertype='IPv6', id='eca1134d-12ed-47d5-8a55-ec57e4132bf0',                                     |
|                 | remote_group_id='a930250a-f00d-4da3-99b7-cb727a78fc8e', standard_attr_id='98', updated_at='2026-02-25T04:15:52Z'                                                                       |
| stateful        | True                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                     |
| updated_at      | 2026-02-25T04:19:06Z                                                                                                                                                                   |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ ping 172.24.4.105
PING 172.24.4.105 (172.24.4.105) 56(84) bytes of data.
64 bytes from 172.24.4.105: icmp_seq=1 ttl=63 time=1.50 ms
64 bytes from 172.24.4.105: icmp_seq=2 ttl=63 time=0.842 ms
64 bytes from 172.24.4.105: icmp_seq=3 ttl=63 time=0.381 ms
64 bytes from 172.24.4.105: icmp_seq=4 ttl=63 time=0.369 ms
64 bytes from 172.24.4.105: icmp_seq=5 ttl=63 time=0.364 ms
64 bytes from 172.24.4.105: icmp_seq=6 ttl=63 time=0.306 ms
^C
--- 172.24.4.105 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5087ms
rtt min/avg/max/mdev = 0.306/0.626/1.498/0.428 ms
ubuntu@gelani-lab-1:~/image-factory/packer$ ping "$FIP"
ssh -i ~/.ssh/packer_build_key ubuntu@"$FIP"
PING 172.24.4.105 (172.24.4.105) 56(84) bytes of data.
64 bytes from 172.24.4.105: icmp_seq=1 ttl=63 time=0.882 ms
64 bytes from 172.24.4.105: icmp_seq=2 ttl=63 time=0.767 ms
64 bytes from 172.24.4.105: icmp_seq=3 ttl=63 time=0.482 ms
64 bytes from 172.24.4.105: icmp_seq=4 ttl=63 time=0.349 ms
64 bytes from 172.24.4.105: icmp_seq=5 ttl=63 time=0.476 ms
64 bytes from 172.24.4.105: icmp_seq=6 ttl=63 time=0.416 ms
^C
--- 172.24.4.105 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5129ms
rtt min/avg/max/mdev = 0.349/0.562/0.882/0.193 ms
The authenticity of host '172.24.4.105 (172.24.4.105)' can't be established.
ED25519 key fingerprint is SHA256:AkBIK03RiIc3hUVb+Lr32g2kYKzgnT+CHubK/Z5u9iA.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '172.24.4.105' (ED25519) to the list of known hosts.
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Mar 10 18:15:57 UTC 2026

  System load:  0.14              Processes:             97
  Usage of /:   9.7% of 18.33GB   Users logged in:       0
  Memory usage: 8%                IPv4 address for ens3: 10.0.0.48
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


ubuntu@ubuntu-24-golden-test-vm:~$ cat /etc/os-release
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
ubuntu@ubuntu-24-golden-test-vm:~$ uname -r
6.8.0-101-generic
ubuntu@ubuntu-24-golden-test-vm:~$ cloud-init status
status: done
ubuntu@ubuntu-24-golden-test-vm:~$ systemctl status ssh --no-pager
● ssh.service - OpenBSD Secure Shell server
     Loaded: loaded (/usr/lib/systemd/system/ssh.service; enabled; preset: enabled)
     Active: active (running) since Tue 2026-03-10 18:13:52 UTC; 2min 36s ago
TriggeredBy: ● ssh.socket
       Docs: man:sshd(8)
             man:sshd_config(5)
    Process: 730 ExecStartPre=/usr/sbin/sshd -t (code=exited, status=0/SUCCESS)
   Main PID: 747 (sshd)
      Tasks: 1 (limit: 2316)
     Memory: 4.1M (peak: 4.8M)
        CPU: 71ms
     CGroup: /system.slice/ssh.service
             └─747 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Mar 10 18:13:51 ubuntu-24-golden-test-vm systemd[1]: Starting ssh.service - OpenBSD Secure Shell server...
Mar 10 18:13:52 ubuntu-24-golden-test-vm sshd[747]: Server listening on 0.0.0.0 port 22.
Mar 10 18:13:52 ubuntu-24-golden-test-vm sshd[747]: Server listening on :: port 22.
Mar 10 18:13:52 ubuntu-24-golden-test-vm systemd[1]: Started ssh.service - OpenBSD Secure Shell server.
Mar 10 18:15:57 ubuntu-24-golden-test-vm sshd[934]: Accepted publickey for ubuntu from 172.24.4.1 port 55092 ssh2: ED25519 SHA256:wruMahUMNJ1x5DN1f12oUWUDAKPO42Hjw4KAqiSDTVM
Mar 10 18:15:57 ubuntu-24-golden-test-vm sshd[934]: pam_unix(sshd:session): session opened for user ubuntu(uid=1000) by ubuntu(uid=0)
ubuntu@ubuntu-24-golden-test-vm:~$ systemctl status qemu-guest-agent --no-pager
○ qemu-guest-agent.service - QEMU Guest Agent
     Loaded: loaded (/usr/lib/systemd/system/qemu-guest-agent.service; static)
     Active: inactive (dead)
ubuntu@ubuntu-24-golden-test-vm:~$ apt list --upgradable
Listing... Done
ubuntu@ubuntu-24-golden-test-vm:~$ 
ubuntu@ubuntu-24-golden-test-vm:~$ exit
logout
Connection to 172.24.4.105 closed.
ubuntu@gelani-lab-1:~/image-factory/packer$ 
```
**achivement: initialization and validation paker**
* Packer built a new image automatically
    * the image was stored in Glance
    * the image exists in Ceph images pool
    * created a Ceph-backed boot volume from that image
    * launched a VM from that volume
    * the VM booted cleanly
    * SSH works
    * cloud-init finished
    * 0 updates pending
    * the guest is Ubuntu 24.04.4 LTS
    * OS automation project v1 is working

***from outputs, the produced image is genuinely good:***
  * PRETTY_NAME="Ubuntu 24.04.4 LTS"
  * cloud-init status: done
  * ssh.service is enabled and running
  *  apt list --upgradable shows nothing
**That means the image is not just created — it is actually usable and updated**

### One small thing to improve
***systemctl status qemu-guest-agent --no-pager***

***Active: inactive (dead)***

***Loaded: ... static***

**It is not a failure for this project, but for a polished golden image the guest agent to be active when possible,later the provision script will be adjusted to start it explicitly instead of only trying to enable it**

#### Before changing the build, test this inside the VM:
```
ubuntu@gelani-lab-1:~/image-factory/packer$ ssh -i ~/.ssh/packer_build_key ubuntu@"$FIP"
Welcome to Ubuntu 24.04.4 LTS (GNU/Linux 6.8.0-101-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Tue Mar 10 19:14:06 UTC 2026

  System load:  0.0               Processes:             95
  Usage of /:   9.8% of 18.33GB   Users logged in:       0
  Memory usage: 8%                IPv4 address for ens3: 10.0.0.48
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


Last login: Tue Mar 10 18:15:58 2026 from 172.24.4.1
ubuntu@ubuntu-24-golden-test-vm:~$ sudo systemctl start qemu-guest-agent
sudo systemctl status qemu-guest-agent --no-pager
A dependency job for qemu-guest-agent.service failed. See 'journalctl -xe' for details.
○ qemu-guest-agent.service - QEMU Guest Agent
     Loaded: loaded (/usr/lib/systemd/system/qemu-guest-agent.service; static)
     Active: inactive (dead)

Mar 10 19:15:39 ubuntu-24-golden-test-vm systemd[1]: Dependency failed for qemu-guest-agent.service - QEMU Guest Agent.
Mar 10 19:15:39 ubuntu-24-golden-test-vm systemd[1]: qemu-guest-agent.service: Job qemu-guest-agent.service/start failed with result 'dependency'.
ubuntu@ubuntu-24-golden-test-vm:~$ 
ubuntu@ubuntu-24-golden-test-vm:~$ exit
logout
Connection to 172.24.4.105 closed.
ubuntu@gelani-lab-1:~/image-factory/packer$ 

```
#### saving the proof of the work and achivement
```
ubuntu@gelani-lab-1:~/image-factory/packer$ {
  echo "=== IMAGES ==="
  openstack image list
  echo
  echo "=== IMAGE DETAILS ==="
  openstack image show ca73743e-149c-4999-89fe-87fd7174515d
  echo
  echo "=== VOLUMES ==="
  openstack volume list
  echo
  echo "=== SERVERS ==="
  openstack server list
  echo
  echo "=== CEPH IMAGES POOL ==="
  rbd ls -p images
  echo
  echo "=== CEPH VOLUME POOL ==="
  rbd ls -p volume
} | tee ~/image-factory/logs/ubuntu-24-v1-success.txt
=== IMAGES ===
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
| ca73743e-149c-4999-89fe-87fd7174515d | ubuntu-24.04-2026-03-10-1724         | active |
| be415f83-0c94-4c5e-b351-416fbe719f45 | ubuntu-24.04-base                    | active |
+--------------------------------------+--------------------------------------+--------+

=== IMAGE DETAILS ===
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | 3a8bb168243910a4c36405b22b1225af                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| created_at       | 2026-03-10T17:44:02Z                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| file             | /v2/images/ca73743e-149c-4999-89fe-87fd7174515d/file                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| id               | ca73743e-149c-4999-89fe-87fd7174515d                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| min_disk         | 20                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| min_ram          | 0                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| name             | ubuntu-24.04-2026-03-10-1724                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| properties       | base_image_ref='be415f83-0c94-4c5e-b351-416fbe719f45', boot_roles='admin,member,manager,reader', build_method='packer', hw_cdrom_bus='ide', hw_disk_bus='virtio', hw_machine_type='pc', hw_video_model='virtio', hw_vif_model='virtio', image_location='snapshot', image_state='available', image_type='image', instance_uuid='3ab9ed71-f7a3-4711-b902-990061a9605f', os_distro='ubuntu', os_hash_algo='sha512', os_hash_value='d63a617bff987d4ea1fcb4c5d38eddb8c8569ad6ce091f42be13de76d7e8b597cc320ef0398cc70e4e7210d888eb2641e8b574bcbac986a849d3420d81d03157', os_hidden='False', os_version='24.04', owner_project_name='admin', owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256='', owner_user_name='admin', purpose='golden-image', user_id='270824ef176044a2a8b64a8337e2f00a' |
| protected        | False                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| size             | 2571763712                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| status           | active                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| tags             | 24.04, automated, golden, ubuntu                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| updated_at       | 2026-03-10T17:47:18Z                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| virtual_size     | 21474836480                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| visibility       | public                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

=== VOLUMES ===
+--------------------------------------+---------------------------+--------+------+---------------------------------------------------+
| ID                                   | Name                      | Status | Size | Attached to                                       |
+--------------------------------------+---------------------------+--------+------+---------------------------------------------------+
| 25d106dd-cab6-4ad2-a1c7-1751fcd2e84c | ubuntu-24-golden-test-vol | in-use |   20 | Attached to ubuntu-24-golden-test-vm on /dev/vda  |
+--------------------------------------+---------------------------+--------+------+---------------------------------------------------+

=== SERVERS ===
+--------------------------------------+--------------------------+--------+---------------------------------+--------------------------+----------+
| ID                                   | Name                     | Status | Networks                        | Image                    | Flavor   |
+--------------------------------------+--------------------------+--------+---------------------------------+--------------------------+----------+
| 42a270e1-c738-46e4-ac88-78f4b1888114 | ubuntu-24-golden-test-vm | ACTIVE | private=10.0.0.48, 172.24.4.105 | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------+--------+---------------------------------+--------------------------+----------+

=== CEPH IMAGES POOL ===
151fa56a-92e5-4a05-82bb-f4472394d3d9
5a2209bd-847e-4948-87e2-e66b1109f4eb
8c2f2ee0-458e-4370-8cfa-e5e145402142
9bd72412-c33b-49a4-8917-396c9dd3741f
a05bfffb-5b9a-468e-b9a7-45e541d6e1c7
b522ceff-bea1-465d-9dbb-ebb567769ef4
b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb
be415f83-0c94-4c5e-b351-416fbe719f45
c218d57e-3393-4283-8a6c-fe74551e9ea2
ca73743e-149c-4999-89fe-87fd7174515d
ea3b9ae8-c81a-4198-a2a3-4936599f84c7
f339488c-2c82-4e7d-ab70-d57a4d2c1ade
fbb9bfc0-3dc0-4f20-b230-e046473fe629

=== CEPH VOLUME POOL ===
volume-25d106dd-cab6-4ad2-a1c7-1751fcd2e84c
ubuntu@gelani-lab-1:~/image-factory/packer$
```
# Testing the error free doc to initialiaze and validate packer
**Delete everything and rebuild again**
## Deleting everything build:
```
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.23
ubuntu@192.168.95.23's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-171-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Wed Mar 11 07:10:44 UTC 2026

  System load:  0.23               Processes:             412
  Usage of /:   50.2% of 96.73GB   Users logged in:       0
  Memory usage: 47%                IPv4 address for ens3: 192.168.95.23
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

18 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

New release '24.04.4 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Wed Mar 11 05:31:02 2026 from 192.168.95.86
ubuntu@gelani-lab-1:~$ cd /opt/stack/devstack
source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server delete ubuntu-24-golden-test-vm
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
| ID                                   | Name                     | Status | Networks | Image                    | Flavor   |
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
| 42a270e1-c738-46e4-ac88-78f4b1888114 | ubuntu-24-golden-test-vm | ACTIVE |          | N/A (booted from volume) | m1.small |
+--------------------------------------+--------------------------+--------+----------+--------------------------+----------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete ubuntu-24-golden-test-vol
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list | grep ubuntu-24.04
| ca73743e-149c-4999-89fe-87fd7174515d | ubuntu-24.04-2026-03-10-1724         | active |
| be415f83-0c94-4c5e-b351-416fbe719f45 | ubuntu-24.04-base                    | active |
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image delete ubuntu-24.04-base
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image delete ubuntu-24.04-2026-03-10-1724
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list | grep ubuntu-24.04
ubuntu@gelani-lab-1:/opt/stack/devstack$ rbd ls -p images
151fa56a-92e5-4a05-82bb-f4472394d3d9
5a2209bd-847e-4948-87e2-e66b1109f4eb
8c2f2ee0-458e-4370-8cfa-e5e145402142
9bd72412-c33b-49a4-8917-396c9dd3741f
a05bfffb-5b9a-468e-b9a7-45e541d6e1c7
b522ceff-bea1-465d-9dbb-ebb567769ef4
b5a9da1c-2fd0-404d-9e39-e7ea9a50acfb
c218d57e-3393-4283-8a6c-fe74551e9ea2
ea3b9ae8-c81a-4198-a2a3-4936599f84c7
f339488c-2c82-4e7d-ab70-d57a4d2c1ade
fbb9bfc0-3dc0-4f20-b230-e046473fe629
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list
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
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list --all-projects -f value -c ID | xargs -r -n1 openstack image delete
usage: openstack image list [-h] [-f {csv,json,table,value,yaml}] [-c COLUMN]
                            [--quote {all,minimal,none,nonnumeric}]
                            [--noindent] [--max-width <integer>] [--fit-width]
                            [--print-empty] [--sort-column SORT_COLUMN]
                            [--sort-ascending | --sort-descending]
                            [--public | --private | --community | --shared | --all]
                            [--property <key=value>] [--name <name>]
                            [--status <status>]
                            [--member-status <member-status>]
                            [--project <project>]
                            [--project-domain <project-domain>] [--tag <tag>]
                            [--hidden] [--long] [--sort <key>[:<direction>]]
                            [--limit <limit>] [--marker <marker>]
openstack image list: error: unrecognized arguments: --all-projects
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list -f value -c ID | xargs -r -n1 openstack image delete
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list

ubuntu@gelani-lab-1:/opt/stack/devstack$ rbd ls -p images
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack security group delete packer-build-sg
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack keypair delete packer-build-key
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack keypair list
openstack security group list

+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| ID                                   | Name    | Description            | Project                          | Tags | Shared |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| 8a3c0ccd-fdbc-414e-86a7-390be42a231e | default | Default security group | 74a530ca6d4142cbbdcf25dd6b640a81 | []   | False  |
| a930250a-f00d-4da3-99b7-cb727a78fc8e | default | Default security group | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack security group show 8a3c0ccd-fdbc-414e-86a7-390be42a231e
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-10T18:13:37Z                                                                                                                                                                                                   |
| description     | Default security group                                                                                                                                                                                                 |
| id              | 8a3c0ccd-fdbc-414e-86a7-390be42a231e                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | default                                                                                                                                                                                                                |
| project_id      | 74a530ca6d4142cbbdcf25dd6b640a81                                                                                                                                                                                       |
| revision_number | 1                                                                                                                                                                                                                      |
| rules           | belongs_to_default_sg='True', created_at='2026-03-10T18:13:37Z', direction='egress', ethertype='IPv6', id='28153411-0a4f-4dd8-af46-2b6b18030592', standard_attr_id='158', updated_at='2026-03-10T18:13:37Z'            |
|                 | belongs_to_default_sg='True', created_at='2026-03-10T18:13:37Z', direction='egress', ethertype='IPv4', id='5559b2f0-e35e-4acd-b5d7-faddd6b82ce7', standard_attr_id='157', updated_at='2026-03-10T18:13:37Z'            |
|                 | belongs_to_default_sg='True', created_at='2026-03-10T18:13:37Z', direction='ingress', ethertype='IPv4', id='a24754b8-2e4f-4a53-b06b-b66bc47ca882', remote_group_id='8a3c0ccd-fdbc-414e-86a7-390be42a231e',             |
|                 | standard_attr_id='159', updated_at='2026-03-10T18:13:37Z'                                                                                                                                                              |
|                 | belongs_to_default_sg='True', created_at='2026-03-10T18:13:37Z', direction='ingress', ethertype='IPv6', id='f91c14da-647d-438e-b4c1-2348d6b3d84a', remote_group_id='8a3c0ccd-fdbc-414e-86a7-390be42a231e',             |
|                 | standard_attr_id='156', updated_at='2026-03-10T18:13:37Z'                                                                                                                                                              |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-03-10T18:13:37Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack security group show a930250a-f00d-4da3-99b7-cb727a78fc8e
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-02-25T04:15:52Z                                                                                                                                                                                                   |
| description     | Default security group                                                                                                                                                                                                 |
| id              | a930250a-f00d-4da3-99b7-cb727a78fc8e                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | default                                                                                                                                                                                                                |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                                                      |
| rules           | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='ingress', ethertype='IPv6', id='eca1134d-12ed-47d5-8a55-ec57e4132bf0', remote_group_id='a930250a-f00d-4da3-99b7-cb727a78fc8e',             |
|                 | standard_attr_id='98', updated_at='2026-02-25T04:15:52Z'                                                                                                                                                               |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='ingress', ethertype='IPv4', id='bceeba9b-23c3-409f-a139-6b9099e09591', remote_group_id='a930250a-f00d-4da3-99b7-cb727a78fc8e',             |
|                 | standard_attr_id='101', updated_at='2026-02-25T04:15:52Z'                                                                                                                                                              |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:19:06Z', direction='ingress', ethertype='IPv4', id='aa0f2374-c19f-47b7-975a-7647f31e9e0d', normalized_cidr='0.0.0.0/0', port_range_max='22',                   |
|                 | port_range_min='22', protocol='tcp', remote_ip_prefix='0.0.0.0/0', standard_attr_id='103', updated_at='2026-02-25T04:19:06Z'                                                                                           |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='egress', ethertype='IPv4', id='44eb3743-a3a1-42dd-b0c7-73d92e5bf66e', standard_attr_id='99', updated_at='2026-02-25T04:15:52Z'             |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:15:52Z', direction='egress', ethertype='IPv6', id='1cc08382-9935-4268-8d8e-ef2272673118', standard_attr_id='100', updated_at='2026-02-25T04:15:52Z'            |
|                 | belongs_to_default_sg='True', created_at='2026-02-25T04:18:56Z', direction='ingress', ethertype='IPv4', id='13ae1f89-d0a7-4789-bb31-b0381b9c1ebc', normalized_cidr='0.0.0.0/0', protocol='icmp',                       |
|                 | remote_ip_prefix='0.0.0.0/0', standard_attr_id='102', updated_at='2026-02-25T04:18:56Z'                                                                                                                                |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-02-25T04:19:06Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack security group delete 8a3c0ccd-fdbc-414e-86a7-390be42a231e
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack security group list
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| ID                                   | Name    | Description            | Project                          | Tags | Shared |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| a930250a-f00d-4da3-99b7-cb727a78fc8e | default | Default security group | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ rm -rf ~/image-factory
ubuntu@gelani-lab-1:/opt/stack/devstack$ rm -rf ~/images
ubuntu@gelani-lab-1:/opt/stack/devstack$ rm -f ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
ubuntu@gelani-lab-1:/opt/stack/devstack$ ls -la ~/ | grep image
ls -la ~/.ssh/
drwxrwxr-x 2 ubuntu ubuntu  4096 Mar 10 11:42 raw-image
total 28
drwx------ 2 ubuntu ubuntu 4096 Mar 11 07:19 .
drwxr-x--- 9 ubuntu ubuntu 4096 Mar 11 07:19 ..
-rw------- 1 ubuntu ubuntu  399 Feb 18 04:44 authorized_keys
-rw------- 1 ubuntu ubuntu 6738 Mar 10 18:15 known_hosts
-rw------- 1 ubuntu ubuntu 5902 Mar 10 18:15 known_hosts.old
ubuntu@gelani-lab-1:/opt/stack/devstack$ echo "=== OpenStack Images ===" && openstack image list | grep ubuntu-24.04
echo "=== OpenStack Keypairs ===" && openstack keypair list | grep packer
echo "=== OpenStack Security Groups ===" && openstack security group list | grep packer
echo "=== Servers ===" && openstack server list | grep ubuntu-24
echo "=== Volumes ===" && openstack volume list | grep ubuntu-24
echo "=== Local Directories ===" && ls -d ~/image-factory ~/images 2>/dev/null || echo "Directories deleted"
=== OpenStack Images ===
=== OpenStack Keypairs ===
=== OpenStack Security Groups ===
=== Servers ===
=== Volumes ===
=== Local Directories ===
Directories deleted
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
```
## Now rebuild:
```
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd ~
ubuntu@gelani-lab-1:~$ cd /opt/stack/devstack
source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output,logs}
tree ~/image-factory
/home/ubuntu/image-factory
├── cloud-init
├── logs
├── output
├── packer
└── scripts

5 directories, 0 files
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo apt update
sudo apt install -y unzip qemu-utils jq curl wget
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]       
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease                
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [3,285 kB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1,256 kB]
Fetched 4,925 kB in 4s (1,227 kB/s)                        
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
curl is already the newest version (7.81.0-1ubuntu1.22).
jq is already the newest version (1.6-2.1ubuntu3.1).
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.28).
unzip is already the newest version (6.0-26ubuntu3.2).
wget is already the newest version (1.21.2-2ubuntu1.1).
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
ubuntu@gelani-lab-1:/opt/stack/devstack$ qemu-img --version
jq --version
curl --version | head -n 1
qemu-img version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.28)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
jq-1.6
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /tmp
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
packer version
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ mkdir -p ~/images/base-image
cd ~/images/base-image
pwd
/home/ubuntu/images/base-image
ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-11 07:24:11--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629380096 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                  100%[========================================================================================================================================>] 600.22M  8.12MB/s    in 53s     

2026-03-11 07:25:06 (11.2 MB/s) - ‘noble.img’ saved [629380096/629380096]

ubuntu@gelani-lab-1:~/images/base-image$ ls -lh noble.img
qemu-img info noble.img
-rw-rw-r-- 1 ubuntu ubuntu 601M Mar  7 13:14 noble.img
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
| checksum         | feb5056f9206c4baf68b0b90b0f0432f                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                  |
| created_at       | 2026-03-11T07:25:30Z                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                 |
| file             | /v2/images/a8ea282c-531c-4e72-9153-8ce608b70a98/file                                                                                                                                                                  |
| id               | a8ea282c-531c-4e72-9153-8ce608b70a98                                                                                                                                                                                  |
| min_disk         | 0                                                                                                                                                                                                                     |
| min_ram          | 0                                                                                                                                                                                                                     |
| name             | ubuntu-24.04-base                                                                                                                                                                                                     |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                      |
| properties       | os_hash_algo='sha512', os_hash_value='5e703cc3191e04f0870f54db32ac5ba823b15c1c0eb76e2612c0736586f70d61854fea1bec412c71ebe49175b84913cae047e1baa06dc6c1fb8ea33a9284d2c1', os_hidden='False',                           |
|                  | owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256=''                                                                                    |
| protected        | False                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                     |
| size             | 629380096                                                                                                                                                                                                             |
| status           | active                                                                                                                                                                                                                |
| tags             |                                                                                                                                                                                                                       |
| updated_at       | 2026-03-11T07:25:41Z                                                                                                                                                                                                  |
| virtual_size     | 3758096384                                                                                                                                                                                                            |
| visibility       | public                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image show ubuntu-24.04-base -c id -c name -c status -c disk_format -c size
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| disk_format | qcow2                                |
| id          | a8ea282c-531c-4e72-9153-8ce608b70a98 |
| name        | ubuntu-24.04-base                    |
| size        | 629380096                            |
| status      | active                               |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ rbd ls -p images
a8ea282c-531c-4e72-9153-8ce608b70a98
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group list | grep packer-build-sg
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group create packer-build-sg
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                         |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-11T07:26:16Z                                                                                                                                                          |
| description     | packer-build-sg                                                                                                                                                               |
| id              | 6bdf959c-142d-4ad8-bf3a-86ae7f956ccf                                                                                                                                          |
| is_shared       | False                                                                                                                                                                         |
| name            | packer-build-sg                                                                                                                                                               |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                              |
| revision_number | 1                                                                                                                                                                             |
| rules           | created_at='2026-03-11T07:26:16Z', direction='egress', ethertype='IPv4', id='63c2243d-8b3f-4cbf-aeaa-9d52e9b4c056', standard_attr_id='161', updated_at='2026-03-11T07:26:16Z' |
|                 | created_at='2026-03-11T07:26:16Z', direction='egress', ethertype='IPv6', id='e6679923-703d-4e4f-92a7-5e61e52a469d', standard_attr_id='162', updated_at='2026-03-11T07:26:16Z' |
| stateful        | True                                                                                                                                                                          |
| tags            | []                                                                                                                                                                            |
| updated_at      | 2026-03-11T07:26:16Z                                                                                                                                                          |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group rule create --proto tcp --dst-port 22 --ingress packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-11T07:26:23Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 0a270a2d-8b39-41d1-adb3-6cff99c466e9 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | 6bdf959c-142d-4ad8-bf3a-86ae7f956ccf |
| updated_at              | 2026-03-11T07:26:23Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group rule create --proto icmp --ingress packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-11T07:26:28Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 36a02a68-ca9e-4657-b52e-c4fc0ac62b67 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | 6bdf959c-142d-4ad8-bf3a-86ae7f956ccf |
| updated_at              | 2026-03-11T07:26:28Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group show packer-build-sg
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-11T07:26:16Z                                                                                                                                                                                                   |
| description     | packer-build-sg                                                                                                                                                                                                        |
| id              | 6bdf959c-142d-4ad8-bf3a-86ae7f956ccf                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | packer-build-sg                                                                                                                                                                                                        |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                                                      |
| rules           | created_at='2026-03-11T07:26:23Z', direction='ingress', ethertype='IPv4', id='0a270a2d-8b39-41d1-adb3-6cff99c466e9', normalized_cidr='0.0.0.0/0', port_range_max='22', port_range_min='22', protocol='tcp',            |
|                 | remote_ip_prefix='0.0.0.0/0', standard_attr_id='163', updated_at='2026-03-11T07:26:23Z'                                                                                                                                |
|                 | created_at='2026-03-11T07:26:28Z', direction='ingress', ethertype='IPv4', id='36a02a68-ca9e-4657-b52e-c4fc0ac62b67', normalized_cidr='0.0.0.0/0', protocol='icmp', remote_ip_prefix='0.0.0.0/0',                       |
|                 | standard_attr_id='164', updated_at='2026-03-11T07:26:28Z'                                                                                                                                                              |
|                 | created_at='2026-03-11T07:26:16Z', direction='egress', ethertype='IPv4', id='63c2243d-8b3f-4cbf-aeaa-9d52e9b4c056', standard_attr_id='161', updated_at='2026-03-11T07:26:16Z'                                          |
|                 | created_at='2026-03-11T07:26:16Z', direction='egress', ethertype='IPv6', id='e6679923-703d-4e4f-92a7-5e61e52a469d', standard_attr_id='162', updated_at='2026-03-11T07:26:16Z'                                          |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-03-11T07:26:28Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ mkdir -p ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:yU7uAN7tgdDxofn0OJ0Bl0NOd9PLhTX9priTaZVDCs0 ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
|          o . o=o|
|         + o ...=|
|      . o =o  . +|
|     . * =..E .oo|
|    o + S .. + + |
|   . + O + oo =  |
|    . + O +  = . |
|       + o  *    |
|        o  . .   |
+----[SHA256]-----+
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
-rw------- 1 ubuntu ubuntu 411 Mar 11 07:26 /home/ubuntu/.ssh/packer_build_key
-rw-r--r-- 1 ubuntu ubuntu 101 Mar 11 07:26 /home/ubuntu/.ssh/packer_build_key.pub
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair list | grep packer-build-key
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair create --public-key ~/.ssh/packer_build_key.pub packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | None                                            |
| fingerprint | 25:18:54:ed:b5:8c:b7:5e:df:ff:a7:1c:84:84:cc:d0 |
| id          | packer-build-key                                |
| is_deleted  | None                                            |
| name        | packer-build-key                                |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair show packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | 2026-03-11T07:27:08.000000                      |
| fingerprint | 25:18:54:ed:b5:8c:b7:5e:df:ff:a7:1c:84:84:cc:d0 |
| id          | packer-build-key                                |
| is_deleted  | False                                           |
| name        | packer-build-key                                |
| private_key | None                                            |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/provision-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 351 Mar 11 07:27 /home/ubuntu/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/cleanup-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 316 Mar 11 07:27 /home/ubuntu/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/provision-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y dist-upgrade

apt-get install -y \
  qemu-guest-agent \
  cloud-init \
  curl \
  wget \
  vim \
  net-tools \
  ca-certificates

systemctl enable qemu-guest-agent || true
systemctl enable ssh || true

apt-get -y autoremove --purge
apt-get clean
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/cleanup-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

cloud-init clean --logs || true

truncate -s 0 /etc/machine-id || true
rm -f /var/lib/dbus/machine-id || true
ln -sf /etc/machine-id /var/lib/dbus/machine-id || true

rm -rf /tmp/* /var/tmp/* || true
find /var/log -type f -exec truncate -s 0 {} \; || true

apt-get clean
sync
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "<add-your-network-id>"
}
source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-HHmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "<add-your-network-id>"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/provision-ubuntu.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/cleanup-ubuntu.sh"
  }
}
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/image-factory/packer
packer init .
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer validate -var "network_name=private" ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer build -var "network_name=private" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: a8ea282c-531c-4e72-9153-8ce608b70a98
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}
==> openstack.ubuntu2404: Terminating the source server:  ...
==> openstack.ubuntu2404: Error terminating server, may still be around: Resource not found
Build 'openstack.ubuntu2404' errored after 127 milliseconds 797 microseconds: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Wait completed after 127 milliseconds 911 microseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Builds finished but no artifacts were created.
```
**Failed the copy pest attempt**
**The core issue is  simple** 
***this command : packer build -var "network_name=a374dd2e-853a-41eb-88ca-b5730143b548" ubuntu-24.04.pkr.hcl***
## again clean
```
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack image delete ubuntu-24.04-base
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack keypair delete packer-build-key && openstack security group delete packer-build-sg && rm -f ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub && rm -rf ~/image-factory
rm -rf ~/images
ubuntu@gelani-lab-1:~/image-factory/packer$ sudo rm -f /usr/local/bin/packer
rm -f /tmp/packer.zip /tmp/LICENSE.txt /tmp/packer
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~
ubuntu@gelani-lab-1:~$ rm -f /tmp/packer.zip /tmp/LICENSE.txt /tmp/packer
ubuntu@gelani-lab-1:~$ openstack image list | grep ubuntu-24.04-base
openstack keypair list | grep packer-build-key
openstack security group list | grep packer-build-sg
ls ~/image-factory 2>/dev/null || echo "Deleted"
ls ~/images 2>/dev/null || echo "Deleted"
Deleted
Deleted
ubuntu@gelani-lab-1:~$ 
```
## Now again rebuild:
```
ubuntu@gelani-lab-1:~$ cd /opt/stack/devstack
source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output,logs}
tree ~/image-factory
/home/ubuntu/image-factory
├── cloud-init
├── logs
├── output
├── packer
└── scripts

5 directories, 0 files
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo apt update
sudo apt install -y unzip qemu-utils jq curl wget
Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease                
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease     
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
curl is already the newest version (7.81.0-1ubuntu1.22).
jq is already the newest version (1.6-2.1ubuntu3.1).
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.28).
unzip is already the newest version (6.0-26ubuntu3.2).
wget is already the newest version (1.21.2-2ubuntu1.1).
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
ubuntu@gelani-lab-1:/opt/stack/devstack$ qemu-img --version
jq --version
curl --version | head -n 1
qemu-img version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.28)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
jq-1.6
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /tmp
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
packer version
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ mkdir -p ~/images/base-image
cd ~/images/base-image
pwd
/home/ubuntu/images/base-image
ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-11 08:53:01--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629380096 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                  100%[========================================================================================================================================>] 600.22M  14.4MB/s    in 57s     

2026-03-11 08:53:59 (10.5 MB/s) - ‘noble.img’ saved [629380096/629380096]

ubuntu@gelani-lab-1:~/images/base-image$ ls -lh noble.img
qemu-img info noble.img
-rw-rw-r-- 1 ubuntu ubuntu 601M Mar  7 13:14 noble.img
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
| checksum         | feb5056f9206c4baf68b0b90b0f0432f                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                  |
| created_at       | 2026-03-11T08:54:32Z                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                 |
| file             | /v2/images/819b7582-aa1e-4f3f-a03b-edafbae2c9ef/file                                                                                                                                                                  |
| id               | 819b7582-aa1e-4f3f-a03b-edafbae2c9ef                                                                                                                                                                                  |
| min_disk         | 0                                                                                                                                                                                                                     |
| min_ram          | 0                                                                                                                                                                                                                     |
| name             | ubuntu-24.04-base                                                                                                                                                                                                     |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                      |
| properties       | os_hash_algo='sha512', os_hash_value='5e703cc3191e04f0870f54db32ac5ba823b15c1c0eb76e2612c0736586f70d61854fea1bec412c71ebe49175b84913cae047e1baa06dc6c1fb8ea33a9284d2c1', os_hidden='False',                           |
|                  | owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256=''                                                                                    |
| protected        | False                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                     |
| size             | 629380096                                                                                                                                                                                                             |
| status           | active                                                                                                                                                                                                                |
| tags             |                                                                                                                                                                                                                       |
| updated_at       | 2026-03-11T08:54:42Z                                                                                                                                                                                                  |
| virtual_size     | 3758096384                                                                                                                                                                                                            |
| visibility       | public                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image show ubuntu-24.04-base -c id -c name -c status -c disk_format -c size
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| disk_format | qcow2                                |
| id          | 819b7582-aa1e-4f3f-a03b-edafbae2c9ef |
| name        | ubuntu-24.04-base                    |
| size        | 629380096                            |
| status      | active                               |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ rbd ls -p images
819b7582-aa1e-4f3f-a03b-edafbae2c9ef
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group list | grep packer-build-sg
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group create packer-build-sg
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                         |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-11T08:55:06Z                                                                                                                                                          |
| description     | packer-build-sg                                                                                                                                                               |
| id              | c152fa14-982c-4b3a-8df0-019b0deacbdb                                                                                                                                          |
| is_shared       | False                                                                                                                                                                         |
| name            | packer-build-sg                                                                                                                                                               |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                              |
| revision_number | 1                                                                                                                                                                             |
| rules           | created_at='2026-03-11T08:55:06Z', direction='egress', ethertype='IPv4', id='b91c9a93-ab12-4f34-9f7f-4f725807fa60', standard_attr_id='166', updated_at='2026-03-11T08:55:06Z' |
|                 | created_at='2026-03-11T08:55:06Z', direction='egress', ethertype='IPv6', id='cb8fbc36-2f5d-4e23-85f9-6738b01660e6', standard_attr_id='167', updated_at='2026-03-11T08:55:06Z' |
| stateful        | True                                                                                                                                                                          |
| tags            | []                                                                                                                                                                            |
| updated_at      | 2026-03-11T08:55:06Z                                                                                                                                                          |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group rule create --proto tcp --dst-port 22 packer-build-sg && openstack security group rule create --proto icmp packer-build-sg
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-11T08:55:19Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | a4bcf32f-e22d-4fbe-8470-af172957e9e5 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | c152fa14-982c-4b3a-8df0-019b0deacbdb |
| updated_at              | 2026-03-11T08:55:19Z                 |
+-------------------------+--------------------------------------+
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-11T08:55:22Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 8dd371cc-a271-47f9-88f5-4883bc3c6d68 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | c152fa14-982c-4b3a-8df0-019b0deacbdb |
| updated_at              | 2026-03-11T08:55:22Z                 |
+-------------------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group show packer-build-sg
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-11T08:55:06Z                                                                                                                                                                                                   |
| description     | packer-build-sg                                                                                                                                                                                                        |
| id              | c152fa14-982c-4b3a-8df0-019b0deacbdb                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | packer-build-sg                                                                                                                                                                                                        |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                                                      |
| rules           | created_at='2026-03-11T08:55:22Z', direction='ingress', ethertype='IPv4', id='8dd371cc-a271-47f9-88f5-4883bc3c6d68', normalized_cidr='0.0.0.0/0', protocol='icmp', remote_ip_prefix='0.0.0.0/0',                       |
|                 | standard_attr_id='169', updated_at='2026-03-11T08:55:22Z'                                                                                                                                                              |
|                 | created_at='2026-03-11T08:55:19Z', direction='ingress', ethertype='IPv4', id='a4bcf32f-e22d-4fbe-8470-af172957e9e5', normalized_cidr='0.0.0.0/0', port_range_max='22', port_range_min='22', protocol='tcp',            |
|                 | remote_ip_prefix='0.0.0.0/0', standard_attr_id='168', updated_at='2026-03-11T08:55:19Z'                                                                                                                                |
|                 | created_at='2026-03-11T08:55:06Z', direction='egress', ethertype='IPv4', id='b91c9a93-ab12-4f34-9f7f-4f725807fa60', standard_attr_id='166', updated_at='2026-03-11T08:55:06Z'                                          |
|                 | created_at='2026-03-11T08:55:06Z', direction='egress', ethertype='IPv6', id='cb8fbc36-2f5d-4e23-85f9-6738b01660e6', standard_attr_id='167', updated_at='2026-03-11T08:55:06Z'                                          |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-03-11T08:55:22Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ mkdir -p ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:66w2kcAWSOppjK07KyoQzyNGntNemEk5ihSuMoBF3wk ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
| oo.E            |
| oo..o .         |
|+...o.o          |
|B=.++            |
|OO*.=. .S        |
|OB+= .o  .       |
|=oo..  ..        |
|+. .  oo         |
|Bo   ..oo        |
+----[SHA256]-----+
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
-rw------- 1 ubuntu ubuntu 411 Mar 11 08:55 /home/ubuntu/.ssh/packer_build_key
-rw-r--r-- 1 ubuntu ubuntu 101 Mar 11 08:55 /home/ubuntu/.ssh/packer_build_key.pub
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair list | grep packer-build-key
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair create --public-key ~/.ssh/packer_build_key.pub packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | None                                            |
| fingerprint | 12:f1:6b:ba:2d:4b:75:66:13:f9:f0:82:d5:a0:01:b9 |
| id          | packer-build-key                                |
| is_deleted  | None                                            |
| name        | packer-build-key                                |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair show packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | 2026-03-11T08:55:52.000000                      |
| fingerprint | 12:f1:6b:ba:2d:4b:75:66:13:f9:f0:82:d5:a0:01:b9 |
| id          | packer-build-key                                |
| is_deleted  | False                                           |
| name        | packer-build-key                                |
| private_key | None                                            |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/provision-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y dist-upgrade

apt-get install -y \
  qemu-guest-agent \
  cloud-init \
  curl \
  wget \
  vim \
  net-tools \
  ca-certificates

systemctl enable qemu-guest-agent || true
systemctl enable ssh || true

apt-get -y autoremove --purge
apt-get clear
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/provision-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 351 Mar 11 08:56 /home/ubuntu/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/cleanup-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

cloud-init clean --logs || true

truncate -s 0 /etc/machine-id || true
rm -f /var/lib/dbus/machine-id || true
ln -sf /etc/machine-id /var/lib/dbus/machine-id || true

rm -rf /tmp/* /var/tmp/* || true
find /var/log -type f -exec truncate -s 0 {} \; || true

apt-get clean
sync
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/cleanup-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 316 Mar 11 08:56 /home/ubuntu/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}
source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/provision-ubuntu.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/cleanup-ubuntu.sh"
  }
}
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/image-factory/packer
packer init .
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer validate -var "network_name=private" ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer build -var "network_name=private" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: 819b7582-aa1e-4f3f-a03b-edafbae2c9ef
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}
==> openstack.ubuntu2404: Terminating the source server:  ...
==> openstack.ubuntu2404: Error terminating server, may still be around: Resource not found
Build 'openstack.ubuntu2404' errored after 137 milliseconds 937 microseconds: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Wait completed after 138 milliseconds 26 microseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Builds finished but no artifacts were created.
ubuntu@gelani-lab-1:~/image-factory/packer$ openstack network list
+--------------------------------------+----------+--------------------------------------+
| ID                                   | Name     | Subnets                              |
+--------------------------------------+----------+--------------------------------------+
| a374dd2e-853a-41eb-88ca-b5730143b548 | private  | bd0d784b-b8ff-4577-998d-a546756f7b8b |
| abd82ede-929d-4f72-a034-e27922dda38f | public   | 65d17f74-a22e-452f-982f-5d641c6c6c57 |
| e83ed974-4855-4c7b-bfb6-949d6c49e829 | shared   | bbc63ac2-84de-4309-9a01-8f69e17a63c1 |
| ee6db446-7789-4b4e-9851-b4335a721c56 | heat-net |                                      |
+--------------------------------------+----------+--------------------------------------+
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build -var "network_name=a374dd2e-853a-41eb-88ca-b5730143b548" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: 819b7582-aa1e-4f3f-a03b-edafbae2c9ef
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
    openstack.ubuntu2404: Server ID: f6b8e780-ec1e-4b14-904c-bef0ed517b5f
==> openstack.ubuntu2404: Waiting for server to become ready...
==> openstack.ubuntu2404: Creating floating IP using network abd82ede-929d-4f72-a034-e27922dda38f ...
    openstack.ubuntu2404: Created floating IP: 'b21ebd00-a269-4614-b5fa-b56a219269b4' (172.24.4.81)
==> openstack.ubuntu2404: Associating floating IP 'b21ebd00-a269-4614-b5fa-b56a219269b4' (172.24.4.81) with instance port...
    openstack.ubuntu2404: Added floating IP 'b21ebd00-a269-4614-b5fa-b56a219269b4' (172.24.4.81) to instance!
==> openstack.ubuntu2404: Using SSH communicator to connect: 172.24.4.81
==> openstack.ubuntu2404: Waiting for SSH to become available...
==> openstack.ubuntu2404: Connected to SSH!
==> openstack.ubuntu2404: Provisioning with shell script: ../scripts/provision-ubuntu.sh
==> openstack.ubuntu2404: + export DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + apt-get update
    openstack.ubuntu2404: Get:1 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
    openstack.ubuntu2404: Hit:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble InRelease
    openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
    openstack.ubuntu2404: Get:4 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1507 kB]
    openstack.ubuntu2404: Get:5 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
    openstack.ubuntu2404: Get:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
    openstack.ubuntu2404: Get:7 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [241 kB]
    openstack.ubuntu2404: Get:8 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.5 kB]
    openstack.ubuntu2404: Get:9 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [10.1 kB]
    openstack.ubuntu2404: Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [975 kB]
    openstack.ubuntu2404: Get:11 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [218 kB]
    openstack.ubuntu2404: Get:12 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.1 kB]
    openstack.ubuntu2404: Get:13 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [20.6 kB]
    openstack.ubuntu2404: Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2612 kB]
    openstack.ubuntu2404: Get:15 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [603 kB]
    openstack.ubuntu2404: Get:16 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]
    openstack.ubuntu2404: Get:17 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [544 B]
    openstack.ubuntu2404: Get:18 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]
    openstack.ubuntu2404: Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6732 B]
    openstack.ubuntu2404: Get:20 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [208 B]
    openstack.ubuntu2404: Get:21 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
    openstack.ubuntu2404: Ign:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
    openstack.ubuntu2404: Get:22 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe Translation-en [5982 kB]
    openstack.ubuntu2404: Get:23 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Components [3871 kB]
    openstack.ubuntu2404: Get:24 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 c-n-f Metadata [301 kB]
    openstack.ubuntu2404: Get:25 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages [269 kB]
    openstack.ubuntu2404: Get:26 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse Translation-en [118 kB]
    openstack.ubuntu2404: Get:27 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Components [35.0 kB]
    openstack.ubuntu2404: Get:28 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 c-n-f Metadata [8328 B]
    openstack.ubuntu2404: Get:29 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1807 kB]
    openstack.ubuntu2404: Get:30 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main Translation-en [332 kB]
    openstack.ubuntu2404: Get:31 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [177 kB]
    openstack.ubuntu2404: Get:32 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 c-n-f Metadata [16.7 kB]
    openstack.ubuntu2404: Get:33 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1565 kB]
    openstack.ubuntu2404: Get:34 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [318 kB]
    openstack.ubuntu2404: Get:35 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]
    openstack.ubuntu2404: Get:36 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 c-n-f Metadata [32.9 kB]
    openstack.ubuntu2404: Get:37 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [2748 kB]
    openstack.ubuntu2404: Get:38 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
    openstack.ubuntu2404: Get:39 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 c-n-f Metadata [556 B]
    openstack.ubuntu2404: Get:40 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [32.1 kB]
    openstack.ubuntu2404: Get:41 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse Translation-en [7044 B]
    openstack.ubuntu2404: Get:42 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
    openstack.ubuntu2404: Get:43 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 c-n-f Metadata [496 B]
    openstack.ubuntu2404: Get:44 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Packages [40.4 kB]
    openstack.ubuntu2404: Get:45 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main Translation-en [9208 B]
    openstack.ubuntu2404: Get:46 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7312 B]
    openstack.ubuntu2404: Get:47 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 c-n-f Metadata [368 B]
    openstack.ubuntu2404: Get:48 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [29.5 kB]
    openstack.ubuntu2404: Get:49 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [17.9 kB]
    openstack.ubuntu2404: Get:50 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [10.5 kB]
    openstack.ubuntu2404: Get:51 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 c-n-f Metadata [1444 B]
    openstack.ubuntu2404: Get:52 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [216 B]
    openstack.ubuntu2404: Get:53 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 c-n-f Metadata [116 B]
    openstack.ubuntu2404: Get:54 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]
    openstack.ubuntu2404: Get:55 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 c-n-f Metadata [116 B]
    openstack.ubuntu2404: Get:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
    openstack.ubuntu2404: Fetched 27.8 MB in 11min 52s (39.1 kB/s)
    openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: + apt-get -y dist-upgrade
    openstack.ubuntu2404: Reading package lists...
    openstack.ubuntu2404: Building dependency tree...
    openstack.ubuntu2404: Reading state information...
    openstack.ubuntu2404: Calculating upgrade...
    openstack.ubuntu2404: The following upgrades have been deferred due to phasing:
    openstack.ubuntu2404:   libnftables1 nftables
    openstack.ubuntu2404: The following packages will be upgraded:
    openstack.ubuntu2404:   libpython3.12-minimal libpython3.12-stdlib libpython3.12t64 python3.12
    openstack.ubuntu2404:   python3.12-minimal
    openstack.ubuntu2404: 5 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
    openstack.ubuntu2404: Need to get 8235 kB of archives.
    openstack.ubuntu2404: After this operation, 4096 B of additional disk space will be used.
    openstack.ubuntu2404: Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12t64 amd64 3.12.3-1ubuntu0.12 [2345 kB]
    openstack.ubuntu2404: Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12 amd64 3.12.3-1ubuntu0.12 [651 kB]
    openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-stdlib amd64 3.12.3-1ubuntu0.12 [2069 kB]
    openstack.ubuntu2404: Get:4 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12-minimal amd64 3.12.3-1ubuntu0.12 [2334 kB]
    openstack.ubuntu2404: Get:5 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-minimal amd64 3.12.3-1ubuntu0.12 [837 kB]
    openstack.ubuntu2404: Fetched 8235 kB in 11min 9s (12.3 kB/s)
    openstack.ubuntu2404: (Reading database ... 75035 files and directories currently installed.)
    openstack.ubuntu2404: Preparing to unpack .../libpython3.12t64_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../python3.12_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking python3.12 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../libpython3.12-stdlib_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../python3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking python3.12-minimal (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Preparing to unpack .../libpython3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
    openstack.ubuntu2404: Unpacking libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
    openstack.ubuntu2404: Setting up libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up python3.12-minimal (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up python3.12 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Setting up libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) ...
    openstack.ubuntu2404: Processing triggers for systemd (255.4-1ubuntu8.12) ...
    openstack.ubuntu2404: Processing triggers for man-db (2.12.0-4build2) ...
    openstack.ubuntu2404: Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Running kernel seems to be up-to-date.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Restarting services...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Service restarts being deferred:
==> openstack.ubuntu2404:  systemctl restart unattended-upgrades.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No containers need to be restarted.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No user sessions are running outdated binaries.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No VM guests are running outdated hypervisor (qemu) binaries on this host.
==> openstack.ubuntu2404: + apt-get install -y qemu-guest-agent cloud-init curl wget vim net-tools ca-certificates
    openstack.ubuntu2404: Reading package lists...
    openstack.ubuntu2404: Building dependency tree...
    openstack.ubuntu2404: Reading state information...
    openstack.ubuntu2404: cloud-init is already the newest version (25.3-0ubuntu1~24.04.1).
    openstack.ubuntu2404: curl is already the newest version (8.5.0-2ubuntu10.7).
    openstack.ubuntu2404: curl set to manually installed.
    openstack.ubuntu2404: wget is already the newest version (1.21.4-1ubuntu4.1).
    openstack.ubuntu2404: wget set to manually installed.
    openstack.ubuntu2404: vim is already the newest version (2:9.1.0016-1ubuntu7.9).
    openstack.ubuntu2404: vim set to manually installed.
    openstack.ubuntu2404: ca-certificates is already the newest version (20240203).
    openstack.ubuntu2404: ca-certificates set to manually installed.
    openstack.ubuntu2404: The following additional packages will be installed:
    openstack.ubuntu2404:   liburing2
    openstack.ubuntu2404: The following NEW packages will be installed:
    openstack.ubuntu2404:   liburing2 net-tools qemu-guest-agent
    openstack.ubuntu2404: 0 upgraded, 3 newly installed, 0 to remove and 2 not upgraded.
    openstack.ubuntu2404: Need to get 616 kB of archives.
    openstack.ubuntu2404: After this operation, 2113 kB of additional disk space will be used.
    openstack.ubuntu2404: Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liburing2 amd64 2.5-1build1 [21.1 kB]
    openstack.ubuntu2404: Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 qemu-guest-agent amd64 1:8.2.2+ds-0ubuntu1.13 [390 kB]
    openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 net-tools amd64 2.10-0.1ubuntu4.4 [204 kB]
    openstack.ubuntu2404: Fetched 616 kB in 2s (264 kB/s)
    openstack.ubuntu2404: Selecting previously unselected package liburing2:amd64.
    openstack.ubuntu2404: (Reading database ... 75035 files and directories currently installed.)
    openstack.ubuntu2404: Preparing to unpack .../liburing2_2.5-1build1_amd64.deb ...
    openstack.ubuntu2404: Unpacking liburing2:amd64 (2.5-1build1) ...
    openstack.ubuntu2404: Selecting previously unselected package qemu-guest-agent.
    openstack.ubuntu2404: Preparing to unpack .../qemu-guest-agent_1%3a8.2.2+ds-0ubuntu1.13_amd64.deb ...
    openstack.ubuntu2404: Unpacking qemu-guest-agent (1:8.2.2+ds-0ubuntu1.13) ...
    openstack.ubuntu2404: Selecting previously unselected package net-tools.
    openstack.ubuntu2404: Preparing to unpack .../net-tools_2.10-0.1ubuntu4.4_amd64.deb ...
    openstack.ubuntu2404: Unpacking net-tools (2.10-0.1ubuntu4.4) ...
    openstack.ubuntu2404: Setting up net-tools (2.10-0.1ubuntu4.4) ...
    openstack.ubuntu2404: Setting up liburing2:amd64 (2.5-1build1) ...
    openstack.ubuntu2404: Setting up qemu-guest-agent (1:8.2.2+ds-0ubuntu1.13) ...
    openstack.ubuntu2404: qemu-guest-agent.service is a disabled or a static unit, not starting it.
    openstack.ubuntu2404: Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
    openstack.ubuntu2404: Processing triggers for man-db (2.12.0-4build2) ...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Running kernel seems to be up-to-date.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Restarting services...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Service restarts being deferred:
==> openstack.ubuntu2404:  systemctl restart unattended-upgrades.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No containers need to be restarted.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No user sessions are running outdated binaries.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No VM guests are running outdated hypervisor (qemu) binaries on this host.
==> openstack.ubuntu2404: + systemctl enable qemu-guest-agent
==> openstack.ubuntu2404: Synchronizing state of qemu-guest-agent.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
==> openstack.ubuntu2404: Executing: /usr/lib/systemd/systemd-sysv-install enable qemu-guest-agent
==> openstack.ubuntu2404: The unit files have no installation config (WantedBy=, RequiredBy=, UpheldBy=,
==> openstack.ubuntu2404: Also=, or Alias= settings in the [Install] section, and DefaultInstance= for
==> openstack.ubuntu2404: template units). This means they are not meant to be enabled or disabled using systemctl.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Possible reasons for having these kinds of units are:
==> openstack.ubuntu2404: • A unit may be statically enabled by being symlinked from another unit's
==> openstack.ubuntu2404:   .wants/, .requires/, or .upholds/ directory.
==> openstack.ubuntu2404: • A unit's purpose may be to act as a helper for some other unit which has
==> openstack.ubuntu2404:   a requirement dependency on it.
==> openstack.ubuntu2404: • A unit may be started when needed via activation (socket, path, timer,
==> openstack.ubuntu2404:   D-Bus, udev, scripted systemctl call, ...).
==> openstack.ubuntu2404: • In case of template units, the unit is meant to be enabled with some
==> openstack.ubuntu2404:   instance name specified.
==> openstack.ubuntu2404: + systemctl enable ssh
==> openstack.ubuntu2404: Synchronizing state of ssh.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
==> openstack.ubuntu2404: Executing: /usr/lib/systemd/systemd-sysv-install enable ssh
==> openstack.ubuntu2404: Created symlink /etc/systemd/system/sshd.service → /usr/lib/systemd/system/ssh.service.
==> openstack.ubuntu2404: Created symlink /etc/systemd/system/multi-user.target.wants/ssh.service → /usr/lib/systemd/system/ssh.service.
==> openstack.ubuntu2404: + apt-get -y autoremove --purge
    openstack.ubuntu2404: Reading package lists...
    openstack.ubuntu2404: Building dependency tree...
    openstack.ubuntu2404: Reading state information...
==> openstack.ubuntu2404: + apt-get clear
    openstack.ubuntu2404: 0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
==> openstack.ubuntu2404: E: Invalid operation clear
==> openstack.ubuntu2404: Provisioning step had errors: Running the cleanup provisioner, if present...
==> openstack.ubuntu2404: Deleted temporary floating IP 'b21ebd00-a269-4614-b5fa-b56a219269b4' (172.24.4.81)
==> openstack.ubuntu2404: Terminating the source server: f6b8e780-ec1e-4b14-904c-bef0ed517b5f ...
Build 'openstack.ubuntu2404' errored after 25 minutes 4 seconds: Script exited with non-zero exit status: 100. Allowed exit codes are: [0]

==> Wait completed after 25 minutes 4 seconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Script exited with non-zero exit status: 100. Allowed exit codes are: [0]

==> Builds finished but no artifacts were created.
ubuntu@gelani-lab-1:~/image-factory/packer$ 
```
**again failed**

## clear with script
```
ubuntu@gelani-lab-1:~$ ll
total 144
drwxr-x--- 11 ubuntu ubuntu  4096 Mar 11 10:16 ./
drwxr-xr-x  3 root   root    4096 Jan 19 10:56 ../
-rw-------  1 ubuntu ubuntu 73924 Mar 11 10:16 .bash_history
-rw-r--r--  1 ubuntu ubuntu   220 Jan  6  2022 .bash_logout
-rw-r--r--  1 ubuntu ubuntu  3771 Jan  6  2022 .bashrc
drwx------  3 ubuntu ubuntu  4096 Jan 31 14:00 .cache/
drwxrwxr-x  6 ubuntu ubuntu  4096 Feb 26 19:54 .config/
drwxrwxr-x  3 ubuntu ubuntu  4096 Feb 15 06:14 .glanceclient/
-rw-------  1 ubuntu ubuntu    20 Feb 18 06:37 .lesshst
drwxrwxr-x  3 ubuntu ubuntu  4096 Feb 17 10:51 .local/
-rw-------  1 ubuntu ubuntu   803 Feb 15 10:01 .mysql_history
-rw-r--r--  1 ubuntu ubuntu   807 Jan  6  2022 .profile
drwx------  2 ubuntu ubuntu  4096 Mar 11 09:09 .ssh/
-rw-r--r--  1 ubuntu ubuntu     0 Jan 19 10:58 .sudo_as_admin_successful
-rw-rw-r--  1 ubuntu ubuntu   408 Feb 26 05:49 .wget-hsts
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 10 11:08 cloudinit-userdata/
drwxrwxr-x  7 ubuntu ubuntu  4096 Mar 11 08:52 image-factory/
drwxrwxr-x  3 ubuntu ubuntu  4096 Mar 11 08:52 images/
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 10 11:42 raw-image/
ubuntu@gelani-lab-1:~$ mkdir scripts-openstack
ubuntu@gelani-lab-1:~$ cd scripts-openstack/
ubuntu@gelani-lab-1:~/scripts-openstack$ nano cleanup-packer-env.sh
ubuntu@gelani-lab-1:~/scripts-openstack$ cat cleanup-packer-env.sh 
#!/usr/bin/env bash
# ============================================================
# cleanup-packer-env.sh
# Removes all resources created during the Packer/OpenStack
# image factory setup.
# ============================================================

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log()    { echo -e "${GREEN}[✔] $1${NC}"; }
warn()   { echo -e "${YELLOW}[!] $1${NC}"; }
error()  { echo -e "${RED}[✘] $1${NC}"; }

echo ""
echo "========================================"
echo "   Packer / OpenStack Cleanup Script    "
echo "========================================"
echo ""

# ── 1. OpenStack image ───────────────────────────────────────
echo ">>> Deleting OpenStack image: ubuntu-24.04-base"
if openstack image show ubuntu-24.04-base &>/dev/null; then
    openstack image delete ubuntu-24.04-base
    log "Image 'ubuntu-24.04-base' deleted."
else
    warn "Image 'ubuntu-24.04-base' not found, skipping."
fi

# ── 2. OpenStack keypair ─────────────────────────────────────
echo ">>> Deleting OpenStack keypair: packer-build-key"
if openstack keypair show packer-build-key &>/dev/null; then
    openstack keypair delete packer-build-key
    log "Keypair 'packer-build-key' deleted."
else
    warn "Keypair 'packer-build-key' not found, skipping."
fi

# ── 3. OpenStack security group ──────────────────────────────
echo ">>> Deleting OpenStack security group: packer-build-sg"
if openstack security group show packer-build-sg &>/dev/null; then
    openstack security group delete packer-build-sg
    log "Security group 'packer-build-sg' deleted."
else
    warn "Security group 'packer-build-sg' not found, skipping."
fi

# ── 4. Local SSH keys ────────────────────────────────────────
echo ">>> Removing local SSH keys"
for key in ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub; do
    if [ -f "$key" ]; then
        rm -f "$key"
        log "Removed $key"
    else
        warn "$key not found, skipping."
    fi
done

# ── 5. Local directories ─────────────────────────────────────
echo ">>> Removing local directories"
for dir in ~/image-factory ~/images; do
    if [ -d "$dir" ]; then
        rm -rf "$dir"
        log "Removed directory $dir"
    else
        warn "Directory $dir not found, skipping."
    fi
done

# ── 6. Packer binary + temp files ────────────────────────────
echo ">>> Removing Packer binary and temp files"
if [ -f /usr/local/bin/packer ]; then
    sudo rm -f /usr/local/bin/packer
    log "Removed /usr/local/bin/packer"
else
    warn "Packer binary not found, skipping."
fi

for f in /tmp/packer.zip /tmp/LICENSE.txt /tmp/packer; do
    if [ -f "$f" ]; then
        rm -f "$f"
        log "Removed $f"
    fi
done

# ── 7. Final verification ─────────────────────────────────────
echo ""
echo "========================================"
echo "           Verification Check          "
echo "========================================"

PASS=true

openstack image list | grep -q "ubuntu-24.04-base" \
    && { error "Image still exists!"; PASS=false; } \
    || log "Image: cleared"

openstack keypair list | grep -q "packer-build-key" \
    && { error "Keypair still exists!"; PASS=false; } \
    || log "Keypair: cleared"

openstack security group list | grep -q "packer-build-sg" \
    && { error "Security group still exists!"; PASS=false; } \
    || log "Security group: cleared"

[ -d ~/image-factory ] \
    && { error "~/image-factory still exists!"; PASS=false; } \
    || log "~/image-factory: cleared"

[ -d ~/images ] \
    && { error "~/images still exists!"; PASS=false; } \
    || log "~/images: cleared"

command -v packer &>/dev/null \
    && { error "Packer binary still found!"; PASS=false; } \
    || log "Packer binary: cleared"

echo ""
if $PASS; then
    echo -e "${GREEN}All resources cleaned up successfully!${NC}"
else
    echo -e "${RED}Some resources may still remain. Check errors above.${NC}"
fi
echo ""
ubuntu@gelani-lab-1:~/scripts-openstack$ chmod +x cleanup-packer-env.sh
ubuntu@gelani-lab-1:~/scripts-openstack$ ./cleanup-packer-env.sh

========================================
   Packer / OpenStack Cleanup Script    
========================================

>>> Deleting OpenStack image: ubuntu-24.04-base
[!] Image 'ubuntu-24.04-base' not found, skipping.
>>> Deleting OpenStack keypair: packer-build-key
[!] Keypair 'packer-build-key' not found, skipping.
>>> Deleting OpenStack security group: packer-build-sg
[!] Security group 'packer-build-sg' not found, skipping.
>>> Removing local SSH keys
[✔] Removed /home/ubuntu/.ssh/packer_build_key
[✔] Removed /home/ubuntu/.ssh/packer_build_key.pub
>>> Removing local directories
[✔] Removed directory /home/ubuntu/image-factory
[✔] Removed directory /home/ubuntu/images
>>> Removing Packer binary and temp files
[✔] Removed /usr/local/bin/packer
[✔] Removed /tmp/packer.zip
[✔] Removed /tmp/LICENSE.txt

========================================
           Verification Check          
========================================
Missing value auth-url required for auth plugin password
[✔] Image: cleared
Missing value auth-url required for auth plugin password
[✔] Keypair: cleared
Missing value auth-url required for auth plugin password
[✔] Security group: cleared
[✔] ~/image-factory: cleared
[✔] ~/images: cleared
[✔] Packer binary: cleared

All resources cleaned up successfully!

ubuntu@gelani-lab-1:~/scripts-openstack$ 
```
## trying-again
### here modified script and wrong ssh key choosen
```
ubuntu@gelani-lab-1:~/scripts-openstack$ cd /opt/stack/devstack
source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack token issue
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                                                                                                   |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| expires    | 2026-03-12T04:52:18+0000                                                                                                                                                                |
| id         | gAAAAABpsjhynJhmp96MchJAuuH4xDMfpdaxHjy9sQghj_ElUvbtCb7ZLSdwAcEBZAtX4KwnHJm-7AXjWPGqIF-QMxykTl-RPds7MmfMVgg3mkBUGP_nBmthD6r-DEkzEIdQ5K8ri1zsq7Iz8ifHK2tbAnt_jjvQ9SJAvbk65e9ZApDy0G0WRb0 |
| project_id | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                        |
| user_id    | 270824ef176044a2a8b64a8337e2f00a                                                                                                                                                        |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output,logs}
tree ~/image-factory
/home/ubuntu/image-factory
├── cloud-init
├── logs
├── output
├── packer
└── scripts

5 directories, 0 files
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo apt update
sudo apt install -y unzip qemu-utils jq curl wget
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease                
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security/main amd64 Packages [3,023 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 Packages [3,286 kB]
Get:7 http://security.ubuntu.com/ubuntu jammy-security/main amd64 c-n-f Metadata [14.1 kB]
Get:8 http://security.ubuntu.com/ubuntu jammy-security/universe amd64 Packages [1,019 kB]         
Get:9 http://security.ubuntu.com/ubuntu jammy-security/universe Translation-en [225 kB]    
Get:10 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 c-n-f Metadata [19.2 kB]
Get:11 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe amd64 Packages [1,257 kB]
Get:12 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/universe Translation-en [315 kB]
Fetched 9,542 kB in 4s (2,256 kB/s)                             
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
5 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
jq is already the newest version (1.6-2.1ubuntu3.1).
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.28).
unzip is already the newest version (6.0-26ubuntu3.2).
wget is already the newest version (1.21.2-2ubuntu1.1).
The following additional packages will be installed:
  libcurl4
The following packages will be upgraded:
  curl libcurl4
2 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
Need to get 484 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 curl amd64 7.81.0-1ubuntu1.23 [194 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates/main amd64 libcurl4 amd64 7.81.0-1ubuntu1.23 [290 kB]
Fetched 484 kB in 2s (220 kB/s)   
(Reading database ... 142620 files and directories currently installed.)
Preparing to unpack .../curl_7.81.0-1ubuntu1.23_amd64.deb ...
Unpacking curl (7.81.0-1ubuntu1.23) over (7.81.0-1ubuntu1.22) ...
Preparing to unpack .../libcurl4_7.81.0-1ubuntu1.23_amd64.deb ...
Unpacking libcurl4:amd64 (7.81.0-1ubuntu1.23) over (7.81.0-1ubuntu1.22) ...
Setting up libcurl4:amd64 (7.81.0-1ubuntu1.23) ...
Setting up curl (7.81.0-1ubuntu1.23) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.13) ...
Scanning processes...                                                                                                                                                                                                                       
Scanning candidates...                                                                                                                                                                                                                      
Scanning linux images...                                                                                                                                                                                                                    

Running kernel seems to be up-to-date.

Restarting services...
 systemctl restart devstack@aodh-api.service devstack@aodh-evaluator.service devstack@aodh-listener.service devstack@aodh-notifier.service devstack@c-api.service devstack@c-sch.service devstack@c-vol.service devstack@ceilometer-acentral.service devstack@ceilometer-acompute.service devstack@ceilometer-anotification.service devstack@dstat.service devstack@g-api.service devstack@gnocchi-api.service devstack@gnocchi-metricd.service devstack@h-api-cfn.service devstack@h-api.service devstack@h-eng.service devstack@keystone.service devstack@n-api-meta.service devstack@n-api.service devstack@n-cond-cell1.service devstack@n-cpu.service devstack@n-novnc-cell1.service devstack@n-sch.service devstack@n-super-cond.service devstack@neutron-api.service devstack@neutron-ovn-maintenance-worker.service devstack@neutron-periodic-workers.service devstack@neutron-rpc-server.service devstack@placement-api.service devstack@q-ovn-agent.service
Service restarts being deferred:
 systemctl restart networkd-dispatcher.service
 systemctl restart unattended-upgrades.service

No containers need to be restarted.

No user sessions are running outdated binaries.

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@gelani-lab-1:/opt/stack/devstack$ qemu-img --version
jq --version
curl --version | head -n 1
qemu-img version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.28)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
jq-1.6
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
ubuntu@gelani-lab-1:/opt/stack/devstack$ packer version
Command 'packer' not found, but can be installed with:
sudo snap install packer  # version 1.0.0-2, or
sudo apt  install packer  # version 1.6.6+ds1-4ubuntu0.22.04.3
See 'snap info packer' for additional versions.
ubuntu@gelani-lab-1:/opt/stack/devstack$ mkdir -p ~/images/base-image
cd ~/images/base-image
pwd
/home/ubuntu/images/base-image
ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-12 03:53:35--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.37, 185.125.190.40, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.37|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629380096 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                  100%[========================================================================================================================================>] 600.22M  16.2MB/s    in 50s     

2026-03-12 03:54:26 (11.9 MB/s) - ‘noble.img’ saved [629380096/629380096]

ubuntu@gelani-lab-1:~/images/base-image$ ls -lh noble.img
qemu-img info noble.img
-rw-rw-r-- 1 ubuntu ubuntu 601M Mar  7 13:14 noble.img
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
| 819b7582-aa1e-4f3f-a03b-edafbae2c9ef | ubuntu-24.04-base | active |
ubuntu@gelani-lab-1:~/images/base-image$ rbd ls -p images
819b7582-aa1e-4f3f-a03b-edafbae2c9ef
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group list | grep packer-build-sg
| c152fa14-982c-4b3a-8df0-019b0deacbdb | packer-build-sg | packer-build-sg        | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group show packer-build-sg
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-11T08:55:06Z                                                                                                                                                                                                   |
| description     | packer-build-sg                                                                                                                                                                                                        |
| id              | c152fa14-982c-4b3a-8df0-019b0deacbdb                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | packer-build-sg                                                                                                                                                                                                        |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                                                      |
| rules           | created_at='2026-03-11T08:55:22Z', direction='ingress', ethertype='IPv4', id='8dd371cc-a271-47f9-88f5-4883bc3c6d68', normalized_cidr='0.0.0.0/0', protocol='icmp', remote_ip_prefix='0.0.0.0/0',                       |
|                 | standard_attr_id='169', updated_at='2026-03-11T08:55:22Z'                                                                                                                                                              |
|                 | created_at='2026-03-11T08:55:19Z', direction='ingress', ethertype='IPv4', id='a4bcf32f-e22d-4fbe-8470-af172957e9e5', normalized_cidr='0.0.0.0/0', port_range_max='22', port_range_min='22', protocol='tcp',            |
|                 | remote_ip_prefix='0.0.0.0/0', standard_attr_id='168', updated_at='2026-03-11T08:55:19Z'                                                                                                                                |
|                 | created_at='2026-03-11T08:55:06Z', direction='egress', ethertype='IPv4', id='b91c9a93-ab12-4f34-9f7f-4f725807fa60', standard_attr_id='166', updated_at='2026-03-11T08:55:06Z'                                          |
|                 | created_at='2026-03-11T08:55:06Z', direction='egress', ethertype='IPv6', id='cb8fbc36-2f5d-4e23-85f9-6738b01660e6', standard_attr_id='167', updated_at='2026-03-11T08:55:06Z'                                          |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-03-11T08:55:22Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
ls: cannot access '/home/ubuntu/.ssh/packer_build_key': No such file or directory
ls: cannot access '/home/ubuntu/.ssh/packer_build_key.pub': No such file or directory
ubuntu@gelani-lab-1:~/images/base-image$ mkdir -p ~/.ssh
ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:css7lSeOY92ApWEJthfUDGjfTaZVgSJ7/xO5ogVTijE ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
|       oo+   oo. |
|      = o + =    |
|     o +E* B.    |
|      . B+=o.    |
|      .oS*+o   . |
|       +o.=oo o  |
|        o= =.. o |
|        =.o.o +  |
|       ..o.. . . |
+----[SHA256]-----+
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair list | grep packer-build-key
| packer-build-key | 12:f1:6b:ba:2d:4b:75:66:13:f9:f0:82:d5:a0:01:b9 | ssh  |
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair show packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | 2026-03-11T08:55:52.000000                      |
| fingerprint | 12:f1:6b:ba:2d:4b:75:66:13:f9:f0:82:d5:a0:01:b9 |
| id          | packer-build-key                                |
| is_deleted  | False                                           |
| name        | packer-build-key                                |
| private_key | None                                            |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/provision-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 351 Mar 12 04:00 /home/ubuntu/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/cleanup-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 316 Mar 12 04:00 /home/ubuntu/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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

  ssh_interface         = "public"
  ssh_ip_version        = "4"

  floating_ip_network   = "public"
  instance_floating_ip_net = "private"

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
ubuntu@gelani-lab-1:~/images/base-image$ openstack network show
usage: openstack network show [-h] [-f {json,shell,table,value,yaml}] [-c COLUMN] [--noindent] [--prefix PREFIX] [--max-width <integer>] [--fit-width] [--print-empty] <network>
openstack network show: error: the following arguments are required: <network>
ubuntu@gelani-lab-1:~/images/base-image$ openstack network list
+--------------------------------------+----------+--------------------------------------+
| ID                                   | Name     | Subnets                              |
+--------------------------------------+----------+--------------------------------------+
| a374dd2e-853a-41eb-88ca-b5730143b548 | private  | bd0d784b-b8ff-4577-998d-a546756f7b8b |
| abd82ede-929d-4f72-a034-e27922dda38f | public   | 65d17f74-a22e-452f-982f-5d641c6c6c57 |
| e83ed974-4855-4c7b-bfb6-949d6c49e829 | shared   | bbc63ac2-84de-4309-9a01-8f69e17a63c1 |
| ee6db446-7789-4b4e-9851-b4335a721c56 | heat-net |                                      |
+--------------------------------------+----------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ rm -r ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}

source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/image-factory/packer
packer init .
Command 'packer' not found, but can be installed with:
sudo snap install packer  # version 1.0.0-2, or
sudo apt  install packer  # version 1.6.6+ds1-4ubuntu0.22.04.3
See 'snap info packer' for additional versions.
ubuntu@gelani-lab-1:~/image-factory/packer$ whoami
ubuntu
ubuntu@gelani-lab-1:~/image-factory/packer$ packer version
Command 'packer' not found, but can be installed with:
sudo snap install packer  # version 1.0.0-2, or
sudo apt  install packer  # version 1.6.6+ds1-4ubuntu0.22.04.3
See 'snap info packer' for additional versions.
ubuntu@gelani-lab-1:~/image-factory/packer$ cd /tmp
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
packer version
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ packer version
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ packer version
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ cd ~/image-factory/packer
ubuntu@gelani-lab-1:~/image-factory/packer$ packer init .
ubuntu@gelani-lab-1:~/image-factory/packer$ packer validate -var "network_name=private" ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer build -var "network_name=private" ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: 819b7582-aa1e-4f3f-a03b-edafbae2c9ef
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}
==> openstack.ubuntu2404: Terminating the source server:  ...
==> openstack.ubuntu2404: Error terminating server, may still be around: Resource not found
Build 'openstack.ubuntu2404' errored after 864 milliseconds 591 microseconds: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Wait completed after 864 milliseconds 675 microseconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Error launching source server: Bad request with: [POST http://192.168.95.23/compute/v2.1/servers], error message: {"badRequest": {"code": 400, "message": "Bad networks format: network uuid is not in proper format (private)"}}

==> Builds finished but no artifacts were created.
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/image-factory/packer
packer validate ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
    openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
    openstack.ubuntu2404: Found Image ID: 819b7582-aa1e-4f3f-a03b-edafbae2c9ef
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
    openstack.ubuntu2404: Server ID: 3d8b70b6-1fae-4fbf-a264-158b097c237e
==> openstack.ubuntu2404: Waiting for server to become ready...
==> openstack.ubuntu2404: Creating floating IP using network abd82ede-929d-4f72-a034-e27922dda38f ...
    openstack.ubuntu2404: Created floating IP: 'a455c069-2e84-43ff-8945-35dd8fb33891' (172.24.4.11)
==> openstack.ubuntu2404: Associating floating IP 'a455c069-2e84-43ff-8945-35dd8fb33891' (172.24.4.11) with instance port...
    openstack.ubuntu2404: Added floating IP 'a455c069-2e84-43ff-8945-35dd8fb33891' (172.24.4.11) to instance!
==> openstack.ubuntu2404: Using SSH communicator to connect: 172.24.4.11
==> openstack.ubuntu2404: Waiting for SSH to become available...
Cancelling build after receiving interrupt
==> openstack.ubuntu2404: Deleted temporary floating IP 'a455c069-2e84-43ff-8945-35dd8fb33891' (172.24.4.11)
==> openstack.ubuntu2404: Terminating the source server: 3d8b70b6-1fae-4fbf-a264-158b097c237e ...
Build 'openstack.ubuntu2404' finished after 5 minutes 8 seconds.

==> Wait completed after 5 minutes 8 seconds
Cleanly cancelled builds after being interrupted.
ubuntu@gelani-lab-1:~/image-factory/packer$ 
```
### fix this and re-run
```
ubuntu@gelani-lab-1:~/image-factory/packer$ cd ~/.ssh
ubuntu@gelani-lab-1:~/.ssh$ ll
total 44
drwx------  2 ubuntu ubuntu 4096 Mar 12 04:43 ./
drwxr-x--- 12 ubuntu ubuntu 4096 Mar 12 04:46 ../
-rw-------  1 ubuntu ubuntu  399 Feb 18 04:44 authorized_keys
-rw-------  1 ubuntu ubuntu 9814 Mar 12 04:43 known_hosts
-rw-------  1 ubuntu ubuntu 8978 Mar 12 04:43 known_hosts.old
-rw-------  1 ubuntu ubuntu  411 Mar 12 04:25 packer_build_key
-rw-r--r--  1 ubuntu ubuntu  101 Mar 12 04:25 packer_build_key.pub
ubuntu@gelani-lab-1:~/.ssh$ rm -r pack*
ubuntu@gelani-lab-1:~/.ssh$ ll
total 36
drwx------  2 ubuntu ubuntu 4096 Mar 12 06:02 ./
drwxr-x--- 12 ubuntu ubuntu 4096 Mar 12 04:46 ../
-rw-------  1 ubuntu ubuntu  399 Feb 18 04:44 authorized_keys
-rw-------  1 ubuntu ubuntu 9814 Mar 12 04:43 known_hosts
-rw-------  1 ubuntu ubuntu 8978 Mar 12 04:43 known_hosts.old
ubuntu@gelani-lab-1:~/.ssh$ 
ubuntu@gelani-lab-1:~/image-factory/packer$ cd /opt/stack/devstack
source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack token issue
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                                                                                                   |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| expires    | 2026-03-12T07:07:51+0000                                                                                                                                                                |
| id         | gAAAAABpslg3zY80P0Lll1Jeau1JZWXFCZmwWO0rA56OYuNr6o6UsS8iuEBQ-PmtXQjKuOe5rRE_u2pXCyJXFJVQUgsuOTdozCd60SHXkCn-nv3GjckNz9AWHOdpZsiivwcOuHIXl0ZYjwksLeZnhMlFGcJtFqDhtuoiNc7LpizecXBNaBTQLwk |
| project_id | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                        |
| user_id    | 270824ef176044a2a8b64a8337e2f00a                                                                                                                                                        |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output,logs}
tree ~/image-factory
/home/ubuntu/image-factory
├── cloud-init
├── logs
├── output
├── packer
└── scripts

5 directories, 0 files
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo apt update
sudo apt install -y unzip qemu-utils jq curl wget
Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
3 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
curl is already the newest version (7.81.0-1ubuntu1.23).
jq is already the newest version (1.6-2.1ubuntu3.1).
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.28).
unzip is already the newest version (6.0-26ubuntu3.2).
wget is already the newest version (1.21.2-2ubuntu1.1).
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
ubuntu@gelani-lab-1:/opt/stack/devstack$ qemu-img --version
jq --version
curl --version | head -n 1
qemu-img version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.28)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
jq-1.6
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
ubuntu@gelani-lab-1:/opt/stack/devstack$ packer version
Command 'packer' not found, but can be installed with:
sudo snap install packer  # version 1.0.0-2, or
sudo apt  install packer  # version 1.6.6+ds1-4ubuntu0.22.04.3
See 'snap info packer' for additional versions.
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /tmp
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
packer version
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ packer version
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ cd /tmp
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
packer version
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
Packer v1.15.0
ubuntu@gelani-lab-1:/tmp$ packer version
Packer v1.15.0
ubuntu@gelani-lab-1:/tmp$ mkdir -p ~/images/base-image
cd ~/images/base-image
pwd
/home/ubuntu/images/base-image
ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-12 06:11:23--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.37, 185.125.190.40, 2620:2d:4000:1::17, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.37|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629380096 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                  100%[========================================================================================================================================>] 600.22M  16.9MB/s    in 45s     

2026-03-12 06:12:09 (13.4 MB/s) - ‘noble.img’ saved [629380096/629380096]

ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-12 06:12:14--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629380096 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                    0%[                                                                                                                                         ]       0  --.-KB/s               ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ^C
ubuntu@gelani-lab-1:~/images/base-image$ ls -lh noble.img
qemu-img info noble.img
-rw-rw-r-- 1 ubuntu ubuntu 16K Mar 12 06:12 noble.img
image: noble.img
file format: qcow2
virtual size: 3.5 GiB (3758096384 bytes)
disk size: 16 KiB
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
| checksum         | 7a901ccaddcc52ba6dc30c6161da0eda                                                                                                                                                                                      |
| container_format | bare                                                                                                                                                                                                                  |
| created_at       | 2026-03-12T06:12:38Z                                                                                                                                                                                                  |
| disk_format      | qcow2                                                                                                                                                                                                                 |
| file             | /v2/images/1a3d9485-ba92-4244-a7ef-d5066cbecad7/file                                                                                                                                                                  |
| id               | 1a3d9485-ba92-4244-a7ef-d5066cbecad7                                                                                                                                                                                  |
| min_disk         | 0                                                                                                                                                                                                                     |
| min_ram          | 0                                                                                                                                                                                                                     |
| name             | ubuntu-24.04-base                                                                                                                                                                                                     |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                      |
| properties       | os_hash_algo='sha512', os_hash_value='383a7009fa3a28617e8c774e2414e6cb80f249844ff51f43234df4ad2942588fbbacf9906463e11989ed942f22244220a2bf9dfbb8e0e6c316cfc09221848130', os_hidden='False',                           |
|                  | owner_specified.openstack.md5='', owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256=''                                                                                    |
| protected        | False                                                                                                                                                                                                                 |
| schema           | /v2/schemas/image                                                                                                                                                                                                     |
| size             | 16384                                                                                                                                                                                                                 |
| status           | active                                                                                                                                                                                                                |
| tags             |                                                                                                                                                                                                                       |
| updated_at       | 2026-03-12T06:12:40Z                                                                                                                                                                                                  |
| virtual_size     | 3758096384                                                                                                                                                                                                            |
| visibility       | public                                                                                                                                                                                                                |
+------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image show ubuntu-24.04-base -c id -c name -c status -c disk_format -c size
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| disk_format | qcow2                                |
| id          | 1a3d9485-ba92-4244-a7ef-d5066cbecad7 |
| name        | ubuntu-24.04-base                    |
| size        | 16384                                |
| status      | active                               |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ rbd ls -p images
1a3d9485-ba92-4244-a7ef-d5066cbecad7
60e5eeee-2ffa-49e2-895b-dc2d3ab19a9f
ubuntu@gelani-lab-1:~/images/base-image$ openstack image list
+--------------------------------------+------------------------------+--------+
| ID                                   | Name                         | Status |
+--------------------------------------+------------------------------+--------+
| 60e5eeee-2ffa-49e2-895b-dc2d3ab19a9f | ubuntu-24.04-2026-03-12-0431 | active |
| 1a3d9485-ba92-4244-a7ef-d5066cbecad7 | ubuntu-24.04-base            | active |
+--------------------------------------+------------------------------+--------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image delete ubuntu-24.04-2026-03-12-0431
ubuntu@gelani-lab-1:~/images/base-image$ openstack image list 
+--------------------------------------+-------------------+--------+
| ID                                   | Name              | Status |
+--------------------------------------+-------------------+--------+
| 1a3d9485-ba92-4244-a7ef-d5066cbecad7 | ubuntu-24.04-base | active |
+--------------------------------------+-------------------+--------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group list | grep packer-build-sg
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group create packer-build-sg && openstack security group rule create --proto tcp --dst-port 22 packer-build-sg && openstack security group rule create --proto icmp packer-build-sg && openstack security group show packer-build-sg
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                         |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-12T06:14:32Z                                                                                                                                                          |
| description     | packer-build-sg                                                                                                                                                               |
| id              | cd32df06-0e3e-4b2b-9018-3f03dfa11a83                                                                                                                                          |
| is_shared       | False                                                                                                                                                                         |
| name            | packer-build-sg                                                                                                                                                               |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                              |
| revision_number | 1                                                                                                                                                                             |
| rules           | created_at='2026-03-12T06:14:32Z', direction='egress', ethertype='IPv4', id='2d71cb29-8594-4652-a713-5b0795df199f', standard_attr_id='191', updated_at='2026-03-12T06:14:32Z' |
|                 | created_at='2026-03-12T06:14:32Z', direction='egress', ethertype='IPv6', id='cc57f2e9-c542-49a8-ad9b-01311a295404', standard_attr_id='192', updated_at='2026-03-12T06:14:32Z' |
| stateful        | True                                                                                                                                                                          |
| tags            | []                                                                                                                                                                            |
| updated_at      | 2026-03-12T06:14:32Z                                                                                                                                                          |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-12T06:14:35Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 8b6b4b49-2f05-4a02-8e35-936ef5e98e07 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | cd32df06-0e3e-4b2b-9018-3f03dfa11a83 |
| updated_at              | 2026-03-12T06:14:35Z                 |
+-------------------------+--------------------------------------+
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-12T06:14:37Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 6476cdfc-48b2-4269-b771-72b3641f32b5 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | cd32df06-0e3e-4b2b-9018-3f03dfa11a83 |
| updated_at              | 2026-03-12T06:14:37Z                 |
+-------------------------+--------------------------------------+
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                  |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-12T06:14:32Z                                                                                                                                                                                                   |
| description     | packer-build-sg                                                                                                                                                                                                        |
| id              | cd32df06-0e3e-4b2b-9018-3f03dfa11a83                                                                                                                                                                                   |
| is_shared       | False                                                                                                                                                                                                                  |
| name            | packer-build-sg                                                                                                                                                                                                        |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                       |
| revision_number | 3                                                                                                                                                                                                                      |
| rules           | created_at='2026-03-12T06:14:32Z', direction='egress', ethertype='IPv4', id='2d71cb29-8594-4652-a713-5b0795df199f', standard_attr_id='191', updated_at='2026-03-12T06:14:32Z'                                          |
|                 | created_at='2026-03-12T06:14:37Z', direction='ingress', ethertype='IPv4', id='6476cdfc-48b2-4269-b771-72b3641f32b5', normalized_cidr='0.0.0.0/0', protocol='icmp', remote_ip_prefix='0.0.0.0/0',                       |
|                 | standard_attr_id='194', updated_at='2026-03-12T06:14:37Z'                                                                                                                                                              |
|                 | created_at='2026-03-12T06:14:35Z', direction='ingress', ethertype='IPv4', id='8b6b4b49-2f05-4a02-8e35-936ef5e98e07', normalized_cidr='0.0.0.0/0', port_range_max='22', port_range_min='22', protocol='tcp',            |
|                 | remote_ip_prefix='0.0.0.0/0', standard_attr_id='193', updated_at='2026-03-12T06:14:35Z'                                                                                                                                |
|                 | created_at='2026-03-12T06:14:32Z', direction='egress', ethertype='IPv6', id='cc57f2e9-c542-49a8-ad9b-01311a295404', standard_attr_id='192', updated_at='2026-03-12T06:14:32Z'                                          |
| stateful        | True                                                                                                                                                                                                                   |
| tags            | []                                                                                                                                                                                                                     |
| updated_at      | 2026-03-12T06:14:37Z                                                                                                                                                                                                   |
+-----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/.ssh
ubuntu@gelani-lab-1:~/.ssh$ ls
authorized_keys  known_hosts  known_hosts.old
ubuntu@gelani-lab-1:~/.ssh$ ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:bmnw9TQFwO2QbNgLPTpGm2wN5aKF7D5Ie2CQjJInmeY ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
|         Bo+.    |
| * . . .=.X ..   |
|B.=   oooO.=  .  |
|+o . . oO.o ..   |
| E  + +oS.. o    |
|   o = + o o .   |
|    o + *   .    |
|     . +         |
|                 |
+----[SHA256]-----+
ubuntu@gelani-lab-1:~/.ssh$ ls -l ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
-rw------- 1 ubuntu ubuntu 411 Mar 12 06:15 /home/ubuntu/.ssh/packer_build_key
-rw-r--r-- 1 ubuntu ubuntu 101 Mar 12 06:15 /home/ubuntu/.ssh/packer_build_key.pub
ubuntu@gelani-lab-1:~/.ssh$ openstack keypair list | grep packer-build-key
ubuntu@gelani-lab-1:~/.ssh$ openstack keypair create --public-key ~/.ssh/packer_build_key.pub packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | None                                            |
| fingerprint | cd:3b:a2:d2:c8:4f:b5:45:08:d2:08:5e:0b:06:a1:35 |
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
| created_at  | 2026-03-12T06:15:17.000000                      |
| fingerprint | cd:3b:a2:d2:c8:4f:b5:45:08:d2:08:5e:0b:06:a1:35 |
| id          | packer-build-key                                |
| is_deleted  | False                                           |
| name        | packer-build-key                                |
| private_key | None                                            |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/.ssh$ nano ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ cat ~/image-factory/scripts/provision-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y dist-upgrade

apt-get install -y \
  qemu-guest-agent \
  cloud-init \
  curl \
  wget \
  vim \
  net-tools \
  ca-certificates

systemctl enable qemu-guest-agent || true
systemctl enable ssh || true

apt-get -y autoremove --purge
apt-get clean
ubuntu@gelani-lab-1:~/.ssh$ chmod +x ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ ls -l ~/image-factory/scripts/provision-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 351 Mar 12 06:15 /home/ubuntu/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ nano ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ chmod +x ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/.ssh$ ls -l ~/image-factory/scripts/cleanup-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 316 Mar 12 06:15 /home/ubuntu/image-factory/scripts/cleanup-ubuntu.sh
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}

source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/provision-ubuntu.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/cleanup-ubuntu.sh"
  }
}
ubuntu@gelani-lab-1:~/.ssh$ cat ~/image-factory/scripts/cleanup-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

cloud-init clean --logs || true

truncate -s 0 /etc/machine-id || true
rm -f /var/lib/dbus/machine-id || true
ln -sf /etc/machine-id /var/lib/dbus/machine-id || true

rm -rf /tmp/* /var/tmp/* || true
find /var/log -type f -exec truncate -s 0 {} \; || true

apt-get clean
sync
ubuntu@gelani-lab-1:~/.ssh$ cd ~/image-factory/packer
packer init .
ubuntu@gelani-lab-1:~/image-factory/packer$ packer validate -var "network_name=private" ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
==> openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Found Image ID: 1a3d9485-ba92-4244-a7ef-d5066cbecad7
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Server ID: 27f75bf5-57b5-4f71-8fc2-2fb59f859f79
==> openstack.ubuntu2404: Waiting for server to become ready...
==> openstack.ubuntu2404: Creating floating IP using network abd82ede-929d-4f72-a034-e27922dda38f ...
==> openstack.ubuntu2404: Created floating IP: '7b301717-d54e-4bc3-a3c7-550bed65b294' (172.24.4.191)
==> openstack.ubuntu2404: Associating floating IP '7b301717-d54e-4bc3-a3c7-550bed65b294' (172.24.4.191) with instance port...
==> openstack.ubuntu2404: Added floating IP '7b301717-d54e-4bc3-a3c7-550bed65b294' (172.24.4.191) to instance!
==> openstack.ubuntu2404: Using SSH communicator to connect: 172.24.4.191
==> openstack.ubuntu2404: Waiting for SSH to become available...

Cancelling build after receiving interrupt
==> openstack.ubuntu2404: Deleted temporary floating IP '7b301717-d54e-4bc3-a3c7-550bed65b294' (172.24.4.191)
==> openstack.ubuntu2404: Terminating the source server: 27f75bf5-57b5-4f71-8fc2-2fb59f859f79 ...
Build 'openstack.ubuntu2404' finished after 3 minutes 48 seconds.

==> Wait completed after 3 minutes 48 seconds
Cleanly cancelled builds after being interrupted.
ubuntu@gelani-lab-1:~/image-factory/packer$ 
```





```
ubuntu@gelani-lab-1:~$ cd scripts-openstack/
ubuntu@gelani-lab-1:~/scripts-openstack$ ls
cleanup-packer-env.sh
ubuntu@gelani-lab-1:~/scripts-openstack$ ./cleanup-packer-env.sh 

========================================
   Packer / OpenStack Cleanup Script    
========================================

>>> Deleting OpenStack image: ubuntu-24.04-base
[✔] Image 'ubuntu-24.04-base' deleted.
>>> Deleting OpenStack keypair: packer-build-key
[✔] Keypair 'packer-build-key' deleted.
>>> Deleting OpenStack security group: packer-build-sg
[✔] Security group 'packer-build-sg' deleted.
>>> Removing local SSH keys
[✔] Removed /home/ubuntu/.ssh/packer_build_key
[✔] Removed /home/ubuntu/.ssh/packer_build_key.pub
>>> Removing local directories
[✔] Removed directory /home/ubuntu/image-factory
[✔] Removed directory /home/ubuntu/images
>>> Removing Packer binary and temp files
[✔] Removed /usr/local/bin/packer
[✔] Removed /tmp/packer.zip
[✔] Removed /tmp/LICENSE.txt

========================================
           Verification Check          
========================================
[✔] Image: cleared
[✔] Keypair: cleared
[✔] Security group: cleared
[✔] ~/image-factory: cleared
[✔] ~/images: cleared
[✔] Packer binary: cleared

All resources cleaned up successfully!

ubuntu@gelani-lab-1:~/scripts-openstack$ openstack image list

ubuntu@gelani-lab-1:~/scripts-openstack$ openstack server list

ubuntu@gelani-lab-1:~/scripts-openstack$ openstack security group list
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| ID                                   | Name    | Description            | Project                          | Tags | Shared |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| 1679afe8-45f0-47b1-9756-7f4346ef0506 | default | Default security group | 74a530ca6d4142cbbdcf25dd6b640a81 | []   | False  |
| a930250a-f00d-4da3-99b7-cb727a78fc8e | default | Default security group | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:~/scripts-openstack$ openstack security group D*
openstack: 'security group D*' is not an openstack command. See 'openstack --help'.
Did you mean one of these?
  security group create
  security group delete
  security group list
  security group rule create
  security group rule delete
  security group rule list
  security group rule show
  security group set
  security group show
  security group unset
  secret consumer create
  secret consumer delete
  secret consumer list
  secret container create
  secret container delete
  secret container get
  secret container list
  secret delete
  secret get
  secret list
  secret order create
  secret order delete
  secret order get
  secret order list
  secret store
  secret update
ubuntu@gelani-lab-1:~/scripts-openstack$ openstack security group Default
openstack: 'security group Default' is not an openstack command. See 'openstack --help'.
Did you mean one of these?
  security group create
  security group delete
  security group list
  security group rule create
  security group rule delete
  security group rule list
  security group rule show
  security group set
  security group show
  security group unset
  secret consumer create
  secret consumer delete
  secret consumer list
  secret container create
  secret container delete
  secret container get
  secret container list
  secret delete
  secret get
  secret list
  secret order create
  secret order delete
  secret order get
  secret order list
  secret store
  secret update
ubuntu@gelani-lab-1:~/scripts-openstack$ openstack security group delete D*
Failed to delete group with name or ID 'D*': No SecurityGroup found for D*
1 of 1 groups failed to delete.
ubuntu@gelani-lab-1:~/scripts-openstack$ openstack security group delete 1679afe8-45f0-47b1-9756-7f4346ef0506  | openstack security group delete a930250a-f00d-4da3-99b7-cb727a78fc8e
ubuntu@gelani-lab-1:~/scripts-openstack$ openstack security group list
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| ID                                   | Name    | Description            | Project                          | Tags | Shared |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
| 7a0b62af-530c-4dc0-ba50-cb16de4944f5 | default | Default security group | 99ab77b7592c418096336a7ccf9e299d | []   | False  |
+--------------------------------------+---------+------------------------+----------------------------------+------+--------+
ubuntu@gelani-lab-1:~/scripts-openstack$ cd ~
ubuntu@gelani-lab-1:~$ ls
cloudinit-userdata  raw-image  scripts-openstack
ubuntu@gelani-lab-1:~$ ll
total 140
drwxr-x--- 10 ubuntu ubuntu  4096 Mar 12 06:26 ./
drwxr-xr-x  3 root   root    4096 Jan 19 10:56 ../
-rw-------  1 ubuntu ubuntu 75262 Mar 12 04:46 .bash_history
-rw-r--r--  1 ubuntu ubuntu   220 Jan  6  2022 .bash_logout
-rw-r--r--  1 ubuntu ubuntu  3771 Jan  6  2022 .bashrc
drwx------  3 ubuntu ubuntu  4096 Jan 31 14:00 .cache/
drwxrwxr-x  6 ubuntu ubuntu  4096 Feb 26 19:54 .config/
drwxrwxr-x  3 ubuntu ubuntu  4096 Feb 15 06:14 .glanceclient/
-rw-------  1 ubuntu ubuntu    20 Feb 18 06:37 .lesshst
drwxrwxr-x  3 ubuntu ubuntu  4096 Feb 17 10:51 .local/
-rw-------  1 ubuntu ubuntu   803 Feb 15 10:01 .mysql_history
-rw-r--r--  1 ubuntu ubuntu   807 Jan  6  2022 .profile
drwx------  2 ubuntu ubuntu  4096 Mar 12 06:26 .ssh/
-rw-r--r--  1 ubuntu ubuntu     0 Jan 19 10:58 .sudo_as_admin_successful
-rw-rw-r--  1 ubuntu ubuntu   408 Feb 26 05:49 .wget-hsts
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 10 11:08 cloudinit-userdata/
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 10 11:42 raw-image/
drwxrwxr-x  2 ubuntu ubuntu  4096 Mar 12 03:47 scripts-openstack/
ubuntu@gelani-lab-1:~$ mkdir -p ~/image-factory/{packer,scripts,cloud-init,output,logs}
tree ~/image-factory
/home/ubuntu/image-factory
├── cloud-init
├── logs
├── output
├── packer
└── scripts

5 directories, 0 files
ubuntu@gelani-lab-1:~$ sudo apt update
sudo apt install -y unzip qemu-utils jq curl wget
Hit:1 http://security.ubuntu.com/ubuntu jammy-security InRelease
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease
Hit:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
2 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
curl is already the newest version (7.81.0-1ubuntu1.23).
jq is already the newest version (1.6-2.1ubuntu3.1).
qemu-utils is already the newest version (1:6.2+dfsg-2ubuntu6.28).
unzip is already the newest version (6.0-26ubuntu3.2).
wget is already the newest version (1.21.2-2ubuntu1.1).
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
ubuntu@gelani-lab-1:~$ qemu-img --version
jq --version
curl --version | head -n 1
qemu-img version 6.2.0 (Debian 1:6.2+dfsg-2ubuntu6.28)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
jq-1.6
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
ubuntu@gelani-lab-1:~$ packer version
-bash: /usr/local/bin/packer: No such file or directory
ubuntu@gelani-lab-1:~$ cd /tmp         
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.11.0/packer_1.11.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
ubuntu@gelani-lab-1:/tmp$ packer version
Packer v1.11.0

Your version of Packer is out of date! The latest version
is 1.15.0. You can update by downloading from www.packer.io/downloads
ubuntu@gelani-lab-1:/tmp$ cd /tmp
curl -fsSL -o packer.zip https://releases.hashicorp.com/packer/1.15.0/packer_1.15.0_linux_amd64.zip
unzip -o packer.zip
sudo mv -f packer /usr/local/bin/packer
packer version
Archive:  packer.zip
  inflating: LICENSE.txt             
  inflating: packer                  
Packer v1.15.0
ubuntu@gelani-lab-1:/tmp$ mkdir -p ~/images/base-image
ubuntu@gelani-lab-1:/tmp$ cd ~/images/base-image
ubuntu@gelani-lab-1:~/images/base-image$ wget -O noble.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-03-12 06:30:24--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.37, 185.125.190.40, 2620:2d:4000:1::17, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.37|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 629380096 (600M) [application/octet-stream]
Saving to: ‘noble.img’

noble.img                                                           100%[=================================================================================================================================================================>] 600.22M  15.2MB/s    in 52s     

2026-03-12 06:31:17 (11.6 MB/s) - ‘noble.img’ saved [629380096/629380096]

ubuntu@gelani-lab-1:~/images/base-image$ ls -lh noble.img
-rw-rw-r-- 1 ubuntu ubuntu 601M Mar  7 13:14 noble.img
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
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field            | Value                                                                                                                                                                                                                                                   |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| checksum         | feb5056f9206c4baf68b0b90b0f0432f                                                                                                                                                                                                                        |
| container_format | bare                                                                                                                                                                                                                                                    |
| created_at       | 2026-03-12T06:32:55Z                                                                                                                                                                                                                                    |
| disk_format      | qcow2                                                                                                                                                                                                                                                   |
| file             | /v2/images/9340852a-e317-4944-a321-6cd5e3f0f673/file                                                                                                                                                                                                    |
| id               | 9340852a-e317-4944-a321-6cd5e3f0f673                                                                                                                                                                                                                    |
| min_disk         | 0                                                                                                                                                                                                                                                       |
| min_ram          | 0                                                                                                                                                                                                                                                       |
| name             | ubuntu-24.04-base                                                                                                                                                                                                                                       |
| owner            | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                                                        |
| properties       | os_hash_algo='sha512', os_hash_value='5e703cc3191e04f0870f54db32ac5ba823b15c1c0eb76e2612c0736586f70d61854fea1bec412c71ebe49175b84913cae047e1baa06dc6c1fb8ea33a9284d2c1', os_hidden='False', owner_specified.openstack.md5='',                           |
|                  | owner_specified.openstack.object='images/ubuntu-24.04-base', owner_specified.openstack.sha256=''                                                                                                                                                        |
| protected        | False                                                                                                                                                                                                                                                   |
| schema           | /v2/schemas/image                                                                                                                                                                                                                                       |
| size             | 629380096                                                                                                                                                                                                                                               |
| status           | active                                                                                                                                                                                                                                                  |
| tags             |                                                                                                                                                                                                                                                         |
| updated_at       | 2026-03-12T06:33:06Z                                                                                                                                                                                                                                    |
| virtual_size     | 3758096384                                                                                                                                                                                                                                              |
| visibility       | public                                                                                                                                                                                                                                                  |
+------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack image show ubuntu-24.04-base -c id -c name -c status -c disk_format -c size
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| disk_format | qcow2                                |
| id          | 9340852a-e317-4944-a321-6cd5e3f0f673 |
| name        | ubuntu-24.04-base                    |
| size        | 629380096                            |
| status      | active                               |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ rbd ls -p images
9340852a-e317-4944-a321-6cd5e3f0f673
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group list | grep packer-build-sg
ubuntu@gelani-lab-1:~/images/base-image$ openstack security group create packer-build-sg && openstack security group rule create --proto tcp --dst-port 22 packer-build-sg && openstack security group rule create --proto icmp packer-build-sg && openstack security group show packer-build-sg
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                         |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-12T06:34:02Z                                                                                                                                                          |
| description     | packer-build-sg                                                                                                                                                               |
| id              | 1e9895d1-1672-4cc0-a988-48ccd059f5aa                                                                                                                                          |
| is_shared       | False                                                                                                                                                                         |
| name            | packer-build-sg                                                                                                                                                               |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                              |
| revision_number | 1                                                                                                                                                                             |
| rules           | created_at='2026-03-12T06:34:02Z', direction='egress', ethertype='IPv4', id='81361a63-878a-4ec7-b3d7-2904cc00cda3', standard_attr_id='204', updated_at='2026-03-12T06:34:02Z' |
|                 | created_at='2026-03-12T06:34:02Z', direction='egress', ethertype='IPv6', id='c0761abe-9812-4280-8869-164ba3d6e1a2', standard_attr_id='205', updated_at='2026-03-12T06:34:02Z' |
| stateful        | True                                                                                                                                                                          |
| tags            | []                                                                                                                                                                            |
| updated_at      | 2026-03-12T06:34:02Z                                                                                                                                                          |
+-----------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-12T06:34:04Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | 85fd058e-c0e5-4548-b3c5-dea9292b18ac |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | 22                                   |
| port_range_min          | 22                                   |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | tcp                                  |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | 1e9895d1-1672-4cc0-a988-48ccd059f5aa |
| updated_at              | 2026-03-12T06:34:04Z                 |
+-------------------------+--------------------------------------+
+-------------------------+--------------------------------------+
| Field                   | Value                                |
+-------------------------+--------------------------------------+
| belongs_to_default_sg   | False                                |
| created_at              | 2026-03-12T06:34:07Z                 |
| description             |                                      |
| direction               | ingress                              |
| ether_type              | IPv4                                 |
| id                      | db4d38ed-dba5-49dd-8fb7-762b5d80ec41 |
| normalized_cidr         | 0.0.0.0/0                            |
| port_range_max          | None                                 |
| port_range_min          | None                                 |
| project_id              | 99ab77b7592c418096336a7ccf9e299d     |
| protocol                | icmp                                 |
| remote_address_group_id | None                                 |
| remote_group_id         | None                                 |
| remote_ip_prefix        | 0.0.0.0/0                            |
| revision_number         | 0                                    |
| security_group_id       | 1e9895d1-1672-4cc0-a988-48ccd059f5aa |
| updated_at              | 2026-03-12T06:34:07Z                 |
+-------------------------+--------------------------------------+
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field           | Value                                                                                                                                                                                                                                                    |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| created_at      | 2026-03-12T06:34:02Z                                                                                                                                                                                                                                     |
| description     | packer-build-sg                                                                                                                                                                                                                                          |
| id              | 1e9895d1-1672-4cc0-a988-48ccd059f5aa                                                                                                                                                                                                                     |
| is_shared       | False                                                                                                                                                                                                                                                    |
| name            | packer-build-sg                                                                                                                                                                                                                                          |
| project_id      | 99ab77b7592c418096336a7ccf9e299d                                                                                                                                                                                                                         |
| revision_number | 3                                                                                                                                                                                                                                                        |
| rules           | created_at='2026-03-12T06:34:02Z', direction='egress', ethertype='IPv4', id='81361a63-878a-4ec7-b3d7-2904cc00cda3', standard_attr_id='204', updated_at='2026-03-12T06:34:02Z'                                                                            |
|                 | created_at='2026-03-12T06:34:04Z', direction='ingress', ethertype='IPv4', id='85fd058e-c0e5-4548-b3c5-dea9292b18ac', normalized_cidr='0.0.0.0/0', port_range_max='22', port_range_min='22', protocol='tcp', remote_ip_prefix='0.0.0.0/0',                |
|                 | standard_attr_id='206', updated_at='2026-03-12T06:34:04Z'                                                                                                                                                                                                |
|                 | created_at='2026-03-12T06:34:02Z', direction='egress', ethertype='IPv6', id='c0761abe-9812-4280-8869-164ba3d6e1a2', standard_attr_id='205', updated_at='2026-03-12T06:34:02Z'                                                                            |
|                 | created_at='2026-03-12T06:34:07Z', direction='ingress', ethertype='IPv4', id='db4d38ed-dba5-49dd-8fb7-762b5d80ec41', normalized_cidr='0.0.0.0/0', protocol='icmp', remote_ip_prefix='0.0.0.0/0', standard_attr_id='207',                                 |
|                 | updated_at='2026-03-12T06:34:07Z'                                                                                                                                                                                                                        |
| stateful        | True                                                                                                                                                                                                                                                     |
| tags            | []                                                                                                                                                                                                                                                       |
| updated_at      | 2026-03-12T06:34:07Z                                                                                                                                                                                                                                     |
+-----------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ ls ~/.ssh
authorized_keys  known_hosts  known_hosts.old
ubuntu@gelani-lab-1:~/images/base-image$ ssh-keygen -t ed25519 -f ~/.ssh/packer_build_key -N ""
Generating public/private ed25519 key pair.
Your identification has been saved in /home/ubuntu/.ssh/packer_build_key
Your public key has been saved in /home/ubuntu/.ssh/packer_build_key.pub
The key fingerprint is:
SHA256:0Xr3S5QJ7vcseYtLvWH+0ngIMhYO7ITysIpDdQZBXjQ ubuntu@gelani-lab-1
The key's randomart image is:
+--[ED25519 256]--+
|  .ooE           |
|  ... .  .       |
|   ..  o. . .    |
|   .oo. +o.. . o |
|  . o= oSo..o +  |
| .  . . ..=o.o.  |
|.. .     . o.o+O |
|o .         .oX+*|
| .           ooO*|
+----[SHA256]-----+
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/.ssh/packer_build_key ~/.ssh/packer_build_key.pub
-rw------- 1 ubuntu ubuntu 411 Mar 12 06:35 /home/ubuntu/.ssh/packer_build_key
-rw-r--r-- 1 ubuntu ubuntu 101 Mar 12 06:35 /home/ubuntu/.ssh/packer_build_key.pub
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair list | grep packer-build-key
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair create --public-key ~/.ssh/packer_build_key.pub packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | None                                            |
| fingerprint | b1:b1:4f:e8:27:2c:76:7d:20:42:7c:0e:0f:7b:6d:1e |
| id          | packer-build-key                                |
| is_deleted  | None                                            |
| name        | packer-build-key                                |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack keypair show packer-build-key
+-------------+-------------------------------------------------+
| Field       | Value                                           |
+-------------+-------------------------------------------------+
| created_at  | 2026-03-12T06:36:11.000000                      |
| fingerprint | b1:b1:4f:e8:27:2c:76:7d:20:42:7c:0e:0f:7b:6d:1e |
| id          | packer-build-key                                |
| is_deleted  | False                                           |
| name        | packer-build-key                                |
| private_key | None                                            |
| type        | ssh                                             |
| user_id     | 270824ef176044a2a8b64a8337e2f00a                |
+-------------+-------------------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/provision-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y dist-upgrade

apt-get install -y \
  qemu-guest-agent \
  cloud-init \
  curl \
  wget \
  vim \
  net-tools \
  ca-certificates

systemctl enable qemu-guest-agent || true
systemctl enable ssh || true

apt-get -y autoremove --purge
apt-get clear
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/provision-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 351 Mar 12 06:36 /home/ubuntu/image-factory/scripts/provision-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/cleanup-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

cloud-init clean --logs || true

truncate -s 0 /etc/machine-id || true
rm -f /var/lib/dbus/machine-id || true
ln -sf /etc/machine-id /var/lib/dbus/machine-id || true

rm -rf /tmp/* /var/tmp/* || true
find /var/log -type f -exec truncate -s 0 {} \; || true

apt-get clean
sync
ubuntu@gelani-lab-1:~/images/base-image$ chmod +x ~/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ ls -l ~/image-factory/scripts/cleanup-ubuntu.sh
-rwxrwxr-x 1 ubuntu ubuntu 316 Mar 12 06:37 /home/ubuntu/image-factory/scripts/cleanup-ubuntu.sh
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/scripts/cleanup-ubuntu.sh
#!/usr/bin/env bash
set -euxo pipefail

cloud-init clean --logs || true

truncate -s 0 /etc/machine-id || true
rm -f /var/lib/dbus/machine-id || true
ln -sf /etc/machine-id /var/lib/dbus/machine-id || true

rm -rf /tmp/* /var/tmp/* || true
find /var/log -type f -exec truncate -s 0 {} \; || true

apt-get clean
sync
ubuntu@gelani-lab-1:~/images/base-image$ nano ~/image-factory/packer/ubuntu-24.04.pkr.hcl
ubuntu@gelani-lab-1:~/images/base-image$ cat ~/image-factory/packer/ubuntu-24.04.pkr.hcl
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
  default = "a374dd2e-853a-41eb-88ca-b5730143b548"
}

source "openstack" "ubuntu2404" {
  image_name               = "ubuntu-24.04-${formatdate("YYYY-MM-DD-hhmm", timestamp())}"
  source_image_name        = "ubuntu-24.04-base"
  flavor                   = "m1.small"

  networks                 = [var.network_name]
  security_groups          = ["packer-build-sg"]

  ssh_username             = "ubuntu"
  ssh_private_key_file     = "~/.ssh/packer_build_key"
  ssh_keypair_name         = "packer-build-key"
  ssh_timeout              = "20m"

  ssh_interface            = "public"
  ssh_ip_version           = "4"

  floating_ip_network      = "public"
  instance_floating_ip_net = "a374dd2e-853a-41eb-88ca-b5730143b548"

  image_visibility         = "public"
  image_tags               = ["ubuntu", "24.04", "golden", "automated"]

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
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/provision-ubuntu.sh"
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; sudo -E {{ .Path }}"
    script          = "../scripts/cleanup-ubuntu.sh"
  }
}
ubuntu@gelani-lab-1:~/images/base-image$ openstack network list
+--------------------------------------+----------+--------------------------------------+
| ID                                   | Name     | Subnets                              |
+--------------------------------------+----------+--------------------------------------+
| a374dd2e-853a-41eb-88ca-b5730143b548 | private  | bd0d784b-b8ff-4577-998d-a546756f7b8b |
| abd82ede-929d-4f72-a034-e27922dda38f | public   | 65d17f74-a22e-452f-982f-5d641c6c6c57 |
| e83ed974-4855-4c7b-bfb6-949d6c49e829 | shared   | bbc63ac2-84de-4309-9a01-8f69e17a63c1 |
| ee6db446-7789-4b4e-9851-b4335a721c56 | heat-net |                                      |
+--------------------------------------+----------+--------------------------------------+
ubuntu@gelani-lab-1:~/images/base-image$ openstack network list | grep private
| a374dd2e-853a-41eb-88ca-b5730143b548 | private  | bd0d784b-b8ff-4577-998d-a546756f7b8b |
ubuntu@gelani-lab-1:~/images/base-image$ cd ~/image-factory/packer
packer init .
ubuntu@gelani-lab-1:~/image-factory/packer$ packer validate ubuntu-24.04.pkr.hcl
The configuration is valid.
ubuntu@gelani-lab-1:~/image-factory/packer$ packer build ubuntu-24.04.pkr.hcl
openstack.ubuntu2404: output will be in this color.

==> openstack.ubuntu2404: Loading flavor: m1.small
==> openstack.ubuntu2404: Verified flavor. ID: 2
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Using existing SSH private key
==> openstack.ubuntu2404: Found Image ID: 9340852a-e317-4944-a321-6cd5e3f0f673
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Launching server...
==> openstack.ubuntu2404: Server ID: 5dee0b00-2e98-4573-9679-b57b36c01108
==> openstack.ubuntu2404: Waiting for server to become ready...
==> openstack.ubuntu2404: Creating floating IP using network abd82ede-929d-4f72-a034-e27922dda38f ...
==> openstack.ubuntu2404: Created floating IP: '25bf739c-9cb1-4fb5-8eb6-6f1035c85b8c' (172.24.4.70)
==> openstack.ubuntu2404: Associating floating IP '25bf739c-9cb1-4fb5-8eb6-6f1035c85b8c' (172.24.4.70) with instance port...
==> openstack.ubuntu2404: Added floating IP '25bf739c-9cb1-4fb5-8eb6-6f1035c85b8c' (172.24.4.70) to instance!
==> openstack.ubuntu2404: Using SSH communicator to connect: 172.24.4.70
==> openstack.ubuntu2404: Waiting for SSH to become available...
==> openstack.ubuntu2404: Connected to SSH!
==> openstack.ubuntu2404: Provisioning with shell script: ../scripts/provision-ubuntu.sh
==> openstack.ubuntu2404: + export DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + DEBIAN_FRONTEND=noninteractive
==> openstack.ubuntu2404: + apt-get update
==> openstack.ubuntu2404: Get:1 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
==> openstack.ubuntu2404: Hit:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble InRelease
==> openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
==> openstack.ubuntu2404: Get:4 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
==> openstack.ubuntu2404: Get:5 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1507 kB]
==> openstack.ubuntu2404: Get:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
==> openstack.ubuntu2404: Get:7 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [241 kB]
==> openstack.ubuntu2404: Get:8 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.5 kB]
==> openstack.ubuntu2404: Get:9 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [10.1 kB]
==> openstack.ubuntu2404: Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [976 kB]
==> openstack.ubuntu2404: Get:11 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [218 kB]
==> openstack.ubuntu2404: Get:12 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.3 kB]
==> openstack.ubuntu2404: Get:13 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [20.6 kB]
==> openstack.ubuntu2404: Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2612 kB]
==> openstack.ubuntu2404: Get:15 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe Translation-en [5982 kB]
==> openstack.ubuntu2404: Get:16 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [603 kB]
==> openstack.ubuntu2404: Get:17 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]
==> openstack.ubuntu2404: Get:18 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [544 B]
==> openstack.ubuntu2404: Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]
==> openstack.ubuntu2404: Get:20 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6732 B]
==> openstack.ubuntu2404: Get:21 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
==> openstack.ubuntu2404: Get:22 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
==> openstack.ubuntu2404: Get:23 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 Components [3871 kB]
==> openstack.ubuntu2404: Get:24 http://nova.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 c-n-f Metadata [301 kB]
==> openstack.ubuntu2404: Get:25 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages [269 kB]
==> openstack.ubuntu2404: Get:26 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse Translation-en [118 kB]
==> openstack.ubuntu2404: Get:27 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 Components [35.0 kB]
==> openstack.ubuntu2404: Get:28 http://nova.clouds.archive.ubuntu.com/ubuntu noble/multiverse amd64 c-n-f Metadata [8328 B]
==> openstack.ubuntu2404: Get:29 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1807 kB]
==> openstack.ubuntu2404: Get:30 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main Translation-en [332 kB]
==> openstack.ubuntu2404: Get:31 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [178 kB]
==> openstack.ubuntu2404: Get:32 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 c-n-f Metadata [16.7 kB]
==> openstack.ubuntu2404: Get:33 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1566 kB]
==> openstack.ubuntu2404: Get:34 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [319 kB]
==> openstack.ubuntu2404: Get:35 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]
==> openstack.ubuntu2404: Get:36 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 c-n-f Metadata [32.9 kB]
==> openstack.ubuntu2404: Get:37 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [2748 kB]
==> openstack.ubuntu2404: Get:38 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
==> openstack.ubuntu2404: Get:39 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 c-n-f Metadata [556 B]
==> openstack.ubuntu2404: Get:40 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [32.1 kB]
==> openstack.ubuntu2404: Get:41 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse Translation-en [7044 B]
==> openstack.ubuntu2404: Get:42 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
==> openstack.ubuntu2404: Get:43 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 c-n-f Metadata [496 B]
==> openstack.ubuntu2404: Get:44 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Packages [40.4 kB]
==> openstack.ubuntu2404: Get:45 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main Translation-en [9208 B]
==> openstack.ubuntu2404: Get:46 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7300 B]
==> openstack.ubuntu2404: Get:47 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/main amd64 c-n-f Metadata [368 B]
==> openstack.ubuntu2404: Get:48 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [29.5 kB]
==> openstack.ubuntu2404: Get:49 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [17.9 kB]
==> openstack.ubuntu2404: Get:50 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [10.5 kB]
==> openstack.ubuntu2404: Get:51 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/universe amd64 c-n-f Metadata [1444 B]
==> openstack.ubuntu2404: Get:52 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [216 B]
==> openstack.ubuntu2404: Get:53 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 c-n-f Metadata [116 B]
==> openstack.ubuntu2404: Get:54 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]
==> openstack.ubuntu2404: Get:55 http://nova.clouds.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 c-n-f Metadata [116 B]
==> openstack.ubuntu2404: Fetched 39.9 MB in 11s (3569 kB/s)
==> openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: + apt-get -y dist-upgrade
==> openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: Building dependency tree...
==> openstack.ubuntu2404: Reading state information...
==> openstack.ubuntu2404: Calculating upgrade...
==> openstack.ubuntu2404: The following packages will be upgraded:
==> openstack.ubuntu2404:   curl libcurl3t64-gnutls libcurl4t64 libnftables1 libpython3.12-minimal
==> openstack.ubuntu2404:   libpython3.12-stdlib libpython3.12t64 nftables python3.12 python3.12-minimal
==> openstack.ubuntu2404: 10 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
==> openstack.ubuntu2404: Need to get 9566 kB of archives.
==> openstack.ubuntu2404: After this operation, 4096 B of additional disk space will be used.
==> openstack.ubuntu2404: Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12t64 amd64 3.12.3-1ubuntu0.12 [2345 kB]
==> openstack.ubuntu2404: Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12 amd64 3.12.3-1ubuntu0.12 [651 kB]
==> openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-stdlib amd64 3.12.3-1ubuntu0.12 [2069 kB]
==> openstack.ubuntu2404: Get:4 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 python3.12-minimal amd64 3.12.3-1ubuntu0.12 [2334 kB]
==> openstack.ubuntu2404: Get:5 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpython3.12-minimal amd64 3.12.3-1ubuntu0.12 [837 kB]
==> openstack.ubuntu2404: Get:6 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 nftables amd64 1.0.9-1ubuntu0.1 [69.8 kB]
==> openstack.ubuntu2404: Get:7 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libnftables1 amd64 1.0.9-1ubuntu0.1 [359 kB]
==> openstack.ubuntu2404: Get:8 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 curl amd64 8.5.0-2ubuntu10.8 [227 kB]
==> openstack.ubuntu2404: Get:9 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libcurl4t64 amd64 8.5.0-2ubuntu10.8 [342 kB]
==> openstack.ubuntu2404: Get:10 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libcurl3t64-gnutls amd64 8.5.0-2ubuntu10.8 [334 kB]
==> openstack.ubuntu2404: Fetched 9566 kB in 15min 6s (10.6 kB/s)
==> openstack.ubuntu2404: (Reading database ... 75035 files and directories currently installed.)
==> openstack.ubuntu2404: Preparing to unpack .../0-libpython3.12t64_3.12.3-1ubuntu0.12_amd64.deb ...
==> openstack.ubuntu2404: Unpacking libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
==> openstack.ubuntu2404: Preparing to unpack .../1-python3.12_3.12.3-1ubuntu0.12_amd64.deb ...
==> openstack.ubuntu2404: Unpacking python3.12 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
==> openstack.ubuntu2404: Preparing to unpack .../2-libpython3.12-stdlib_3.12.3-1ubuntu0.12_amd64.deb ...
==> openstack.ubuntu2404: Unpacking libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
==> openstack.ubuntu2404: Preparing to unpack .../3-python3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
==> openstack.ubuntu2404: Unpacking python3.12-minimal (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
==> openstack.ubuntu2404: Preparing to unpack .../4-libpython3.12-minimal_3.12.3-1ubuntu0.12_amd64.deb ...
==> openstack.ubuntu2404: Unpacking libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) over (3.12.3-1ubuntu0.11) ...
==> openstack.ubuntu2404: Preparing to unpack .../5-nftables_1.0.9-1ubuntu0.1_amd64.deb ...
==> openstack.ubuntu2404: Unpacking nftables (1.0.9-1ubuntu0.1) over (1.0.9-1build1) ...
==> openstack.ubuntu2404: Preparing to unpack .../6-libnftables1_1.0.9-1ubuntu0.1_amd64.deb ...
==> openstack.ubuntu2404: Unpacking libnftables1:amd64 (1.0.9-1ubuntu0.1) over (1.0.9-1build1) ...
==> openstack.ubuntu2404: Preparing to unpack .../7-curl_8.5.0-2ubuntu10.8_amd64.deb ...
==> openstack.ubuntu2404: Unpacking curl (8.5.0-2ubuntu10.8) over (8.5.0-2ubuntu10.7) ...
==> openstack.ubuntu2404: Preparing to unpack .../8-libcurl4t64_8.5.0-2ubuntu10.8_amd64.deb ...
==> openstack.ubuntu2404: Unpacking libcurl4t64:amd64 (8.5.0-2ubuntu10.8) over (8.5.0-2ubuntu10.7) ...
==> openstack.ubuntu2404: Preparing to unpack .../9-libcurl3t64-gnutls_8.5.0-2ubuntu10.8_amd64.deb ...
==> openstack.ubuntu2404: Unpacking libcurl3t64-gnutls:amd64 (8.5.0-2ubuntu10.8) over (8.5.0-2ubuntu10.7) ...
==> openstack.ubuntu2404: Setting up libnftables1:amd64 (1.0.9-1ubuntu0.1) ...
==> openstack.ubuntu2404: Setting up nftables (1.0.9-1ubuntu0.1) ...
==> openstack.ubuntu2404: Setting up libcurl4t64:amd64 (8.5.0-2ubuntu10.8) ...
==> openstack.ubuntu2404: Setting up libpython3.12-minimal:amd64 (3.12.3-1ubuntu0.12) ...
==> openstack.ubuntu2404: Setting up libcurl3t64-gnutls:amd64 (8.5.0-2ubuntu10.8) ...
==> openstack.ubuntu2404: Setting up curl (8.5.0-2ubuntu10.8) ...
==> openstack.ubuntu2404: Setting up python3.12-minimal (3.12.3-1ubuntu0.12) ...
==> openstack.ubuntu2404: Setting up libpython3.12-stdlib:amd64 (3.12.3-1ubuntu0.12) ...
==> openstack.ubuntu2404: Setting up python3.12 (3.12.3-1ubuntu0.12) ...
==> openstack.ubuntu2404: Setting up libpython3.12t64:amd64 (3.12.3-1ubuntu0.12) ...
==> openstack.ubuntu2404: Processing triggers for systemd (255.4-1ubuntu8.12) ...
==> openstack.ubuntu2404: Processing triggers for man-db (2.12.0-4build2) ...
==> openstack.ubuntu2404: Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Running kernel seems to be up-to-date.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Restarting services...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Service restarts being deferred:
==> openstack.ubuntu2404:  systemctl restart unattended-upgrades.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No containers need to be restarted.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No user sessions are running outdated binaries.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No VM guests are running outdated hypervisor (qemu) binaries on this host.
==> openstack.ubuntu2404: + apt-get install -y qemu-guest-agent cloud-init curl wget vim net-tools ca-certificates
==> openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: Building dependency tree...
==> openstack.ubuntu2404: Reading state information...
==> openstack.ubuntu2404: cloud-init is already the newest version (25.3-0ubuntu1~24.04.1).
==> openstack.ubuntu2404: curl is already the newest version (8.5.0-2ubuntu10.8).
==> openstack.ubuntu2404: curl set to manually installed.
==> openstack.ubuntu2404: wget is already the newest version (1.21.4-1ubuntu4.1).
==> openstack.ubuntu2404: wget set to manually installed.
==> openstack.ubuntu2404: vim is already the newest version (2:9.1.0016-1ubuntu7.9).
==> openstack.ubuntu2404: vim set to manually installed.
==> openstack.ubuntu2404: ca-certificates is already the newest version (20240203).
==> openstack.ubuntu2404: ca-certificates set to manually installed.
==> openstack.ubuntu2404: The following additional packages will be installed:
==> openstack.ubuntu2404:   liburing2
==> openstack.ubuntu2404: The following NEW packages will be installed:
==> openstack.ubuntu2404:   liburing2 net-tools qemu-guest-agent
==> openstack.ubuntu2404: 0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
==> openstack.ubuntu2404: Need to get 616 kB of archives.
==> openstack.ubuntu2404: After this operation, 2113 kB of additional disk space will be used.
==> openstack.ubuntu2404: Get:1 http://nova.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liburing2 amd64 2.5-1build1 [21.1 kB]
==> openstack.ubuntu2404: Get:2 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 qemu-guest-agent amd64 1:8.2.2+ds-0ubuntu1.13 [390 kB]
==> openstack.ubuntu2404: Get:3 http://nova.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 net-tools amd64 2.10-0.1ubuntu4.4 [204 kB]
==> openstack.ubuntu2404: Fetched 616 kB in 2s (250 kB/s)
==> openstack.ubuntu2404: Selecting previously unselected package liburing2:amd64.
==> openstack.ubuntu2404: (Reading database ... 75035 files and directories currently installed.)
==> openstack.ubuntu2404: Preparing to unpack .../liburing2_2.5-1build1_amd64.deb ...
==> openstack.ubuntu2404: Unpacking liburing2:amd64 (2.5-1build1) ...
==> openstack.ubuntu2404: Selecting previously unselected package qemu-guest-agent.
==> openstack.ubuntu2404: Preparing to unpack .../qemu-guest-agent_1%3a8.2.2+ds-0ubuntu1.13_amd64.deb ...
==> openstack.ubuntu2404: Unpacking qemu-guest-agent (1:8.2.2+ds-0ubuntu1.13) ...
==> openstack.ubuntu2404: Selecting previously unselected package net-tools.
==> openstack.ubuntu2404: Preparing to unpack .../net-tools_2.10-0.1ubuntu4.4_amd64.deb ...
==> openstack.ubuntu2404: Unpacking net-tools (2.10-0.1ubuntu4.4) ...
==> openstack.ubuntu2404: Setting up net-tools (2.10-0.1ubuntu4.4) ...
==> openstack.ubuntu2404: Setting up liburing2:amd64 (2.5-1build1) ...
==> openstack.ubuntu2404: Setting up qemu-guest-agent (1:8.2.2+ds-0ubuntu1.13) ...
==> openstack.ubuntu2404: qemu-guest-agent.service is a disabled or a static unit, not starting it.
==> openstack.ubuntu2404: Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
==> openstack.ubuntu2404: Processing triggers for man-db (2.12.0-4build2) ...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Running kernel seems to be up-to-date.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Restarting services...
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Service restarts being deferred:
==> openstack.ubuntu2404:  systemctl restart unattended-upgrades.service
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No containers need to be restarted.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No user sessions are running outdated binaries.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: No VM guests are running outdated hypervisor (qemu) binaries on this host.
==> openstack.ubuntu2404: + systemctl enable qemu-guest-agent
==> openstack.ubuntu2404: Synchronizing state of qemu-guest-agent.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
==> openstack.ubuntu2404: Executing: /usr/lib/systemd/systemd-sysv-install enable qemu-guest-agent
==> openstack.ubuntu2404: The unit files have no installation config (WantedBy=, RequiredBy=, UpheldBy=,
==> openstack.ubuntu2404: Also=, or Alias= settings in the [Install] section, and DefaultInstance= for
==> openstack.ubuntu2404: template units). This means they are not meant to be enabled or disabled using systemctl.
==> openstack.ubuntu2404:
==> openstack.ubuntu2404: Possible reasons for having these kinds of units are:
==> openstack.ubuntu2404: • A unit may be statically enabled by being symlinked from another unit's
==> openstack.ubuntu2404:   .wants/, .requires/, or .upholds/ directory.
==> openstack.ubuntu2404: • A unit's purpose may be to act as a helper for some other unit which has
==> openstack.ubuntu2404:   a requirement dependency on it.
==> openstack.ubuntu2404: • A unit may be started when needed via activation (socket, path, timer,
==> openstack.ubuntu2404:   D-Bus, udev, scripted systemctl call, ...).
==> openstack.ubuntu2404: • In case of template units, the unit is meant to be enabled with some
==> openstack.ubuntu2404:   instance name specified.
==> openstack.ubuntu2404: + systemctl enable ssh
==> openstack.ubuntu2404: Synchronizing state of ssh.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
==> openstack.ubuntu2404: Executing: /usr/lib/systemd/systemd-sysv-install enable ssh
==> openstack.ubuntu2404: Created symlink /etc/systemd/system/sshd.service → /usr/lib/systemd/system/ssh.service.
==> openstack.ubuntu2404: Created symlink /etc/systemd/system/multi-user.target.wants/ssh.service → /usr/lib/systemd/system/ssh.service.
==> openstack.ubuntu2404: + apt-get -y autoremove --purge
==> openstack.ubuntu2404: Reading package lists...
==> openstack.ubuntu2404: Building dependency tree...
==> openstack.ubuntu2404: Reading state information...
==> openstack.ubuntu2404: 0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
==> openstack.ubuntu2404: + apt-get clear
==> openstack.ubuntu2404: E: Invalid operation clear
==> openstack.ubuntu2404: Provisioning step had errors: Running the cleanup provisioner, if present...
==> openstack.ubuntu2404: Deleted temporary floating IP '25bf739c-9cb1-4fb5-8eb6-6f1035c85b8c' (172.24.4.70)
==> openstack.ubuntu2404: Terminating the source server: 5dee0b00-2e98-4573-9679-b57b36c01108 ...
Build 'openstack.ubuntu2404' errored after 17 minutes 25 seconds: Script exited with non-zero exit status: 100. Allowed exit codes are: [0]

==> Wait completed after 17 minutes 25 seconds

==> Some builds didn't complete successfully and had errors:
--> openstack.ubuntu2404: Script exited with non-zero exit status: 100. Allowed exit codes are: [0]

==> Builds finished but no artifacts were created.
ubuntu@gelani-lab-1:~/image-factory/packer$ 
```

**Have to study on this phase in details""
```

```





































