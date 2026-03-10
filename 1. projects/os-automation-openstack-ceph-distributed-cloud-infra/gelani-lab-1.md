

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
