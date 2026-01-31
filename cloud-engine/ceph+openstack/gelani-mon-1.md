```
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.19
ubuntu@192.168.95.19's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Jan 31 07:54:41 UTC 2026

  System load:  0.0                Processes:             145
  Usage of /:   16.6% of 38.58GB   Users logged in:       0
  Memory usage: 50%                IPv4 address for ens3: 192.168.95.19
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

8 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

2 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm


Last login: Thu Jan 29 06:32:34 2026 from 192.168.95.86
ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# ceph osd pool ls
.mgr
volume
images
vms
backups
rgw.meta
rgw.control
rgw.log
rgw.buckets.data
rgw.buckets.index
.rgw.root
gelani-zone.rgw.log
gelani-zone.rgw.control
gelani-zone.rgw.meta
gelani-zone.rgw.buckets.index
gelani-zone.rgw.buckets.data
gelani-zone.rgw.buckets.non-ec
root@gelani-mon-1:/# ceph auth get-or-create client.glance \
  mon "profile rbd" \
  osd "profile rbd pool=images" \
  -o /etc/ceph/ceph.client.glance.keyring
root@gelani-mon-1:/# ceph auth get-or-create client.cinder \
  mon "profile rbd" \
  osd "profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images" \
  -o /etc/ceph/ceph.client.cinder.keyring
root@gelani-mon-1:/# ceph auth get-or-create client.nova \
  mon "profile rbd" \
  osd "profile rbd pool=vms" \
  -o /etc/ceph/ceph.client.nova.keyring
root@gelani-mon-1:/# ceph auth get-or-create client.cinder \
  mon "profile rbd" \
  osd "profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images" \
  -o /etc/ceph/ceph.client.cinder.keyring
root@gelani-mon-1:/# ceph auth get-or-create client.nova \
  mon "profile rbd" \
  osd "profile rbd pool=vms" \
  -o /etc/ceph/ceph.client.nova.keyring
root@gelani-mon-1:/# ceph auth ls | egrep 'client.glance|client.cinder|client.nova'
ls -l /etc/ceph/ceph.client.*.keyring
client.cinder
client.glance
client.nova
-rw-r--r-- 1 root root 64 Jan 31 08:16 /etc/ceph/ceph.client.cinder.keyring
-rw-r--r-- 1 root root 64 Jan 31 08:04 /etc/ceph/ceph.client.glance.keyring
-rw-r--r-- 1 root root 62 Jan 31 08:16 /etc/ceph/ceph.client.nova.keyring
root@gelani-mon-1:/# ceph config generate-minimal-conf > /etc/ceph/ceph.conf
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-01-31T08:19:46.888+0000 7f9aba35f640 -1 failed for service _ceph-mon._tcp

2026-01-31T08:19:46.888+0000 7f9aba35f640 -1 monclient: get_monmap_and_config cannot identify monitors to contact

[errno 2] RADOS object not found (error connecting to the cluster)
root@gelani-mon-1:/# ls /var/lib/ceph/*/mon.gelani-mon-1/config
ls: cannot access '/var/lib/ceph/*/mon.gelani-mon-1/config': No such file or directory
root@gelani-mon-1:/# sudo ls /var/lib/ceph/*/mon.gelani-mon-1/config
ls: cannot access '/var/lib/ceph/*/mon.gelani-mon-1/config': No such file or directory
root@gelani-mon-1:/# ls /var/lib/ceph/*/
/var/lib/ceph/bootstrap-mds/:

/var/lib/ceph/bootstrap-mgr/:

/var/lib/ceph/bootstrap-osd/:

/var/lib/ceph/bootstrap-rbd-mirror/:

/var/lib/ceph/bootstrap-rbd/:

/var/lib/ceph/bootstrap-rgw/:

/var/lib/ceph/crash/:
posted

/var/lib/ceph/mds/:

/var/lib/ceph/mgr/:

/var/lib/ceph/mon/:

/var/lib/ceph/osd/:

/var/lib/ceph/radosgw/:

/var/lib/ceph/tmp/:
root@gelani-mon-1:/# cephadm shell
ERROR: No container engine binary found (podman or docker). Try run `apt/dnf/yum/zypper install <container engine>`
root@gelani-mon-1:/# exit
exit
ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# ceph -s
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-01-31T08:28:12.224+0000 7f3b8a0bd640 -1 failed for service _ceph-mon._tcp

2026-01-31T08:28:12.224+0000 7f3b8a0bd640 -1 monclient: get_monmap_and_config cannot identify monitors to contact

[errno 2] RADOS object not found (error connecting to the cluster)
root@gelani-mon-1:/# sudo cephadm ls
ERROR: No container engine binary found (podman or docker). Try run `apt/dnf/yum/zypper install <container engine>`
root@gelani-mon-1:/# 
``` 
