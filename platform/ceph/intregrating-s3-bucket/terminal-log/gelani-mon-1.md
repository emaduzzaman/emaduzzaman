```
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.19 
ubuntu@192.168.95.19's password: 
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-164-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Thu Jan 29 06:32:33 UTC 2026

  System load:  0.01               Processes:             141
  Usage of /:   14.1% of 38.58GB   Users logged in:       0
  Memory usage: 43%                IPv4 address for ens3: 192.168.95.19
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

1 additional security update can be applied with ESM Apps.
Learn more about enabling ESM Apps service at https://ubuntu.com/esm

New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Thu Jan 29 06:29:07 2026 from 192.168.95.86
```
# create-RGW-pools, since production engineers create them explicitly!
```
ubuntu@gelani-mon-1:~$ sudo ceph osd pool create rgw.meta 16
pool 'rgw.meta' created
ubuntu@gelani-mon-1:~$ sudo ceph osd pool create rgw.control 16
pool 'rgw.control' created
ubuntu@gelani-mon-1:~$ sudo ceph osd pool create rgw.log 16 && sudo ceph osd pool create rgw.buckets.data 64 && sudo ceph osd pool create rgw.buckets.index 32
pool 'rgw.log' created
pool 'rgw.buckets.data' created
pool 'rgw.buckets.index' created
```
## set-Set replication (because 2-OSD-hosts-exists-in-the-lab-environment)
```
ubuntu@gelani-mon-1:~$ for p in rgw.meta rgw.control rgw.log rgw.buckets.data rgw.buckets.index; do
  sudo ceph osd pool set $p size 2
  sudo ceph osd pool set $p min_size 1
done
set pool 6 size to 2
set pool 6 min_size to 1
set pool 7 size to 2
set pool 7 min_size to 1
set pool 8 size to 2
set pool 8 min_size to 1
set pool 9 size to 2
set pool 9 min_size to 1
set pool 10 size to 2
set pool 10 min_size to 1
```
## enabling-application-tag
```
ubuntu@gelani-mon-1:~$ for p in rgw.meta rgw.control rgw.log rgw.buckets.data rgw.buckets.index; do
  sudo ceph osd pool application enable $p rgw
done
enabled application 'rgw' on pool 'rgw.meta'
enabled application 'rgw' on pool 'rgw.control'
enabled application 'rgw' on pool 'rgw.log'
enabled application 'rgw' on pool 'rgw.buckets.data'
enabled application 'rgw' on pool 'rgw.buckets.index'
```
# Create-single-site-production-correct-RGW-realm-zonegroup-zone
```
ubuntu@gelani-mon-1:~$ sudo radosgw-admin realm create --rgw-realm=gelani-realm --default
sudo radosgw-admin zonegroup create --rgw-zonegroup=gelani-zg --master --default
sudo radosgw-admin zone create --rgw-zone=gelani-zone \
  --rgw-zonegroup=gelani-zg \
  --master --default
{
    "id": "a0c41d39-5ae1-4297-a6e8-c4771979ffb5",
    "name": "gelani-realm",
    "current_period": "06328a00-0f33-495f-9b98-0f066c01a6e0",
    "epoch": 1
}
{
    "id": "63c60e23-bf34-4636-bed9-d558e33a278e",
    "name": "gelani-zg",
    "api_name": "gelani-zg",
    "is_master": "true",
    "endpoints": [],
    "hostnames": [],
    "hostnames_s3website": [],
    "master_zone": "",
    "zones": [],
    "placement_targets": [],
    "default_placement": "",
    "realm_id": "a0c41d39-5ae1-4297-a6e8-c4771979ffb5",
    "sync_policy": {
        "groups": []
    }
}
{
    "id": "8202dc65-5965-455c-af3f-449068ca70f7",
    "name": "gelani-zone",
    "domain_root": "gelani-zone.rgw.meta:root",
    "control_pool": "gelani-zone.rgw.control",
    "gc_pool": "gelani-zone.rgw.log:gc",
    "lc_pool": "gelani-zone.rgw.log:lc",
    "log_pool": "gelani-zone.rgw.log",
    "intent_log_pool": "gelani-zone.rgw.log:intent",
    "usage_log_pool": "gelani-zone.rgw.log:usage",
    "roles_pool": "gelani-zone.rgw.meta:roles",
    "reshard_pool": "gelani-zone.rgw.log:reshard",
    "user_keys_pool": "gelani-zone.rgw.meta:users.keys",
    "user_email_pool": "gelani-zone.rgw.meta:users.email",
    "user_swift_pool": "gelani-zone.rgw.meta:users.swift",
    "user_uid_pool": "gelani-zone.rgw.meta:users.uid",
    "otp_pool": "gelani-zone.rgw.otp",
    "system_key": {
        "access_key": "",
        "secret_key": ""
    },
    "placement_pools": [
        {
            "key": "default-placement",
            "val": {
                "index_pool": "gelani-zone.rgw.buckets.index",
                "storage_classes": {
                    "STANDARD": {
                        "data_pool": "gelani-zone.rgw.buckets.data"
                    }
                },
                "data_extra_pool": "gelani-zone.rgw.buckets.non-ec",
                "index_type": 0,
                "inline_data": "true"
            }
        }
    ],
    "realm_id": "a0c41d39-5ae1-4297-a6e8-c4771979ffb5",
    "notif_pool": "gelani-zone.rgw.log:notif"
}
```
## commit-config:
```
ubuntu@gelani-mon-1:~$ sudo radosgw-admin period update --commit
2026-01-29T06:39:49.961+0000 7fd8303f0fc0  0 period (06328a00-0f33-495f-9b98-0f066c01a6e0 does not have zone 8202dc65-5965-455c-af3f-449068ca70f7 configured

{
    "id": "8b02b3ee-f346-443e-8484-fdfe5105c25e",
    "epoch": 1,
    "predecessor_uuid": "06328a00-0f33-495f-9b98-0f066c01a6e0",
    "sync_status": [],
    "period_map": {
        "id": "8b02b3ee-f346-443e-8484-fdfe5105c25e",
        "zonegroups": [
            {
                "id": "63c60e23-bf34-4636-bed9-d558e33a278e",
                "name": "gelani-zg",
                "api_name": "gelani-zg",
                "is_master": "true",
                "endpoints": [],
                "hostnames": [],
                "hostnames_s3website": [],
                "master_zone": "8202dc65-5965-455c-af3f-449068ca70f7",
                "zones": [
                    {
                        "id": "8202dc65-5965-455c-af3f-449068ca70f7",
                        "name": "gelani-zone",
                        "endpoints": [],
                        "log_meta": "false",
                        "log_data": "false",
                        "bucket_index_max_shards": 11,
                        "read_only": "false",
                        "tier_type": "",
                        "sync_from_all": "true",
                        "sync_from": [],
                        "redirect_zone": ""
                    }
                ],
                "placement_targets": [
                    {
                        "name": "default-placement",
                        "tags": [],
                        "storage_classes": [
                            "STANDARD"
                        ]
                    }
                ],
                "default_placement": "default-placement",
                "realm_id": "a0c41d39-5ae1-4297-a6e8-c4771979ffb5",
                "sync_policy": {
                    "groups": []
                }
            }
        ],
        "short_zone_ids": [
            {
                "key": "8202dc65-5965-455c-af3f-449068ca70f7",
                "val": 1362335231
            }
        ]
    },
    "master_zonegroup": "63c60e23-bf34-4636-bed9-d558e33a278e",
    "master_zone": "8202dc65-5965-455c-af3f-449068ca70f7",
    "period_config": {
        "bucket_quota": {
            "enabled": false,
            "check_on_raw": false,
            "max_size": -1,
            "max_size_kb": 0,
            "max_objects": -1
        },
        "user_quota": {
            "enabled": false,
            "check_on_raw": false,
            "max_size": -1,
            "max_size_kb": 0,
            "max_objects": -1
        },
        "user_ratelimit": {
            "max_read_ops": 0,
            "max_write_ops": 0,
            "max_read_bytes": 0,
            "max_write_bytes": 0,
            "enabled": false
        },
        "bucket_ratelimit": {
            "max_read_ops": 0,
            "max_write_ops": 0,
            "max_read_bytes": 0,
            "max_write_bytes": 0,
            "enabled": false
        },
        "anonymous_ratelimit": {
            "max_read_ops": 0,
            "max_write_ops": 0,
            "max_read_bytes": 0,
            "max_write_bytes": 0,
            "enabled": false
        }
    },
    "realm_id": "a0c41d39-5ae1-4297-a6e8-c4771979ffb5",
    "realm_name": "gelani-realm",
    "realm_epoch": 2
}
```
# deploy-RGW-service-(HA)
```
ubuntu@gelani-mon-1:~$ sudo ceph orch apply rgw gelani \
  --placement="2 gelani-mon-1 gelani-mon-2 gelani-mon-3" \
  --port 7480
Scheduled rgw.gelani update...
```
## check-status
ubuntu@gelani-mon-1:~$ sudo ceph orch ps --daemon_type rgw
NAME                            HOST          PORTS   STATUS         REFRESHED  AGE  MEM USE  MEM LIM  VERSION  IMAGE ID      CONTAINER ID  
rgw.gelani.gelani-mon-1.cceitw  gelani-mon-1  *:7480  running (13s)     6s ago  13s    84.3M        -  17.2.8   259b35566514  268d7d785ba5  
rgw.gelani.gelani-mon-3.vbvpvz  gelani-mon-3  *:7480  running (12s)     6s ago  12s    84.5M        -  17.2.8   259b35566514  ffe260c21a4e  
ubuntu@gelani-mon-1:~$ curl http://192.168.95.19:7480
<?xml version="1.0" encoding="UTF-8"?><ListAllMyBucketsResult xmlns="http://s3.amazonaws.com/doc/2006-03-01/"><Owner><ID>anonymous</ID><DisplayName></DisplayName></Owner><Buckets></Buckets></ListAllMyBucketsResult>ubuntu@gelani-mon-1:~$ ^C
```
# create-production-style-S3-user
```
ubuntu@gelani-mon-1:~$ sudo radosgw-admin user create \
  --uid="s3admin" \
  --display-name="S3 Admin User"
{
    "user_id": "s3admin",
    "display_name": "S3 Admin User",
    "email": "",
    "suspended": 0,
    "max_buckets": 1000,
    "subusers": [],
    "keys": [
        {
            "user": "s3admin",
            "access_key": "K3TWOHKX5ZP7CDQNEM4E",
            "secret_key": "E6NyqDiP2wvFO8K6Ar65YzN1EKYBqCcjmhkStHzK"
        }
    ],
    "swift_keys": [],
    "caps": [],
    "op_mask": "read, write, delete",
    "default_placement": "",
    "default_storage_class": "",
    "placement_tags": [],
    "bucket_quota": {
        "enabled": false,
        "check_on_raw": false,
        "max_size": -1,
        "max_size_kb": 0,
        "max_objects": -1
    },
    "user_quota": {
        "enabled": false,
        "check_on_raw": false,
        "max_size": -1,
        "max_size_kb": 0,
        "max_objects": -1
    },
    "temp_url_keys": [],
    "type": "rgw",
    "mfa_ids": []
}
```

ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# ceph mgr module enable rgw
root@gelani-mon-1:/# ceph mgr module ls | grep rgw
rgw                on            
root@gelani-mon-1:/# exit
exit
ubuntu@gelani-mon-1:~$ aws --profile ceph-s3 \
  --endpoint-url http://192.168.95.19:7480 \
  s3api put-bucket-versioning \
  --bucket my-first-bucket \
  --versioning-configuration Status=Enabled
Command 'aws' not found, but can be installed with:
sudo snap install aws-cli  # version 1.44.25, or
sudo apt  install awscli   # version 1.22.34-1
See 'snap info aws-cli' for additional versions.
ubuntu@gelani-mon-1:~$ sudo cephadm shell
Inferring fsid a9625cff-fc0e-11f0-a1f6-6998182b0a5e
Inferring config /var/lib/ceph/a9625cff-fc0e-11f0-a1f6-6998182b0a5e/mon.gelani-mon-1/config
Using ceph image with id '259b35566514' and tag 'v17' created on 2024-11-26 00:45:38 +0000 UTC
quay.io/ceph/ceph@sha256:a0f373aaaf5a5ca5c4379c09da24c771b8266a09dc9e2181f90eacf423d7326f
root@gelani-mon-1:/# radosgw-admin quota set \
  --uid s3admin \
  --quota-scope=user \
  --max-size 10G
root@gelani-mon-1:/# radosgw-admin quota enable \
  --uid s3admin \
  --quota-scope=user
root@gelani-mon-1:/# radosgw-admin quota get --uid s3admin
ERROR: Unrecognized argument: 'get'
Expected one of the following:
  disable
  enable
  set
root@gelani-mon-1:/# radosgw-admin quota get --uid s3admin
ERROR: Unrecognized argument: 'get'
Expected one of the following:
  disable
  enable
  set
root@gelani-mon-1:/# radosgw-admin quota show --uid s3admin
ERROR: Unrecognized argument: 'show'
Expected one of the following:
  disable
  enable
  set
root@gelani-mon-1:/# radosgw-admin user info --uid s3admin
{
    "user_id": "s3admin",
    "display_name": "S3 Admin User",
    "email": "",
    "suspended": 0,
    "max_buckets": 1000,
    "subusers": [],
    "keys": [
        {
            "user": "s3admin",
            "access_key": "K3TWOHKX5ZP7CDQNEM4E",
            "secret_key": "E6NyqDiP2wvFO8K6Ar65YzN1EKYBqCcjmhkStHzK"
        }
    ],
    "swift_keys": [],
    "caps": [],
    "op_mask": "read, write, delete",
    "default_placement": "",
    "default_storage_class": "",
    "placement_tags": [],
    "bucket_quota": {
        "enabled": false,
        "check_on_raw": false,
        "max_size": -1,
        "max_size_kb": 0,
        "max_objects": -1
    },
    "user_quota": {
        "enabled": true,
        "check_on_raw": false,
        "max_size": 10737418240,
        "max_size_kb": 10485760,
        "max_objects": -1
    },
    "temp_url_keys": [],
    "type": "rgw",
    "mfa_ids": []
}

root@gelani-mon-1:/# 

```