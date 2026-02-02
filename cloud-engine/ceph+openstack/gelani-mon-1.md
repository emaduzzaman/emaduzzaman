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
root@gelani-mon-1:/# client_loop: send disconnect: Broken pipe
emaduzzaman@emaduzzaman:~$ which docker
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.19
ubuntu@192.168.95.19's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sat Jan 31 12:35:14 UTC 2026

  System load:  0.05               Processes:             146
  Usage of /:   16.9% of 38.58GB   Users logged in:       0
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

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Sat Jan 31 07:54:41 2026 from 192.168.95.86
ubuntu@gelani-mon-1:~$ which docker
/usr/bin/docker
ubuntu@gelani-mon-1:~$ docker --version
Docker version 28.2.2, build 28.2.2-0ubuntu1~22.04.1
ubuntu@gelani-mon-1:~$ docker --version
Docker version 28.2.2, build 28.2.2-0ubuntu1~22.04.1
ubuntu@gelani-mon-1:~$ sudo systemctl status docker
● docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Wed 2026-01-28 05:58:20 UTC; 3 days ago
TriggeredBy: ● docker.socket
       Docs: https://docs.docker.com
   Main PID: 1818 (dockerd)
      Tasks: 21
     Memory: 462.5M
        CPU: 4min 1.676s
     CGroup: /system.slice/docker.service
             └─1818 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jan 31 10:05:55 gelani-mon-1 dockerd[1818]: time="2026-01-31T10:05:55.366446028Z" level=info msg="ignoring event" co>
Jan 31 10:36:37 gelani-mon-1 dockerd[1818]: time="2026-01-31T10:36:37.117307377Z" level=info msg="ignoring event" co>
Jan 31 10:36:38 gelani-mon-1 dockerd[1818]: time="2026-01-31T10:36:38.258404195Z" level=info msg="ignoring event" co>
Jan 31 10:43:20 gelani-mon-1 dockerd[1818]: time="2026-01-31T10:43:20.348044555Z" level=info msg="ignoring event" co>
Jan 31 11:07:19 gelani-mon-1 dockerd[1818]: time="2026-01-31T11:07:19.670897358Z" level=info msg="ignoring event" co>
Jan 31 11:07:20 gelani-mon-1 dockerd[1818]: time="2026-01-31T11:07:20.718169302Z" level=info msg="ignoring event" co>
Jan 31 11:38:02 gelani-mon-1 dockerd[1818]: time="2026-01-31T11:38:02.432231294Z" level=info msg="ignoring event" co>
Jan 31 11:38:03 gelani-mon-1 dockerd[1818]: time="2026-01-31T11:38:03.472748971Z" level=info msg="ignoring event" co>
Jan 31 12:08:45 gelani-mon-1 dockerd[1818]: time="2026-01-31T12:08:45.269159960Z" level=info msg="ignoring event" co>
Jan 31 12:08:46 gelani-mon-1 dockerd[1818]: time="2026-01-31T12:08:46.343441610Z" level=info msg="ignoring event" co>

ubuntu@gelani-mon-1:~$ sudo cephadm
No command specified; pass -h or --help for usage
ubuntu@gelani-mon-1:~$ sudo cephadm ls
[
    {
        "style": "cephadm:v1",
        "name": "grafana.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@grafana.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "grafana",
        "ports": [
            3000
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "d3212a8fe771d61c7153b9bdde32993c225687d0b414954c01712936aecb910e",
        "container_image_name": "quay.io/ceph/ceph-grafana:9.4.7",
        "container_image_id": "954c08fa618887fe9a6fe572ae541197c77e625b05f4193df7898f5ac649ada9",
        "container_image_digests": [
            "quay.io/ceph/ceph-grafana@sha256:97d919ad919187a9b924574c2480be30f840d252447bc0a91ff5213f3cf7f4b1"
        ],
        "memory_usage": 86759178,
        "cpu_percentage": "3.11%",
        "version": "9.4.7",
        "started": "2026-01-28T06:03:50.879003Z",
        "created": "2026-01-28T06:02:58.191193Z",
        "deployed": "2026-01-28T06:02:57.695190Z",
        "configured": "2026-01-28T06:03:50.607419Z"
    },
    {
        "style": "cephadm:v1",
        "name": "alertmanager.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@alertmanager.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "alertmanager",
        "ports": [
            9093,
            9094
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "cb53c3eb0871bb512a3d6ac791818427411457af96835bd8f99d6e184377bac0",
        "container_image_name": "quay.io/prometheus/alertmanager:v0.25.0",
        "container_image_id": "c8568f914cd25b2062c44e9f79f9c18da6e3b85fe0c47a12a2191c61426c2b19",
        "container_image_digests": [
            "quay.io/prometheus/alertmanager@sha256:fd4d9a3dd1fd0125108417be21be917f19cc76262347086509a0d43f29b80e98"
        ],
        "memory_usage": 15770583,
        "cpu_percentage": "0.06%",
        "version": "0.25.0",
        "started": "2026-01-28T06:42:22.711536Z",
        "created": "2026-01-28T06:01:39.754853Z",
        "deployed": "2026-01-28T06:01:39.214851Z",
        "configured": "2026-01-28T06:42:22.434511Z"
    },
    {
        "style": "cephadm:v1",
        "name": "mgr.gelani-mon-1.gzltah",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mgr.gelani-mon-1.gzltah",
        "enabled": true,
        "state": "running",
        "service_name": "mgr",
        "memory_request": null,
        "memory_limit": null,
        "ports": [
            9283,
            8765,
            8443
        ],
        "container_id": "504af1640bd600d05b3556589c158176c831f9d9946e50607d01a2ed5a1132c8",
        "container_image_name": "quay.io/ceph/ceph:v17",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 596325171,
        "cpu_percentage": "0.17%",
        "version": "17.2.8",
        "started": "2026-01-28T06:00:44.373377Z",
        "created": "2026-01-28T06:00:44.322613Z",
        "deployed": "2026-01-28T06:00:43.870611Z",
        "configured": "2026-01-28T06:42:11.158417Z"
    },
    {
        "style": "cephadm:v1",
        "name": "node-exporter.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@node-exporter.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "node-exporter",
        "ports": [
            9100
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "cb7a32fb0b5f07056a9d93fec510473250b25a339761caddb4f4998d73488c75",
        "container_image_name": "quay.io/prometheus/node-exporter:v1.5.0",
        "container_image_id": "0da6a335fe1356545476b749c68f022c897de3a2139e8f0054f6937349ee2b83",
        "container_image_digests": [
            "quay.io/prometheus/node-exporter@sha256:39c642b2b337e38c18e80266fb14383754178202f40103646337722a594d984c"
        ],
        "memory_usage": 10034872,
        "cpu_percentage": "0.00%",
        "version": "1.5.0",
        "started": "2026-01-28T06:01:40.445161Z",
        "created": "2026-01-28T06:01:30.166811Z",
        "deployed": "2026-01-28T06:01:29.670809Z",
        "configured": "2026-01-28T06:01:30.166811Z"
    },
    {
        "style": "cephadm:v1",
        "name": "prometheus.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@prometheus.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "prometheus",
        "ports": [
            9095
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "64264f6645d72bbbd9c45933ee8e8913810e45138f64a35983217743cad0229c",
        "container_image_name": "quay.io/prometheus/prometheus:v2.43.0",
        "container_image_id": "a07b618ecd1dce142bce4c52f0e80982eaf1f14265a2415c2d35978ccaa0a464",
        "container_image_digests": [
            "quay.io/prometheus/prometheus@sha256:f5c29683a301d4e5427fb0d985f794b1f743498310a4eadee75e85f5dba73a6d"
        ],
        "memory_usage": 97590968,
        "cpu_percentage": "4.48%",
        "version": "2.43.0",
        "started": "2026-01-28T06:42:23.582857Z",
        "created": "2026-01-28T06:03:36.683359Z",
        "deployed": "2026-01-28T06:03:36.179357Z",
        "configured": "2026-01-28T06:42:23.334519Z"
    },
    {
        "style": "cephadm:v1",
        "name": "crash.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@crash.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "crash",
        "ports": [],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "8dfbc6d6774da32799d09cc8eb1606c5dc652ac78901f11c394f500ce666bf16",
        "container_image_name": "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 7557087,
        "cpu_percentage": "0.00%",
        "version": "17.2.8",
        "started": "2026-01-28T06:01:29.467207Z",
        "created": "2026-01-28T06:01:29.382808Z",
        "deployed": "2026-01-28T06:01:28.866806Z",
        "configured": "2026-01-28T06:42:11.598421Z"
    },
    {
        "style": "cephadm:v1",
        "name": "rgw.gelani.gelani-mon-1.cceitw",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@rgw.gelani.gelani-mon-1.cceitw",
        "enabled": true,
        "state": "running",
        "service_name": "rgw.gelani",
        "ports": [
            7480
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "268d7d785ba53fe8b5ccc972917a0341c38c663877794b11514c62ad365fb136",
        "container_image_name": "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 275880345,
        "cpu_percentage": "0.14%",
        "version": "17.2.8",
        "started": "2026-01-29T06:40:43.243943Z",
        "created": "2026-01-29T06:40:43.169950Z",
        "deployed": "2026-01-29T06:40:42.669946Z",
        "configured": "2026-01-29T06:40:43.169950Z"
    },
    {
        "style": "cephadm:v1",
        "name": "mon.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "mon",
        "memory_request": null,
        "memory_limit": null,
        "ports": [],
        "container_id": "42ffb7d672628deb2c905b635e955551ad073730baa38a3a089e6154d668e810",
        "container_image_name": "quay.io/ceph/ceph:v17",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 456549990,
        "cpu_percentage": "0.67%",
        "version": "17.2.8",
        "started": "2026-01-28T06:00:43.148594Z",
        "created": "2026-01-28T06:00:41.518601Z",
        "deployed": "2026-01-28T06:00:40.370596Z",
        "configured": "2026-01-28T06:42:12.034425Z"
    }
]
ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# ceph -s
unable to get monitor info from DNS SRV with service name: ceph-mon
[errno 2] RADOS object not found (error connecting to the cluster)
root@gelani-mon-1:/# exit
exit
ubuntu@gelani-mon-1:~$ sudo ls -l /etc/ceph/
total 16
-rw------- 1 root root 151 Jan 29 06:56 ceph.client.admin.keyring
-rw-r--r-- 1 root root 281 Jan 29 06:56 ceph.conf
-rw-r--r-- 1 root ceph 595 Jan 28 06:01 ceph.pub
-rw-r--r-- 1 root ceph  92 Aug 21 11:33 rbdmap
ubuntu@gelani-mon-1:~$ sudo tee /etc/ceph/ceph.conf >/dev/null <<'EOF'
[global]
fsid = a9625cff-fc0e-11f0-a1f6-6998182b0a5e
mon_host = 192.168.95.19,192.168.95.240,192.168.95.221
public_network = 192.168.95.0/24
EOF
ubuntu@gelani-mon-1:~$ sudo chmod 644 /etc/ceph/ceph.conf
ubuntu@gelani-mon-1:~$ sudo ls -l /etc/ceph/ceph.client.admin.keyring
-rw------- 1 root root 151 Jan 29 06:56 /etc/ceph/ceph.client.admin.keyring
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            Degraded data redundancy: 423/1289 objects degraded (32.816%), 106 pgs degraded, 224 pgs undersized
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 433 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     423/1289 objects degraded (32.816%)
             241 active+clean
             118 active+undersized
             106 active+undersized+degraded
 
ubuntu@gelani-mon-1:~$ sudo ceph osd pool ls detail | egrep 'pool|size'
pool 1 '.mgr' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 1 pgp_num 1 autoscale_mode on last_change 23 flags hashpspool stripe_width 0 pg_num_max 32 pg_num_min 1 application mgr
pool 2 'volume' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 50 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 3 'images' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 53 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 4 'vms' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 56 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 5 'backups' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 59 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 6 'rgw.meta' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 89 flags hashpspool stripe_width 0 application rgw
pool 7 'rgw.control' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 90 flags hashpspool stripe_width 0 application rgw
pool 8 'rgw.log' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 91 flags hashpspool stripe_width 0 application rgw
pool 9 'rgw.buckets.data' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 64 pgp_num 64 autoscale_mode on last_change 92 flags hashpspool stripe_width 0 application rgw
pool 10 'rgw.buckets.index' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 93 flags hashpspool stripe_width 0 application rgw
pool 11 '.rgw.root' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 98 lfor 0/0/98 flags hashpspool stripe_width 0 application rgw
pool 12 'gelani-zone.rgw.log' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 106 lfor 0/0/106 flags hashpspool stripe_width 0 application rgw
pool 13 'gelani-zone.rgw.control' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 108 lfor 0/0/108 flags hashpspool stripe_width 0 application rgw
pool 14 'gelani-zone.rgw.meta' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 108 lfor 0/0/108 flags hashpspool stripe_width 0 pg_autoscale_bias 4 application rgw
pool 15 'gelani-zone.rgw.buckets.index' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 117 lfor 0/0/117 flags hashpspool stripe_width 0 pg_autoscale_bias 4 application rgw
pool 16 'gelani-zone.rgw.buckets.data' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 119 lfor 0/0/119 flags hashpspool stripe_width 0 application rgw
pool 17 'gelani-zone.rgw.buckets.non-ec' replicated size 3 min_size 2 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 1 pgp_num_target 32 autoscale_mode on last_change 125 lfor 0/0/125 flags hashpspool stripe_width 0 application rgw
ubuntu@gelani-mon-1:~$ sudo ceph config set global osd_pool_default_size 2
ubuntu@gelani-mon-1:~$ sudo ceph config set global osd_pool_default_min_size 1
ubuntu@gelani-mon-1:~$ for p in $(sudo ceph osd pool ls); do
  echo "Setting pool $p size=2 min_size=1"
  sudo ceph osd pool set "$p" size 2
  sudo ceph osd pool set "$p" min_size 1
done
Setting pool .mgr size=2 min_size=1
set pool 1 size to 2
set pool 1 min_size to 1
Setting pool volume size=2 min_size=1
set pool 2 size to 2
set pool 2 min_size to 1
Setting pool images size=2 min_size=1
set pool 3 size to 2
set pool 3 min_size to 1
Setting pool vms size=2 min_size=1
set pool 4 size to 2
set pool 4 min_size to 1
Setting pool backups size=2 min_size=1
set pool 5 size to 2
set pool 5 min_size to 1
Setting pool rgw.meta size=2 min_size=1
set pool 6 size to 2
set pool 6 min_size to 1
Setting pool rgw.control size=2 min_size=1
set pool 7 size to 2
set pool 7 min_size to 1
Setting pool rgw.log size=2 min_size=1
set pool 8 size to 2
set pool 8 min_size to 1
Setting pool rgw.buckets.data size=2 min_size=1
set pool 9 size to 2
set pool 9 min_size to 1
Setting pool rgw.buckets.index size=2 min_size=1
set pool 10 size to 2
set pool 10 min_size to 1
Setting pool .rgw.root size=2 min_size=1
set pool 11 size to 2
set pool 11 min_size to 1
Setting pool gelani-zone.rgw.log size=2 min_size=1
set pool 12 size to 2
set pool 12 min_size to 1
Setting pool gelani-zone.rgw.control size=2 min_size=1
set pool 13 size to 2
set pool 13 min_size to 1
Setting pool gelani-zone.rgw.meta size=2 min_size=1
set pool 14 size to 2
set pool 14 min_size to 1
Setting pool gelani-zone.rgw.buckets.index size=2 min_size=1
set pool 15 size to 2
set pool 15 min_size to 1
Setting pool gelani-zone.rgw.buckets.data size=2 min_size=1
set pool 16 size to 2
set pool 16 min_size to 1
Setting pool gelani-zone.rgw.buckets.non-ec size=2 min_size=1
set pool 17 size to 2
set pool 17 min_size to 1
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_WARN
            Reduced data availability: 1 pg peering
            Degraded data redundancy: 44/830 objects degraded (5.301%), 4 pgs degraded
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d); 7 remapped pgs
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 415 objects, 561 MiB
    usage:   3.1 GiB used, 177 GiB / 180 GiB avail
    pgs:     2.151% pgs not active
             44/830 objects degraded (5.301%)
             53/830 objects misplaced (6.386%)
             444 active+clean
             10  peering
             4   active+remapped+backfill_wait
             4   active+recovery_wait+degraded
             2   active+recovering
             1   active+remapped
 
ubuntu@gelani-mon-1:~$ sudo ceph health detail
HEALTH_OK
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d); 1 remapped pgs
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 442 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     464 active+clean
             1   active+clean+remapped
 
ubuntu@gelani-mon-1:~$ sudo ceph health detail
HEALTH_OK
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 434 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     0.215% pgs not active
             464 active+clean
             1   peering
 
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
  io:
    recovery: 1024 KiB/s, 0 objects/s
 
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.0 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
  io:
    client:   32 KiB/s rd, 0 B/s wr, 31 op/s rd, 21 op/s wr
 
ubuntu@gelani-mon-1:~$ [global]
fsid = a9625cff-fc0e-11f0-a1f6-6998182b0a5e
mon_host = 192.168.95.19,192.168.95.240,192.168.95.221
public_network = 192.168.95.0/24
[global]: command not found
Command 'fsid' not found, did you mean:
  command 'fnid' from deb id-utils (4.6.28-20200521ss15dab)
  command 'fid' from deb id-utils (4.6.28-20200521ss15dab)
  command 'ssid' from deb suckless-tools (46-1)
  command 'vsid' from deb vice (3.6.1+dfsg-2)
Try: sudo apt install <deb name>
mon_host: command not found
public_network: command not found
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.1 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ sudo scp /etc/ceph/ceph.conf ubuntu@192.168.95.93:/tmp/ceph.conf
sudo scp /etc/ceph/ceph.client.glance.keyring ubuntu@192.168.95.93:/tmp/
sudo scp /etc/ceph/ceph.client.cinder.keyring ubuntu@192.168.95.93:/tmp/
sudo scp /etc/ceph/ceph.client.nova.keyring ubuntu@192.168.95.93:/tmp/
The authenticity of host '192.168.95.93 (192.168.95.93)' can't be established.
ED25519 key fingerprint is SHA256:c2OeWOBIkW9ZNBh4MRPe1uS9dpW9Va3GvNEwOTFAea0.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.95.93' (ED25519) to the list of known hosts.
ubuntu@192.168.95.93's password: 
ceph.conf                                                                          100%  141   393.1KB/s   00:00    
ubuntu@192.168.95.93's password: 
/etc/ceph/ceph.client.glance.keyring: No such file or directory
ubuntu@192.168.95.93's password: 
Permission denied, please try again.
ubuntu@192.168.95.93's password: 
Permission denied, please try again.
ubuntu@192.168.95.93's password: 
/etc/ceph/ceph.client.cinder.keyring: No such file or directory
ubuntu@192.168.95.93's password: 
/etc/ceph/ceph.client.nova.keyring: No such file or directory
ubuntu@gelani-mon-1:~$ sudo ls -lh /etc/ceph/
total 16K
-rw------- 1 root root 151 Jan 29 06:56 ceph.client.admin.keyring
-rw-r--r-- 1 root root 141 Jan 31 12:40 ceph.conf
-rw-r--r-- 1 root ceph 595 Jan 28 06:01 ceph.pub
-rw-r--r-- 1 root ceph  92 Aug 21 11:33 rbdmap
ubuntu@gelani-mon-1:~$ sudo ls -lh /etc/ceph/ceph.client.*.keyring
-rw------- 1 root root 151 Jan 29 06:56 /etc/ceph/ceph.client.admin.keyring
ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# ceph auth get-or-create client.glance \
  mon "profile rbd" \
  osd "profile rbd pool=images" \
  -o /tmp/ceph.client.glance.keyring

ceph auth get-or-create client.cinder \
  mon "profile rbd" \
  osd "profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images" \
  -o /tmp/ceph.client.cinder.keyring

ceph auth get-or-create client.nova \
  mon "profile rbd" \
  osd "profile rbd pool=vms" \
  -o /tmp/ceph.client.nova.keyring
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-01-31T13:10:28.764+0000 7f2a463f7640 -1 failed for service _ceph-mon._tcp

2026-01-31T13:10:28.764+0000 7f2a463f7640 -1 monclient: get_monmap_and_config cannot identify monitors to contact
[errno 2] RADOS object not found (error connecting to the cluster)
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-01-31T13:10:29.020+0000 7f854db97640 -1 failed for service _ceph-mon._tcp

2026-01-31T13:10:29.020+0000 7f854db97640 -1 monclient: get_monmap_and_config cannot identify monitors to contact

[errno 2] RADOS object not found (error connecting to the cluster)
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-01-31T13:10:29.292+0000 7fb22ab35640 -1 failed for service _ceph-mon._tcp

2026-01-31T13:10:29.292+0000 7fb22ab35640 -1 monclient: get_monmap_and_config cannot identify monitors to contact

[errno 2] RADOS object not found (error connecting to the cluster)
root@gelani-mon-1:/# exit
exit
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.1 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ sudo ceph auth get-or-create client.glance \
  mon "profile rbd" \
  osd "profile rbd pool=images" \
  -o /etc/ceph/ceph.client.glance.keyring

sudo ceph auth get-or-create client.cinder \
  mon "profile rbd" \
  osd "profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images" \
  -o /etc/ceph/ceph.client.cinder.keyring

sudo ceph auth get-or-create client.nova \
  mon "profile rbd" \
  osd "profile rbd pool=vms" \
  -o /etc/ceph/ceph.client.nova.keyring
ubuntu@gelani-mon-1:~$ sudo ls -lh /etc/ceph/ceph.client.{glance,cinder,nova}.keyring
-rw-r--r-- 1 root root 64 Jan 31 13:12 /etc/ceph/ceph.client.cinder.keyring
-rw-r--r-- 1 root root 64 Jan 31 13:12 /etc/ceph/ceph.client.glance.keyring
-rw-r--r-- 1 root root 62 Jan 31 13:12 /etc/ceph/ceph.client.nova.keyring
ubuntu@gelani-mon-1:~$ sudo scp /etc/ceph/ceph.conf ubuntu@192.168.95.93:/tmp/ceph.conf
sudo scp /etc/ceph/ceph.client.glance.keyring ubuntu@192.168.95.93:/tmp/
sudo scp /etc/ceph/ceph.client.cinder.keyring ubuntu@192.168.95.93:/tmp/
sudo scp /etc/ceph/ceph.client.nova.keyring ubuntu@192.168.95.93:/tmp/
ubuntu@192.168.95.93's password: 
ceph.conf                                                                          100%  141   426.6KB/s   00:00    
ubuntu@192.168.95.93's password: 
ceph.client.glance.keyring                                                         100%   64   161.1KB/s   00:00    
ubuntu@192.168.95.93's password: 
ceph.client.cinder.keyring                                                         100%   64   163.6KB/s   00:00    
ubuntu@192.168.95.93's password: 
ceph.client.nova.keyring                                                           100%   62   133.8KB/s   00:00    
ubuntu@gelani-mon-1:~$ ^C
ubuntu@gelani-mon-1:~$ sudo scp /etc/ceph/ceph.client.admin.keyring ubuntu@192.168.95.93:/tmp/
ubuntu@192.168.95.93's password: 
ceph.client.admin.keyring                                                                                                                                                                                 100%  151   373.9KB/s   00:00    
ubuntu@gelani-mon-1:~$ sudo mv /tmp/ceph.client.admin.keyring /etc/ceph/
sudo chmod 600 /etc/ceph/ceph.client.admin.keyring
sudo ceph -s
mv: cannot stat '/tmp/ceph.client.admin.keyring': No such file or directory
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.1 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ cd /opt/stack/devstack
-bash: cd: /opt/stack/devstack: No such file or directory
ubuntu@gelani-mon-1:~$ source openrc admin admin
-bash: openrc: No such file or directory
ubuntu@gelani-mon-1:~$ sudo ls -l /opt/stack/devstack/openrc
sudo ls -l /opt/stack/devstack/openrc.sh
sudo ls -l /opt/stack/devstack/stackrc
ls: cannot access '/opt/stack/devstack/openrc': No such file or directory
ls: cannot access '/opt/stack/devstack/openrc.sh': No such file or directory
ls: cannot access '/opt/stack/devstack/stackrc': No such file or directory
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3d), 6 in (since 3d)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 432 objects, 657 MiB
    usage:   3.1 GiB used, 177 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ sudo rbd -p volume ls
ubuntu@gelani-mon-1:~$ sudo apt install -y ceph-common
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ceph-common is already the newest version (17.2.9-0ubuntu0.22.04.1).
0 upgraded, 0 newly installed, 0 to remove and 7 not upgraded.
ubuntu@gelani-mon-1:~$ sudo rbd -p volume ls
ubuntu@gelani-mon-1:~$ sudo cephadm shell
rbd -p volume ls
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# client_loop: send disconnect: Broken pipe
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.19
ubuntu@192.168.95.19's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  1 03:50:15 UTC 2026

  System load:  0.05               Processes:             145
  Usage of /:   17.6% of 38.58GB   Users logged in:       0
  Memory usage: 51%                IPv4 address for ens3: 192.168.95.19
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

8 updates can be applied immediately.
To see these additional updates run: apt list --upgradable

2 additional security updates can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Sat Jan 31 12:35:14 2026 from 192.168.95.86
ubuntu@gelani-mon-1:~$ 


ubuntu@gelani-lab-1:~/images$ ceph -v
ceph version 17.2.9 (69bf48f20731a4b0d742613f6c6335ccb54dd217) quincy (stable)
ubuntu@gelani-lab-1:~/images$ ceph -v
ceph version 17.2.9 (69bf48f20731a4b0d742613f6c6335ccb54dd217) quincy (stable)
ubuntu@gelani-lab-1:~/images$ sudo cat /etc/ceph/ceph.conf
[global]
fsid = a9625cff-fc0e-11f0-a1f6-6998182b0a5e
mon_host = 192.168.95.19,192.168.95.240,192.168.95.221
public_network = 192.168.95.0/24


[client.glance]
keyring = /etc/ceph/ceph.client.glance.keyring

[client.glance]
keyring = /etc/ceph/ceph.client.glance.keyring
ubuntu@gelani-lab-1:~/images$ ^C
ubuntu@gelani-lab-1:~/images$ sudo nano /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:~/images$ sudo nano /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:~/images$ sudo nano /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:~/images$ sudo cat /etc/ceph/ceph.conf
[global]
fsid = a9625cff-fc0e-11f0-a1f6-6998182b0a5e
mon_host = 192.168.95.19,192.168.95.240,192.168.95.221
public_network = 192.168.95.0/24

# REQUIRED for Quincy (cephx v2)
auth_cluster_required = cephx
auth_service_required = cephx
auth_client_required = cephx

[client.glance]
keyring = /etc/ceph/ceph.client.glance.keyring
ubuntu@gelani-lab-1:~/images$ sudo nano /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:~/images$ sudo cat /etc/ceph/ceph.conf
[global]
fsid = a9625cff-fc0e-11f0-a1f6-6998182b0a5e
mon_host = 192.168.95.19,192.168.95.240,192.168.95.221
public_network = 192.168.95.0/24

# REQUIRED for Quincy (cephx v2)
auth_cluster_required = cephx
auth_service_required = cephx
auth_client_required = cephx

[client.glance]
keyring = /etc/ceph/ceph.client.glance.keyring


ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@$(hostname)
sudo systemctl status ceph-mon@$(hostname) --no-pager
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
Unit ceph-mon@gelani-mon-1.service could not be found.
ubuntu@gelani-mon-1:~$ sudo ceph mon dump
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
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@a
Failed to restart ceph-mon@a.service: Unit ceph-mon@a.service not found.
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@0
Failed to restart ceph-mon@0.service: Unit ceph-mon@0.service not found.
ubuntu@gelani-mon-1:~$ systemctl list-units --type=service | grep -E 'ceph-mon@|ceph.*mon'
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@alertmanager.gelani-mon-1.service      loaded active running Ceph alertmanager.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@crash.gelani-mon-1.service             loaded active running Ceph crash.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@grafana.gelani-mon-1.service           loaded active running Ceph grafana.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mgr.gelani-mon-1.gzltah.service        loaded active running Ceph mgr.gelani-mon-1.gzltah for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1.service               loaded active running Ceph mon.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@node-exporter.gelani-mon-1.service     loaded active running Ceph node-exporter.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@prometheus.gelani-mon-1.service        loaded active running Ceph prometheus.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@rgw.gelani.gelani-mon-1.cceitw.service loaded active running Ceph rgw.gelani.gelani-mon-1.cceitw for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@gelani-mon-1
sudo systemctl status ceph-mon@gelani-mon-1 --no-pager
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
Unit ceph-mon@gelani-mon-1.service could not be found.
ubuntu@gelani-mon-1:~$ sudo cephadm ls
[
    {
        "style": "cephadm:v1",
        "name": "grafana.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@grafana.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "grafana",
        "ports": [
            3000
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "d3212a8fe771d61c7153b9bdde32993c225687d0b414954c01712936aecb910e",
        "container_image_name": "quay.io/ceph/ceph-grafana:9.4.7",
        "container_image_id": "954c08fa618887fe9a6fe572ae541197c77e625b05f4193df7898f5ac649ada9",
        "container_image_digests": [
            "quay.io/ceph/ceph-grafana@sha256:97d919ad919187a9b924574c2480be30f840d252447bc0a91ff5213f3cf7f4b1"
        ],
        "memory_usage": 87713382,
        "cpu_percentage": "0.04%",
        "version": "9.4.7",
        "started": "2026-01-28T06:03:50.879003Z",
        "created": "2026-01-28T06:02:58.191193Z",
        "deployed": "2026-01-28T06:02:57.695190Z",
        "configured": "2026-01-28T06:03:50.607419Z"
    },
    {
        "style": "cephadm:v1",
        "name": "alertmanager.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@alertmanager.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "alertmanager",
        "ports": [
            9093,
            9094
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "cb53c3eb0871bb512a3d6ac791818427411457af96835bd8f99d6e184377bac0",
        "container_image_name": "quay.io/prometheus/alertmanager:v0.25.0",
        "container_image_id": "c8568f914cd25b2062c44e9f79f9c18da6e3b85fe0c47a12a2191c61426c2b19",
        "container_image_digests": [
            "quay.io/prometheus/alertmanager@sha256:fd4d9a3dd1fd0125108417be21be917f19cc76262347086509a0d43f29b80e98"
        ],
        "memory_usage": 15550382,
        "cpu_percentage": "0.07%",
        "version": "0.25.0",
        "started": "2026-01-28T06:42:22.711536Z",
        "created": "2026-01-28T06:01:39.754853Z",
        "deployed": "2026-01-28T06:01:39.214851Z",
        "configured": "2026-01-28T06:42:22.434511Z"
    },
    {
        "style": "cephadm:v1",
        "name": "mgr.gelani-mon-1.gzltah",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mgr.gelani-mon-1.gzltah",
        "enabled": true,
        "state": "running",
        "service_name": "mgr",
        "memory_request": null,
        "memory_limit": null,
        "ports": [
            9283,
            8765,
            8443
        ],
        "container_id": "504af1640bd600d05b3556589c158176c831f9d9946e50607d01a2ed5a1132c8",
        "container_image_name": "quay.io/ceph/ceph:v17",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 607125504,
        "cpu_percentage": "0.39%",
        "version": "17.2.8",
        "started": "2026-01-28T06:00:44.373377Z",
        "created": "2026-01-28T06:00:44.322613Z",
        "deployed": "2026-01-28T06:00:43.870611Z",
        "configured": "2026-01-28T06:42:11.158417Z"
    },
    {
        "style": "cephadm:v1",
        "name": "node-exporter.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@node-exporter.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "node-exporter",
        "ports": [
            9100
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "cb7a32fb0b5f07056a9d93fec510473250b25a339761caddb4f4998d73488c75",
        "container_image_name": "quay.io/prometheus/node-exporter:v1.5.0",
        "container_image_id": "0da6a335fe1356545476b749c68f022c897de3a2139e8f0054f6937349ee2b83",
        "container_image_digests": [
            "quay.io/prometheus/node-exporter@sha256:39c642b2b337e38c18e80266fb14383754178202f40103646337722a594d984c"
        ],
        "memory_usage": 9940500,
        "cpu_percentage": "0.00%",
        "version": "1.5.0",
        "started": "2026-01-28T06:01:40.445161Z",
        "created": "2026-01-28T06:01:30.166811Z",
        "deployed": "2026-01-28T06:01:29.670809Z",
        "configured": "2026-01-28T06:01:30.166811Z"
    },
    {
        "style": "cephadm:v1",
        "name": "prometheus.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@prometheus.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "prometheus",
        "ports": [
            9095
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "64264f6645d72bbbd9c45933ee8e8913810e45138f64a35983217743cad0229c",
        "container_image_name": "quay.io/prometheus/prometheus:v2.43.0",
        "container_image_id": "a07b618ecd1dce142bce4c52f0e80982eaf1f14265a2415c2d35978ccaa0a464",
        "container_image_digests": [
            "quay.io/prometheus/prometheus@sha256:f5c29683a301d4e5427fb0d985f794b1f743498310a4eadee75e85f5dba73a6d"
        ],
        "memory_usage": 91865743,
        "cpu_percentage": "0.12%",
        "version": "2.43.0",
        "started": "2026-01-28T06:42:23.582857Z",
        "created": "2026-01-28T06:03:36.683359Z",
        "deployed": "2026-01-28T06:03:36.179357Z",
        "configured": "2026-01-28T06:42:23.334519Z"
    },
    {
        "style": "cephadm:v1",
        "name": "crash.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@crash.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "crash",
        "ports": [],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "8dfbc6d6774da32799d09cc8eb1606c5dc652ac78901f11c394f500ce666bf16",
        "container_image_name": "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 7552892,
        "cpu_percentage": "0.00%",
        "version": "17.2.8",
        "started": "2026-01-28T06:01:29.467207Z",
        "created": "2026-01-28T06:01:29.382808Z",
        "deployed": "2026-01-28T06:01:28.866806Z",
        "configured": "2026-01-28T06:42:11.598421Z"
    },
    {
        "style": "cephadm:v1",
        "name": "rgw.gelani.gelani-mon-1.cceitw",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@rgw.gelani.gelani-mon-1.cceitw",
        "enabled": true,
        "state": "running",
        "service_name": "rgw.gelani",
        "ports": [
            7480
        ],
        "ip": null,
        "deployed_by": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "rank": null,
        "rank_generation": null,
        "extra_container_args": null,
        "extra_entrypoint_args": null,
        "memory_request": null,
        "memory_limit": null,
        "container_id": "268d7d785ba53fe8b5ccc972917a0341c38c663877794b11514c62ad365fb136",
        "container_image_name": "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 273783193,
        "cpu_percentage": "0.29%",
        "version": "17.2.8",
        "started": "2026-01-29T06:40:43.243943Z",
        "created": "2026-01-29T06:40:43.169950Z",
        "deployed": "2026-01-29T06:40:42.669946Z",
        "configured": "2026-01-29T06:40:43.169950Z"
    },
    {
        "style": "cephadm:v1",
        "name": "mon.gelani-mon-1",
        "fsid": "a9625cff-fc0e-11f0-a1f6-6998182b0a5e",
        "systemd_unit": "ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1",
        "enabled": true,
        "state": "running",
        "service_name": "mon",
        "memory_request": null,
        "memory_limit": null,
        "ports": [],
        "container_id": "42ffb7d672628deb2c905b635e955551ad073730baa38a3a089e6154d668e810",
        "container_image_name": "quay.io/ceph/ceph:v17",
        "container_image_id": "259b3556651452e4de35111bd226d7a17fe902360c7e9e49a4e5da686ffb71c1",
        "container_image_digests": [
            "quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f"
        ],
        "memory_usage": 459590860,
        "cpu_percentage": "0.91%",
        "version": "17.2.8",
        "started": "2026-01-28T06:00:43.148594Z",
        "created": "2026-01-28T06:00:41.518601Z",
        "deployed": "2026-01-28T06:00:40.370596Z",
        "configured": "2026-01-28T06:42:12.034425Z"
    }
]
ubuntu@gelani-mon-1:~$ hostname
gelani-mon-1
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@$(hostname)
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@gelani-mon-1
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@$gelani-mon-1
Failed to restart ceph-mon@-mon-1.service: Unit ceph-mon@-mon-1.service not found.
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@$(hostname)
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@$(hostname)
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
ubuntu@gelani-mon-1:~$ sudo ceph mon dump
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
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@gelani-mon-1
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
ubuntu@gelani-mon-1:~$ hsotname
Command 'hsotname' not found, did you mean:
  command 'hostname' from deb hostname (3.23ubuntu2)
Try: sudo apt install <deb name>
ubuntu@gelani-mon-1:~$ hostnamectl
 Static hostname: gelani-mon-1
       Icon name: computer-vm
         Chassis: vm
      Machine ID: d0a08804c7aa4808b8e93ce9c8300048
         Boot ID: dc7268b8ce5344d1958776f4494ba4b5
  Virtualization: kvm
Operating System: Ubuntu 22.04.5 LTS              
          Kernel: Linux 5.15.0-164-generic
    Architecture: x86-64
 Hardware Vendor: OpenStack Foundation
  Hardware Model: OpenStack Nova
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-mon@gelani-mon-1
Failed to restart ceph-mon@gelani-mon-1.service: Unit ceph-mon@gelani-mon-1.service not found.
ubuntu@gelani-mon-1:~$ sudo systemctl status ceph-mon@gelani-mon-1 --no-pager
Unit ceph-mon@gelani-mon-1.service could not be found.
ubuntu@gelani-mon-1:~$ sudo systemctl list-units --type=service | grep -E 'ceph.*mon|mon\.gelani' || true
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@alertmanager.gelani-mon-1.service      loaded active running Ceph alertmanager.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@crash.gelani-mon-1.service             loaded active running Ceph crash.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@grafana.gelani-mon-1.service           loaded active running Ceph grafana.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mgr.gelani-mon-1.gzltah.service        loaded active running Ceph mgr.gelani-mon-1.gzltah for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1.service               loaded active running Ceph mon.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@node-exporter.gelani-mon-1.service     loaded active running Ceph node-exporter.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@prometheus.gelani-mon-1.service        loaded active running Ceph prometheus.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@rgw.gelani.gelani-mon-1.cceitw.service loaded active running Ceph rgw.gelani.gelani-mon-1.cceitw for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
ubuntu@gelani-mon-1:~$ sudo systemctl list-unit-files | grep -E 'ceph.*mon|ceph.*@' || true
ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@.service                            indirect        enabled
ubuntu@gelani-mon-1:~$ sudo systemctl restart ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1.service
ubuntu@gelani-mon-1:~$ sudo systemctl status  ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1.service --no-pager
● ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1.service - Ceph mon.gelani-mon-1 for a9625cff-fc0e-11f0-a1f6-6998182b0a5e
     Loaded: loaded (/etc/systemd/system/ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@.service; enabled; vendor preset: enabled)
     Active: active (running) since Sun 2026-02-01 11:39:56 UTC; 19s ago
   Main PID: 606215 (bash)
      Tasks: 10 (limit: 4643)
     Memory: 8.7M
        CPU: 54ms
     CGroup: /system.slice/system-ceph\x2da9625cff\x2dfc0e\x2d11f0\x2da1f6\x2d6998182b0a5e.slice/ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e@mon.gelani-mon-1.service
             ├─606215 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/unit.run
             └─606231 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --entrypoint /usr/bin/ceph-mon --privileged --group-add=disk --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-mon…

Feb 01 11:40:10 gelani-mon-1 bash[606231]: debug 2026-02-01T11:40:10.316+0000 7f6c3ad6e640  0 log_channel(audit) log [INF] : from='mgr.15189 ' entity='mgr.gelani-mon-1.gzltah'
Feb 01 11:40:10 gelani-mon-1 bash[606231]: cluster 2026-02-01T11:40:09.294320+0000 mgr.gelani-mon-1.gzltah (mgr.15189) 138564 : cluster [DBG] pgmap v138232: 465 pgs: 465 active+clean; 4.1 GiB data, 10 GiB used, 170 GiB / 180 GiB avail
Feb 01 11:40:10 gelani-mon-1 bash[606231]: audit 2026-02-01T11:40:09.888894+0000 mon.gelani-mon-3 (mon.2) 40573 : audit [DBG] from='mgr.15189 192.168.95.19:0/2181611709' entity='mgr.gelani-mon-1.gzltah' cmd=[{"prefix… "json"}]: dispatch
Feb 01 11:40:10 gelani-mon-1 bash[606231]: audit 2026-02-01T11:40:10.303540+0000 mon.gelani-mon-3 (mon.2) 40574 : audit [DBG] from='mgr.15189 192.168.95.19:0/2181611709' entity='mgr.gelani-mon-1.gzltah' cmd=[{"prefix…l-conf"}]: dispatch
Feb 01 11:40:10 gelani-mon-1 bash[606231]: audit 2026-02-01T11:40:10.306100+0000 mon.gelani-mon-3 (mon.2) 40575 : audit [INF] from='mgr.15189 192.168.95.19:0/2181611709' entity='mgr.gelani-mon-1.gzltah' cmd=[{"prefix….admin"}]: dispatch
Feb 01 11:40:10 gelani-mon-1 bash[606231]: audit 2026-02-01T11:40:10.321237+0000 mon.gelani-mon-1 (mon.0) 9 : audit [INF] from='mgr.15189 ' entity='mgr.gelani-mon-1.gzltah'
Feb 01 11:40:10 gelani-mon-1 bash[606231]: audit 2026-02-01T11:40:10.326766+0000 mon.gelani-mon-3 (mon.2) 40576 : audit [DBG] from='mgr.15189 192.168.95.19:0/2181611709' entity='mgr.gelani-mon-1.gzltah' cmd=[{"prefix… "json"}]: dispatch
Feb 01 11:40:12 gelani-mon-1 bash[606231]: cluster 2026-02-01T11:40:11.295552+0000 mgr.gelani-mon-1.gzltah (mgr.15189) 138565 : cluster [DBG] pgmap v138233: 465 pgs: 465 active+clean; 4.1 GiB data, 10 GiB used, 170 GiB / 180 GiB avail
Feb 01 11:40:13 gelani-mon-1 bash[606231]: audit 2026-02-01T11:40:13.387212+0000 mon.gelani-mon-3 (mon.2) 40577 : audit [DBG] from='mgr.15189 192.168.95.19:0/2181611709' entity='mgr.gelani-mon-1.gzltah' cmd=[{"prefix… "json"}]: dispatch
Feb 01 11:40:14 gelani-mon-1 bash[606231]: cluster 2026-02-01T11:40:13.295999+0000 mgr.gelani-mon-1.gzltah (mgr.15189) 138566 : cluster [DBG] pgmap v138234: 465 pgs: 465 active+clean; 4.1 GiB data, 10 GiB used, 170 GiB / 180 GiB avail
Hint: Some lines were ellipsized, use -l to show in full.
ubuntu@gelani-mon-1:~$ 
ubuntu@gelani-mon-1:~$ ceph -s
2026-02-01T11:49:25.304+0000 7f6bd30d7640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-01T11:49:25.304+0000 7f6bd30d7640 -1 AuthRegistry(0x7f6bcc063d78) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-01T11:49:25.304+0000 7f6bd30d7640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-01T11:49:25.304+0000 7f6bd30d7640 -1 AuthRegistry(0x7f6bd30d5f80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-01T11:49:25.308+0000 7f6bd0e73640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-01T11:49:25.308+0000 7f6bc3fff640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-01T11:49:25.308+0000 7f6bd30d7640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 13] RADOS permission denied (error connecting to the cluster)
ubuntu@gelani-mon-1:~$ sudo apt update
sudo apt install -y ceph-common
Get:1 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]                      
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease                                
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]               
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Fetched 384 kB in 3s (119 kB/s)   
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
3 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ceph-common is already the newest version (17.2.9-0ubuntu0.22.04.1).
0 upgraded, 0 newly installed, 0 to remove and 3 not upgraded.
ubuntu@gelani-mon-1:~$ sudo find / -name 'ceph.client.admin.keyring' 2>/dev/null
/var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/config/ceph.client.admin.keyring
/etc/ceph/ceph.client.admin.keyring
ubuntu@gelani-mon-1:~$ sudo chown root:root /etc/ceph/ceph.client.admin.keyring
sudo chmod 600 /etc/ceph/ceph.client.admin.keyring
ubuntu@gelani-mon-1:~$ ceph -s
2026-02-01T11:58:39.080+0000 7f2ec5e99640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-01T11:58:39.080+0000 7f2ec5e99640 -1 AuthRegistry(0x7f2ec0063d78) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-01T11:58:39.080+0000 7f2ec5e99640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-01T11:58:39.080+0000 7f2ec5e99640 -1 AuthRegistry(0x7f2ec5e97f80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-01T11:58:39.084+0000 7f2ebeffd640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-01T11:58:39.088+0000 7f2ec5e99640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 95] error connecting to the cluster
ubuntu@gelani-mon-1:~$ ps aux | grep ceph
root        4132  0.0  0.0   7764  2592 ?        Ss   Jan28   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mgr.gelani-mon-1.gzltah/unit.run
root        4156  0.0  0.7 1848216 28676 ?       Sl   Jan28   0:37 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --entrypoint /usr/bin/ceph-mgr --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-mgr-gelani-mon-1-gzltah --pids-limit=0 -e CONTAINER_IMAGE=quay.io/ceph/ceph:v17 -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -e TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=134217728 -v /var/run/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/run/ceph:z -v /var/log/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/log/ceph:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash:/var/lib/ceph/crash:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mgr.gelani-mon-1.gzltah:/var/lib/ceph/mgr/ceph-gelani-mon-1.gzltah:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mgr.gelani-mon-1.gzltah/config:/etc/ceph/ceph.conf:z quay.io/ceph/ceph:v17 -n mgr.gelani-mon-1.gzltah -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug 
root        4235  0.0  0.0   1136     4 ?        Ss   Jan28   0:05 /sbin/docker-init -- /usr/bin/ceph-mgr -n mgr.gelani-mon-1.gzltah -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug 
167         4253  1.2 15.2 2129992 609524 ?      Sl   Jan28  75:19 /usr/bin/ceph-mgr -n mgr.gelani-mon-1.gzltah -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug 
root        9939  0.0  0.0   7764  2596 ?        Ss   Jan28   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash.gelani-mon-1/unit.run
root        9959  0.0  0.6 1774484 26548 ?       Sl   Jan28   0:06 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --entrypoint /usr/bin/ceph-crash --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-crash-gelani-mon-1 --pids-limit=0 -e CONTAINER_IMAGE=quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -e TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=134217728 -v /var/run/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/run/ceph:z -v /var/log/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/log/ceph:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash:/var/lib/ceph/crash:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash.gelani-mon-1/config:/etc/ceph/ceph.conf:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash.gelani-mon-1/keyring:/etc/ceph/ceph.client.crash.gelani-mon-1.keyring quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f -n client.crash.gelani-mon-1
root       10003  0.0  0.0   1136     4 ?        Ss   Jan28   0:07 /sbin/docker-init -- /usr/bin/ceph-crash -n client.crash.gelani-mon-1
167        10025  0.0  0.3  14268 12536 ?        S    Jan28   0:00 /usr/bin/python3 -s /usr/bin/ceph-crash -n client.crash.gelani-mon-1
root       10102  0.0  0.0   7764  2600 ?        Ss   Jan28   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/node-exporter.gelani-mon-1/unit.run
root       10117  0.0  0.6 1774484 27624 ?       Sl   Jan28   0:06 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-node-exporter-gelani-mon-1 --user 65534 --security-opt label=disable -e CONTAINER_IMAGE=quay.io/prometheus/node-exporter:v1.5.0 -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -v /proc:/host/proc:ro -v /sys:/host/sys:ro -v /:/rootfs:ro quay.io/prometheus/node-exporter:v1.5.0 --no-collector.timex --web.listen-address=:9100 --path.procfs=/host/proc --path.sysfs=/host/sys --path.rootfs=/rootfs
root       12257  0.0  0.0   7764  2528 ?        Ss   Jan28   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/grafana.gelani-mon-1/unit.run
root       12276  0.0  0.7 1848216 28568 ?       Sl   Jan28   0:05 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-grafana-gelani-mon-1 --user 998 -e CONTAINER_IMAGE=quay.io/ceph/ceph-grafana:9.4.7 -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/grafana.gelani-mon-1/etc/grafana/grafana.ini:/etc/grafana/grafana.ini:Z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/grafana.gelani-mon-1/etc/grafana/provisioning/datasources:/etc/grafana/provisioning/datasources:Z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/grafana.gelani-mon-1/etc/grafana/certs:/etc/grafana/certs:Z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/grafana.gelani-mon-1/data/grafana.db:/var/lib/grafana/grafana.db:Z quay.io/ceph/ceph-grafana:9.4.7
root       21864  0.0  0.0   7764  2608 ?        Ss   Jan28   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/alertmanager.gelani-mon-1/unit.run
root       21880  0.0  0.7 1774484 28924 ?       Sl   Jan28   0:05 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-alertmanager-gelani-mon-1 --user 65534 -e CONTAINER_IMAGE=quay.io/prometheus/alertmanager:v0.25.0 -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/alertmanager.gelani-mon-1/etc/alertmanager:/etc/alertmanager:Z quay.io/prometheus/alertmanager:v0.25.0 --cluster.listen-address=:9094 --web.listen-address=:9093 --config.file=/etc/alertmanager/alertmanager.yml
root       22182  0.0  0.0   7764  2624 ?        Ss   Jan28   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/prometheus.gelani-mon-1/unit.run
root       22198  0.0  0.7 1847960 28096 ?       Sl   Jan28   0:05 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-prometheus-gelani-mon-1 --user 65534 -e CONTAINER_IMAGE=quay.io/prometheus/prometheus:v2.43.0 -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/prometheus.gelani-mon-1/etc/prometheus:/etc/prometheus:Z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/prometheus.gelani-mon-1/data:/prometheus:Z quay.io/prometheus/prometheus:v2.43.0 --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/prometheus --storage.tsdb.retention.time=15d --storage.tsdb.retention.size=0 --web.external-url=http://192.168.95.19:9095 --web.listen-address=:9095
root      160019  0.0  0.0   7764  2568 ?        Ss   Jan29   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/rgw.gelani.gelani-mon-1.cceitw/unit.run
root      160037  0.0  0.6 1774484 27376 ?       Sl   Jan29   0:04 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --entrypoint /usr/bin/radosgw --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-rgw-gelani-gelani-mon-1-cceitw --pids-limit=0 -e CONTAINER_IMAGE=quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -e TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=134217728 -v /var/run/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/run/ceph:z -v /var/log/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/log/ceph:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash:/var/lib/ceph/crash:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/rgw.gelani.gelani-mon-1.cceitw:/var/lib/ceph/radosgw/ceph-rgw.gelani.gelani-mon-1.cceitw:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/rgw.gelani.gelani-mon-1.cceitw/config:/etc/ceph/ceph.conf:z quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f -n client.rgw.gelani.gelani-mon-1.cceitw -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug 
root      160074  0.0  0.0   1136     4 ?        Ss   Jan29   0:05 /sbin/docker-init -- /usr/bin/radosgw -n client.rgw.gelani.gelani-mon-1.cceitw -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug 
167       160087  0.1  5.3 6157388 215036 ?      Sl   Jan29   8:16 /usr/bin/radosgw -n client.rgw.gelani.gelani-mon-1.cceitw -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug 
root      606215  0.0  0.0   7764  3624 ?        Ss   11:39   0:00 /bin/bash /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/unit.run
root      606231  0.0  0.7 1848216 28260 ?       Sl   11:39   0:00 /usr/bin/docker run --rm --ipc=host --stop-signal=SIGTERM --ulimit nofile=1048576 --net=host --entrypoint /usr/bin/ceph-mon --privileged --group-add=disk --init --name ceph-a9625cff-fc0e-11f0-a1f6-6998182b0a5e-mon-gelani-mon-1 --pids-limit=0 -e CONTAINER_IMAGE=quay.io/ceph/ceph:v17 -e NODE_NAME=gelani-mon-1 -e CEPH_USE_RANDOM_NONCE=1 -e TCMALLOC_MAX_TOTAL_THREAD_CACHE_BYTES=134217728 -v /var/run/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/run/ceph:z -v /var/log/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e:/var/log/ceph:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/crash:/var/lib/ceph/crash:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1:/var/lib/ceph/mon/ceph-gelani-mon-1:z -v /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config:/etc/ceph/ceph.conf:z -v /dev:/dev -v /run/udev:/run/udev quay.io/ceph/ceph:v17 -n mon.gelani-mon-1 -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug  --default-mon-cluster-log-to-file=false --default-mon-cluster-log-to-stderr=true
root      606269  0.0  0.0   1136     4 ?        Ss   11:39   0:00 /sbin/docker-init -- /usr/bin/ceph-mon -n mon.gelani-mon-1 -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug  --default-mon-cluster-log-to-file=false --default-mon-cluster-log-to-stderr=true
167       606283  0.7  3.0 333704 120572 ?       Sl   11:39   0:26 /usr/bin/ceph-mon -n mon.gelani-mon-1 -f --setuser ceph --setgroup ceph --default-log-to-file=false --default-log-to-stderr=true --default-log-stderr-prefix=debug  --default-mon-cluster-log-to-file=false --default-mon-cluster-log-to-stderr=true
ubuntu    612378  0.0  0.0   7000  2644 pts/0    S+   12:35   0:00 grep --color=auto ceph
ubuntu@gelani-mon-1:~$ ls -l /etc/ceph/ceph.client.glance.keyring
-rw-r--r-- 1 root root 64 Jan 31 13:12 /etc/ceph/ceph.client.glance.keyring
ubuntu@gelani-mon-1:~$ sudo chown root:stack /etc/ceph/ceph.client.glance.keyring
sudo chmod 640 /etc/ceph/ceph.client.glance.keyring
chown: invalid group: ‘root:stack’
ubuntu@gelani-mon-1:~$ sudo -u stack rbd -p images ls \
  --conf /etc/ceph/ceph.conf \
  --keyring /etc/ceph/ceph.client.glance.keyring
sudo: unknown user stack
sudo: error initializing audit plugin sudoers_audit
ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# ceph -s
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-02-01T13:14:10.975+0000 7f6df792c640 -1 failed for service _ceph-mon._tcp

2026-02-01T13:14:10.975+0000 7f6df792c640 -1 monclient: get_monmap_and_config cannot identify monitors to contact

[errno 2] RADOS object not found (error connecting to the cluster)
root@gelani-mon-1:/# ceph orch ps --daemon-type mon
unable to get monitor info from DNS SRV with service name: ceph-mon
2026-02-01T13:14:24.287+0000 7fa5f8f67640 -1 failed for service _ceph-mon._tcp

2026-02-01T13:14:24.287+0000 7fa5f8f67640 -1 monclient: get_monmap_and_config cannot identify monitors to contact

[errno 2] RADOS object not found (error connecting to the cluster)
root@gelani-mon-1:/# 

``` 
