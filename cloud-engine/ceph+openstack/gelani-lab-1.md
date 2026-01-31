```
#rpc_response_timeout = 120
#quota_snapshots = 10
#quota_backups = 10
#quota_volumes = 10
#my_ip = 192.168.95.93
#state_path = /opt/stack/data/cinder
#osapi_volume_listen = 0.0.0.0
#osapi_volume_extension = cinder.api.contrib.standard_extensions
#rootwrap_config = /etc/cinder/rootwrap.conf
#api_paste_config = /etc/cinder/api-paste.ini
#target_helper = lioadm
#debug = True
#--------------------------------------------------------------------------------
[DEFAULT]
enabled_backends = ceph
default_volume_type = ceph
my_ip = 192.168.95.93
transport_url = rabbit://stackrabbit:SuperSecret123@192.168.95.93:5672/
glance_api_servers = http://192.168.95.93/image
debug = True

[ceph]
volume_driver = cinder.volume.drivers.rbd.RBDDriver
volume_backend_name = ceph

rbd_pool = volume
rbd_user = cinder
rbd_ceph_conf = /etc/ceph/ceph.conf
rbd_keyring_conf = /etc/ceph/ceph.client.cinder.keyring

rbd_flatten_volume_from_snapshot = false
rbd_max_clone_depth = 5
rbd_store_chunk_size = 4

[database]
connection = mysql+pymysql://root:SuperSecret123@127.0.0.1/cinder?charset=utf8&plugin=dbcounter

[keystone_authtoken]
auth_url = http://192.168.95.93/identity
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = cinder
password = SuperSecret123
interface = public
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem

[database]
connection = mysql+pymysql://root:SuperSecret123@127.0.0.1/cinder?charset=utf8&plugin=dbcounter

[oslo_concurrency]
lock_path = /opt/stack/data/cinder

[key_manager]
fixed_key = bae3516cc1c0eb18b05440eba8012a4a880a2ee04d584a9c1579445e675b12defdc716ec
backend = cinder.keymgr.conf_key_mgr.ConfKeyManager

[lvmdriver-1]
image_volume_cache_enabled = True
volume_clear = zero
lvm_type = auto
target_prefix = iqn.2010-10.org.openstack:
target_port = 3260
target_protocol = iscsi
target_helper = lioadm
volume_group = stack-volumes-lvmdriver-1
volume_driver = cinder.volume.drivers.lvm.LVMVolumeDriver
volume_backend_name = lvmdriver-1

[oslo_messaging_notifications]
driver = messagingv2

[glance]
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem
project_domain_name = Default
project_name = service
user_domain_name = Default
password = SuperSecret123
username = glance
auth_url = http://192.168.95.93/identity
interface = public
auth_type = password

[nova]
region_name = RegionOne
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem
project_domain_name = Default
project_name = service
user_domain_name = Default
password = SuperSecret123
username = nova
auth_url = http://192.168.95.93/identity
interface = public
auth_type = password

[coordination]
backend_url = etcd3+http://192.168.95.93:2379?api_version=v3

[oslo_policy]
enforce_new_defaults = false
enforce_scope = false

[service_user]
send_service_user_token = True
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem
project_domain_name = Default
project_name = service
user_domain_name = Default
password = SuperSecret123
username = cinder
auth_url = http://192.168.95.93/identity
interface = public
auth_type = password

[os_brick]
lock_path = /opt/stack/data/os_brick
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo cp -a /etc/cinder/cinder.conf /etc/cinder/cinder.conf.bak.$(date +%F-%H%M%S)

sudo tee /etc/cinder/cinder.conf >/dev/null <<'EOF'
[DEFAULT]
enabled_backends = ceph
default_volume_type = ceph

my_ip = 192.168.95.93
transport_url = rabbit://stackrabbit:SuperSecret123@192.168.95.93:5672/
glance_api_servers = http://192.168.95.93/image

state_path = /opt/stack/data/cinder
lock_path = /opt/stack/data/cinder
debug = True

rootwrap_config = /etc/cinder/rootwrap.conf
api_paste_config = /etc/cinder/api-paste.ini

[ceph]
volume_backend_name = ceph
volume_driver = cinder.volume.drivers.rbd.RBDDriver

rbd_pool = volume
rbd_user = cinder
rbd_ceph_conf = /etc/ceph/ceph.conf

rbd_flatten_volume_from_snapshot = false
rbd_max_clone_depth = 5
rbd_store_chunk_size = 4

[database]
connection = mysql+pymysql://root:SuperSecret123@127.0.0.1/cinder?charset=utf8&plugin=dbcounter

[keystone_authtoken]
auth_url = http://192.168.95.93/identity
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = cinder
password = SuperSecret123
interface = public
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem

[oslo_concurrency]
lock_path = /opt/stack/data/cinder

[oslo_messaging_notifications]
driver = messagingv2

[service_user]
send_service_user_token = True
EOFile = /opt/stack/data/ca-bundle.pemty
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo chown root:stack /etc/ceph/ceph.conf /etc/ceph/ceph.client.cinder.keyring
sudo chmod 644 /etc/ceph/ceph.conf
sudo chmod 640 /etc/ceph/ceph.client.cinder.keyring
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo systemctl restart devstack@c-vol devstack@c-sch devstack@c-api
sudo systemctl status devstack@c-vol --no-pager
● devstack@c-vol.service - Devstack devstack@c-vol.service
     Loaded: loaded (/etc/systemd/system/devstack@c-vol.service; enabled; vendor preset: enabled)
     Active: active (running) since Sat 2026-01-31 14:36:10 UTC; 15ms ago
   Main PID: 1947427 (cinder-volume)
      Tasks: 1 (limit: 38457)
     Memory: 3.1M
        CPU: 13ms
     CGroup: /system.slice/system-devstack.slice/devstack@c-vol.service
             └─1947427 /opt/stack/data/venv/bin/python3.10 /opt/stack/data/venv/bin/cinder-volume --config-file /etc/cinder/cinder.conf

Jan 31 14:36:10 gelani-lab-1 systemd[1]: Started Devstack devstack@c-vol.service.
ubuntu@gelani-lab-1:/opt/stack/devstack$ source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume service list
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
| Binary           | Host                     | Zone | Status  | State | Updated At                 | Cluster | Backend State |
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
| cinder-scheduler | gelani-lab-1             | nova | enabled | up    | 2026-01-31T14:39:13.000000 | None    | None          |
| cinder-volume    | gelani-lab-1@lvmdriver-1 | nova | enabled | down  | 2026-01-31T13:58:17.000000 | None    | None          |
| cinder-volume    | gelani-lab-1@ceph        | nova | enabled | up    | 2026-01-31T14:39:13.000000 | None    | None          |
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo tail -n 30 /etc/cinder/cinder.conf
[keystone_authtoken]
auth_url = http://192.168.95.93/identity
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = cinder
password = SuperSecret123
interface = public
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem

[oslo_concurrency]
lock_path = /opt/stack/data/cinder

[oslo_messaging_notifications]
driver = messagingv2

[service_user]
send_service_user_token = True
auth_url = http://192.168.95.93/identity
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = cinder
password = SuperSecret123
interface = public
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo tee /etc/cinder/cinder.conf >/dev/null <<'EOF'
[DEFAULT]
enabled_backends = ceph
default_volume_type = ceph

my_ip = 192.168.95.93
transport_url = rabbit://stackrabbit:SuperSecret123@192.168.95.93:5672/
glance_api_servers = http://192.168.95.93/image

state_path = /opt/stack/data/cinder
debug = True

rootwrap_config = /etc/cinder/rootwrap.conf
api_paste_config = /etc/cinder/api-paste.ini

[ceph]
volume_backend_name = ceph
volume_driver = cinder.volume.drivers.rbd.RBDDriver
rbd_pool = volume
rbd_user = cinder
rbd_ceph_conf = /etc/ceph/ceph.conf
rbd_flatten_volume_from_snapshot = false
rbd_max_clone_depth = 5
rbd_store_chunk_size = 4

[database]
connection = mysql+pymysql://root:SuperSecret123@127.0.0.1/cinder?charset=utf8&plugin=dbcounter

[keystone_authtoken]
auth_url = http://192.168.95.93/identity
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
username = cinder
password = SuperSecret123
interface = public
memcached_servers = localhost:11211
cafile = /opt/stack/data/ca-bundle.pem

[oslo_concurrency]
lock_path = /opt/stack/data/cinder

[oslo_messaging_notifications]
driver = messagingv2

[service_user]
send_service_user_token = True
auth_url = http://192.168.95.93/identity
auth_type = password
project_domain_name = Default
user_domain_name = Default
project_name = service
EOFile = /opt/stack/data/ca-bundle.pem
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo systemctl restart devstack@c-vol devstack@c-sch devstack@c-api
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo ceph -s --name client.cinder --keyring /etc/ceph/ceph.client.cinder.keyring
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
 
ubuntu@gelani-lab-1:/opt/stack/devstack$ source /opt/stack/devstack/openrc admin admin
openstack volume type show ceph
+--------------------+--------------------------------------+
| Field              | Value                                |
+--------------------+--------------------------------------+
| access_project_ids | None                                 |
| description        | None                                 |
| id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
| is_public          | True                                 |
| name               | ceph                                 |
| properties         | volume_backend_name='ceph'           |
| qos_specs_id       | None                                 |
+--------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --size 1 ceph-vol-1
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T14:45:26.736085           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b751b947-32ca-4e27-b297-baa4020843b3 |
| multiattach                    | False                                |
| name                           | ceph-vol-1                           |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 1                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list --name ceph-vol-1
+--------------------------------------+------------+-----------+------+-------------+
| ID                                   | Name       | Status    | Size | Attached to |
+--------------------------------------+------------+-----------+------+-------------+
| b751b947-32ca-4e27-b297-baa4020843b3 | ceph-vol-1 | available |    1 |             |
+--------------------------------------+------------+-----------+------+-------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show b751b947-32ca-4e27-b297-baa4020843b3
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T14:45:27.000000           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b751b947-32ca-4e27-b297-baa4020843b3 |
| multiattach                    | False                                |
| name                           | ceph-vol-1                           |
| os-vol-host-attr:host          | gelani-lab-1@ceph#ceph               |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | 9fb44e4466264364b4ac3eb936bdc4c2     |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | 62a0e87e-7f48-49a0-a409-c1c84ec1207a |
| shared_targets                 | False                                |
| size                           | 1                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | available                            |
| type                           | ceph                                 |
| updated_at                     | 2026-01-31T14:45:27.000000           |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls --id cinder --keyring /etc/ceph/ceph.client.cinder.keyring
volume-b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume snapshot create --volume b751b947-32ca-4e27-b297-baa4020843b3 ceph-vol-1-snap
openstack volume snapshot show ceph-vol-1-snap
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| created_at  | 2026-01-31T14:47:47.564758           |
| description | None                                 |
| id          | e21c5302-ba97-4be4-a8c5-f40b5b390c31 |
| name        | ceph-vol-1-snap                      |
| properties  |                                      |
| size        | 1                                    |
| status      | creating                             |
| volume_id   | b751b947-32ca-4e27-b297-baa4020843b3 |
+-------------+--------------------------------------+
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| created_at  | 2026-01-31T14:47:48.000000           |
| description | None                                 |
| id          | e21c5302-ba97-4be4-a8c5-f40b5b390c31 |
| name        | ceph-vol-1-snap                      |
| properties  |                                      |
| size        | 1                                    |
| status      | available                            |
| volume_id   | b751b947-32ca-4e27-b297-baa4020843b3 |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --image b6e575cd-c986-4098-a75f-136eafa50af2 --type ceph --size 5 ceph-boot-vol
openstack volume show ceph-boot-vol
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T14:48:43.982801           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | 4c67f1c6-6d25-4af4-a05f-944934af35d0 |
| multiattach                    | False                                |
| name                           | ceph-boot-vol                        |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 5                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T14:48:44.000000           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | 4c67f1c6-6d25-4af4-a05f-944934af35d0 |
| multiattach                    | False                                |
| name                           | ceph-boot-vol                        |
| os-vol-host-attr:host          | gelani-lab-1@ceph#ceph               |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | 9fb44e4466264364b4ac3eb936bdc4c2     |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 5                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | 2026-01-31T14:48:44.000000           |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack flavor list
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
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack flavor list
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
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack network list
+--------------------------------------+----------+----------------------------------------------------------------------------+
| ID                                   | Name     | Subnets                                                                    |
+--------------------------------------+----------+----------------------------------------------------------------------------+
| 172b9757-3f94-4b3a-8588-aaef9f5d94e3 | public   | 0f51c1e9-b2bb-4546-a208-2f911e514369, 17c9de01-9f5b-422c-b9ce-53cc4a3f2cdc |
| 34be5cb2-fc34-4a8b-b337-41595e361e6d | heat-net | 6914f2f9-8d4e-4138-8a06-b8bbd45bb3bb                                       |
| 68a7ad34-b3e9-48a4-a3cc-c178a4d89ddd | shared   | 13063700-83a4-402f-8cc9-0ca93ac96bf6                                       |
| af7ee1c4-02c6-438b-8784-93690f664a47 | private  | 6adea907-730d-4318-98d5-1908d2d013fc, ee882e21-e946-48f8-9873-826e2c5e68b8 |
+--------------------------------------+----------+----------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
openstack server create \
  --flavor 1 \
  --network af7ee1c4-02c6-438b-8784-93690f664a47 \
  --volume ceph-boot-vol \
  ceph-vm-1
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-1                                                                                                                                                                                          |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-8wk00bqs                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | L8NxzriGPoo9                                                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                                                               |
| created                             | 2026-01-31T14:50:40Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | 9b0fb30d-69e5-4a2f-bc2b-daf599fd1d04                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-1                                                                                                                                                                                          |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T14:50:40Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | nova                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | gelani-lab-1                                                                                                                                                                                       |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-1                                                                                                                                                                                          |
| OS-EXT-SRV-ATTR:hypervisor_hostname | gelani-lab-1                                                                                                                                                                                       |
| OS-EXT-SRV-ATTR:instance_name       | instance-00000003                                                                                                                                                                                  |
| OS-EXT-SRV-ATTR:kernel_id           |                                                                                                                                                                                                    |
| OS-EXT-SRV-ATTR:launch_index        | 0                                                                                                                                                                                                  |
| OS-EXT-SRV-ATTR:ramdisk_id          |                                                                                                                                                                                                    |
| OS-EXT-SRV-ATTR:reservation_id      | r-8wk00bqs                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | /dev/vda                                                                                                                                                                                           |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | NOSTATE                                                                                                                                                                                            |
| OS-EXT-STS:task_state               | block_device_mapping                                                                                                                                                                               |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          |                                                                                                                                                                                                    |
| accessIPv6                          |                                                                                                                                                                                                    |
| addresses                           |                                                                                                                                                                                                    |
| config_drive                        |                                                                                                                                                                                                    |
| created                             | 2026-01-31T14:50:40Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | 1a9b341366ed487e3339a9c39458983be209eda548d47c346dcbc484                                                                                                                                           |
| host_status                         | UP                                                                                                                                                                                                 |
| id                                  | 9b0fb30d-69e5-4a2f-bc2b-daf599fd1d04                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | False                                                                                                                                                                                              |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-1                                                                                                                                                                                          |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | 0                                                                                                                                                                                                  |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          |                                                                                                                                                                                                    |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T14:50:46Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    | delete_on_termination='False', id='4c67f1c6-6d25-4af4-a05f-944934af35d0'                                                                                                                           |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show ceph-boot-vol
+--------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                          | Value                                                                                                                                                                                                   |
+--------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| attachments                    | []                                                                                                                                                                                                      |
| availability_zone              | nova                                                                                                                                                                                                    |
| backup_id                      | None                                                                                                                                                                                                    |
| bootable                       | True                                                                                                                                                                                                    |
| cluster_name                   | None                                                                                                                                                                                                    |
| consumes_quota                 | True                                                                                                                                                                                                    |
| created_at                     | 2026-01-31T14:48:44.000000                                                                                                                                                                              |
| description                    | None                                                                                                                                                                                                    |
| encrypted                      | False                                                                                                                                                                                                   |
| group_id                       | None                                                                                                                                                                                                    |
| id                             | 4c67f1c6-6d25-4af4-a05f-944934af35d0                                                                                                                                                                    |
| multiattach                    | False                                                                                                                                                                                                   |
| name                           | ceph-boot-vol                                                                                                                                                                                           |
| os-vol-host-attr:host          | gelani-lab-1@ceph#ceph                                                                                                                                                                                  |
| os-vol-mig-status-attr:migstat | None                                                                                                                                                                                                    |
| os-vol-mig-status-attr:name_id | None                                                                                                                                                                                                    |
| os-vol-tenant-attr:tenant_id   | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                        |
| properties                     |                                                                                                                                                                                                         |
| provider_id                    | None                                                                                                                                                                                                    |
| replication_status             | None                                                                                                                                                                                                    |
| service_uuid                   | 62a0e87e-7f48-49a0-a409-c1c84ec1207a                                                                                                                                                                    |
| shared_targets                 | False                                                                                                                                                                                                   |
| size                           | 5                                                                                                                                                                                                       |
| snapshot_id                    | None                                                                                                                                                                                                    |
| source_volid                   | None                                                                                                                                                                                                    |
| status                         | available                                                                                                                                                                                               |
| type                           | ceph                                                                                                                                                                                                    |
| updated_at                     | 2026-01-31T14:50:55.000000                                                                                                                                                                              |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                        |
| volume_image_metadata          | {'signature_verified': 'False', 'image_id': 'b6e575cd-c986-4098-a75f-136eafa50af2', 'image_name': 'ubuntu', 'checksum': 'feae9da27c50da7f45bfcca6b1f8aae0', 'container_format': 'bare', 'disk_format':  |
|                                | 'qcow2', 'min_disk': '0', 'min_ram': '0', 'size': '688868864'}                                                                                                                                          |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411                                                                                                                                                                    |
+--------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@n-cpu -n 200 --no-pager
Jan 31 14:56:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:23 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:56:24 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:56:24 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:56:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:30 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:30 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:30 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:30 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:30 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:30 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:35 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:35 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:35 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:35 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:35 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:35 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:40 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:40 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:40 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:40 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:40 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:40 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:44 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._sync_scheduler_instance_info {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:56:45 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:45 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:45 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:45 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:45 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:45 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:48 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._cleanup_expired_console_auth_tokens {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:56:50 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:50 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:50 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:50 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:50 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:50 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:51 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._run_pending_deletes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:56:51 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Cleaning up deleted instances {{(pid=1932170) _run_pending_deletes /opt/stack/nova/nova/compute/manager.py:11955}}
Jan 31 14:56:51 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] There are 0 instances to clean {{(pid=1932170) _run_pending_deletes /opt/stack/nova/nova/compute/manager.py:11964}}
Jan 31 14:56:55 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:55 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:56:55 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:56:55 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:56:55 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:56:55 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:00 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:00 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:00 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:00 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:00 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:00 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:01 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:01 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 14:57:01 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.000s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 14:57:01 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 14:57:01 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1932170) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG nova.virt.libvirt.driver [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1932170) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG nova.virt.libvirt.driver [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1932170) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: WARNING nova.virt.libvirt.driver [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.processutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1932170) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.processutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] CMD "env LANG=C uptime" returned: 0 in 0.017s {{(pid=1932170) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=18244MB free_disk=10.970806121826172GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1932170) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 14:57:02 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.001s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '1', 'uptime': ' 14:57:02 up 12 days,  2:07,  1 user,  load average: 0.16, 0.24, 0.29\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Refreshing inventories for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1932170) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:822}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Updating ProviderTree inventory for provider ba2ec314-9891-498b-82cc-7a5f896382bf from _refresh_and_get_inventory using data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) _refresh_and_get_inventory /opt/stack/nova/nova/scheduler/client/report.py:786}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.provider_tree [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Updating inventory in ProviderTree for provider ba2ec314-9891-498b-82cc-7a5f896382bf with inventory: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:176}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Refreshing aggregate associations for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf, aggregates: None {{(pid=1932170) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:831}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Refreshing trait associations for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf, traits: COMPUTE_IMAGE_TYPE_AMI,COMPUTE_GRAPHICS_MODEL_CIRRUS,COMPUTE_NET_VIF_MODEL_E1000,COMPUTE_VOLUME_ATTACH_WITH_TAG,COMPUTE_DEVICE_TAGGING,HW_CPU_X86_MMX,COMPUTE_SECURITY_UEFI_SECURE_BOOT,COMPUTE_VOLUME_MULTI_ATTACH,COMPUTE_NET_VIF_MODEL_SPAPR_VLAN,HW_CPU_X86_SSE,COMPUTE_NET_VIF_MODEL_RTL8139,COMPUTE_IMAGE_TYPE_ISO,HW_CPU_X86_SSSE3,COMPUTE_SOUND_MODEL_ICH6,COMPUTE_NET_VIF_MODEL_E1000E,COMPUTE_VIOMMU_MODEL_INTEL,COMPUTE_STORAGE_BUS_USB,COMPUTE_IMAGE_TYPE_AKI,COMPUTE_ARCH_X86_64,COMPUTE_SOUND_MODEL_ICH9,COMPUTE_ACCELERATORS,COMPUTE_SOUND_MODEL_PCSPK,COMPUTE_SOUND_MODEL_SB16,COMPUTE_NET_VIF_MODEL_VIRTIO,COMPUTE_STORAGE_VIRTIO_FS,COMPUTE_STORAGE_BUS_IDE,COMPUTE_SOUND_MODEL_USB,COMPUTE_GRAPHICS_MODEL_BOCHS,COMPUTE_RESCUE_BFV,COMPUTE_GRAPHICS_MODEL_VIRTIO,COMPUTE_NET_VIRTIO_PACKED,COMPUTE_NET_ATTACH_INTERFACE_WITH_TAG,COMPUTE_NET_VIF_MODEL_PCNET,COMPUTE_NET_VIF_MODEL_NE2K_PCI,HW_CPU_X86_SSE2,COMPUTE_SOUND_MODEL_AC97,COMPUTE_VIOMMU_MODEL_AUTO,HW_ARCH_X86_64,COMPUTE_GRAPHICS_MODEL_QXL,COMPUTE_GRAPHICS_MODEL_NONE,COMPUTE_NET_ATTACH_INTERFACE,COMPUTE_SOCKET_PCI_NUMA_AFFINITY,COMPUTE_GRAPHICS_MODEL_VGA,HW_CPU_X86_SSE41,COMPUTE_STORAGE_BUS_SCSI,COMPUTE_VOLUME_EXTEND,COMPUTE_GRAPHICS_MODEL_VMVGA,COMPUTE_TRUSTED_CERTS,COMPUTE_STORAGE_BUS_SATA,COMPUTE_STORAGE_BUS_VIRTIO,COMPUTE_NET_VIF_MODEL_VMXNET3,COMPUTE_STORAGE_BUS_FDC,COMPUTE_IMAGE_TYPE_RAW,COMPUTE_NODE,COMPUTE_IMAGE_TYPE_ARI,HW_CPU_X86_SSE42,COMPUTE_IMAGE_TYPE_QCOW2,COMPUTE_SOUND_MODEL_ES1370 {{(pid=1932170) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:843}}
Jan 31 14:57:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.provider_tree [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1932170) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 14:57:04 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 14:57:04 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1932170) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 14:57:04 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.171s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 14:57:05 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:05 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:05 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:05 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:05 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:05 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:09 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:10 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:12 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:12 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1932170) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 14:57:14 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:14 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._cleanup_incomplete_migrations {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:14 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Cleaning up deleted instances with incomplete migration  {{(pid=1932170) _cleanup_incomplete_migrations /opt/stack/nova/nova/compute/manager.py:11993}}
Jan 31 14:57:15 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:15 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:15 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:15 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:15 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:15 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:20 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:25 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:25 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4998-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:25 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:26 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:26 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:27 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:57:31 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:31 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:31 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:31 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:31 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:31 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:36 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:36 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:36 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:36 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:36 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:36 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:41 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:41 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:41 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:41 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:41 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:41 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:46 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:51 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:51 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:51 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:51 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:51 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:51 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:56 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:56 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:57:56 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:57:56 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:57:56 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:57:56 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:01 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:58:01 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:58:01 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:58:01 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:01 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:58:01 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:02 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:58:03 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 14:58:03 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.001s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 14:58:03 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 14:58:03 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1932170) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG nova.virt.libvirt.driver [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1932170) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG nova.virt.libvirt.driver [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1932170) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: WARNING nova.virt.libvirt.driver [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.processutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1932170) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.processutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] CMD "env LANG=C uptime" returned: 0 in 0.027s {{(pid=1932170) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=18247MB free_disk=10.969696044921875GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1932170) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 14:58:04 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.001s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 14:58:05 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 14:58:05 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 14:58:05 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 14:58:05 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '1', 'uptime': ' 14:58:04 up 12 days,  2:08,  1 user,  load average: 0.21, 0.24, 0.28\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 14:58:05 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.provider_tree [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1932170) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 14:58:05 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1932170) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.089s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:58:06 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5001 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 14:58:11 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 14:58:12 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-609abe85-1516-4898-9bd6-025478f235e7 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show ceph-boot-vol
openstack server show ceph-vm-1 -c status -c OS-EXT-STS:task_state -c OS-EXT-STS:vm_state -c addresses
+--------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                          | Value                                                                                                                                                                                                   |
+--------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| attachments                    | []                                                                                                                                                                                                      |
| availability_zone              | nova                                                                                                                                                                                                    |
| backup_id                      | None                                                                                                                                                                                                    |
| bootable                       | True                                                                                                                                                                                                    |
| cluster_name                   | None                                                                                                                                                                                                    |
| consumes_quota                 | True                                                                                                                                                                                                    |
| created_at                     | 2026-01-31T14:48:44.000000                                                                                                                                                                              |
| description                    | None                                                                                                                                                                                                    |
| encrypted                      | False                                                                                                                                                                                                   |
| group_id                       | None                                                                                                                                                                                                    |
| id                             | 4c67f1c6-6d25-4af4-a05f-944934af35d0                                                                                                                                                                    |
| multiattach                    | False                                                                                                                                                                                                   |
| name                           | ceph-boot-vol                                                                                                                                                                                           |
| os-vol-host-attr:host          | gelani-lab-1@ceph#ceph                                                                                                                                                                                  |
| os-vol-mig-status-attr:migstat | None                                                                                                                                                                                                    |
| os-vol-mig-status-attr:name_id | None                                                                                                                                                                                                    |
| os-vol-tenant-attr:tenant_id   | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                        |
| properties                     |                                                                                                                                                                                                         |
| provider_id                    | None                                                                                                                                                                                                    |
| replication_status             | None                                                                                                                                                                                                    |
| service_uuid                   | 62a0e87e-7f48-49a0-a409-c1c84ec1207a                                                                                                                                                                    |
| shared_targets                 | False                                                                                                                                                                                                   |
| size                           | 5                                                                                                                                                                                                       |
| snapshot_id                    | None                                                                                                                                                                                                    |
| source_volid                   | None                                                                                                                                                                                                    |
| status                         | available                                                                                                                                                                                               |
| type                           | ceph                                                                                                                                                                                                    |
| updated_at                     | 2026-01-31T14:50:55.000000                                                                                                                                                                              |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                        |
| volume_image_metadata          | {'signature_verified': 'False', 'image_id': 'b6e575cd-c986-4098-a75f-136eafa50af2', 'image_name': 'ubuntu', 'checksum': 'feae9da27c50da7f45bfcca6b1f8aae0', 'container_format': 'bare', 'disk_format':  |
|                                | 'qcow2', 'min_disk': '0', 'min_ram': '0', 'size': '688868864'}                                                                                                                                          |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411                                                                                                                                                                    |
+--------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| addresses             |       |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ 




s allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:13:22 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 17:13:22 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '1', 'uptime': ' 17:13:21 up 12 days,  4:23,  1 user,  load average: 0.16, 0.40, 0.49\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 17:13:22 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.provider_tree [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1932170) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 17:13:22 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 17:13:23 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1932170) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 17:13:23 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.086s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:13:25 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5001 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:27 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._sync_scheduler_instance_info {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:28 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5076 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:13:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:34 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:13:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:13:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:46 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:13:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:52 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:57 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:57 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:13:57 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5005 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:13:57 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:57 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:13:57 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:13:59 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:13:59 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1932170) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 17:14:02 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:02 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:02 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5001 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:02 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:02 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:02 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:07 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:07 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:07 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5004 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:07 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:07 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:07 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:10 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:12 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:12 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:12 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5039 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:12 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:12 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:12 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:17 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:17 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:17 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:17 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:17 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:17 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:21 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager.update_available_resource {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.001s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1932170) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:22 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG nova.virt.libvirt.driver [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1932170) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG nova.virt.libvirt.driver [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1932170) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: WARNING nova.virt.libvirt.driver [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.processutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1932170) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.processutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] CMD "env LANG=C uptime" returned: 0 in 0.016s {{(pid=1932170) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=18107MB free_disk=10.867305755615234GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1932170) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:14:23 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.000s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1932170) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '1', 'uptime': ' 17:14:23 up 12 days,  4:24,  1 user,  load average: 0.21, 0.37, 0.47\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1932170) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Refreshing inventories for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1932170) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:822}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Updating ProviderTree inventory for provider ba2ec314-9891-498b-82cc-7a5f896382bf from _refresh_and_get_inventory using data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) _refresh_and_get_inventory /opt/stack/nova/nova/scheduler/client/report.py:786}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.provider_tree [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Updating inventory in ProviderTree for provider ba2ec314-9891-498b-82cc-7a5f896382bf with inventory: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:176}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Refreshing aggregate associations for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf, aggregates: None {{(pid=1932170) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:831}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Refreshing trait associations for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf, traits: COMPUTE_IMAGE_TYPE_AMI,COMPUTE_GRAPHICS_MODEL_CIRRUS,COMPUTE_NET_VIF_MODEL_E1000,COMPUTE_VOLUME_ATTACH_WITH_TAG,COMPUTE_DEVICE_TAGGING,HW_CPU_X86_MMX,COMPUTE_SECURITY_UEFI_SECURE_BOOT,COMPUTE_VOLUME_MULTI_ATTACH,COMPUTE_NET_VIF_MODEL_SPAPR_VLAN,HW_CPU_X86_SSE,COMPUTE_NET_VIF_MODEL_RTL8139,COMPUTE_IMAGE_TYPE_ISO,HW_CPU_X86_SSSE3,COMPUTE_SOUND_MODEL_ICH6,COMPUTE_NET_VIF_MODEL_E1000E,COMPUTE_VIOMMU_MODEL_INTEL,COMPUTE_STORAGE_BUS_USB,COMPUTE_IMAGE_TYPE_AKI,COMPUTE_ARCH_X86_64,COMPUTE_SOUND_MODEL_ICH9,COMPUTE_ACCELERATORS,COMPUTE_SOUND_MODEL_PCSPK,COMPUTE_SOUND_MODEL_SB16,COMPUTE_NET_VIF_MODEL_VIRTIO,COMPUTE_STORAGE_VIRTIO_FS,COMPUTE_STORAGE_BUS_IDE,COMPUTE_SOUND_MODEL_USB,COMPUTE_GRAPHICS_MODEL_BOCHS,COMPUTE_RESCUE_BFV,COMPUTE_GRAPHICS_MODEL_VIRTIO,COMPUTE_NET_VIRTIO_PACKED,COMPUTE_NET_ATTACH_INTERFACE_WITH_TAG,COMPUTE_NET_VIF_MODEL_PCNET,COMPUTE_NET_VIF_MODEL_NE2K_PCI,HW_CPU_X86_SSE2,COMPUTE_SOUND_MODEL_AC97,COMPUTE_VIOMMU_MODEL_AUTO,HW_ARCH_X86_64,COMPUTE_GRAPHICS_MODEL_QXL,COMPUTE_GRAPHICS_MODEL_NONE,COMPUTE_NET_ATTACH_INTERFACE,COMPUTE_SOCKET_PCI_NUMA_AFFINITY,COMPUTE_GRAPHICS_MODEL_VGA,HW_CPU_X86_SSE41,COMPUTE_STORAGE_BUS_SCSI,COMPUTE_VOLUME_EXTEND,COMPUTE_GRAPHICS_MODEL_VMVGA,COMPUTE_TRUSTED_CERTS,COMPUTE_STORAGE_BUS_SATA,COMPUTE_STORAGE_BUS_VIRTIO,COMPUTE_NET_VIF_MODEL_VMXNET3,COMPUTE_STORAGE_BUS_FDC,COMPUTE_IMAGE_TYPE_RAW,COMPUTE_NODE,COMPUTE_IMAGE_TYPE_ARI,HW_CPU_X86_SSE42,COMPUTE_IMAGE_TYPE_QCOW2,COMPUTE_SOUND_MODEL_ES1370 {{(pid=1932170) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:843}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.provider_tree [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1932170) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 17:14:24 gelani-lab-1 nova-compute[1932170]: DEBUG nova.scheduler.client.report [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1932170) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 17:14:25 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.resource_tracker [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1932170) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 17:14:25 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_concurrency.lockutils [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.143s {{(pid=1932170) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:14:26 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5034 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:27 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:29 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:29 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:32 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:36 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5055 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:37 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:42 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1932170) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1932170) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:14:47 gelani-lab-1 nova-compute[1932170]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1932170) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:14:48 gelani-lab-1 nova-compute[1932170]: DEBUG oslo_service.periodic_task [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Running periodic task ComputeManager._run_pending_deletes {{(pid=1932170) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:14:48 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] Cleaning up deleted instances {{(pid=1932170) _run_pending_deletes /opt/stack/nova/nova/compute/manager.py:11955}}
Jan 31 17:14:48 gelani-lab-1 nova-compute[1932170]: DEBUG nova.compute.manager [None req-c4f93d24-602c-4e70-af34-ffc4d0f52aab None None] There are 0 instances to clean {{(pid=1932170) _run_pending_deletes /opt/stack/nova/nova/compute/manager.py:11964}}
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@c-vol -n 250 --no-pager
Jan 31 16:46:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:40.910 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:46:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:40.910 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:46:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:40.941 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:46:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:40.964 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:46:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:41.873 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:46:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:41.876 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:46:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:46:51.883 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:47:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:11.880 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:47:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:11.882 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:47:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:21.887 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:47:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:40.907 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:47:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:40.908 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:47:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:40.935 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:47:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:40.954 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:47:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:41.883 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:47:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:47:51.889 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:48:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:01.891 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:48:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:11.895 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:48:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:21.898 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:48:31 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:31.901 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:48:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:40.908 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:48:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:40.909 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:48:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:40.938 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:48:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:40.964 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:48:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:51.903 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:48:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:48:51.905 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:49:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:11.910 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:49:31 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:31.909 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:49:31 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:31.913 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:49:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:40.908 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:49:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:40.909 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:49:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:40.935 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:49:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:40.956 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:49:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:49:51.915 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:50:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:01.921 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:50:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:11.926 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:50:31 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:31.928 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:50:31 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:31.932 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:50:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:40.910 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:50:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:40.911 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:50:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:40.934 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:50:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:40.954 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:50:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:51.936 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:50:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:50:51.939 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:51:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:11.942 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:51:11 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:11.944 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:51:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:21.948 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:51:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:40.908 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:51:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:40.909 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:51:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:40.935 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:51:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:40.953 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:51:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:51:41.946 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:01.941 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:01.943 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:21.948 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:21.952 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:31 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:31.957 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:40.906 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:52:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:40.907 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:52:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:40.932 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:52:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:40.954 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:52:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:51.952 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:52:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:52:51.955 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:53:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:01.962 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:53:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:21.957 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:53:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:21.960 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:53:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:40.907 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:53:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:40.909 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:53:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:40.935 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:53:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:40.958 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:53:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:53:41.967 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:54:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:01.971 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:54:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:01.974 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:54:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:21.979 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:54:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:21.984 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:54:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:40.912 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:54:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:40.912 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:54:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:40.946 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:54:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:40.967 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:54:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:41.989 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:54:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:54:41.991 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:55:01 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:01.996 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:55:21 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:21.997 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:55:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:32.000 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:55:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:40.910 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:55:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:40.911 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:55:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:40.942 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:55:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:40.961 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:55:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:55:42.004 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:56:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:02.000 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:56:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:22.004 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:56:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:32.008 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:56:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:40.915 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:56:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:40.916 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:56:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:40.984 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:41.002 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:56:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:56:52.006 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:57:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:12.010 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:57:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:12.012 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:57:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:32.016 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:57:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:32.020 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:57:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:40.915 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:57:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:40.916 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:57:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:40.947 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:57:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:40.971 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:57:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:57:42.026 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:58:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:02.029 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:58:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:12.033 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:58:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:22.035 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:58:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:40.915 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:58:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:40.915 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:58:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:40.938 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:58:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:40.958 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:58:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:42.041 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:58:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:58:42.043 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:59:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:02.046 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:59:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:12.052 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:59:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:22.053 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:59:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:40.912 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 16:59:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:40.913 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:59:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:40.934 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 16:59:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:40.952 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 16:59:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:42.052 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:59:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:42.054 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 16:59:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 16:59:52.059 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:00:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:02.062 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:00:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:12.065 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:00:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:22.068 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:00:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:32.071 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:00:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:40.915 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:00:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:40.917 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:00:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:40.942 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:00:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:40.966 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:00:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:00:52.068 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:01:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:02.072 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:01:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:22.074 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:01:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:32.079 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:01:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:40.919 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:01:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:40.920 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:01:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:40.946 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:01:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:40.969 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:01:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:01:52.082 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:02:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:12.086 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:02:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:12.089 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:02:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:32.096 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:02:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:40.923 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:02:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:40.923 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:02:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:40.944 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:02:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:40.966 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:02:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:02:52.100 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:03:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:02.105 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:03:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:22.099 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:03:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:32.106 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:03:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:40.919 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:03:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:40.920 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:03:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:40.947 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:03:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:40.967 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:03:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:42.109 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:03:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:03:52.113 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:04:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:12.118 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:04:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:32.120 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:04:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:32.122 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:04:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:40.921 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:04:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:40.921 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:04:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:40.944 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:04:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:40.966 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:04:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:04:52.123 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:05:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:02.129 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:05:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:12.132 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:05:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:32.136 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:05:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:40.920 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:05:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:40.921 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:05:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:40.947 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:05:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:05:40.970 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:06:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:02.143 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:06:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:12.148 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:06:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:22.152 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:06:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:40.924 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:06:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:40.925 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:06:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:40.954 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:06:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:40.973 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:06:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:42.153 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:06:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:06:42.156 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:07:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:02.162 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:07:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:22.169 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:07:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:32.171 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:07:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:40.929 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:07:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:40.929 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:07:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:40.951 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:07:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:07:40.974 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:08:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:02.176 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:08:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:02.179 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:08:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:22.184 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:08:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:32.188 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:08:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:40.928 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:08:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:40.929 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:08:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:40.952 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:08:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:40.970 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:08:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:42.190 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:08:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:08:52.195 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:09:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:12.192 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:09:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:22.199 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:09:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:40.934 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:09:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:40.935 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:09:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:40.960 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:09:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:40.980 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:09:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:42.193 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:09:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:09:52.198 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:10:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:02.200 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:10:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:12.205 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:10:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:22.206 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:10:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:32.212 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:10:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:40.934 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:10:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:40.935 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:10:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:40.957 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:10:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:40.975 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:10:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:42.214 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:10:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:10:52.217 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:11:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:11:12.220 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:11:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:11:12.223 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:11:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:11:32.226 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:11:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:11:32.228 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:11:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:11:42.236 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:11:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:11:52.238 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:12:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:12.243 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:12:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:12.245 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:12:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:22.251 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:12:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:40.941 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:12:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:40.942 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:12:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:40.968 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:12:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:40.989 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:12:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:42.254 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:12:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:12:52.259 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:13:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:02.265 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:13:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:12.268 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:13:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:32.270 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:13:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:40.943 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:13:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:40.943 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:13:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:40.967 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:13:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:40.986 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:13:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:13:42.278 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:14:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:02.280 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:14:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:02.283 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:14:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:12.288 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:14:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:22.292 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:14:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:40.941 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:14:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:40.941 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:14:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:40.966 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:14:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:40.987 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:14:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:14:42.286 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
ubuntu@gelani-lab-1:/opt/stack/devstack$ which rbd
rbd --version
/usr/bin/rbd
ceph version 17.2.9 (69bf48f20731a4b0d742613f6c6335ccb54dd217) quincy (stable)
ubuntu@gelani-lab-1:/opt/stack/devstack$ ps aux | egrep 'qemu-system|libvirtd' | head
id libvirt-qemu 2>/dev/null || true
id nova 2>/dev/null || true
root       55638  0.0  0.0 1633236 29528 ?       Ssl  Jan19  11:56 /usr/sbin/libvirtd
libvirt+ 1322005  0.3  0.5 752208 174608 ?       Sl   Jan27  18:45 /usr/bin/qemu-system-x86_64 -name guest=instance-00000001,debug-threads=on -S -object {"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-instance-00000001/master-key.aes"} -machine pc-i440fx-6.2,usb=off,dump-guest-core=off,memory-backend=pc.ram -accel kvm -cpu Nehalem -m 128 -object {"qom-type":"memory-backend-ram","id":"pc.ram","size":134217728} -overcommit mem-lock=off -smp 1,sockets=1,dies=1,cores=1,threads=1 -uuid 1a155fc3-49dd-44be-853d-e19221446b64 -smbios type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=32.1.0,serial=1a155fc3-49dd-44be-853d-e19221446b64,uuid=1a155fc3-49dd-44be-853d-e19221446b64,family=Virtual Machine -no-user-config -nodefaults -chardev socket,id=charmonitor,fd=34,server=on,wait=off -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-hpet -no-shutdown -boot strict=on -blockdev {"driver":"host_device","filename":"/dev/sda","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"} -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=libvirt-1-format,id=ua-e6244cf1-4d20-43c8-813e-7f0e36643271,bootindex=1,write-cache=on,serial=e6244cf1-4d20-43c8-813e-7f0e36643271 -netdev tap,fd=36,id=hostnet0,vhost=on,vhostfd=38 -device virtio-net-pci,host_mtu=1442,netdev=hostnet0,id=net0,mac=fa:16:3e:32:85:e2,bus=pci.0,addr=0x3 -add-fd set=3,fd=35 -chardev pty,id=charserial0,logfile=/dev/fdset/3,logappend=on -device isa-serial,chardev=charserial0,id=serial0 -audiodev {"id":"audio1","driver":"none"} -vnc 0.0.0.0:0,audiodev=audio1 -device virtio-vga,id=video0,max_outputs=1,bus=pci.0,addr=0x2 -device virtio-balloon-pci,id=balloon0,deflate-on-oom=on,free-page-reporting=on,bus=pci.0,addr=0x5 -object {"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"} -device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x6 -device vmcoreinfo -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on
libvirt+ 1479008  0.5  2.6 2794428 880368 ?      Sl   Jan28  27:11 /usr/bin/qemu-system-x86_64 -name guest=instance-00000002,debug-threads=on -S -object {"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-2-instance-00000002/master-key.aes"} -machine pc-i440fx-6.2,usb=off,dump-guest-core=off,memory-backend=pc.ram -accel kvm -cpu Nehalem -m 2048 -object {"qom-type":"memory-backend-ram","id":"pc.ram","size":2147483648} -overcommit mem-lock=off -smp 2,sockets=2,dies=1,cores=1,threads=1 -uuid c0c53027-178e-4ac8-9ac9-955d0c6dc606 -smbios type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=32.1.0,serial=c0c53027-178e-4ac8-9ac9-955d0c6dc606,uuid=c0c53027-178e-4ac8-9ac9-955d0c6dc606,family=Virtual Machine -no-user-config -nodefaults -chardev socket,id=charmonitor,fd=37,server=on,wait=off -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-hpet -no-shutdown -boot strict=on -blockdev {"driver":"host_device","filename":"/dev/sdb","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"} -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=libvirt-1-format,id=ua-5f35d8ce-23d4-4771-aaed-cf25c9791752,bootindex=1,write-cache=on,serial=5f35d8ce-23d4-4771-aaed-cf25c9791752 -netdev tap,fd=40,id=hostnet0,vhost=on,vhostfd=42 -device virtio-net-pci,host_mtu=1442,netdev=hostnet0,id=net0,mac=fa:16:3e:e3:4a:51,bus=pci.0,addr=0x3 -add-fd set=3,fd=39 -chardev pty,id=charserial0,logfile=/dev/fdset/3,logappend=on -device isa-serial,chardev=charserial0,id=serial0 -audiodev {"id":"audio1","driver":"none"} -vnc 0.0.0.0:1,audiodev=audio1 -device virtio-vga,id=video0,max_outputs=1,bus=pci.0,addr=0x2 -device virtio-balloon-pci,id=balloon0,deflate-on-oom=on,free-page-reporting=on,bus=pci.0,addr=0x5 -object {"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"} -device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x6 -device vmcoreinfo -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on
ubuntu   1967675  0.0  0.0   7004  2536 pts/1    S+   17:15   0:00 grep -E --color=auto qemu-system|libvirtd
uid=64055(libvirt-qemu) gid=109(kvm) groups=109(kvm),64055(libvirt-qemu)
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo chown root:libvirt /etc/ceph/ceph.client.cinder.keyring 2>/dev/null || sudo chown root:libvirtd /etc/ceph/ceph.client.cinder.keyring 2>/dev/null || true
sudo chmod 640 /etc/ceph/ceph.client.cinder.keyring
sudo chmod 644 /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo systemctl restart devstack@n-cpu
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server delete ceph-vm-1
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor 1 \
  --network af7ee1c4-02c6-438b-8784-93690f664a47 \
  --volume ceph-boot-vol \
  ceph-vm-1
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-1                                                                                                                                                                                          |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-3ev4281c                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | b8sDP4PCuAgE                                                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                                                               |
| created                             | 2026-01-31T17:15:45Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | ba03753d-2c3b-4431-979f-9bbd1eecf323                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-1                                                                                                                                                                                          |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T17:15:45Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+----------------------+
| Field                 | Value                |
+-----------------------+----------------------+
| OS-EXT-STS:task_state | block_device_mapping |
| OS-EXT-STS:vm_state   | building             |
| status                | BUILD                |
+-----------------------+----------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+------------+
| Field                 | Value      |
+-----------------------+------------+
| OS-EXT-STS:task_state | scheduling |
| OS-EXT-STS:vm_state   | building   |
| status                | BUILD      |
+-----------------------+------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c fault -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@n-cpu -n 120 --no-pager
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.manager [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Triggering sync for uuid 1a155fc3-49dd-44be-853d-e19221446b64 {{(pid=1967697) _sync_power_states /opt/stack/nova/nova/compute/manager.py:11066}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.manager [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Triggering sync for uuid c0c53027-178e-4ac8-9ac9-955d0c6dc606 {{(pid=1967697) _sync_power_states /opt/stack/nova/nova/compute/manager.py:11066}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Acquiring lock "1a155fc3-49dd-44be-853d-e19221446b64" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "1a155fc3-49dd-44be-853d-e19221446b64" acquired by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: waited 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Acquiring lock "c0c53027-178e-4ac8-9ac9-955d0c6dc606" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "c0c53027-178e-4ac8-9ac9-955d0c6dc606" acquired by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: waited 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._cleanup_running_deleted_instances {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "1a155fc3-49dd-44be-853d-e19221446b64" "released" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: held 0.506s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:16:28 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "c0c53027-178e-4ac8-9ac9-955d0c6dc606" "released" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: held 0.507s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:16:31 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.manager [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1967697) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 17:16:33 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:16:34 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:16:34 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:16:34 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:16:34 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1967697) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.processutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1967697) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.processutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] CMD "env LANG=C uptime" returned: 0 in 0.022s {{(pid=1967697) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=18086MB free_disk=10.847408294677734GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1967697) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:16:35 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:16:36 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1967697) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:16:36 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1967697) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:16:36 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1967697) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 17:16:36 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '1', 'uptime': ' 17:16:35 up 12 days,  4:27,  1 user,  load average: 0.48, 0.43, 0.48\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1967697) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 17:16:36 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.provider_tree [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1967697) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 17:16:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:16:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.scheduler.client.report [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1967697) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 17:16:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1967697) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 17:16:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.085s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:16:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:16:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:16:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5001 ms, sending inactivity probe {{(pid=1967697) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:16:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:16:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:16:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:16:46 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:16:51 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:16:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:06 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:11 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:21 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:26 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:31 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:17:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:17:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1967697) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:17:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:17:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:17:36 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._sync_scheduler_instance_info {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.manager [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1967697) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 17:17:37 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_service.periodic_task [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1967697) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 17:17:38 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:17:38 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.001s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:17:38 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:17:38 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1967697) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.processutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1967697) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.processutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] CMD "env LANG=C uptime" returned: 0 in 0.018s {{(pid=1967697) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=18092MB free_disk=10.838569641113281GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1967697) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 17:17:39 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.000s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 17:17:40 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1967697) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:17:40 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1967697) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 17:17:40 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1967697) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 17:17:40 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '1', 'uptime': ' 17:17:39 up 12 days,  4:28,  1 user,  load average: 0.16, 0.34, 0.44\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1967697) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 17:17:40 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.provider_tree [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1967697) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 17:17:40 gelani-lab-1 nova-compute[1967697]: DEBUG nova.scheduler.client.report [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1967697) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG nova.compute.resource_tracker [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1967697) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG oslo_concurrency.lockutils [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.087s {{(pid=1967697) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1967697) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:17:41 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:46 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:51 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:17:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:17:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1967697) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:17:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:17:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:17:56 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:18:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4998-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:18:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:18:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1967697) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:18:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:18:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:18:01 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:18:06 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:18:11 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:18:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:18:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 17:18:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5004 ms, sending inactivity probe {{(pid=1967697) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 17:18:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 17:18:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1967697) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 17:18:16 gelani-lab-1 nova-compute[1967697]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1967697) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
ubuntu@gelani-lab-1:/opt/stack/devstack$ 




ubuntu@gelani-lab-1:/opt/stack/devstack$ source /opt/stack/devstack/openrc admin admin

openstack server event list ceph-vm-1
+------------------------------------------+--------------------------------------+--------+----------------------------+
| Request ID                               | Server ID                            | Action | Start Time                 |
+------------------------------------------+--------------------------------------+--------+----------------------------+
| req-6bad5b0d-52ef-49aa-92fa-72d2cf3a8cb7 | ba03753d-2c3b-4431-979f-9bbd1eecf323 | create | 2026-01-31T17:15:45.000000 |
+------------------------------------------+--------------------------------------+--------+----------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ source /opt/stack/devstack/openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server event show ceph-vm-1 req-6bad5b0d-52ef-49aa-92fa-72d2cf3a8cb7
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                                                                                                                                       |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| action     | create                                                                                                                                                                                                                      |
| events     | details=, event='compute__do_build_and_run_instance', finish_time='2026-01-31T17:16:03.000000', host='gelani-lab-1', host_id='1a9b341366ed487e3339a9c39458983be209eda548d47c346dcbc484', result='Success',                  |
|            | start_time='2026-01-31T17:15:46.000000', traceback=                                                                                                                                                                         |
| id         | req-6bad5b0d-52ef-49aa-92fa-72d2cf3a8cb7                                                                                                                                                                                    |
| message    | None                                                                                                                                                                                                                        |
| project_id | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                                            |
| request_id | req-6bad5b0d-52ef-49aa-92fa-72d2cf3a8cb7                                                                                                                                                                                    |
| start_time | 2026-01-31T17:15:45.000000                                                                                                                                                                                                  |
| user_id    | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                                            |
+------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@n-cpu --since "20 minutes ago" --no-pager | egrep -i "error|exception|traceback|rbd|ceph|libvirt|qemu|secret|permission denied|ephemeral|spawn" | tail -n 200
Jan 31 17:19:43 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:19:43 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:19:43 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:20:34 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:20:34 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:20:34 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:21:35 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:21:35 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:21:35 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:22:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:22:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:22:37 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:23:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:23:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:23:37 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:24:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:24:37 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:24:37 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:25:39 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:25:39 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:25:39 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:26:41 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:26:41 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:26:41 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:27:41 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:27:41 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:27:41 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:28:42 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:28:42 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:28:43 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:29:44 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:29:44 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:29:44 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:30:45 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:30:45 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:30:45 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:31:47 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:31:47 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:31:47 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:32:46 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:32:46 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:32:46 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:33:46 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:33:46 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:33:46 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:34:46 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:34:46 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:34:46 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:35:47 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:35:47 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:35:47 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:36:49 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:36:49 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:36:49 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:37:50 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:37:50 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:37:50 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 17:38:52 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:38:52 gelani-lab-1 nova-compute[1967697]: DEBUG nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1967697) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 17:38:53 gelani-lab-1 nova-compute[1967697]: WARNING nova.virt.libvirt.driver [None req-2d48e97a-6d5f-4bb8-ab8a-cf8ac693a1f5 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@n-api --since "20 minutes ago" --no-pager | egrep -i "error|exception|traceback|fault|NoValidHost" | tail -n 120
Jan 31 17:20:36 gelani-lab-1 devstack@n-api.service[1932371]: INFO nova.api.openstack.wsgi [None req-3f2893c6-d358-47f8-b071-38806711b288 admin admin] HTTP exception thrown: Instance ceph-vm-1 could not be found.
Jan 31 17:31:08 gelani-lab-1 devstack@n-api.service[1932369]: INFO nova.api.openstack.wsgi [None req-710be8aa-5a9a-428c-b95e-bda14d0b610a admin admin] HTTP exception thrown: Instance ceph-vm-1 could not be found.
Jan 31 17:31:12 gelani-lab-1 devstack@n-api.service[1932368]: INFO nova.api.openstack.wsgi [None req-69833ef1-e571-4ac9-96dd-df27a6d485bb admin admin] HTTP exception thrown: Instance ceph-vm-1 could not be found.
Jan 31 17:31:19 gelani-lab-1 devstack@n-api.service[1932370]: INFO nova.api.openstack.wsgi [None req-40a20fe8-5a14-45c5-b25d-57641edda89c admin admin] HTTP exception thrown: Instance ceph-vm-1 could not be found.
Jan 31 17:36:23 gelani-lab-1 devstack@n-api.service[1932371]: INFO nova.api.openstack.wsgi [None req-2713c88f-6987-4357-b5de-7ae465f91ec8 admin admin] HTTP exception thrown: Instance ceph-vm-1 could not be found.
Jan 31 17:38:58 gelani-lab-1 devstack@n-api.service[1932369]: INFO nova.api.openstack.wsgi [None req-3e9e7019-e225-41c0-8784-51d7aaadb6d0 admin admin] HTTP exception thrown: Instance ceph-vm-1 could not be found.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@c-vol --since "20 minutes ago" --no-pager | egrep -i "error|exception|traceback|rbd|ceph|auth|permission" | tail -n 200
Jan 31 17:19:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:19:40.954 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:19:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:19:40.984 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:20:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:20:40.962 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:20:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:20:40.986 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:21:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:21:40.961 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:21:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:21:40.988 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:22:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:22:40.962 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:22:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:22:40.993 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:23:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:23:40.968 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:23:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:23:41.002 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:24:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:24:40.965 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:24:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:24:40.991 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:25:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:25:40.967 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:25:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:25:40.992 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:26:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:26:40.964 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:26:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:26:40.994 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:27:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:27:40.966 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:27:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:27:40.999 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:28:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:28:40.968 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:28:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:28:40.994 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:29:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:29:40.971 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:29:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:29:41.000 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:30:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:30:40.969 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:30:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:30:40.995 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:31:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:31:40.968 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:31:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:31:40.992 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:32:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:32:40.966 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:32:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:32:40.996 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:33:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:33:40.966 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:33:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:33:40.993 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:34:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:34:40.971 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:34:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:34:40.997 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:35:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:35:40.973 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:35:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:35:40.999 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:36:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:36:40.974 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:36:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:36:41.002 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:37:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:37:40.979 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:37:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:37:41.004 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:38:40 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:38:40.985 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:38:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:38:41.018 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
ubuntu@gelani-lab-1:/opt/stack/devstack$ ps -ef | grep -E "qemu-system|libvirtd" | grep -v grep
root       55638       1  0 Jan19 ?        00:11:58 /usr/sbin/libvirtd
libvirt+ 1322005       1  0 Jan27 ?        00:18:50 /usr/bin/qemu-system-x86_64 -name guest=instance-00000001,debug-threads=on -S -object {"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-instance-00000001/master-key.aes"} -machine pc-i440fx-6.2,usb=off,dump-guest-core=off,memory-backend=pc.ram -accel kvm -cpu Nehalem -m 128 -object {"qom-type":"memory-backend-ram","id":"pc.ram","size":134217728} -overcommit mem-lock=off -smp 1,sockets=1,dies=1,cores=1,threads=1 -uuid 1a155fc3-49dd-44be-853d-e19221446b64 -smbios type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=32.1.0,serial=1a155fc3-49dd-44be-853d-e19221446b64,uuid=1a155fc3-49dd-44be-853d-e19221446b64,family=Virtual Machine -no-user-config -nodefaults -chardev socket,id=charmonitor,fd=34,server=on,wait=off -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-hpet -no-shutdown -boot strict=on -blockdev {"driver":"host_device","filename":"/dev/sda","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"} -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=libvirt-1-format,id=ua-e6244cf1-4d20-43c8-813e-7f0e36643271,bootindex=1,write-cache=on,serial=e6244cf1-4d20-43c8-813e-7f0e36643271 -netdev tap,fd=36,id=hostnet0,vhost=on,vhostfd=38 -device virtio-net-pci,host_mtu=1442,netdev=hostnet0,id=net0,mac=fa:16:3e:32:85:e2,bus=pci.0,addr=0x3 -add-fd set=3,fd=35 -chardev pty,id=charserial0,logfile=/dev/fdset/3,logappend=on -device isa-serial,chardev=charserial0,id=serial0 -audiodev {"id":"audio1","driver":"none"} -vnc 0.0.0.0:0,audiodev=audio1 -device virtio-vga,id=video0,max_outputs=1,bus=pci.0,addr=0x2 -device virtio-balloon-pci,id=balloon0,deflate-on-oom=on,free-page-reporting=on,bus=pci.0,addr=0x5 -object {"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"} -device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x6 -device vmcoreinfo -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on
libvirt+ 1479008       1  0 Jan28 ?        00:27:20 /usr/bin/qemu-system-x86_64 -name guest=instance-00000002,debug-threads=on -S -object {"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-2-instance-00000002/master-key.aes"} -machine pc-i440fx-6.2,usb=off,dump-guest-core=off,memory-backend=pc.ram -accel kvm -cpu Nehalem -m 2048 -object {"qom-type":"memory-backend-ram","id":"pc.ram","size":2147483648} -overcommit mem-lock=off -smp 2,sockets=2,dies=1,cores=1,threads=1 -uuid c0c53027-178e-4ac8-9ac9-955d0c6dc606 -smbios type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=32.1.0,serial=c0c53027-178e-4ac8-9ac9-955d0c6dc606,uuid=c0c53027-178e-4ac8-9ac9-955d0c6dc606,family=Virtual Machine -no-user-config -nodefaults -chardev socket,id=charmonitor,fd=37,server=on,wait=off -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-hpet -no-shutdown -boot strict=on -blockdev {"driver":"host_device","filename":"/dev/sdb","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"} -device virtio-blk-pci,bus=pci.0,addr=0x4,drive=libvirt-1-format,id=ua-5f35d8ce-23d4-4771-aaed-cf25c9791752,bootindex=1,write-cache=on,serial=5f35d8ce-23d4-4771-aaed-cf25c9791752 -netdev tap,fd=40,id=hostnet0,vhost=on,vhostfd=42 -device virtio-net-pci,host_mtu=1442,netdev=hostnet0,id=net0,mac=fa:16:3e:e3:4a:51,bus=pci.0,addr=0x3 -add-fd set=3,fd=39 -chardev pty,id=charserial0,logfile=/dev/fdset/3,logappend=on -device isa-serial,chardev=charserial0,id=serial0 -audiodev {"id":"audio1","driver":"none"} -vnc 0.0.0.0:1,audiodev=audio1 -device virtio-vga,id=video0,max_outputs=1,bus=pci.0,addr=0x2 -device virtio-balloon-pci,id=balloon0,deflate-on-oom=on,free-page-reporting=on,bus=pci.0,addr=0x5 -object {"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"} -device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x6 -device vmcoreinfo -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo ls -l /etc/ceph/ceph.conf /etc/ceph/ceph.client.cinder.keyring
-rw-r----- 1 root libvirt  64 Jan 31 13:14 /etc/ceph/ceph.client.cinder.keyring
-rw-r--r-- 1 root stack   141 Jan 31 13:14 /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo chgrp libvirt /etc/ceph/ceph.client.cinder.keyring 2>/dev/null || \
sudo chgrp libvirtd /etc/ceph/ceph.client.cinder.keyring 2>/dev/null || true

sudo chmod 640 /etc/ceph/ceph.client.cinder.keyring
sudo chmod 644 /etc/ceph/ceph.conf
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo systemctl restart devstack@n-cpu
ubuntu@gelani-lab-1:/opt/stack/devstack$ which rbd || sudo apt update && sudo apt install -y ceph-common
rbd --version
/usr/bin/rbd
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ceph-common is already the newest version (17.2.9-0ubuntu0.22.04.1).
The following packages were automatically installed and are no longer required:
  apport-symptoms linux-headers-5.15.0-143 linux-headers-5.15.0-143-generic linux-image-5.15.0-143-generic linux-modules-5.15.0-143-generic python3-apport python3-problem-report
Use 'sudo apt autoremove' to remove them.
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
ceph version 17.2.9 (69bf48f20731a4b0d742613f6c6335ccb54dd217) quincy (stable)
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor 1 \
  --network af7ee1c4-02c6-438b-8784-93690f664a47 \
  --volume ceph-boot-vol \
  ceph-vm-1
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-1                                                                                                                                                                                          |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-0jm73opz                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | Do3W2minS6Yf                                                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                                                               |
| created                             | 2026-01-31T17:39:59Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | 45a9d083-1128-46ac-a606-dbe76cf44d23                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-1                                                                                                                                                                                          |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T17:39:59Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
More than one Server exists with the name 'ceph-vm-1'.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
More than one Server exists with the name 'ceph-vm-1'.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create   --flavor 1   --network af7ee1c4-02c6-438b-8784-93690f664a47   --volume ceph-boot-vol   ceph-vm-0
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-0                                                                                                                                                                                          |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-11vzmdpw                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | ccKird7gXSgm                                                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                                                               |
| created                             | 2026-01-31T17:40:22Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | 6992259f-5325-45a8-9ccf-9900f54dc47e                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-0                                                                                                                                                                                          |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T17:40:21Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
More than one Server exists with the name 'ceph-vm-1'.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-0 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+----------+
| Field                 | Value    |
+-----------------------+----------+
| OS-EXT-STS:task_state | spawning |
| OS-EXT-STS:vm_state   | building |
| status                | BUILD    |
+-----------------------+----------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-0 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+------------+
| Field                 | Value      |
+-----------------------+------------+
| OS-EXT-STS:task_state | scheduling |
| OS-EXT-STS:vm_state   | building   |
| status                | BUILD      |
+-----------------------+------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-0 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-0 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ 



ubuntu@gelani-lab-1:/opt/stack/devstack$ source /opt/stack/devstack/openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --name ceph-vm
+--------------------------------------+-----------+--------+----------+--------------------------+---------+
| ID                                   | Name      | Status | Networks | Image                    | Flavor  |
+--------------------------------------+-----------+--------+----------+--------------------------+---------+
| 6992259f-5325-45a8-9ccf-9900f54dc47e | ceph-vm-0 | ERROR  |          | N/A (booted from volume) | m1.tiny |
| 45a9d083-1128-46ac-a606-dbe76cf44d23 | ceph-vm-1 | ERROR  |          | N/A (booted from volume) | m1.tiny |
| ba03753d-2c3b-4431-979f-9bbd1eecf323 | ceph-vm-1 | ERROR  |          | N/A (booted from volume) | m1.tiny |
+--------------------------------------+-----------+--------+----------+--------------------------+---------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server delete 6992259f-5325-45a8-9ccf-9900f54dc47e 45a9d083-1128-46ac-a606-dbe76cf44d23 ba03753d-2c3b-4431-979f-9bbd1eecf323 2>/dev/null || true
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --name ceph-vm

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --name ceph-vm

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --name ceph-vm

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --name ceph-vm


ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --image d3d0c59e-4eef-4932-b6dd-e436b761c6be --type ceph --size 5 ceph-boot-vol-2
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T18:01:48.729821           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | 49f084b9-f18f-466d-ab95-9df7e3954652 |
| multiattach                    | False                                |
| name                           | ceph-boot-vol-2                      |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 5                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-vol-2 -c status -c bootable -c os-vol-host-attr:host"
ubuntu@gelani-lab-1:/opt/stack/devstack$ 


Every 2.0s: openstack volume show ceph-boot-vol-2 -c status -c bootable -c os-vol-host-attr:host                                                                                                      gelani-lab-1: Sat Jan 31 18:02:26 2026

+-----------------------+------------------------+
| Field                 | Value                  |
+-----------------------+------------------------+
| bootable              | True                   |
| os-vol-host-attr:host | gelani-lab-1@ceph#ceph |
| status                | available              |
+-----------------------+------------------------+



| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T18:06:12Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack server show ceph-vm-cephboot-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state"
ubuntu@gelani-lab-1:/opt/stack/devstack$ ^C
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-cephboot-1
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         |                                                                                                                                                                                                    |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-cephboot-1                                                                                                                                                                                 |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | instance-00000007                                                                                                                                                                                  |
| OS-EXT-SRV-ATTR:kernel_id           |                                                                                                                                                                                                    |
| OS-EXT-SRV-ATTR:launch_index        | 0                                                                                                                                                                                                  |
| OS-EXT-SRV-ATTR:ramdisk_id          |                                                                                                                                                                                                    |
| OS-EXT-SRV-ATTR:reservation_id      | r-3ecyi62e                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | /dev/vda                                                                                                                                                                                           |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | NOSTATE                                                                                                                                                                                            |
| OS-EXT-STS:task_state               | None                                                                                                                                                                                               |
| OS-EXT-STS:vm_state                 | error                                                                                                                                                                                              |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          |                                                                                                                                                                                                    |
| accessIPv6                          |                                                                                                                                                                                                    |
| addresses                           |                                                                                                                                                                                                    |
| config_drive                        |                                                                                                                                                                                                    |
| created                             | 2026-01-31T18:06:12Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              |                                                                                                                                                                                                    |
| host_status                         |                                                                                                                                                                                                    |
| id                                  | f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | False                                                                                                                                                                                              |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-cephboot-1                                                                                                                                                                                 |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          |                                                                                                                                                                                                    |
| scheduler_hints                     |                                                                                                                                                                                                    |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | ERROR                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T18:06:30Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    | delete_on_termination='False', id='49f084b9-f18f-466d-ab95-9df7e3954652'                                                                                                                           |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack server show ceph-vm-cephboot-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state"
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-cephboot-1 -c status -c fault -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@n-cpu --since "15 minutes ago" --no-pager | tail -n 300
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:       <address type='pci' domain='0x0000' bus='0x00' slot='0x05' function='0x0'/>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:     </memballoon>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:     <rng model='virtio'>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:       <backend model='random'>/dev/urandom</backend>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:       <address type='pci' domain='0x0000' bus='0x00' slot='0x06' function='0x0'/>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:     </rng>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]:   </devices>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: </domain>
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: : libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest Traceback (most recent call last):
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest   File "/opt/stack/nova/nova/virt/libvirt/guest.py", line 160, in launch
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest     return self._domain.createWithFlags(flags)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 186, in doit
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest     result = proxy_call(self._autowrap, f, *args, **kwargs)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 144, in proxy_call
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest     rv = execute(f, *args, **kwargs)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 125, in execute
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest     raise e.with_traceback(tb)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 82, in tworker
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest     rv = meth(*args, **kwargs)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest   File "/usr/lib/python3/dist-packages/libvirt.py", line 1385, in createWithFlags
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest     raise libvirtError('virDomainCreateWithFlags() failed')
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.guest 
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.virt.libvirt.driver [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Failed to start libvirt guest: libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] vif_type=ovs instance=Instance(access_ip_v4=None,access_ip_v6=None,architecture=None,auto_disk_config=False,availability_zone='nova',cell_name=None,cleaned=False,compute_id=1,config_drive='',created_at=2026-01-31T18:06:12Z,default_ephemeral_device=None,default_swap_device=None,deleted=False,deleted_at=None,device_metadata=None,disable_terminate=False,display_description=None,display_name='ceph-vm-cephboot-1',ec2_ids=EC2Ids,ephemeral_gb=0,ephemeral_key_uuid=None,fault=<?>,flavor=Flavor(6),hidden=False,host='gelani-lab-1',hostname='ceph-vm-cephboot-1',id=7,image_ref='',info_cache=InstanceInfoCache,instance_type_id=6,kernel_id='',key_data=None,key_name=None,keypairs=KeyPairList,launch_index=0,launched_at=None,launched_on='gelani-lab-1',locked=False,locked_by=None,memory_mb=512,metadata={},migration_context=None,new_flavor=None,node='gelani-lab-1',numa_topology=None,old_flavor=None,os_type=None,pci_devices=PciDeviceList,pci_requests=InstancePCIRequests,power_state=0,progress=0,project_id='9fb44e4466264364b4ac3eb936bdc4c2',ramdisk_id='',reservation_id='r-3ecyi62e',resources=None,root_device_name='/dev/vda',root_gb=1,security_groups=SecurityGroupList,services=<?>,shutdown_terminate=False,system_metadata={boot_roles='admin,reader,manager,member',image_base_image_ref='',image_hw_machine_type='pc',image_hw_rng_model='virtio',image_min_disk='1',image_min_ram='0',image_owner_specified.openstack.md5='',image_owner_specified.openstack.object='images/cirros-0.6.3-x86_64-disk',image_owner_specified.openstack.sha256='',image_signature_verified='False',network_allocated='True',owner_project_name='admin',owner_user_name='admin'},tags=TagList,task_state='spawning',terminated_at=None,trusted_certs=None,updated_at=2026-01-31T18:06:18Z,user_data=None,user_id='09805ebaab704a8cbf99fdc8a0c1859d',uuid=f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed,vcpu_model=VirtCPUModel,vcpus=1,vm_mode=None,vm_state='building') vif={"id": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "address": "fa:16:3e:0d:99:7a", "network": {"id": "af7ee1c4-02c6-438b-8784-93690f664a47", "bridge": "br-int", "label": "private", "subnets": [{"cidr": "10.0.0.0/26", "dns": [], "gateway": {"address": "10.0.0.1", "type": "gateway", "version": 4, "meta": {}}, "ips": [{"address": "10.0.0.7", "type": "fixed", "version": 4, "meta": {}, "floating_ips": []}], "routes": [], "version": 4, "meta": {"enable_dhcp": true}}, {"cidr": "fdf9:52f7:7011::/64", "dns": [], "gateway": {"address": "fdf9:52f7:7011::1", "type": "gateway", "version": 6, "meta": {}}, "ips": [{"address": "fdf9:52f7:7011:0:f816:3eff:fe0d:997a", "type": "fixed", "version": 6, "meta": {}, "floating_ips": []}], "routes": [], "version": 6, "meta": {"enable_dhcp": true, "ipv6_address_mode": "slaac"}}], "meta": {"injected": false, "tenant_id": "6e0c493b7e814bb392ca7ea299c182de", "mtu": 1442, "physical_network": null, "tunneled": true}}, "type": "ovs", "details": {"port_filter": true, "connectivity": "l2", "ovs_create_tap": false, "bridge_name": "br-int", "datapath_type": "system", "bound_drivers": {"0": "ovn"}}, "devname": "tap6cf5c13a-b7", "ovs_interfaceid": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "qbh_params": null, "qbg_params": null, "active": false, "vnic_type": "normal", "profile": {}, "preserve_on_delete": false, "delegate_create": true, "meta": {}} {{(pid=1970964) unplug /opt/stack/nova/nova/virt/libvirt/vif.py:840}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.os_vif_util [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Converting VIF {"id": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "address": "fa:16:3e:0d:99:7a", "network": {"id": "af7ee1c4-02c6-438b-8784-93690f664a47", "bridge": "br-int", "label": "private", "subnets": [{"cidr": "10.0.0.0/26", "dns": [], "gateway": {"address": "10.0.0.1", "type": "gateway", "version": 4, "meta": {}}, "ips": [{"address": "10.0.0.7", "type": "fixed", "version": 4, "meta": {}, "floating_ips": []}], "routes": [], "version": 4, "meta": {"enable_dhcp": true}}, {"cidr": "fdf9:52f7:7011::/64", "dns": [], "gateway": {"address": "fdf9:52f7:7011::1", "type": "gateway", "version": 6, "meta": {}}, "ips": [{"address": "fdf9:52f7:7011:0:f816:3eff:fe0d:997a", "type": "fixed", "version": 6, "meta": {}, "floating_ips": []}], "routes": [], "version": 6, "meta": {"enable_dhcp": true, "ipv6_address_mode": "slaac"}}], "meta": {"injected": false, "tenant_id": "6e0c493b7e814bb392ca7ea299c182de", "mtu": 1442, "physical_network": null, "tunneled": true}}, "type": "ovs", "details": {"port_filter": true, "connectivity": "l2", "ovs_create_tap": false, "bridge_name": "br-int", "datapath_type": "system", "bound_drivers": {"0": "ovn"}}, "devname": "tap6cf5c13a-b7", "ovs_interfaceid": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "qbh_params": null, "qbg_params": null, "active": false, "vnic_type": "normal", "profile": {}, "preserve_on_delete": false, "delegate_create": true, "meta": {}} {{(pid=1970964) nova_to_osvif_vif /opt/stack/nova/nova/network/os_vif_util.py:511}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.os_vif_util [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Converted object VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7') {{(pid=1970964) nova_to_osvif_vif /opt/stack/nova/nova/network/os_vif_util.py:548}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG os_vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Unplugging vif VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7') {{(pid=1970964) unplug /opt/stack/data/venv/lib/python3.10/site-packages/os_vif/__init__.py:109}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 15 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.transaction [-] Running txn n=1 command(idx=0): DelPortCommand(_result=None, port=tap6cf5c13a-b7, bridge=br-int, if_exists=True) {{(pid=1970964) do_commit /opt/stack/data/venv/lib/python3.10/site-packages/ovsdbapp/backend/ovs_idl/transaction.py:89}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 15 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.transaction [-] Running txn n=1 command(idx=0): DbDestroyCommand(_result=None, table=QoS, record=2b9c1800-10aa-4904-be4b-af3b3209aa85) {{(pid=1970964) do_commit /opt/stack/data/venv/lib/python3.10/site-packages/ovsdbapp/backend/ovs_idl/transaction.py:89}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: INFO os_vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Successfully unplugged vif VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7')
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: INFO nova.virt.libvirt.driver [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Deleting instance files /opt/stack/data/nova/instances/f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed_del
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: INFO nova.virt.libvirt.driver [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Deletion of /opt/stack/data/nova/instances/f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed_del complete
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Instance failed to spawn: libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Traceback (most recent call last):
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/compute/manager.py", line 2959, in _build_resources
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     yield resources
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/compute/manager.py", line 2705, in _build_and_run_instance
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self.driver.spawn(context, instance, image_meta,
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 4828, in spawn
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self._create_guest_with_network(
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 8321, in _create_guest_with_network
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     with excutils.save_and_reraise_exception():
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 256, in __exit__
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self.force_reraise()
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 222, in force_reraise
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise self.value
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 8299, in _create_guest_with_network
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     guest = self._create_guest(
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 8238, in _create_guest
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     guest.launch(pause=pause)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/guest.py", line 162, in launch
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     with excutils.save_and_reraise_exception():
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 256, in __exit__
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self.force_reraise()
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 222, in force_reraise
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise self.value
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/guest.py", line 160, in launch
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     return self._domain.createWithFlags(flags)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 186, in doit
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     result = proxy_call(self._autowrap, f, *args, **kwargs)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 144, in proxy_call
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     rv = execute(f, *args, **kwargs)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 125, in execute
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise e.with_traceback(tb)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 82, in tworker
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     rv = meth(*args, **kwargs)
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/usr/lib/python3/dist-packages/libvirt.py", line 1385, in createWithFlags
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise libvirtError('virDomainCreateWithFlags() failed')
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] 
Jan 31 18:06:24 gelani-lab-1 nova-compute[1970964]: INFO nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Terminating instance
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Start destroying the instance on the hypervisor. {{(pid=1970964) _shutdown_instance /opt/stack/nova/nova/compute/manager.py:3222}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [-] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] During wait destroy, instance disappeared. {{(pid=1970964) _wait_for_destroy /opt/stack/nova/nova/virt/libvirt/driver.py:1583}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: INFO nova.virt.libvirt.driver [-] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Instance destroyed successfully.
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] vif_type=ovs instance=Instance(access_ip_v4=None,access_ip_v6=None,architecture=None,auto_disk_config=False,availability_zone='nova',cell_name=None,cleaned=True,compute_id=1,config_drive='',created_at=2026-01-31T18:06:12Z,default_ephemeral_device=None,default_swap_device=None,deleted=False,deleted_at=None,device_metadata=None,disable_terminate=False,display_description=None,display_name='ceph-vm-cephboot-1',ec2_ids=EC2Ids,ephemeral_gb=0,ephemeral_key_uuid=None,fault=<?>,flavor=Flavor(6),hidden=False,host='gelani-lab-1',hostname='ceph-vm-cephboot-1',id=7,image_ref='',info_cache=InstanceInfoCache,instance_type_id=6,kernel_id='',key_data=None,key_name=None,keypairs=KeyPairList,launch_index=0,launched_at=None,launched_on='gelani-lab-1',locked=False,locked_by=None,memory_mb=512,metadata={},migration_context=None,new_flavor=None,node='gelani-lab-1',numa_topology=None,old_flavor=None,os_type=None,pci_devices=PciDeviceList,pci_requests=InstancePCIRequests,power_state=0,progress=0,project_id='9fb44e4466264364b4ac3eb936bdc4c2',ramdisk_id='',reservation_id='r-3ecyi62e',resources=None,root_device_name='/dev/vda',root_gb=1,security_groups=SecurityGroupList,services=<?>,shutdown_terminate=False,system_metadata={boot_roles='admin,reader,manager,member',clean_attempts='1',image_base_image_ref='',image_hw_machine_type='pc',image_hw_rng_model='virtio',image_min_disk='1',image_min_ram='0',image_owner_specified.openstack.md5='',image_owner_specified.openstack.object='images/cirros-0.6.3-x86_64-disk',image_owner_specified.openstack.sha256='',image_signature_verified='False',network_allocated='True',owner_project_name='admin',owner_user_name='admin'},tags=TagList,task_state='spawning',terminated_at=None,trusted_certs=None,updated_at=2026-01-31T18:06:21Z,user_data=None,user_id='09805ebaab704a8cbf99fdc8a0c1859d',uuid=f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed,vcpu_model=VirtCPUModel,vcpus=1,vm_mode=None,vm_state='building') vif={"id": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "address": "fa:16:3e:0d:99:7a", "network": {"id": "af7ee1c4-02c6-438b-8784-93690f664a47", "bridge": "br-int", "label": "private", "subnets": [{"cidr": "10.0.0.0/26", "dns": [], "gateway": {"address": "10.0.0.1", "type": "gateway", "version": 4, "meta": {}}, "ips": [{"address": "10.0.0.7", "type": "fixed", "version": 4, "meta": {}, "floating_ips": []}], "routes": [], "version": 4, "meta": {"enable_dhcp": true}}, {"cidr": "fdf9:52f7:7011::/64", "dns": [], "gateway": {"address": "fdf9:52f7:7011::1", "type": "gateway", "version": 6, "meta": {}}, "ips": [{"address": "fdf9:52f7:7011:0:f816:3eff:fe0d:997a", "type": "fixed", "version": 6, "meta": {}, "floating_ips": []}], "routes": [], "version": 6, "meta": {"enable_dhcp": true, "ipv6_address_mode": "slaac"}}], "meta": {"injected": false, "tenant_id": "6e0c493b7e814bb392ca7ea299c182de", "mtu": 1442, "physical_network": null, "tunneled": true}}, "type": "ovs", "details": {"port_filter": true, "connectivity": "l2", "ovs_create_tap": false, "bridge_name": "br-int", "datapath_type": "system", "bound_drivers": {"0": "ovn"}}, "devname": "tap6cf5c13a-b7", "ovs_interfaceid": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "qbh_params": null, "qbg_params": null, "active": false, "vnic_type": "normal", "profile": {}, "preserve_on_delete": false, "delegate_create": true, "meta": {}} {{(pid=1970964) unplug /opt/stack/nova/nova/virt/libvirt/vif.py:840}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.os_vif_util [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Converting VIF {"id": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "address": "fa:16:3e:0d:99:7a", "network": {"id": "af7ee1c4-02c6-438b-8784-93690f664a47", "bridge": "br-int", "label": "private", "subnets": [{"cidr": "10.0.0.0/26", "dns": [], "gateway": {"address": "10.0.0.1", "type": "gateway", "version": 4, "meta": {}}, "ips": [{"address": "10.0.0.7", "type": "fixed", "version": 4, "meta": {}, "floating_ips": []}], "routes": [], "version": 4, "meta": {"enable_dhcp": true}}, {"cidr": "fdf9:52f7:7011::/64", "dns": [], "gateway": {"address": "fdf9:52f7:7011::1", "type": "gateway", "version": 6, "meta": {}}, "ips": [{"address": "fdf9:52f7:7011:0:f816:3eff:fe0d:997a", "type": "fixed", "version": 6, "meta": {}, "floating_ips": []}], "routes": [], "version": 6, "meta": {"enable_dhcp": true, "ipv6_address_mode": "slaac"}}], "meta": {"injected": false, "tenant_id": "6e0c493b7e814bb392ca7ea299c182de", "mtu": 1442, "physical_network": null, "tunneled": true}}, "type": "ovs", "details": {"port_filter": true, "connectivity": "l2", "ovs_create_tap": false, "bridge_name": "br-int", "datapath_type": "system", "bound_drivers": {"0": "ovn"}}, "devname": "tap6cf5c13a-b7", "ovs_interfaceid": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "qbh_params": null, "qbg_params": null, "active": false, "vnic_type": "normal", "profile": {}, "preserve_on_delete": false, "delegate_create": true, "meta": {}} {{(pid=1970964) nova_to_osvif_vif /opt/stack/nova/nova/network/os_vif_util.py:511}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.os_vif_util [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Converted object VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7') {{(pid=1970964) nova_to_osvif_vif /opt/stack/nova/nova/network/os_vif_util.py:548}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG os_vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Unplugging vif VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7') {{(pid=1970964) unplug /opt/stack/data/venv/lib/python3.10/site-packages/os_vif/__init__.py:109}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 15 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.transaction [-] Running txn n=1 command(idx=0): DelPortCommand(_result=None, port=tap6cf5c13a-b7, bridge=br-int, if_exists=True) {{(pid=1970964) do_commit /opt/stack/data/venv/lib/python3.10/site-packages/ovsdbapp/backend/ovs_idl/transaction.py:89}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.transaction [-] Transaction caused no change {{(pid=1970964) do_commit /opt/stack/data/venv/lib/python3.10/site-packages/ovsdbapp/backend/ovs_idl/transaction.py:129}}
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: INFO os_vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Successfully unplugged vif VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7')
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: INFO nova.virt.libvirt.driver [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Deletion of /opt/stack/data/nova/instances/f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed_del complete
Jan 31 18:06:25 gelani-lab-1 nova-compute[1970964]: INFO nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Took 0.52 seconds to destroy the instance on the hypervisor.
Jan 31 18:06:26 gelani-lab-1 nova-compute[1970964]: INFO nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Took 0.55 seconds to detach 1 volumes for instance.
Jan 31 18:06:26 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.claims [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Aborting claim: <nova.compute.claims.Claim object at 0x7f2cd8cbb400> {{(pid=1970964) abort /opt/stack/nova/nova/compute/claims.py:85}}
Jan 31 18:06:26 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.abort_instance_claim" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:06:26 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.abort_instance_claim" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:06:26 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.provider_tree [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1970964) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.abort_instance_claim" :: held 1.566s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Failed to build and run instance: libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Traceback (most recent call last):
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/compute/manager.py", line 2705, in _build_and_run_instance
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self.driver.spawn(context, instance, image_meta,
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 4828, in spawn
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self._create_guest_with_network(
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 8321, in _create_guest_with_network
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     with excutils.save_and_reraise_exception():
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 256, in __exit__
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self.force_reraise()
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 222, in force_reraise
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise self.value
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 8299, in _create_guest_with_network
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     guest = self._create_guest(
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/driver.py", line 8238, in _create_guest
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     guest.launch(pause=pause)
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/guest.py", line 162, in launch
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     with excutils.save_and_reraise_exception():
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 256, in __exit__
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     self.force_reraise()
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/oslo_utils/excutils.py", line 222, in force_reraise
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise self.value
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/nova/nova/virt/libvirt/guest.py", line 160, in launch
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     return self._domain.createWithFlags(flags)
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 186, in doit
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     result = proxy_call(self._autowrap, f, *args, **kwargs)
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 144, in proxy_call
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     rv = execute(f, *args, **kwargs)
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 125, in execute
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise e.with_traceback(tb)
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/opt/stack/data/venv/lib/python3.10/site-packages/eventlet/tpool.py", line 82, in tworker
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     rv = meth(*args, **kwargs)
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]   File "/usr/lib/python3/dist-packages/libvirt.py", line 1385, in createWithFlags
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed]     raise libvirtError('virDomainCreateWithFlags() failed')
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] libvirt.libvirtError: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: ERROR nova.compute.manager [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] 
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.utils [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] libvirtError {{(pid=1970964) notify_about_instance_usage /opt/stack/nova/nova/compute/utils.py:431}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Build of instance f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed was re-scheduled: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e' {{(pid=1970964) _do_build_and_run_instance /opt/stack/nova/nova/compute/manager.py:2544}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Unplugging VIFs for instance {{(pid=1970964) _cleanup_allocated_networks /opt/stack/nova/nova/compute/manager.py:3071}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] vif_type=ovs instance=Instance(access_ip_v4=None,access_ip_v6=None,architecture=None,auto_disk_config=False,availability_zone='nova',cell_name=None,cleaned=True,compute_id=None,config_drive='',created_at=2026-01-31T18:06:12Z,default_ephemeral_device=None,default_swap_device=None,deleted=False,deleted_at=None,device_metadata=None,disable_terminate=False,display_description=None,display_name='ceph-vm-cephboot-1',ec2_ids=EC2Ids,ephemeral_gb=0,ephemeral_key_uuid=None,fault=<?>,flavor=Flavor(6),hidden=False,host=None,hostname='ceph-vm-cephboot-1',id=7,image_ref='',info_cache=InstanceInfoCache,instance_type_id=6,kernel_id='',key_data=None,key_name=None,keypairs=KeyPairList,launch_index=0,launched_at=None,launched_on='gelani-lab-1',locked=False,locked_by=None,memory_mb=512,metadata={},migration_context=None,new_flavor=None,node=None,numa_topology=None,old_flavor=None,os_type=None,pci_devices=PciDeviceList,pci_requests=InstancePCIRequests,power_state=0,progress=0,project_id='9fb44e4466264364b4ac3eb936bdc4c2',ramdisk_id='',reservation_id='r-3ecyi62e',resources=None,root_device_name='/dev/vda',root_gb=1,security_groups=SecurityGroupList,services=<?>,shutdown_terminate=False,system_metadata={boot_roles='admin,reader,manager,member',clean_attempts='2',image_base_image_ref='',image_hw_machine_type='pc',image_hw_rng_model='virtio',image_min_disk='1',image_min_ram='0',image_owner_specified.openstack.md5='',image_owner_specified.openstack.object='images/cirros-0.6.3-x86_64-disk',image_owner_specified.openstack.sha256='',image_signature_verified='False',network_allocated='True',owner_project_name='admin',owner_user_name='admin'},tags=TagList,task_state='spawning',terminated_at=None,trusted_certs=None,updated_at=2026-01-31T18:06:25Z,user_data=None,user_id='09805ebaab704a8cbf99fdc8a0c1859d',uuid=f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed,vcpu_model=VirtCPUModel,vcpus=1,vm_mode=None,vm_state='building') vif={"id": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "address": "fa:16:3e:0d:99:7a", "network": {"id": "af7ee1c4-02c6-438b-8784-93690f664a47", "bridge": "br-int", "label": "private", "subnets": [{"cidr": "10.0.0.0/26", "dns": [], "gateway": {"address": "10.0.0.1", "type": "gateway", "version": 4, "meta": {}}, "ips": [{"address": "10.0.0.7", "type": "fixed", "version": 4, "meta": {}, "floating_ips": []}], "routes": [], "version": 4, "meta": {"enable_dhcp": true}}, {"cidr": "fdf9:52f7:7011::/64", "dns": [], "gateway": {"address": "fdf9:52f7:7011::1", "type": "gateway", "version": 6, "meta": {}}, "ips": [{"address": "fdf9:52f7:7011:0:f816:3eff:fe0d:997a", "type": "fixed", "version": 6, "meta": {}, "floating_ips": []}], "routes": [], "version": 6, "meta": {"enable_dhcp": true, "ipv6_address_mode": "slaac"}}], "meta": {"injected": false, "tenant_id": "6e0c493b7e814bb392ca7ea299c182de", "mtu": 1442, "physical_network": null, "tunneled": true}}, "type": "ovs", "details": {"port_filter": true, "connectivity": "l2", "ovs_create_tap": false, "bridge_name": "br-int", "datapath_type": "system", "bound_drivers": {"0": "ovn"}}, "devname": "tap6cf5c13a-b7", "ovs_interfaceid": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "qbh_params": null, "qbg_params": null, "active": false, "vnic_type": "normal", "profile": {}, "preserve_on_delete": false, "delegate_create": true, "meta": {}} {{(pid=1970964) unplug /opt/stack/nova/nova/virt/libvirt/vif.py:840}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.os_vif_util [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Converting VIF {"id": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "address": "fa:16:3e:0d:99:7a", "network": {"id": "af7ee1c4-02c6-438b-8784-93690f664a47", "bridge": "br-int", "label": "private", "subnets": [{"cidr": "10.0.0.0/26", "dns": [], "gateway": {"address": "10.0.0.1", "type": "gateway", "version": 4, "meta": {}}, "ips": [{"address": "10.0.0.7", "type": "fixed", "version": 4, "meta": {}, "floating_ips": []}], "routes": [], "version": 4, "meta": {"enable_dhcp": true}}, {"cidr": "fdf9:52f7:7011::/64", "dns": [], "gateway": {"address": "fdf9:52f7:7011::1", "type": "gateway", "version": 6, "meta": {}}, "ips": [{"address": "fdf9:52f7:7011:0:f816:3eff:fe0d:997a", "type": "fixed", "version": 6, "meta": {}, "floating_ips": []}], "routes": [], "version": 6, "meta": {"enable_dhcp": true, "ipv6_address_mode": "slaac"}}], "meta": {"injected": false, "tenant_id": "6e0c493b7e814bb392ca7ea299c182de", "mtu": 1442, "physical_network": null, "tunneled": true}}, "type": "ovs", "details": {"port_filter": true, "connectivity": "l2", "ovs_create_tap": false, "bridge_name": "br-int", "datapath_type": "system", "bound_drivers": {"0": "ovn"}}, "devname": "tap6cf5c13a-b7", "ovs_interfaceid": "6cf5c13a-b743-4576-912a-13d1ce4c1536", "qbh_params": null, "qbg_params": null, "active": false, "vnic_type": "normal", "profile": {}, "preserve_on_delete": false, "delegate_create": true, "meta": {}} {{(pid=1970964) nova_to_osvif_vif /opt/stack/nova/nova/network/os_vif_util.py:511}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.os_vif_util [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Converted object VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7') {{(pid=1970964) nova_to_osvif_vif /opt/stack/nova/nova/network/os_vif_util.py:548}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG os_vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Unplugging vif VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7') {{(pid=1970964) unplug /opt/stack/data/venv/lib/python3.10/site-packages/os_vif/__init__.py:109}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 15 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.transaction [-] Running txn n=1 command(idx=0): DelPortCommand(_result=None, port=tap6cf5c13a-b7, bridge=br-int, if_exists=True) {{(pid=1970964) do_commit /opt/stack/data/venv/lib/python3.10/site-packages/ovsdbapp/backend/ovs_idl/transaction.py:89}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.transaction [-] Transaction caused no change {{(pid=1970964) do_commit /opt/stack/data/venv/lib/python3.10/site-packages/ovsdbapp/backend/ovs_idl/transaction.py:129}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: INFO os_vif [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Successfully unplugged vif VIFOpenVSwitch(active=False,address=fa:16:3e:0d:99:7a,bridge_name='br-int',has_traffic_filtering=True,id=6cf5c13a-b743-4576-912a-13d1ce4c1536,network=Network(af7ee1c4-02c6-438b-8784-93690f664a47),plugin='ovs',port_profile=VIFPortProfileOpenVSwitch,preserve_on_delete=False,vif_name='tap6cf5c13a-b7')
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Unplugged VIFs for instance {{(pid=1970964) _cleanup_allocated_networks /opt/stack/nova/nova/compute/manager.py:3107}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Deallocating network for instance {{(pid=1970964) _deallocate_network /opt/stack/nova/nova/compute/manager.py:2348}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.neutron [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] deallocate_for_instance() {{(pid=1970964) deallocate_for_instance /opt/stack/nova/nova/network/neutron.py:1863}}
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: WARNING neutronclient.v2_0.client [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] The python binding code in neutronclient is deprecated in favor of OpenstackSDK, please use that as this will be removed in a future release.: nova.exception.RescheduledException: Build of instance f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed was re-scheduled: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:27 gelani-lab-1 nova-compute[1970964]: WARNING neutronclient.v2_0.client [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] The python binding code in neutronclient is deprecated in favor of OpenstackSDK, please use that as this will be removed in a future release.: nova.exception.RescheduledException: Build of instance f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed was re-scheduled: Secret not found: no secret with matching uuid 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e'
Jan 31 18:06:28 gelani-lab-1 nova-compute[1970964]: DEBUG nova.network.neutron [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Updating instance_info_cache with network_info: [] {{(pid=1970964) update_instance_cache_with_nw_info /opt/stack/nova/nova/network/neutron.py:116}}
Jan 31 18:06:29 gelani-lab-1 nova-compute[1970964]: INFO nova.compute.manager [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] [instance: f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed] Took 1.24 seconds to deallocate network for instance.
Jan 31 18:06:29 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:30 gelani-lab-1 nova-compute[1970964]: INFO nova.scheduler.client.report [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Deleted allocations for instance f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed
Jan 31 18:06:30 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-a1515822-bea2-4a38-93c1-5bb8c40a2dab admin admin] Lock "f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed" "released" by "nova.compute.manager.ComputeManager.build_and_run_instance.<locals>._locked_do_build_and_run_instance" :: held 17.090s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:06:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:06:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:06:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:06:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:06:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:06:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:06:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:06:59 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:01 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:04 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:07:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:07:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:07:05 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1970964) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: WARNING nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CMD "env LANG=C uptime" returned: 0 in 0.018s {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=17855MB free_disk=10.743122100830078GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1970964) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:07:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:07:07 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:07:07 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:07:07 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 18:07:07 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '3', 'uptime': ' 18:07:06 up 12 days,  5:17,  1 user,  load average: 0.52, 0.42, 0.29\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 18:07:08 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.provider_tree [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1970964) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 18:07:08 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 18:07:09 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1970964) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 18:07:09 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.087s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:07:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:10 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:10 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:14 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:14 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:16 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:07:16 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1970964) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 18:07:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:29 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:34 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:07:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:39 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:07:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:44 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:07:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:49 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:07:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:07:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:07:54 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:07:59 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:03 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:08:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:08:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:04 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:08:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:07 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:07 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:08:07 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.001s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:08:07 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:08:07 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1970964) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: WARNING nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CMD "env LANG=C uptime" returned: 0 in 0.015s {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=17870MB free_disk=10.741802215576172GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1970964) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:08:08 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5001 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 18:08:09 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '3', 'uptime': ' 18:08:08 up 12 days,  5:18,  1 user,  load average: 0.42, 0.41, 0.30\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 18:08:10 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.provider_tree [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1970964) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 18:08:10 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 18:08:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1970964) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 18:08:11 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.085s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:08:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:14 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:08:15 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:18 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:18 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1970964) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 18:08:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:08:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:08:19 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:20 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._sync_scheduler_instance_info {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:08:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:08:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:08:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5001 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:08:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:08:24 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh list --all
 Id   Name                State
-----------------------------------
 1    instance-00000001   running
 2    instance-00000002   running

ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo ls -lt /var/log/libvirt/qemu/ | head
total 28
-rw------- 1 root root   59 Jan 31 18:06 instance-00000007.log
-rw------- 1 root root   59 Jan 31 17:40 instance-00000006.log
-rw------- 1 root root   59 Jan 31 17:40 instance-00000005.log
-rw------- 1 root root   59 Jan 31 17:15 instance-00000004.log
-rw------- 1 root root   59 Jan 31 14:50 instance-00000003.log
-rw------- 1 root root 3006 Jan 28 12:18 instance-00000002.log
-rw------- 1 root root 3004 Jan 27 11:32 instance-00000001.log
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@c-vol --since "15 minutes ago" --no-pager | tail -n 300
Jan 31 17:54:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:02.910 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:54:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:22.912 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:54:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:32.921 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:54:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:41.021 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:54:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:41.021 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:54:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:41.054 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:54:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:41.079 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:54:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:54:42.933 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:55:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:02.923 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:55:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:22.926 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:55:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:32.933 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:55:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:41.023 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:55:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:41.024 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:55:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:41.053 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:55:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:55:41.076 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:56:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:02.934 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:56:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:02.937 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:56:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:22.942 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.020 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.021 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.052 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.077 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:56:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:42.948 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:02.951 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:02.955 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:22.953 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.021 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.022 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.059 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.084 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:57:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:42.960 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:42.963 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:22.955 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:32.954 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.020 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.020 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.048 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.072 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:58:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:52.958 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:52.960 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:12.965 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:22.970 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:32.972 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.016 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.017 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.040 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.057 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:59:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:42.977 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:52.979 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:02.985 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:22.988 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:32.993 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.021 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.022 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.051 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.073 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:00:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:42.994 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:02.998 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:03.001 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:13.007 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:23.011 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:33.015 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.027 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.028 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.050 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.068 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:01:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:43.019 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.842 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume reschedule parameters: True retry: {'num_attempts': 1, 'backends': ['gelani-lab-1@ceph#ceph'], 'hosts': ['gelani-lab-1@ceph#ceph']} get_flow /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:1388
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.852 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Flow 'volume_create_manager' (f21f34c7-5bd2-4a45-8bdb-ef6c60c0825c) transitioned into state 'RUNNING' from state 'PENDING' _flow_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:145
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.856 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeRefTask;volume:create' (dab1031a-b12c-4ccc-9c06-123391861969) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.866 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeRefTask;volume:create' (dab1031a-b12c-4ccc-9c06-123391861969) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'Volume(_name_id=None,admin_metadata={},attach_status='detached',availability_zone='nova',bootable=False,cluster=<?>,cluster_name=None,consistencygroup=<?>,consistencygroup_id=None,created_at=2026-01-31T18:01:49Z,deleted=False,deleted_at=None,display_description=None,display_name='ceph-boot-vol-2',ec2_id=None,encryption_key_id=None,glance_metadata=<?>,group=<?>,group_id=None,host='gelani-lab-1@ceph#ceph',id=49f084b9-f18f-466d-ab95-9df7e3954652,launched_at=None,metadata={},migration_status=None,multiattach=False,previous_status=None,project_id='9fb44e4466264364b4ac3eb936bdc4c2',provider_auth=None,provider_geometry=None,provider_id=None,provider_location=None,replication_driver_data=None,replication_extended_status=None,replication_status=None,scheduled_at=2026-01-31T18:01:49Z,service_uuid=None,shared_targets=True,size=5,snapshot_id=None,snapshots=<?>,source_volid=None,status='creating',terminated_at=None,updated_at=2026-01-31T18:01:49Z,use_quota=True,user_id='09805ebaab704a8cbf99fdc8a0c1859d',volume_attachment=VolumeAttachmentList,volume_type=VolumeType(b612d2b3-a3d9-4063-84ec-64a58b2c4411),volume_type_id=b612d2b3-a3d9-4063-84ec-64a58b2c4411)' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.869 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.OnFailureRescheduleTask;volume:create' (aa8469cb-6c19-4c44-bb68-561dd83e57a7) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.871 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.OnFailureRescheduleTask;volume:create' (aa8469cb-6c19-4c44-bb68-561dd83e57a7) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'None' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.873 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeSpecTask;volume:create' (883f790e-4527-46ea-ac82-a48cdd2f1819) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.958 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeSpecTask;volume:create' (883f790e-4527-46ea-ac82-a48cdd2f1819) transitioned into state 'SUCCESS' from state 'RUNNING' with result '{'status': 'creating', 'type': 'image', 'volume_id': '49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_name': 'volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_size': 5, 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_location': (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]), 'image_meta': {'name': 'cirros-0.6.3-x86_64-disk', 'disk_format': 'qcow2', 'container_format': 'bare', 'visibility': 'public', 'size': 21692416, 'virtual_size': 117440512, 'status': 'active', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'protected': False, 'min_ram': 0, 'min_disk': 0, 'owner': '9fb44e4466264364b4ac3eb936bdc4c2', 'os_hidden': False, 'os_hash_algo': 'sha512', 'os_hash_value': '9a9bce0083a00939ec17c11febbfc767aa211aaa54f51e75c5a8b271a9b5637c77205a518b7a2007cb391d23cceb01e0e4e8d64832317151bc85b734b92a7be0', 'id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'created_at': datetime.datetime(2026, 1, 19, 13, 18, 27, tzinfo=datetime.timezone.utc), 'updated_at': datetime.datetime(2026, 1, 19, 13, 18, 28, tzinfo=datetime.timezone.utc), 'tags': [], 'file': '/v2/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be/file', 'properties': {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': ''}}, 'image_service': <cinder.image.glance.GlanceImageService object at 0x7f267aa5bee0>}' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.960 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.NotifyVolumeActionTask;volume:create, create.start' (d363e39f-722f-47ee-861a-30995a1f1cc3) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.970 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.NotifyVolumeActionTask;volume:create, create.start' (d363e39f-722f-47ee-861a-30995a1f1cc3) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'None' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.972 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeFromSpecTask;volume:create' (21e693ab-4e2e-4aaa-aa23-b6637e107358) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.972 1948442 INFO cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume 49f084b9-f18f-466d-ab95-9df7e3954652: being created as image with specification: {'status': 'creating', 'volume_name': 'volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_size': 5, 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_location': (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]), 'image_meta': {'name': 'cirros-0.6.3-x86_64-disk', 'disk_format': 'qcow2', 'container_format': 'bare', 'visibility': 'public', 'size': 21692416, 'virtual_size': 117440512, 'status': 'active', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'protected': False, 'min_ram': 0, 'min_disk': 0, 'owner': '9fb44e4466264364b4ac3eb936bdc4c2', 'os_hidden': False, 'os_hash_algo': 'sha512', 'os_hash_value': '9a9bce0083a00939ec17c11febbfc767aa211aaa54f51e75c5a8b271a9b5637c77205a518b7a2007cb391d23cceb01e0e4e8d64832317151bc85b734b92a7be0', 'id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'created_at': datetime.datetime(2026, 1, 19, 13, 18, 27, tzinfo=datetime.timezone.utc), 'updated_at': datetime.datetime(2026, 1, 19, 13, 18, 28, tzinfo=datetime.timezone.utc), 'tags': [], 'file': '/v2/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be/file', 'properties': {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': ''}}, 'image_service': <cinder.image.glance.GlanceImageService object at 0x7f267aa5bee0>}
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.973 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Trying to clone 49f084b9-f18f-466d-ab95-9df7e3954652 from image d3d0c59e-4eef-4932-b6dd-e436b761c6be at location (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]). _create_from_image /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:1082
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.973 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] not cloneable: Image file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be is unacceptable: Not stored in RBD. _is_cloneable /opt/stack/cinder/cinder/volume/drivers/rbd.py:1910
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.093 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Image fetch details: dest /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph, size 20.69 MB, duration 1.00 sec fetch /opt/stack/cinder/cinder/image/image_utils.py:736
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.094 1948442 INFO cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Image download 20.69 MB at 20.69 MB/s
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.112 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[939ba0ab-2b06-422a-a692-45cf61755bd7]: (4, 'qcow2') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.113 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:49 gelani-lab-1 sudo[1974754]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph
Jan 31 18:01:49 gelani-lab-1 sudo[1974754]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:49 gelani-lab-1 sudo[1974754]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.462 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph" returned: 0 in 0.350s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.463 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Temporary image d3d0c59e-4eef-4932-b6dd-e436b761c6be is fetched for user 09805ebaab704a8cbf99fdc8a0c1859d. fetch /opt/stack/cinder/cinder/image/image_utils.py:1435
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.500 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[201fb6e7-4a16-4e1a-acc5-bbd70142aa1b]: (4, 'qcow2') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.501 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:49 gelani-lab-1 sudo[1974759]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph
Jan 31 18:01:49 gelani-lab-1 sudo[1974759]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:49 gelani-lab-1 sudo[1974759]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.834 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph" returned: 0 in 0.333s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.835 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] creating volume 'volume-49f084b9-f18f-466d-ab95-9df7e3954652' create_volume /opt/stack/cinder/cinder/volume/drivers/rbd.py:1160
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.836 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.886 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_replicated_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1012
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.887 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_multiattach_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1021
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.907 1948442 DEBUG cinder.volume.volume_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Attempting download of d3d0c59e-4eef-4932-b6dd-e436b761c6be ((None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}])) to volume 49f084b9-f18f-466d-ab95-9df7e3954652. copy_image_to_volume /opt/stack/cinder/cinder/volume/volume_utils.py:1189
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.927 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[1871bed5-266e-4651-b4b0-6d008536c648]: (4, 'raw') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.928 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f raw --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8 execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974779]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f raw --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8
Jan 31 18:01:50 gelani-lab-1 sudo[1974779]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:50 gelani-lab-1 sudo[1974779]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.259 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f raw --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8" returned: 0 in 0.332s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.260 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8 execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974783]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8
Jan 31 18:01:50 gelani-lab-1 sudo[1974783]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:50 gelani-lab-1 sudo[1974783]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.598 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8" returned: 1 in 0.338s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.599 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] '/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8' failed. Not Retrying. execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:423
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.600 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[fc5d3ebf-49a5-4e48-a4af-69868bf5ed80]: (4, 'qcow2') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.601 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974788]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph
Jan 31 18:01:50 gelani-lab-1 sudo[1974788]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:50 gelani-lab-1 sudo[1974788]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.940 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph" returned: 0 in 0.339s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.940 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] d3d0c59e-4eef-4932-b6dd-e436b761c6be was qcow2, converting to raw fetch_to_volume_format /opt/stack/cinder/cinder/image/image_utils.py:1124
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.941 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): sudo cinder-rootwrap /etc/cinder/rootwrap.conf qemu-img convert -O raw -f qcow2 /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph /opt/stack/data/cinder/conversion/tmpwdbezo8n execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974793]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf qemu-img convert -O raw -f qcow2 /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph /opt/stack/data/cinder/conversion/tmpwdbezo8n
Jan 31 18:01:50 gelani-lab-1 sudo[1974793]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:51 gelani-lab-1 sudo[1974793]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.251 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "sudo cinder-rootwrap /etc/cinder/rootwrap.conf qemu-img convert -O raw -f qcow2 /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph /opt/stack/data/cinder/conversion/tmpwdbezo8n" returned: 0 in 0.310s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.252 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Image conversion details: src /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph, size 112.00 MB, duration 1.00 sec, destination /opt/stack/data/cinder/conversion/tmpwdbezo8n _convert_image /opt/stack/cinder/cinder/image/image_utils.py:537
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.252 1948442 INFO cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Converted 112.00 MB image at 112.00 MB/s
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.253 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.272 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.297 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] volume has no backup snaps _delete_backup_snaps /opt/stack/cinder/cinder/volume/drivers/rbd.py:1304
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.298 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume volume-49f084b9-f18f-466d-ab95-9df7e3954652 is not a clone. _get_clone_info /opt/stack/cinder/cinder/volume/drivers/rbd.py:1332
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.305 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] deleting RBD volume volume-49f084b9-f18f-466d-ab95-9df7e3954652 _delete_volume /opt/stack/cinder/cinder/volume/drivers/rbd.py:1490
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.413 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): rbd import --pool volume --order 22 /opt/stack/data/cinder/conversion/tmpwdbezo8n volume-49f084b9-f18f-466d-ab95-9df7e3954652 --new-format --id cinder --cluster ceph --conf /etc/ceph/ceph.conf execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.635 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "rbd import --pool volume --order 22 /opt/stack/data/cinder/conversion/tmpwdbezo8n volume-49f084b9-f18f-466d-ab95-9df7e3954652 --new-format --id cinder --cluster ceph --conf /etc/ceph/ceph.conf" returned: 0 in 0.221s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.652 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.713 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_replicated_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1012
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.713 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_multiattach_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1021
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.714 1948442 DEBUG cinder.volume.volume_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Downloaded image d3d0c59e-4eef-4932-b6dd-e436b761c6be ((None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}])) to volume 49f084b9-f18f-466d-ab95-9df7e3954652 successfully. copy_image_to_volume /opt/stack/cinder/cinder/volume/volume_utils.py:1234
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.719 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Temporary image d3d0c59e-4eef-4932-b6dd-e436b761c6be for user 09805ebaab704a8cbf99fdc8a0c1859d is deleted. fetch /opt/stack/cinder/cinder/image/image_utils.py:1439
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.720 1948442 DEBUG cinder.volume.volume_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Marking volume 49f084b9-f18f-466d-ab95-9df7e3954652 as bootable. enable_bootable_flag /opt/stack/cinder/cinder/volume/volume_utils.py:1138
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.735 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Copying metadata from image d3d0c59e-4eef-4932-b6dd-e436b761c6be to 49f084b9-f18f-466d-ab95-9df7e3954652. _handle_bootable_volume_glance_meta /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:450
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.735 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Creating volume glance metadata for volume 49f084b9-f18f-466d-ab95-9df7e3954652 backed by image d3d0c59e-4eef-4932-b6dd-e436b761c6be with: {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': '', 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_name': 'cirros-0.6.3-x86_64-disk', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'container_format': 'bare', 'disk_format': 'qcow2', 'min_disk': 0, 'min_ram': 0, 'size': 21692416}. _capture_volume_image_metadata /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:682
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.768 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeFromSpecTask;volume:create' (21e693ab-4e2e-4aaa-aa23-b6637e107358) transitioned into state 'SUCCESS' from state 'RUNNING' with result '{'status': 'creating', 'volume_name': 'volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_size': 5, 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_location': (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]), 'image_meta': {'name': 'cirros-0.6.3-x86_64-disk', 'disk_format': 'qcow2', 'container_format': 'bare', 'visibility': 'public', 'size': 21692416, 'virtual_size': 117440512, 'status': 'active', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'protected': False, 'min_ram': 0, 'min_disk': 0, 'owner': '9fb44e4466264364b4ac3eb936bdc4c2', 'os_hidden': False, 'os_hash_algo': 'sha512', 'os_hash_value': '9a9bce0083a00939ec17c11febbfc767aa211aaa54f51e75c5a8b271a9b5637c77205a518b7a2007cb391d23cceb01e0e4e8d64832317151bc85b734b92a7be0', 'id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'created_at': datetime.datetime(2026, 1, 19, 13, 18, 27, tzinfo=datetime.timezone.utc), 'updated_at': datetime.datetime(2026, 1, 19, 13, 18, 28, tzinfo=datetime.timezone.utc), 'tags': [], 'file': '/v2/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be/file', 'properties': {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': ''}}, 'image_service': <cinder.image.glance.GlanceImageService object at 0x7f267aa5bee0>}' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.770 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeOnFinishTask;volume:create, create.end' (23436e9c-2d3f-4204-9cd9-16bb8ffe90d8) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.789 1948442 INFO cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume volume-49f084b9-f18f-466d-ab95-9df7e3954652 (49f084b9-f18f-466d-ab95-9df7e3954652): created successfully
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.791 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeOnFinishTask;volume:create, create.end' (23436e9c-2d3f-4204-9cd9-16bb8ffe90d8) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'None' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.793 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Flow 'volume_create_manager' (f21f34c7-5bd2-4a45-8bdb-ef6c60c0825c) transitioned into state 'SUCCESS' from state 'RUNNING' _flow_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:145
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.808 1948442 INFO cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Created volume successfully.
Jan 31 18:02:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:03.023 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=13,cinder:UPDATE=3,cinder:INSERT=7,cinder:DELETE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:02:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:03.026 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=12,cinder:UPDATE=6,cinder:INSERT=6 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:02:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:23.034 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.033 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.034 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.057 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.080 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:02:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:43.038 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:03.042 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:03.045 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:23.050 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:23.052 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.035 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.057 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.079 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:03:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:43.051 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:43.053 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:03.053 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:03.056 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:23.061 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:33.066 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:43.067 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:53.072 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:03.076 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:13.078 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:23.083 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:33.089 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.035 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.059 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.080 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:05:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:43.092 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:53.095 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:03.099 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:13.104 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:18 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:18.801 1948442 DEBUG oslo_concurrency.processutils [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): ceph mon dump --format=json --id cinder --cluster ceph --conf /etc/ceph/ceph.conf execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.264 1948442 DEBUG oslo_concurrency.processutils [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "ceph mon dump --format=json --id cinder --cluster ceph --conf /etc/ceph/ceph.conf" returned: 0 in 0.463s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.265 1948442 DEBUG cinder.volume.drivers.rbd [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connection data: {'driver_volume_type': 'rbd', 'data': {'name': 'volume/volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'hosts': ['192.168.95.19', '192.168.95.240', '192.168.95.221'], 'ports': ['6789', '6789', '6789'], 'cluster_name': 'ceph', 'auth_enabled': True, 'auth_username': 'cinder', 'secret_type': 'ceph', 'secret_uuid': 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e', 'volume_id': '49f084b9-f18f-466d-ab95-9df7e3954652', 'discard': True}} initialize_connection /opt/stack/cinder/cinder/volume/drivers/rbd.py:1877
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.285 1948442 DEBUG cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Connection info returned from driver {'name': 'volume/volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'hosts': ['192.168.95.19', '192.168.95.240', '192.168.95.221'], 'ports': ['6789', '6789', '6789'], 'cluster_name': 'ceph', 'auth_enabled': True, 'auth_username': 'cinder', 'secret_type': '***', 'secret_uuid': '***', 'volume_id': '49f084b9-f18f-466d-ab95-9df7e3954652', 'discard': True, 'qos_specs': None, 'access_mode': 'rw', 'encrypted': False, 'cacheable': False, 'driver_volume_type': 'rbd', 'attachment_id': '8ed85ff8-458c-4b29-8824-3c1f7c0e3244', 'enforce_multipath': True} _connection_create /opt/stack/cinder/cinder/volume/manager.py:4893
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.313 1948442 INFO cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] attachment_update completed successfully.
Jan 31 18:06:25 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:25.753 1948442 INFO cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-89532a6e-af6a-42a8-a50e-7a849b8201ff 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Terminate volume connection completed successfully.
Jan 31 18:06:25 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:25.753 1948442 DEBUG cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-89532a6e-af6a-42a8-a50e-7a849b8201ff 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Deleting attachment 8ed85ff8-458c-4b29-8824-3c1f7c0e3244. attachment_delete /opt/stack/cinder/cinder/volume/manager.py:5024
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.034 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.061 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.080 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:06:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:43.111 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=11,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:53.116 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=14,cinder:UPDATE=5 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:07:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:13.112 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.035 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.060 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.088 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:07:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:43.119 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=3,cinder:SELECT=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:03.126 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:23.134 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=3,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.032 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.033 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.057 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.076 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:08:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:43.124 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:43.127 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
Every 2.0s: openstack server show ceph-vm-cephboot-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state                                                                                        gelani-lab-1: Sat Jan 31 18:09:43 2026

+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-cephboot-1 -c status -c fault -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh list --all
 Id   Name                State
-----------------------------------
 1    instance-00000001   running
 2    instance-00000002   running

ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo tail -n 200 /var/log/libvirt/qemu/<NEWEST_LOG_FILE>.log
-bash: NEWEST_LOG_FILE: No such file or directory
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo tail -n 200 /var/log/libvirt/qemu/<NEWEST_LOG_FILE>.log
-bash: NEWEST_LOG_FILE: No such file or directory
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo journalctl -u devstack@c-vol --since "15 minutes ago" --no-pager | tail -n 300
Jan 31 17:56:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:22.942 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.020 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.021 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.052 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:56:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:41.077 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:56:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:56:42.948 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:02.951 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:02.955 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:22.953 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.021 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.022 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.059 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:57:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:41.084 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:57:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:42.960 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:57:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:57:42.963 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:22.955 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:32.954 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.020 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.020 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.048 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:58:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:41.072 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:58:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:52.958 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:58:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:58:52.960 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:12 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:12.965 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:22.970 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:32.972 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.016 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.017 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.040 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 17:59:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:41.057 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 17:59:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:42.977 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 17:59:52 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 17:59:52.979 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:02.985 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:22 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:22.988 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:32 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:32.993 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.021 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.022 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.051 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:00:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:41.073 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:00:42 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:00:42.994 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:02 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:02.998 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:03.001 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:13.007 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:23.011 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:33.015 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.027 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.028 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.050 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:41.068 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:01:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:43.019 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.842 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume reschedule parameters: True retry: {'num_attempts': 1, 'backends': ['gelani-lab-1@ceph#ceph'], 'hosts': ['gelani-lab-1@ceph#ceph']} get_flow /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:1388
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.852 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Flow 'volume_create_manager' (f21f34c7-5bd2-4a45-8bdb-ef6c60c0825c) transitioned into state 'RUNNING' from state 'PENDING' _flow_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:145
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.856 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeRefTask;volume:create' (dab1031a-b12c-4ccc-9c06-123391861969) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.866 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeRefTask;volume:create' (dab1031a-b12c-4ccc-9c06-123391861969) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'Volume(_name_id=None,admin_metadata={},attach_status='detached',availability_zone='nova',bootable=False,cluster=<?>,cluster_name=None,consistencygroup=<?>,consistencygroup_id=None,created_at=2026-01-31T18:01:49Z,deleted=False,deleted_at=None,display_description=None,display_name='ceph-boot-vol-2',ec2_id=None,encryption_key_id=None,glance_metadata=<?>,group=<?>,group_id=None,host='gelani-lab-1@ceph#ceph',id=49f084b9-f18f-466d-ab95-9df7e3954652,launched_at=None,metadata={},migration_status=None,multiattach=False,previous_status=None,project_id='9fb44e4466264364b4ac3eb936bdc4c2',provider_auth=None,provider_geometry=None,provider_id=None,provider_location=None,replication_driver_data=None,replication_extended_status=None,replication_status=None,scheduled_at=2026-01-31T18:01:49Z,service_uuid=None,shared_targets=True,size=5,snapshot_id=None,snapshots=<?>,source_volid=None,status='creating',terminated_at=None,updated_at=2026-01-31T18:01:49Z,use_quota=True,user_id='09805ebaab704a8cbf99fdc8a0c1859d',volume_attachment=VolumeAttachmentList,volume_type=VolumeType(b612d2b3-a3d9-4063-84ec-64a58b2c4411),volume_type_id=b612d2b3-a3d9-4063-84ec-64a58b2c4411)' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.869 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.OnFailureRescheduleTask;volume:create' (aa8469cb-6c19-4c44-bb68-561dd83e57a7) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.871 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.OnFailureRescheduleTask;volume:create' (aa8469cb-6c19-4c44-bb68-561dd83e57a7) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'None' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.873 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeSpecTask;volume:create' (883f790e-4527-46ea-ac82-a48cdd2f1819) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.958 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.ExtractVolumeSpecTask;volume:create' (883f790e-4527-46ea-ac82-a48cdd2f1819) transitioned into state 'SUCCESS' from state 'RUNNING' with result '{'status': 'creating', 'type': 'image', 'volume_id': '49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_name': 'volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_size': 5, 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_location': (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]), 'image_meta': {'name': 'cirros-0.6.3-x86_64-disk', 'disk_format': 'qcow2', 'container_format': 'bare', 'visibility': 'public', 'size': 21692416, 'virtual_size': 117440512, 'status': 'active', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'protected': False, 'min_ram': 0, 'min_disk': 0, 'owner': '9fb44e4466264364b4ac3eb936bdc4c2', 'os_hidden': False, 'os_hash_algo': 'sha512', 'os_hash_value': '9a9bce0083a00939ec17c11febbfc767aa211aaa54f51e75c5a8b271a9b5637c77205a518b7a2007cb391d23cceb01e0e4e8d64832317151bc85b734b92a7be0', 'id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'created_at': datetime.datetime(2026, 1, 19, 13, 18, 27, tzinfo=datetime.timezone.utc), 'updated_at': datetime.datetime(2026, 1, 19, 13, 18, 28, tzinfo=datetime.timezone.utc), 'tags': [], 'file': '/v2/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be/file', 'properties': {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': ''}}, 'image_service': <cinder.image.glance.GlanceImageService object at 0x7f267aa5bee0>}' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.960 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.NotifyVolumeActionTask;volume:create, create.start' (d363e39f-722f-47ee-861a-30995a1f1cc3) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.970 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.NotifyVolumeActionTask;volume:create, create.start' (d363e39f-722f-47ee-861a-30995a1f1cc3) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'None' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.972 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeFromSpecTask;volume:create' (21e693ab-4e2e-4aaa-aa23-b6637e107358) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.972 1948442 INFO cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume 49f084b9-f18f-466d-ab95-9df7e3954652: being created as image with specification: {'status': 'creating', 'volume_name': 'volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_size': 5, 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_location': (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]), 'image_meta': {'name': 'cirros-0.6.3-x86_64-disk', 'disk_format': 'qcow2', 'container_format': 'bare', 'visibility': 'public', 'size': 21692416, 'virtual_size': 117440512, 'status': 'active', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'protected': False, 'min_ram': 0, 'min_disk': 0, 'owner': '9fb44e4466264364b4ac3eb936bdc4c2', 'os_hidden': False, 'os_hash_algo': 'sha512', 'os_hash_value': '9a9bce0083a00939ec17c11febbfc767aa211aaa54f51e75c5a8b271a9b5637c77205a518b7a2007cb391d23cceb01e0e4e8d64832317151bc85b734b92a7be0', 'id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'created_at': datetime.datetime(2026, 1, 19, 13, 18, 27, tzinfo=datetime.timezone.utc), 'updated_at': datetime.datetime(2026, 1, 19, 13, 18, 28, tzinfo=datetime.timezone.utc), 'tags': [], 'file': '/v2/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be/file', 'properties': {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': ''}}, 'image_service': <cinder.image.glance.GlanceImageService object at 0x7f267aa5bee0>}
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.973 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Trying to clone 49f084b9-f18f-466d-ab95-9df7e3954652 from image d3d0c59e-4eef-4932-b6dd-e436b761c6be at location (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]). _create_from_image /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:1082
Jan 31 18:01:48 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:48.973 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] not cloneable: Image file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be is unacceptable: Not stored in RBD. _is_cloneable /opt/stack/cinder/cinder/volume/drivers/rbd.py:1910
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.093 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Image fetch details: dest /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph, size 20.69 MB, duration 1.00 sec fetch /opt/stack/cinder/cinder/image/image_utils.py:736
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.094 1948442 INFO cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Image download 20.69 MB at 20.69 MB/s
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.112 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[939ba0ab-2b06-422a-a692-45cf61755bd7]: (4, 'qcow2') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.113 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:49 gelani-lab-1 sudo[1974754]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph
Jan 31 18:01:49 gelani-lab-1 sudo[1974754]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:49 gelani-lab-1 sudo[1974754]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.462 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph" returned: 0 in 0.350s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.463 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Temporary image d3d0c59e-4eef-4932-b6dd-e436b761c6be is fetched for user 09805ebaab704a8cbf99fdc8a0c1859d. fetch /opt/stack/cinder/cinder/image/image_utils.py:1435
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.500 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[201fb6e7-4a16-4e1a-acc5-bbd70142aa1b]: (4, 'qcow2') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.501 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:49 gelani-lab-1 sudo[1974759]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph
Jan 31 18:01:49 gelani-lab-1 sudo[1974759]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:49 gelani-lab-1 sudo[1974759]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.834 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph" returned: 0 in 0.333s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.835 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] creating volume 'volume-49f084b9-f18f-466d-ab95-9df7e3954652' create_volume /opt/stack/cinder/cinder/volume/drivers/rbd.py:1160
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.836 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.886 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_replicated_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1012
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.887 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_multiattach_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1021
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.907 1948442 DEBUG cinder.volume.volume_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Attempting download of d3d0c59e-4eef-4932-b6dd-e436b761c6be ((None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}])) to volume 49f084b9-f18f-466d-ab95-9df7e3954652. copy_image_to_volume /opt/stack/cinder/cinder/volume/volume_utils.py:1189
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.927 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[1871bed5-266e-4651-b4b0-6d008536c648]: (4, 'raw') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:49 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:49.928 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f raw --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8 execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974779]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f raw --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8
Jan 31 18:01:50 gelani-lab-1 sudo[1974779]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:50 gelani-lab-1 sudo[1974779]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.259 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f raw --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8" returned: 0 in 0.332s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.260 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8 execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974783]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8
Jan 31 18:01:50 gelani-lab-1 sudo[1974783]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:50 gelani-lab-1 sudo[1974783]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.598 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8" returned: 1 in 0.338s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.599 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] '/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f luks --output=json /opt/stack/data/cinder/conversion/image_download_d3d0c59e-4eef-4932-b6dd-e436b761c6be_lsdzl1y8' failed. Not Retrying. execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:423
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.600 1949164 DEBUG oslo.privsep.daemon [-] privsep: reply[fc5d3ebf-49a5-4e48-a4af-69868bf5ed80]: (4, 'qcow2') _call_back /opt/stack/data/venv/lib/python3.10/site-packages/oslo_privsep/daemon.py:515
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.601 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): /opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974788]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph
Jan 31 18:01:50 gelani-lab-1 sudo[1974788]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:50 gelani-lab-1 sudo[1974788]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.940 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "/opt/stack/data/venv/bin/python3.10 -m oslo_concurrency.prlimit --as=1073741824 --cpu=60 -- sudo cinder-rootwrap /etc/cinder/rootwrap.conf env LC_ALL=C qemu-img info -f qcow2 --output=json /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph" returned: 0 in 0.339s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.940 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] d3d0c59e-4eef-4932-b6dd-e436b761c6be was qcow2, converting to raw fetch_to_volume_format /opt/stack/cinder/cinder/image/image_utils.py:1124
Jan 31 18:01:50 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:50.941 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): sudo cinder-rootwrap /etc/cinder/rootwrap.conf qemu-img convert -O raw -f qcow2 /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph /opt/stack/data/cinder/conversion/tmpwdbezo8n execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:50 gelani-lab-1 sudo[1974793]:    stack : PWD=/ ; USER=root ; COMMAND=/opt/stack/data/venv/bin/cinder-rootwrap /etc/cinder/rootwrap.conf qemu-img convert -O raw -f qcow2 /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph /opt/stack/data/cinder/conversion/tmpwdbezo8n
Jan 31 18:01:50 gelani-lab-1 sudo[1974793]: pam_unix(sudo:session): session opened for user root(uid=0) by (uid=1001)
Jan 31 18:01:51 gelani-lab-1 sudo[1974793]: pam_unix(sudo:session): session closed for user root
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.251 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "sudo cinder-rootwrap /etc/cinder/rootwrap.conf qemu-img convert -O raw -f qcow2 /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph /opt/stack/data/cinder/conversion/tmpwdbezo8n" returned: 0 in 0.310s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.252 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Image conversion details: src /opt/stack/data/cinder/conversion/image_fetch_d3d0c59e-4eef-4932-b6dd-e436b761c6be_74teq2gegelani-lab-1@ceph, size 112.00 MB, duration 1.00 sec, destination /opt/stack/data/cinder/conversion/tmpwdbezo8n _convert_image /opt/stack/cinder/cinder/image/image_utils.py:537
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.252 1948442 INFO cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Converted 112.00 MB image at 112.00 MB/s
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.253 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.272 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.297 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] volume has no backup snaps _delete_backup_snaps /opt/stack/cinder/cinder/volume/drivers/rbd.py:1304
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.298 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume volume-49f084b9-f18f-466d-ab95-9df7e3954652 is not a clone. _get_clone_info /opt/stack/cinder/cinder/volume/drivers/rbd.py:1332
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.305 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] deleting RBD volume volume-49f084b9-f18f-466d-ab95-9df7e3954652 _delete_volume /opt/stack/cinder/cinder/volume/drivers/rbd.py:1490
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.413 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): rbd import --pool volume --order 22 /opt/stack/data/cinder/conversion/tmpwdbezo8n volume-49f084b9-f18f-466d-ab95-9df7e3954652 --new-format --id cinder --cluster ceph --conf /etc/ceph/ceph.conf execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.635 1948442 DEBUG oslo_concurrency.processutils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "rbd import --pool volume --order 22 /opt/stack/data/cinder/conversion/tmpwdbezo8n volume-49f084b9-f18f-466d-ab95-9df7e3954652 --new-format --id cinder --cluster ceph --conf /etc/ceph/ceph.conf" returned: 0 in 0.221s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.652 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.713 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_replicated_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1012
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.713 1948442 DEBUG cinder.volume.drivers.rbd [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] extra_specs: {'volume_backend_name': 'ceph'} _is_multiattach_type /opt/stack/cinder/cinder/volume/drivers/rbd.py:1021
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.714 1948442 DEBUG cinder.volume.volume_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Downloaded image d3d0c59e-4eef-4932-b6dd-e436b761c6be ((None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}])) to volume 49f084b9-f18f-466d-ab95-9df7e3954652 successfully. copy_image_to_volume /opt/stack/cinder/cinder/volume/volume_utils.py:1234
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.719 1948442 DEBUG cinder.image.image_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Temporary image d3d0c59e-4eef-4932-b6dd-e436b761c6be for user 09805ebaab704a8cbf99fdc8a0c1859d is deleted. fetch /opt/stack/cinder/cinder/image/image_utils.py:1439
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.720 1948442 DEBUG cinder.volume.volume_utils [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Marking volume 49f084b9-f18f-466d-ab95-9df7e3954652 as bootable. enable_bootable_flag /opt/stack/cinder/cinder/volume/volume_utils.py:1138
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.735 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Copying metadata from image d3d0c59e-4eef-4932-b6dd-e436b761c6be to 49f084b9-f18f-466d-ab95-9df7e3954652. _handle_bootable_volume_glance_meta /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:450
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.735 1948442 DEBUG cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Creating volume glance metadata for volume 49f084b9-f18f-466d-ab95-9df7e3954652 backed by image d3d0c59e-4eef-4932-b6dd-e436b761c6be with: {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': '', 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_name': 'cirros-0.6.3-x86_64-disk', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'container_format': 'bare', 'disk_format': 'qcow2', 'min_disk': 0, 'min_ram': 0, 'size': 21692416}. _capture_volume_image_metadata /opt/stack/cinder/cinder/volume/flows/manager/create_volume.py:682
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.768 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeFromSpecTask;volume:create' (21e693ab-4e2e-4aaa-aa23-b6637e107358) transitioned into state 'SUCCESS' from state 'RUNNING' with result '{'status': 'creating', 'volume_name': 'volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'volume_size': 5, 'image_id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'image_location': (None, [{'url': 'file:///opt/stack/data/glance/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be', 'metadata': {}}]), 'image_meta': {'name': 'cirros-0.6.3-x86_64-disk', 'disk_format': 'qcow2', 'container_format': 'bare', 'visibility': 'public', 'size': 21692416, 'virtual_size': 117440512, 'status': 'active', 'checksum': '87617e24a5e30cb3b87fda8c0764838f', 'protected': False, 'min_ram': 0, 'min_disk': 0, 'owner': '9fb44e4466264364b4ac3eb936bdc4c2', 'os_hidden': False, 'os_hash_algo': 'sha512', 'os_hash_value': '9a9bce0083a00939ec17c11febbfc767aa211aaa54f51e75c5a8b271a9b5637c77205a518b7a2007cb391d23cceb01e0e4e8d64832317151bc85b734b92a7be0', 'id': 'd3d0c59e-4eef-4932-b6dd-e436b761c6be', 'created_at': datetime.datetime(2026, 1, 19, 13, 18, 27, tzinfo=datetime.timezone.utc), 'updated_at': datetime.datetime(2026, 1, 19, 13, 18, 28, tzinfo=datetime.timezone.utc), 'tags': [], 'file': '/v2/images/d3d0c59e-4eef-4932-b6dd-e436b761c6be/file', 'properties': {'hw_rng_model': 'virtio', 'owner_specified.openstack.md5': '', 'owner_specified.openstack.object': 'images/cirros-0.6.3-x86_64-disk', 'owner_specified.openstack.sha256': ''}}, 'image_service': <cinder.image.glance.GlanceImageService object at 0x7f267aa5bee0>}' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.770 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeOnFinishTask;volume:create, create.end' (23436e9c-2d3f-4204-9cd9-16bb8ffe90d8) transitioned into state 'RUNNING' from state 'PENDING' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:194
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.789 1948442 INFO cinder.volume.flows.manager.create_volume [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Volume volume-49f084b9-f18f-466d-ab95-9df7e3954652 (49f084b9-f18f-466d-ab95-9df7e3954652): created successfully
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.791 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Task 'cinder.volume.flows.manager.create_volume.CreateVolumeOnFinishTask;volume:create, create.end' (23436e9c-2d3f-4204-9cd9-16bb8ffe90d8) transitioned into state 'SUCCESS' from state 'RUNNING' with result 'None' _task_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:182
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.793 1948442 DEBUG cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Flow 'volume_create_manager' (f21f34c7-5bd2-4a45-8bdb-ef6c60c0825c) transitioned into state 'SUCCESS' from state 'RUNNING' _flow_receiver /opt/stack/data/venv/lib/python3.10/site-packages/taskflow/listeners/logging.py:145
Jan 31 18:01:51 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:01:51.808 1948442 INFO cinder.volume.manager [None req-8a820d50-379f-4e60-94b4-b632142e2f22 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Created volume successfully.
Jan 31 18:02:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:03.023 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=13,cinder:UPDATE=3,cinder:INSERT=7,cinder:DELETE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:02:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:03.026 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=12,cinder:UPDATE=6,cinder:INSERT=6 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:02:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:23.034 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.033 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.034 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.057 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:02:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:41.080 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:02:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:02:43.038 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=3,cinder:UPDATE=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:03.042 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:03.045 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:23.050 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:23.052 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.035 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.057 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:03:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:41.079 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:03:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:43.051 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:03:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:03:43.053 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:03.053 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:03.056 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:23.061 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:33.066 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:43.067 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:04:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:04:53.072 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:03.076 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:13.078 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:23.083 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:33.089 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.035 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.059 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:05:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:41.080 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:05:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:43.092 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:05:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:05:53.095 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:03.099 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:13.104 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:18 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:18.801 1948442 DEBUG oslo_concurrency.processutils [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Running cmd (subprocess): ceph mon dump --format=json --id cinder --cluster ceph --conf /etc/ceph/ceph.conf execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.264 1948442 DEBUG oslo_concurrency.processutils [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] CMD "ceph mon dump --format=json --id cinder --cluster ceph --conf /etc/ceph/ceph.conf" returned: 0 in 0.463s execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.265 1948442 DEBUG cinder.volume.drivers.rbd [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] connection data: {'driver_volume_type': 'rbd', 'data': {'name': 'volume/volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'hosts': ['192.168.95.19', '192.168.95.240', '192.168.95.221'], 'ports': ['6789', '6789', '6789'], 'cluster_name': 'ceph', 'auth_enabled': True, 'auth_username': 'cinder', 'secret_type': 'ceph', 'secret_uuid': 'a9625cff-fc0e-11f0-a1f6-6998182b0a5e', 'volume_id': '49f084b9-f18f-466d-ab95-9df7e3954652', 'discard': True}} initialize_connection /opt/stack/cinder/cinder/volume/drivers/rbd.py:1877
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.285 1948442 DEBUG cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Connection info returned from driver {'name': 'volume/volume-49f084b9-f18f-466d-ab95-9df7e3954652', 'hosts': ['192.168.95.19', '192.168.95.240', '192.168.95.221'], 'ports': ['6789', '6789', '6789'], 'cluster_name': 'ceph', 'auth_enabled': True, 'auth_username': 'cinder', 'secret_type': '***', 'secret_uuid': '***', 'volume_id': '49f084b9-f18f-466d-ab95-9df7e3954652', 'discard': True, 'qos_specs': None, 'access_mode': 'rw', 'encrypted': False, 'cacheable': False, 'driver_volume_type': 'rbd', 'attachment_id': '8ed85ff8-458c-4b29-8824-3c1f7c0e3244', 'enforce_multipath': True} _connection_create /opt/stack/cinder/cinder/volume/manager.py:4893
Jan 31 18:06:19 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:19.313 1948442 INFO cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-43ccf1fa-6de6-4a47-b64f-972453d8b26c 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] attachment_update completed successfully.
Jan 31 18:06:25 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:25.753 1948442 INFO cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-89532a6e-af6a-42a8-a50e-7a849b8201ff 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Terminate volume connection completed successfully.
Jan 31 18:06:25 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:25.753 1948442 DEBUG cinder.volume.manager [req-a1515822-bea2-4a38-93c1-5bb8c40a2dab req-89532a6e-af6a-42a8-a50e-7a849b8201ff 09805ebaab704a8cbf99fdc8a0c1859d 9fb44e4466264364b4ac3eb936bdc4c2 - - - -] Deleting attachment 8ed85ff8-458c-4b29-8824-3c1f7c0e3244. attachment_delete /opt/stack/cinder/cinder/volume/manager.py:5024
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.034 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.061 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:06:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:41.080 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:06:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:43.111 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=11,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:06:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:06:53.116 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=14,cinder:UPDATE=5 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:07:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:13.112 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.034 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.035 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.060 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:07:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:41.088 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:07:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:07:43.119 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=3,cinder:SELECT=3 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:03.126 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:23.134 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=3,cinder:SELECT=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.032 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.033 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.057 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:08:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:41.076 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:08:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:43.124 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:08:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:08:43.127 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:09:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:03.128 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:09:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:03.131 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:09:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:23.133 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:09:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:23.136 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:09:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:41.031 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:09:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:41.032 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:09:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:41.056 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:09:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:41.075 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:09:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:43.138 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:09:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:09:53.161 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:UPDATE=2,cinder:SELECT=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:10:03 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:03.165 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:10:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:13.169 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:10:23 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:23.173 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:10:33 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:33.174 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:10:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:41.030 1948442 DEBUG oslo_service.periodic_task [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Running periodic task VolumeManager.publish_service_capabilities run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210
Jan 31 18:10:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:41.030 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:10:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:41.060 1948442 DEBUG cinder.volume.drivers.rbd [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] connecting to cinder@ceph (conf=/etc/ceph/ceph.conf, timeout=-1). _do_conn /opt/stack/cinder/cinder/volume/drivers/rbd.py:603
Jan 31 18:10:41 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:41.082 1948442 DEBUG cinder.manager [None req-10ef17ee-c2ae-4054-9f5d-7e1cf9cf53d2 - - - - - -] Notifying Schedulers of capabilities ... _publish_service_capabilities /opt/stack/cinder/cinder/manager.py:202
Jan 31 18:10:43 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:43.178 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:10:53 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:10:53.181 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=1,cinder:UPDATE=1 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
Jan 31 18:11:13 gelani-lab-1 cinder-volume[1948442]: 2026-01-31 18:11:13.190 1948442 DEBUG dbcounter [-] [1948442] Writing DB stats cinder:SELECT=2,cinder:UPDATE=2 stat_writer /opt/stack/data/venv/lib/python3.10/site-packages/dbcounter.py:115
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume service list
openstack volume type show ceph
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
| Binary           | Host                     | Zone | Status  | State | Updated At                 | Cluster | Backend State |
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
| cinder-scheduler | gelani-lab-1             | nova | enabled | up    | 2026-01-31T18:11:15.000000 | None    | None          |
| cinder-volume    | gelani-lab-1@lvmdriver-1 | nova | enabled | down  | 2026-01-31T13:58:17.000000 | None    | None          |
| cinder-volume    | gelani-lab-1@ceph        | nova | enabled | up    | 2026-01-31T18:11:23.000000 | None    | None          |
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
+--------------------+--------------------------------------+
| Field              | Value                                |
+--------------------+--------------------------------------+
| access_project_ids | None                                 |
| description        | None                                 |
| id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
| is_public          | True                                 |
| name               | ceph                                 |
| properties         | volume_backend_name='ceph'           |
| qos_specs_id       | None                                 |
+--------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls --id cinder --keyring /etc/ceph/ceph.client.cinder.keyring | tail
volume-49f084b9-f18f-466d-ab95-9df7e3954652
volume-4c67f1c6-6d25-4af4-a05f-944934af35d0
volume-b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ V
V: command not found
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-cephboot-1 -c status -c fault -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
sudo journalctl -u devstack@n-cpu --since "15 minutes ago" --no-pager | tail -n 200
sudo tail -n 120 /var/log/libvirt/qemu/*.log
+-----------------------+-------+
| Field                 | Value |
+-----------------------+-------+
| OS-EXT-STS:task_state | None  |
| OS-EXT-STS:vm_state   | error |
| status                | ERROR |
+-----------------------+-------+
Jan 31 18:09:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:09:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:09:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:09:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:09:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:09:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:09:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:09:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:09:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:09:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:09:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:09:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:09:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:09:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5047 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:05 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:08 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:09 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:09 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:10:09 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:10:09 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:10:09 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1970964) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: WARNING nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CMD "env LANG=C uptime" returned: 0 in 0.018s {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=17866MB free_disk=10.72237777709961GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1970964) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:10:10 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:10:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:10:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:10:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 18:10:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '3', 'uptime': ' 18:10:10 up 12 days,  5:20,  1 user,  load average: 0.17, 0.31, 0.27\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 18:10:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.provider_tree [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1970964) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 18:10:12 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 18:10:13 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1970964) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 18:10:13 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.084s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:10:13 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._cleanup_expired_console_auth_tokens {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:15 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:16 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:18 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._run_pending_deletes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:18 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Cleaning up deleted instances {{(pid=1970964) _run_pending_deletes /opt/stack/nova/nova/compute/manager.py:11955}}
Jan 31 18:10:18 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] There are 0 instances to clean {{(pid=1970964) _run_pending_deletes /opt/stack/nova/nova/compute/manager.py:11964}}
Jan 31 18:10:19 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:19 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._cleanup_incomplete_migrations {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:19 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Cleaning up deleted instances with incomplete migration  {{(pid=1970964) _cleanup_incomplete_migrations /opt/stack/nova/nova/compute/manager.py:11993}}
Jan 31 18:10:20 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:20 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:20 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:20 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:20 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:20 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:21 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._sync_scheduler_instance_info {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:21 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:21 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1970964) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 18:10:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:25 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:30 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._cleanup_running_deleted_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:10:35 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:35 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:35 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:35 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:35 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:35 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:40 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:45 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:50 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:10:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:10:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:10:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:10:55 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:00 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:01 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:01 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5152 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:11:01 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:01 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:01 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rebooting_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:05 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._sync_power_states {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Triggering sync for uuid 1a155fc3-49dd-44be-853d-e19221446b64 {{(pid=1970964) _sync_power_states /opt/stack/nova/nova/compute/manager.py:11066}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Triggering sync for uuid c0c53027-178e-4ac8-9ac9-955d0c6dc606 {{(pid=1970964) _sync_power_states /opt/stack/nova/nova/compute/manager.py:11066}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "1a155fc3-49dd-44be-853d-e19221446b64" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "1a155fc3-49dd-44be-853d-e19221446b64" acquired by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "c0c53027-178e-4ac8-9ac9-955d0c6dc606" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "c0c53027-178e-4ac8-9ac9-955d0c6dc606" acquired by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: waited 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "1a155fc3-49dd-44be-853d-e19221446b64" "released" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: held 0.506s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:11:06 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "c0c53027-178e-4ac8-9ac9-955d0c6dc606" "released" by "nova.compute.manager.ComputeManager._sync_power_states.<locals>._sync.<locals>.query_driver_power_state_and_sync" :: held 0.507s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:11:08 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_rescued_instances {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_volume_usage {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager.update_available_resource {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: waited 0.001s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker.clean_compute_node_cache" :: held 0.000s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:11:11 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Auditing locally available compute resources for gelani-lab-1 (node: gelani-lab-1) {{(pid=1970964) update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:937}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sda (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] skipping disk /dev/sdb (vda) as it is a volume {{(pid=1970964) _get_instance_disk_info_from_config /opt/stack/nova/nova/virt/libvirt/driver.py:12194}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: WARNING nova.virt.libvirt.driver [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] This host appears to have multiple sockets per NUMA node. The `socket` PCI NUMA affinity will not be supported.
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running cmd (subprocess): env LANG=C uptime {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:349}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.processutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CMD "env LANG=C uptime" returned: 0 in 0.049s {{(pid=1970964) execute /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/processutils.py:372}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Hypervisor/Node resource view: name=gelani-lab-1 free_ram=17862MB free_disk=10.721294403076172GB free_vcpus=13 pci_devices=[{"dev_id": "pci_0000_00_00_0", "address": "0000:00:00.0", "product_id": "1237", "vendor_id": "8086", "numa_node": null, "label": "label_8086_1237", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_06_0", "address": "0000:00:06.0", "product_id": "1002", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1002", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_3", "address": "0000:00:01.3", "product_id": "7113", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7113", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_02_0", "address": "0000:00:02.0", "product_id": "0100", "vendor_id": "1b36", "numa_node": null, "label": "label_1b36_0100", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_05_0", "address": "0000:00:05.0", "product_id": "1001", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1001", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_04_0", "address": "0000:00:04.0", "product_id": "1003", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1003", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_03_0", "address": "0000:00:03.0", "product_id": "1000", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_0", "address": "0000:00:01.0", "product_id": "7000", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7000", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_1", "address": "0000:00:01.1", "product_id": "7010", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7010", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_01_2", "address": "0000:00:01.2", "product_id": "7020", "vendor_id": "8086", "numa_node": null, "label": "label_8086_7020", "dev_type": "type-PCI"}, {"dev_id": "pci_0000_00_07_0", "address": "0000:00:07.0", "product_id": "1005", "vendor_id": "1af4", "numa_node": null, "label": "label_1af4_1005", "dev_type": "type-PCI"}] {{(pid=1970964) _report_hypervisor_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1136}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Acquiring lock "compute_resources" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:405}}
Jan 31 18:11:12 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" acquired by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: waited 0.001s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:410}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance 1a155fc3-49dd-44be-853d-e19221446b64 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 128, 'VCPU': 1}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Instance c0c53027-178e-4ac8-9ac9-955d0c6dc606 actively managed on this compute host and has allocations in placement: {'resources': {'MEMORY_MB': 2048, 'VCPU': 2}}. {{(pid=1970964) _remove_deleted_instances_allocations /opt/stack/nova/nova/compute/resource_tracker.py:1740}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Total usable vcpus: 16, total allocated vcpus: 3 {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1159}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Final resource view: name=gelani-lab-1 phys_ram=32089MB used_ram=2688MB phys_disk=48GB used_disk=0GB total_vcpus=16 used_vcpus=3 pci_stats=[] stats={'failed_builds': '3', 'uptime': ' 18:11:12 up 12 days,  5:21,  1 user,  load average: 0.06, 0.25, 0.25\n', 'num_instances': '2', 'num_vm_active': '2', 'num_task_None': '2', 'num_os_type_None': '2', 'num_proj_6e0c493b7e814bb392ca7ea299c182de': '2', 'io_workload': '0'} {{(pid=1970964) _report_final_resource_view /opt/stack/nova/nova/compute/resource_tracker.py:1168}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Refreshing inventories for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1970964) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:822}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Updating ProviderTree inventory for provider ba2ec314-9891-498b-82cc-7a5f896382bf from _refresh_and_get_inventory using data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) _refresh_and_get_inventory /opt/stack/nova/nova/scheduler/client/report.py:786}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.provider_tree [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Updating inventory in ProviderTree for provider ba2ec314-9891-498b-82cc-7a5f896382bf with inventory: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:176}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Refreshing aggregate associations for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf, aggregates: None {{(pid=1970964) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:831}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Refreshing trait associations for resource provider ba2ec314-9891-498b-82cc-7a5f896382bf, traits: COMPUTE_SOUND_MODEL_SB16,COMPUTE_NET_VIF_MODEL_VMXNET3,COMPUTE_NET_VIF_MODEL_VIRTIO,COMPUTE_VOLUME_EXTEND,COMPUTE_STORAGE_BUS_IDE,COMPUTE_SOUND_MODEL_USB,COMPUTE_IMAGE_TYPE_ARI,COMPUTE_NET_VIF_MODEL_RTL8139,HW_CPU_X86_MMX,COMPUTE_STORAGE_BUS_FDC,COMPUTE_GRAPHICS_MODEL_BOCHS,COMPUTE_STORAGE_BUS_USB,COMPUTE_IMAGE_TYPE_AKI,COMPUTE_NET_VIRTIO_PACKED,COMPUTE_STORAGE_BUS_SATA,COMPUTE_VOLUME_ATTACH_WITH_TAG,COMPUTE_GRAPHICS_MODEL_CIRRUS,COMPUTE_STORAGE_BUS_SCSI,HW_CPU_X86_SSE41,COMPUTE_DEVICE_TAGGING,COMPUTE_IMAGE_TYPE_RAW,COMPUTE_ARCH_X86_64,COMPUTE_GRAPHICS_MODEL_NONE,COMPUTE_IMAGE_TYPE_QCOW2,HW_CPU_X86_SSE2,COMPUTE_GRAPHICS_MODEL_VGA,COMPUTE_SECURITY_UEFI_SECURE_BOOT,HW_ARCH_X86_64,COMPUTE_NET_ATTACH_INTERFACE,COMPUTE_VIOMMU_MODEL_INTEL,COMPUTE_NET_VIF_MODEL_SPAPR_VLAN,COMPUTE_IMAGE_TYPE_ISO,COMPUTE_NET_ATTACH_INTERFACE_WITH_TAG,COMPUTE_NET_VIF_MODEL_PCNET,HW_CPU_X86_SSSE3,COMPUTE_GRAPHICS_MODEL_VIRTIO,COMPUTE_TRUSTED_CERTS,COMPUTE_IMAGE_TYPE_AMI,COMPUTE_RESCUE_BFV,COMPUTE_SOUND_MODEL_AC97,COMPUTE_SOUND_MODEL_ICH6,COMPUTE_SOUND_MODEL_ES1370,COMPUTE_SOUND_MODEL_PCSPK,COMPUTE_SOCKET_PCI_NUMA_AFFINITY,COMPUTE_NET_VIF_MODEL_E1000E,COMPUTE_NET_VIF_MODEL_E1000,COMPUTE_NET_VIF_MODEL_NE2K_PCI,HW_CPU_X86_SSE,COMPUTE_STORAGE_VIRTIO_FS,COMPUTE_STORAGE_BUS_VIRTIO,COMPUTE_GRAPHICS_MODEL_QXL,COMPUTE_SOUND_MODEL_ICH9,COMPUTE_GRAPHICS_MODEL_VMVGA,COMPUTE_NODE,COMPUTE_VIOMMU_MODEL_AUTO,COMPUTE_VOLUME_MULTI_ATTACH,COMPUTE_ACCELERATORS,HW_CPU_X86_SSE42 {{(pid=1970964) _refresh_associations /opt/stack/nova/nova/scheduler/client/report.py:843}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.provider_tree [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed in ProviderTree for provider: ba2ec314-9891-498b-82cc-7a5f896382bf {{(pid=1970964) update_inventory /opt/stack/nova/nova/compute/provider_tree.py:180}}
Jan 31 18:11:14 gelani-lab-1 nova-compute[1970964]: DEBUG nova.scheduler.client.report [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Inventory has not changed for provider ba2ec314-9891-498b-82cc-7a5f896382bf based on inventory data: {'VCPU': {'total': 16, 'reserved': 0, 'min_unit': 1, 'max_unit': 16, 'step_size': 1, 'allocation_ratio': 4.0}, 'MEMORY_MB': {'total': 32089, 'reserved': 512, 'min_unit': 1, 'max_unit': 32089, 'step_size': 1, 'allocation_ratio': 1.0}, 'DISK_GB': {'total': 48, 'reserved': 0, 'min_unit': 1, 'max_unit': 48, 'step_size': 1, 'allocation_ratio': 1.0}} {{(pid=1970964) set_inventory_for_provider /opt/stack/nova/nova/scheduler/client/report.py:958}}
Jan 31 18:11:15 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.resource_tracker [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Compute_service record updated for gelani-lab-1:gelani-lab-1 {{(pid=1970964) _update_available_resource /opt/stack/nova/nova/compute/resource_tracker.py:1097}}
Jan 31 18:11:15 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_concurrency.lockutils [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Lock "compute_resources" "released" by "nova.compute.resource_tracker.ResourceTracker._update_available_resource" :: held 2.237s {{(pid=1970964) inner /opt/stack/data/venv/lib/python3.10/site-packages/oslo_concurrency/lockutils.py:424}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5003 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._poll_unconfirmed_resizes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:16 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._instance_usage_audit {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:20 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._check_instance_build_time {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:21 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:22 gelani-lab-1 nova-compute[1970964]: DEBUG oslo_service.periodic_task [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] Running periodic task ComputeManager._reclaim_queued_deletes {{(pid=1970964) run_periodic_tasks /opt/stack/data/venv/lib/python3.10/site-packages/oslo_service/periodic_task.py:210}}
Jan 31 18:11:22 gelani-lab-1 nova-compute[1970964]: DEBUG nova.compute.manager [None req-39fc98ee-25cf-4cb5-a6f7-740fa9f17145 None None] CONF.reclaim_instance_interval <= 0, skipping... {{(pid=1970964) _reclaim_queued_deletes /opt/stack/nova/nova/compute/manager.py:11274}}
Jan 31 18:11:26 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:26 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:26 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5004 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:11:26 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:26 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:26 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:31 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 4999-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:31 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] 0-ms timeout {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:248}}
Jan 31 18:11:31 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: idle 5002 ms, sending inactivity probe {{(pid=1970964) run /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:117}}
Jan 31 18:11:31 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering IDLE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
Jan 31 18:11:31 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] [POLLIN] on fd 17 {{(pid=1970964) __log_wakeup /opt/stack/data/venv/lib/python3.10/site-packages/ovs/poller.py:263}}
Jan 31 18:11:31 gelani-lab-1 nova-compute[1970964]: DEBUG ovsdbapp.backend.ovs_idl.vlog [-] tcp:127.0.0.1:6640: entering ACTIVE {{(pid=1970964) _transition /opt/stack/data/venv/lib/python3.10/site-packages/ovs/reconnect.py:519}}
==> /var/log/libvirt/qemu/instance-00000001.log <==
2026-01-27 11:32:08.390+0000: starting up libvirt version: 8.0.0, package: 1ubuntu7.15 (Marc Deslauriers <marc.deslauriers@ubuntu.com> Mon, 08 Dec 2025 13:08:06 -0500), qemu version: 6.2.0Debian 1:6.2+dfsg-2ubuntu6.27, kernel: 5.15.0-164-generic, hostname: gelani-lab-1
LC_ALL=C \
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin \
HOME=/var/lib/libvirt/qemu/domain-1-instance-00000001 \
XDG_DATA_HOME=/var/lib/libvirt/qemu/domain-1-instance-00000001/.local/share \
XDG_CACHE_HOME=/var/lib/libvirt/qemu/domain-1-instance-00000001/.cache \
XDG_CONFIG_HOME=/var/lib/libvirt/qemu/domain-1-instance-00000001/.config \
/usr/bin/qemu-system-x86_64 \
-name guest=instance-00000001,debug-threads=on \
-S \
-object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-instance-00000001/master-key.aes"}' \
-machine pc-i440fx-6.2,usb=off,dump-guest-core=off,memory-backend=pc.ram \
-accel kvm \
-cpu Nehalem \
-m 128 \
-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":134217728}' \
-overcommit mem-lock=off \
-smp 1,sockets=1,dies=1,cores=1,threads=1 \
-uuid 1a155fc3-49dd-44be-853d-e19221446b64 \
-smbios 'type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=32.1.0,serial=1a155fc3-49dd-44be-853d-e19221446b64,uuid=1a155fc3-49dd-44be-853d-e19221446b64,family=Virtual Machine' \
-no-user-config \
-nodefaults \
-chardev socket,id=charmonitor,fd=34,server=on,wait=off \
-mon chardev=charmonitor,id=monitor,mode=control \
-rtc base=utc,driftfix=slew \
-global kvm-pit.lost_tick_policy=delay \
-no-hpet \
-no-shutdown \
-boot strict=on \
-blockdev '{"driver":"host_device","filename":"/dev/sda","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"}' \
-device virtio-blk-pci,bus=pci.0,addr=0x4,drive=libvirt-1-format,id=ua-e6244cf1-4d20-43c8-813e-7f0e36643271,bootindex=1,write-cache=on,serial=e6244cf1-4d20-43c8-813e-7f0e36643271 \
-netdev tap,fd=36,id=hostnet0,vhost=on,vhostfd=38 \
-device virtio-net-pci,host_mtu=1442,netdev=hostnet0,id=net0,mac=fa:16:3e:32:85:e2,bus=pci.0,addr=0x3 \
-add-fd set=3,fd=35 \
-chardev pty,id=charserial0,logfile=/dev/fdset/3,logappend=on \
-device isa-serial,chardev=charserial0,id=serial0 \
-audiodev '{"id":"audio1","driver":"none"}' \
-vnc 0.0.0.0:0,audiodev=audio1 \
-device virtio-vga,id=video0,max_outputs=1,bus=pci.0,addr=0x2 \
-device virtio-balloon-pci,id=balloon0,deflate-on-oom=on,free-page-reporting=on,bus=pci.0,addr=0x5 \
-object '{"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"}' \
-device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x6 \
-device vmcoreinfo \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-msg timestamp=on
char device redirected to /dev/pts/2 (label charserial0)

==> /var/log/libvirt/qemu/instance-00000002.log <==
2026-01-28 12:18:50.043+0000: starting up libvirt version: 8.0.0, package: 1ubuntu7.15 (Marc Deslauriers <marc.deslauriers@ubuntu.com> Mon, 08 Dec 2025 13:08:06 -0500), qemu version: 6.2.0Debian 1:6.2+dfsg-2ubuntu6.27, kernel: 5.15.0-164-generic, hostname: gelani-lab-1
LC_ALL=C \
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin \
HOME=/var/lib/libvirt/qemu/domain-2-instance-00000002 \
XDG_DATA_HOME=/var/lib/libvirt/qemu/domain-2-instance-00000002/.local/share \
XDG_CACHE_HOME=/var/lib/libvirt/qemu/domain-2-instance-00000002/.cache \
XDG_CONFIG_HOME=/var/lib/libvirt/qemu/domain-2-instance-00000002/.config \
/usr/bin/qemu-system-x86_64 \
-name guest=instance-00000002,debug-threads=on \
-S \
-object '{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-2-instance-00000002/master-key.aes"}' \
-machine pc-i440fx-6.2,usb=off,dump-guest-core=off,memory-backend=pc.ram \
-accel kvm \
-cpu Nehalem \
-m 2048 \
-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":2147483648}' \
-overcommit mem-lock=off \
-smp 2,sockets=2,dies=1,cores=1,threads=1 \
-uuid c0c53027-178e-4ac8-9ac9-955d0c6dc606 \
-smbios 'type=1,manufacturer=OpenStack Foundation,product=OpenStack Nova,version=32.1.0,serial=c0c53027-178e-4ac8-9ac9-955d0c6dc606,uuid=c0c53027-178e-4ac8-9ac9-955d0c6dc606,family=Virtual Machine' \
-no-user-config \
-nodefaults \
-chardev socket,id=charmonitor,fd=37,server=on,wait=off \
-mon chardev=charmonitor,id=monitor,mode=control \
-rtc base=utc,driftfix=slew \
-global kvm-pit.lost_tick_policy=delay \
-no-hpet \
-no-shutdown \
-boot strict=on \
-blockdev '{"driver":"host_device","filename":"/dev/sdb","aio":"native","node-name":"libvirt-1-storage","cache":{"direct":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}' \
-blockdev '{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"no-flush":false},"driver":"raw","file":"libvirt-1-storage"}' \
-device virtio-blk-pci,bus=pci.0,addr=0x4,drive=libvirt-1-format,id=ua-5f35d8ce-23d4-4771-aaed-cf25c9791752,bootindex=1,write-cache=on,serial=5f35d8ce-23d4-4771-aaed-cf25c9791752 \
-netdev tap,fd=40,id=hostnet0,vhost=on,vhostfd=42 \
-device virtio-net-pci,host_mtu=1442,netdev=hostnet0,id=net0,mac=fa:16:3e:e3:4a:51,bus=pci.0,addr=0x3 \
-add-fd set=3,fd=39 \
-chardev pty,id=charserial0,logfile=/dev/fdset/3,logappend=on \
-device isa-serial,chardev=charserial0,id=serial0 \
-audiodev '{"id":"audio1","driver":"none"}' \
-vnc 0.0.0.0:1,audiodev=audio1 \
-device virtio-vga,id=video0,max_outputs=1,bus=pci.0,addr=0x2 \
-device virtio-balloon-pci,id=balloon0,deflate-on-oom=on,free-page-reporting=on,bus=pci.0,addr=0x5 \
-object '{"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"}' \
-device virtio-rng-pci,rng=objrng0,id=rng0,bus=pci.0,addr=0x6 \
-device vmcoreinfo \
-sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny \
-msg timestamp=on
char device redirected to /dev/pts/0 (label charserial0)

==> /var/log/libvirt/qemu/instance-00000003.log <==
2026-01-31 14:50:52.887+0000: shutting down, reason=failed

==> /var/log/libvirt/qemu/instance-00000004.log <==
2026-01-31 17:15:56.735+0000: shutting down, reason=failed

==> /var/log/libvirt/qemu/instance-00000005.log <==
2026-01-31 17:40:11.527+0000: shutting down, reason=failed

==> /var/log/libvirt/qemu/instance-00000006.log <==
2026-01-31 17:40:33.012+0000: shutting down, reason=failed

==> /var/log/libvirt/qemu/instance-00000007.log <==
2026-01-31 18:06:24.133+0000: shutting down, reason=failed
ubuntu@gelani-lab-1:/opt/stack/devstack$ 


ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /opt/stack/devstack
ubuntu@gelani-lab-1:/opt/stack/devstack$ source openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo grep -R --line-number -E "rbd_secret_uuid|rbd_user|rbd_ceph_conf" /etc/nova/nova.conf
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo ceph auth get-key client.cinder
AQCZt31pD9tpJRAACEoHdeuSDcPR/IBinTLfgA==uCEPH_KEY_B64="AQCZt31pD9tpJRAACEoHdeuSDcPR/IBinTLfgA=="QCZt31pD9tpJRAACEoHdeuSDcPR/IBinTLfgA=="
ubuntu@gelani-lab-1:/opt/stack/devstack$ CEPH_KEY_B64="AQCZt31pD9tpJRAACEoHdeuSDcPR/IBinTLfgA=="
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo tee /tmp/ceph-secret.xml >/dev/null <<'EOF'
<secret ephemeral='no' private='no'>
  <uuid>a9625cff-fc0e-11f0-a1f6-6998182b0a5e</uuid>
  <usage type='ceph'>
    <name>client.cinder secret</name>
  </usage>
</secret>
EOF
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh -c qemu:///system secret-define --file /tmp/ceph-secret.xml
Secret a9625cff-fc0e-11f0-a1f6-6998182b0a5e created

ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh -c qemu:///system secret-set-value \
  --secret a9625cff-fc0e-11f0-a1f6-6998182b0a5e \
  --base64 "$CEPH_KEY_B64"
error: Passing secret value as command-line argument is insecure!
Secret value set

ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh -c qemu:///system secret-set-value   --secret a9625cff-fc0e-11f0-a1f6-6998182b0a5e   --base64 "$CEPH_KEY_B64"
error: Passing secret value as command-line argument is insecure!
Secret value set

ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh -c qemu:///system secret-list | grep -i a9625cff || true
 a9625cff-fc0e-11f0-a1f6-6998182b0a5e   ceph client.cinder secret
                                         sudo systemctl restart libvirtdgelani-lab-1:/opt/stack/devstack$ sudo systemctl restart libvirtd
sudo systemctl restart devstack@n-cpu
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor 1 \
  --network af7ee1c4-02c6-438b-8784-93690f664a47 \
  --volume ceph-boot-vol \
  ceph-vm-cephboot-ok
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                               | Value                                                                                                                                                                                              |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                                                                                                                                             |
| OS-EXT-AZ:availability_zone         | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:host                | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-cephboot-ok                                                                                                                                                                                |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:reservation_id      | r-0cxp77hw                                                                                                                                                                                         |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                                                                                                                                               |
| OS-EXT-SRV-ATTR:user_data           | None                                                                                                                                                                                               |
| OS-EXT-STS:power_state              | N/A                                                                                                                                                                                                |
| OS-EXT-STS:task_state               | scheduling                                                                                                                                                                                         |
| OS-EXT-STS:vm_state                 | building                                                                                                                                                                                           |
| OS-SRV-USG:launched_at              | None                                                                                                                                                                                               |
| OS-SRV-USG:terminated_at            | None                                                                                                                                                                                               |
| accessIPv4                          | None                                                                                                                                                                                               |
| accessIPv6                          | None                                                                                                                                                                                               |
| addresses                           | N/A                                                                                                                                                                                                |
| adminPass                           | mdQWWEWD4Lex                                                                                                                                                                                       |
| config_drive                        | None                                                                                                                                                                                               |
| created                             | 2026-01-31T18:26:11Z                                                                                                                                                                               |
| description                         | None                                                                                                                                                                                               |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True', id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny', original_name='m1.tiny', ram='512',             |
|                                     | rxtx_factor=, swap='0', vcpus='1'                                                                                                                                                                  |
| hostId                              | None                                                                                                                                                                                               |
| host_status                         | None                                                                                                                                                                                               |
| id                                  | a97b3eda-2d85-40fc-b19d-9667b4db0d6f                                                                                                                                                               |
| image                               | N/A (booted from volume)                                                                                                                                                                           |
| key_name                            | None                                                                                                                                                                                               |
| locked                              | None                                                                                                                                                                                               |
| locked_reason                       | None                                                                                                                                                                                               |
| name                                | ceph-vm-cephboot-ok                                                                                                                                                                                |
| pinned_availability_zone            | None                                                                                                                                                                                               |
| progress                            | None                                                                                                                                                                                               |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                                                                                                                                                   |
| properties                          | None                                                                                                                                                                                               |
| scheduler_hints                     |                                                                                                                                                                                                    |
| security_groups                     | name='default'                                                                                                                                                                                     |
| server_groups                       | None                                                                                                                                                                                               |
| status                              | BUILD                                                                                                                                                                                              |
| tags                                |                                                                                                                                                                                                    |
| trusted_image_certificates          | None                                                                                                                                                                                               |
| updated                             | 2026-01-31T18:26:11Z                                                                                                                                                                               |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                                                                                                                                                   |
| volumes_attached                    |                                                                                                                                                                                                    |
+-------------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ NEWID=$(openstack server list --name ceph-vm-cephboot-ok -f value -c ID | head -n1)
openstack server show "$NEWID" -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+----------+
| Field                 | Value    |
+-----------------------+----------+
| OS-EXT-STS:task_state | spawning |
| OS-EXT-STS:vm_state   | building |
| status                | BUILD    |
+-----------------------+----------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ /opt/stack/devstack$ openstack server show ceph-vm-0 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
-bash: /opt/stack/devstack$: No such file or directory
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show "$NEWID" -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+--------+
| Field                 | Value  |
+-----------------------+--------+
| OS-EXT-STS:task_state | None   |
| OS-EXT-STS:vm_state   | active |
| status                | ACTIVE |
+-----------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show "$NEWID" -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+-----------------------+--------+
| Field                 | Value  |
+-----------------------+--------+
| OS-EXT-STS:task_state | None   |
| OS-EXT-STS:vm_state   | active |
| status                | ACTIVE |
+-----------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ ^C
ubuntu@gelani-lab-1:/opt/stack/devstack$ 



ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /opt/stack/devstack
source openrc admin admin

openstack server list --name ceph-vm-cephboot-ok
NEWID=$(openstack server list --name ceph-vm-cephboot-ok -f value -c ID | head -n1)
echo "NEWID=$NEWID"
openstack server show "$NEWID" -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+--------------------------------------+---------------------+--------+--------------------------------------------------------+--------------------------+---------+
| ID                                   | Name                | Status | Networks                                               | Image                    | Flavor  |
+--------------------------------------+---------------------+--------+--------------------------------------------------------+--------------------------+---------+
| a97b3eda-2d85-40fc-b19d-9667b4db0d6f | ceph-vm-cephboot-ok | ACTIVE | private=10.0.0.9, fdf9:52f7:7011:0:f816:3eff:fe19:8668 | N/A (booted from volume) | m1.tiny |
+--------------------------------------+---------------------+--------+--------------------------------------------------------+--------------------------+---------+
NEWID=a97b3eda-2d85-40fc-b19d-9667b4db0d6f
+-----------------------+--------+
| Field                 | Value  |
+-----------------------+--------+
| OS-EXT-STS:task_state | None   |
| OS-EXT-STS:vm_state   | active |
| status                | ACTIVE |
+-----------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list --name ceph-boot-vol
VOLID=$(openstack volume list --name ceph-boot-vol -f value -c ID | head -n1)
echo "VOLID=$VOLID"
openstack volume show "$VOLID" -c status -c attachments -c type -c os-vol-host-attr:host
+--------------------------------------+---------------+--------+------+----------------------------------------------+
| ID                                   | Name          | Status | Size | Attached to                                  |
+--------------------------------------+---------------+--------+------+----------------------------------------------+
| 4c67f1c6-6d25-4af4-a05f-944934af35d0 | ceph-boot-vol | in-use |    5 | Attached to ceph-vm-cephboot-ok on /dev/vda  |
+--------------------------------------+---------------+--------+------+----------------------------------------------+
VOLID=4c67f1c6-6d25-4af4-a05f-944934af35d0
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Field                 | Value                                                                                                                                                                                                            |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| attachments           | [{'id': '4c67f1c6-6d25-4af4-a05f-944934af35d0', 'attachment_id': '710d8ac2-0edd-4216-9177-7bb3d145bc33', 'volume_id': '4c67f1c6-6d25-4af4-a05f-944934af35d0', 'server_id':                                       |
|                       | 'a97b3eda-2d85-40fc-b19d-9667b4db0d6f', 'host_name': 'gelani-lab-1', 'device': '/dev/vda', 'attached_at': '2026-01-31T18:26:18.000000'}]                                                                         |
| os-vol-host-attr:host | gelani-lab-1@ceph#ceph                                                                                                                                                                                           |
| status                | in-use                                                                                                                                                                                                           |
| type                  | ceph                                                                                                                                                                                                             |
+-----------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls | tail
# If you want to search by the volume UUID:
sudo rbd -p volume ls | grep "$VOLID" || true
volume-49f084b9-f18f-466d-ab95-9df7e3954652
volume-4c67f1c6-6d25-4af4-a05f-944934af35d0
volume-b751b947-32ca-4e27-b297-baa4020843b3
volume-4c67f1c6-6d25-4af4-a05f-944934af35d0
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo virsh -c qemu:///system list --all
# find the instance name like: instance-0000000X
INST=$(sudo virsh -c qemu:///system list --name | head -n 1)
echo "INST=$INST"

sudo virsh -c qemu:///system dumpxml "$INST" | egrep -n "rbd|ceph|secret|pool|volume-|auth" | head -n 200
 Id   Name                State
-----------------------------------
 1    instance-00000001   running
 2    instance-00000002   running
 3    instance-00000008   running

INST=instance-00000001
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume service list
openstack volume list --status error
openstack server list --status ERROR
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
| Binary           | Host                     | Zone | Status  | State | Updated At                 | Cluster | Backend State |
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
| cinder-scheduler | gelani-lab-1             | nova | enabled | up    | 2026-01-31T18:33:25.000000 | None    | None          |
| cinder-volume    | gelani-lab-1@lvmdriver-1 | nova | enabled | down  | 2026-01-31T13:58:17.000000 | None    | None          |
| cinder-volume    | gelani-lab-1@ceph        | nova | enabled | up    | 2026-01-31T18:33:24.000000 | None    | None          |
+------------------+--------------------------+------+---------+-------+----------------------------+---------+---------------+
+--------------------------------------+---------------+--------+------+-------------+
| ID                                   | Name          | Status | Size | Attached to |
+--------------------------------------+---------------+--------+------+-------------+
| 58e3a81a-a762-468a-a276-d1e5a1ad65cb | ceph-test-vol | error  |    1 |             |
| b1dd372c-1a48-4b39-8553-8ac781382408 | ceph-test-vol | error  |    1 |             |
+--------------------------------------+---------------+--------+------+-------------+
+--------------------------------------+--------------------+--------+----------+--------------------------+---------+
| ID                                   | Name               | Status | Networks | Image                    | Flavor  |
+--------------------------------------+--------------------+--------+----------+--------------------------+---------+
| f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed | ceph-vm-cephboot-1 | ERROR  |          | N/A (booted from volume) | m1.tiny |
+--------------------------------------+--------------------+--------+----------+--------------------------+---------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ source /opt/stack/devstack/openrc admin admin

openstack volume create --type ceph --size 2 ceph-final-test-vol
openstack volume list --name ceph-final-test-vol

NEWVOL=$(openstack volume list --name ceph-final-test-vol -f value -c ID | head -n1)
openstack volume show "$NEWVOL" -c status

openstack server create --flavor 1 --network af7ee1c4-02c6-438b-8784-93690f664a47 --volume "$NEWVOL" ceph-vm-final
openstack server show ceph-vm-final -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T18:34:04.845977           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | 7619d47e-8550-4a18-8593-703ba0b802b3 |
| multiattach                    | False                                |
| name                           | ceph-final-test-vol                  |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 2                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
+--------------------------------------+---------------------+-----------+------+-------------+
| ID                                   | Name                | Status    | Size | Attached to |
+--------------------------------------+---------------------+-----------+------+-------------+
| 7619d47e-8550-4a18-8593-703ba0b802b3 | ceph-final-test-vol | available |    2 |             |
+--------------------------------------+---------------------+-----------+------+-------------+
+--------+-----------+
| Field  | Value     |
+--------+-----------+
| status | available |
+--------+-----------+
BadRequestException: 400: Client Error for url: http://192.168.95.93/compute/v2.1/servers, Block Device 7619d47e-8550-4a18-8593-703ba0b802b3 is not bootable.
No Server found for ceph-vm-final
ubuntu@gelani-lab-1:/opt/stack/devstack$ 


ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /opt/stack/devstack
source /opt/stack/devstack/openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack token issue
+------------+------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                |
+------------+------------------------------------------------------------------------------------------------------+
| expires    | 2026-01-31T19:40:27+0000                                                                             |
| id         | gAAAAABpfkybXw7MWFvlB-                                                                               |
|            | qyAthyQOytiiEPXwXcDsPCT4m4ux3EWimN71sYfD2FG_pq9PT8MazvVKbrhNeQTic66cZ3tL2OO717lu44hG-                |
|            | dbP2ExNgmx_eO6wfe7-KA_gfhlOSGWaBd-rfgwFcRlJlE91ULaowuGuQViBYYmf9XyjoTygLcruo                         |
| project_id | 9fb44e4466264364b4ac3eb936bdc4c2                                                                     |
| user_id    | 09805ebaab704a8cbf99fdc8a0c1859d                                                                     |
+------------+------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --status ERROR -f value -c ID | while read id; do
  echo "Deleting server $id"
  openstack server delete "$id"
done
Deleting server f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list --name ceph-test-vol -f value -c ID -c Status
openstack volume list --name ceph-test-vol -f value -c ID | while read vid; do
  echo "Deleting volume $vid"
  openstack volume delete "$vid"
done
58e3a81a-a762-468a-a276-d1e5a1ad65cb error
b1dd372c-1a48-4b39-8553-8ac781382408 error
Deleting volume 58e3a81a-a762-468a-a276-d1e5a1ad65cb
Deleting volume b1dd372c-1a48-4b39-8553-8ac781382408
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list --public
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID=b6e575cd-c986-4098-a75f-136eafa50af2
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID="b6e575cd-c986-4098-a75f-136eafa50af2"
ubuntu@gelani-lab-1:/opt/stack/devstack$ $ECHO IMAGID
IMAGID: command not found
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --image "$IMGID" --size 8 ceph-boot-from-image
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T18:42:21.555228           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b79ce0ce-a4bf-48c1-9552-0909c03c466d |
| multiattach                    | False                                |
| name                           | ceph-boot-from-image                 |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 8                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-from-image -c status -c bootable -c size"
ubuntu@gelani-lab-1:/opt/stack/devstack$ 

ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /opt/stack/devstack
source /opt/stack/devstack/openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack token issue
+------------+------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                |
+------------+------------------------------------------------------------------------------------------------------+
| expires    | 2026-01-31T19:40:27+0000                                                                             |
| id         | gAAAAABpfkybXw7MWFvlB-                                                                               |
|            | qyAthyQOytiiEPXwXcDsPCT4m4ux3EWimN71sYfD2FG_pq9PT8MazvVKbrhNeQTic66cZ3tL2OO717lu44hG-                |
|            | dbP2ExNgmx_eO6wfe7-KA_gfhlOSGWaBd-rfgwFcRlJlE91ULaowuGuQViBYYmf9XyjoTygLcruo                         |
| project_id | 9fb44e4466264364b4ac3eb936bdc4c2                                                                     |
| user_id    | 09805ebaab704a8cbf99fdc8a0c1859d                                                                     |
+------------+------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --status ERROR -f value -c ID | while read id; do
  echo "Deleting server $id"
  openstack server delete "$id"
done
Deleting server f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list --name ceph-test-vol -f value -c ID -c Status
openstack volume list --name ceph-test-vol -f value -c ID | while read vid; do
  echo "Deleting volume $vid"
  openstack volume delete "$vid"
done
58e3a81a-a762-468a-a276-d1e5a1ad65cb error
b1dd372c-1a48-4b39-8553-8ac781382408 error
Deleting volume 58e3a81a-a762-468a-a276-d1e5a1ad65cb
Deleting volume b1dd372c-1a48-4b39-8553-8ac781382408
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list --public
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID=b6e575cd-c986-4098-a75f-136eafa50af2
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID="b6e575cd-c986-4098-a75f-136eafa50af2"
ubuntu@gelani-lab-1:/opt/stack/devstack$ $ECHO IMAGID
IMAGID: command not found
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --image "$IMGID" --size 8 ceph-boot-from-image
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T18:42:21.555228           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b79ce0ce-a4bf-48c1-9552-0909c03c466d |
| multiattach                    | False                                |
| name                           | ceph-boot-from-image                 |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 8                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-from-image -c status -c bootable -c size"
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /opt/stack/devstack
source /opt/stack/devstack/openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack token issue
+------------+------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                |
+------------+------------------------------------------------------------------------------------------------------+
| expires    | 2026-01-31T19:40:27+0000                                                                             |
| id         | gAAAAABpfkybXw7MWFvlB-                                                                               |
|            | qyAthyQOytiiEPXwXcDsPCT4m4ux3EWimN71sYfD2FG_pq9PT8MazvVKbrhNeQTic66cZ3tL2OO717lu44hG-                |
|            | dbP2ExNgmx_eO6wfe7-KA_gfhlOSGWaBd-rfgwFcRlJlE91ULaowuGuQViBYYmf9XyjoTygLcruo                         |
| project_id | 9fb44e4466264364b4ac3eb936bdc4c2                                                                     |
| user_id    | 09805ebaab704a8cbf99fdc8a0c1859d                                                                     |
+------------+------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --status ERROR -f value -c ID | while read id; do
  echo "Deleting server $id"
  openstack server delete "$id"
done
Deleting server f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list --name ceph-test-vol -f value -c ID -c Status
openstack volume list --name ceph-test-vol -f value -c ID | while read vid; do
  echo "Deleting volume $vid"
  openstack volume delete "$vid"
done
58e3a81a-a762-468a-a276-d1e5a1ad65cb error
b1dd372c-1a48-4b39-8553-8ac781382408 error
Deleting volume 58e3a81a-a762-468a-a276-d1e5a1ad65cb
Deleting volume b1dd372c-1a48-4b39-8553-8ac781382408
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list --public
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID=b6e575cd-c986-4098-a75f-136eafa50af2
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID="b6e575cd-c986-4098-a75f-136eafa50af2"
ubuntu@gelani-lab-1:/opt/stack/devstack$ $ECHO IMAGID
IMAGID: command not found
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --image "$IMGID" --size 8 ceph-boot-from-image
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T18:42:21.555228           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b79ce0ce-a4bf-48c1-9552-0909c03c466d |
| multiattach                    | False                                |
| name                           | ceph-boot-from-image                 |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 8                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-from-image -c status -c bootable -c size"
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
Every 2.0s: openstack volume show ceph-boot-from-image -c status -c bootab...  gelani-lab-1: Sat Jan 31 18:43:18 2026

+----------+-----------+
| Field    | Value     |
+----------+-----------+
| bootable | True      |
| size     | 8         |
| status   | available |
+----------+-----------+


ubuntu@gelani-lab-1:/opt/stack/devstack$ NETID="af7ee1c4-02c6-438b-8784-93690f664a47"   # your network from earlier
VOLID=$(openstack volume show ceph-boot-from-image -f value -c id)

openstack server create --flavor 1 --network "$NETID" --volume "$VOLID" ceph-vm-ok-2
+-------------------------------------+-----------------------------------------------------------------------------+
| Field                               | Value                                                                       |
+-------------------------------------+-----------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                      |
| OS-EXT-AZ:availability_zone         | None                                                                        |
| OS-EXT-SRV-ATTR:host                | None                                                                        |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-ok-2                                                                |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                        |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                        |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                        |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                        |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                        |
| OS-EXT-SRV-ATTR:reservation_id      | r-xc0isz3u                                                                  |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                        |
| OS-EXT-SRV-ATTR:user_data           | None                                                                        |
| OS-EXT-STS:power_state              | N/A                                                                         |
| OS-EXT-STS:task_state               | scheduling                                                                  |
| OS-EXT-STS:vm_state                 | building                                                                    |
| OS-SRV-USG:launched_at              | None                                                                        |
| OS-SRV-USG:terminated_at            | None                                                                        |
| accessIPv4                          | None                                                                        |
| accessIPv6                          | None                                                                        |
| addresses                           | N/A                                                                         |
| adminPass                           | K8Ym7qCcSmyc                                                                |
| config_drive                        | None                                                                        |
| created                             | 2026-01-31T18:43:59Z                                                        |
| description                         | None                                                                        |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True',   |
|                                     | id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny',    |
|                                     | original_name='m1.tiny', ram='512', rxtx_factor=, swap='0', vcpus='1'       |
| hostId                              | None                                                                        |
| host_status                         | None                                                                        |
| id                                  | 16b57140-3ce0-483e-9124-b888974dbcfa                                        |
| image                               | N/A (booted from volume)                                                    |
| key_name                            | None                                                                        |
| locked                              | None                                                                        |
| locked_reason                       | None                                                                        |
| name                                | ceph-vm-ok-2                                                                |
| pinned_availability_zone            | None                                                                        |
| progress                            | None                                                                        |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                            |
| properties                          | None                                                                        |
| scheduler_hints                     |                                                                             |
| security_groups                     | name='default'                                                              |
| server_groups                       | None                                                                        |
| status                              | BUILD                                                                       |
| tags                                |                                                                             |
| trusted_image_certificates          | None                                                                        |
| updated                             | 2026-01-31T18:43:58Z                                                        |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                            |
| volumes_attached                    |                                                                             |
+-------------------------------------+-----------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack server show ceph-vm-ok-2 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state"
ubuntu@gelani-lab-1:/opt/stack/devstack$ 

Every 2.0s: openstack server show ceph-vm-ok-2 -c status -c OS-EXT-STS:vm_...  gelani-lab-1: Sat Jan 31 18:44:52 2026

+-----------------------+--------+
| Field                 | Value  |
+-----------------------+--------+
| OS-EXT-STS:task_state | None   |
| OS-EXT-STS:vm_state   | active |
| status                | ACTIVE |
+-----------------------+--------+

ubuntu@gelani-lab-1:/opt/stack/devstack$ cd /opt/stack/devstack
source /opt/stack/devstack/openrc admin admin
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack token issue
+------------+------------------------------------------------------------------------------------------------------+
| Field      | Value                                                                                                |
+------------+------------------------------------------------------------------------------------------------------+
| expires    | 2026-01-31T19:40:27+0000                                                                             |
| id         | gAAAAABpfkybXw7MWFvlB-                                                                               |
|            | qyAthyQOytiiEPXwXcDsPCT4m4ux3EWimN71sYfD2FG_pq9PT8MazvVKbrhNeQTic66cZ3tL2OO717lu44hG-                |
|            | dbP2ExNgmx_eO6wfe7-KA_gfhlOSGWaBd-rfgwFcRlJlE91ULaowuGuQViBYYmf9XyjoTygLcruo                         |
| project_id | 9fb44e4466264364b4ac3eb936bdc4c2                                                                     |
| user_id    | 09805ebaab704a8cbf99fdc8a0c1859d                                                                     |
+------------+------------------------------------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --status ERROR -f value -c ID | while read id; do
  echo "Deleting server $id"
  openstack server delete "$id"
done
Deleting server f2cf99ac-93a1-49e0-90c0-eeddb24bc0ed
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list --name ceph-test-vol -f value -c ID -c Status
openstack volume list --name ceph-test-vol -f value -c ID | while read vid; do
  echo "Deleting volume $vid"
  openstack volume delete "$vid"
done
58e3a81a-a762-468a-a276-d1e5a1ad65cb error
b1dd372c-1a48-4b39-8553-8ac781382408 error
Deleting volume 58e3a81a-a762-468a-a276-d1e5a1ad65cb
Deleting volume b1dd372c-1a48-4b39-8553-8ac781382408
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list --public
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID=b6e575cd-c986-4098-a75f-136eafa50af2
ubuntu@gelani-lab-1:/opt/stack/devstack$ IMGID="b6e575cd-c986-4098-a75f-136eafa50af2"
ubuntu@gelani-lab-1:/opt/stack/devstack$ $ECHO IMAGID
IMAGID: command not found
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --image "$IMGID" --size 8 ceph-boot-from-image
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T18:42:21.555228           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b79ce0ce-a4bf-48c1-9552-0909c03c466d |
| multiattach                    | False                                |
| name                           | ceph-boot-from-image                 |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 8                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-from-image -c status -c bootable -c size"
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-from-image -c status -c bootable -c size"
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack volume show ceph-boot-from-image -c status -c bootable -c size"
ubuntu@gelani-lab-1:/opt/stack/devstack$ NETID="af7ee1c4-02c6-438b-8784-93690f664a47"   # your network from earlier
VOLID=$(openstack volume show ceph-boot-from-image -f value -c id)

openstack server create --flavor 1 --network "$NETID" --volume "$VOLID" ceph-vm-ok-2
+-------------------------------------+-----------------------------------------------------------------------------+
| Field                               | Value                                                                       |
+-------------------------------------+-----------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                      |
| OS-EXT-AZ:availability_zone         | None                                                                        |
| OS-EXT-SRV-ATTR:host                | None                                                                        |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-ok-2                                                                |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                        |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                        |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                        |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                        |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                        |
| OS-EXT-SRV-ATTR:reservation_id      | r-xc0isz3u                                                                  |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                        |
| OS-EXT-SRV-ATTR:user_data           | None                                                                        |
| OS-EXT-STS:power_state              | N/A                                                                         |
| OS-EXT-STS:task_state               | scheduling                                                                  |
| OS-EXT-STS:vm_state                 | building                                                                    |
| OS-SRV-USG:launched_at              | None                                                                        |
| OS-SRV-USG:terminated_at            | None                                                                        |
| accessIPv4                          | None                                                                        |
| accessIPv6                          | None                                                                        |
| addresses                           | N/A                                                                         |
| adminPass                           | K8Ym7qCcSmyc                                                                |
| config_drive                        | None                                                                        |
| created                             | 2026-01-31T18:43:59Z                                                        |
| description                         | None                                                                        |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True',   |
|                                     | id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny',    |
|                                     | original_name='m1.tiny', ram='512', rxtx_factor=, swap='0', vcpus='1'       |
| hostId                              | None                                                                        |
| host_status                         | None                                                                        |
| id                                  | 16b57140-3ce0-483e-9124-b888974dbcfa                                        |
| image                               | N/A (booted from volume)                                                    |
| key_name                            | None                                                                        |
| locked                              | None                                                                        |
| locked_reason                       | None                                                                        |
| name                                | ceph-vm-ok-2                                                                |
| pinned_availability_zone            | None                                                                        |
| progress                            | None                                                                        |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                            |
| properties                          | None                                                                        |
| scheduler_hints                     |                                                                             |
| security_groups                     | name='default'                                                              |
| server_groups                       | None                                                                        |
| status                              | BUILD                                                                       |
| tags                                |                                                                             |
| trusted_image_certificates          | None                                                                        |
| updated                             | 2026-01-31T18:43:58Z                                                        |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                            |
| volumes_attached                    |                                                                             |
+-------------------------------------+-----------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack server show ceph-vm-ok-2 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state"
ubuntu@gelani-lab-1:/opt/stack/devstack$ watch -n 2 "openstack server show ceph-vm-ok-2 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state"
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls | grep "$VOLID" || true
volume-b79ce0ce-a4bf-48c1-9552-0909c03c466d
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list --name ceph-vm-1
SID=$(openstack server list --name ceph-vm-1 -f value -c ID | head -n1)
openstack server show "$SID"

BadRequestException: 400: Client Error for url: http://192.168.95.93/compute/v2.1/servers/detail?name=, Invalid input for query parameters name. Value: . '' is not a 'regex'
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list -f value -c ID | while read id; do
  openstack server delete "$id"
done
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list -f value -c ID | while read vid; do
  openstack volume delete "$vid"
done
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=False, Invalid volume: Volume status must be available or error or error_restoring or error_extending or error_managing and must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list
+--------------------------------------+------------+-----------+------+-------------+
| ID                                   | Name       | Status    | Size | Attached to |
+--------------------------------------+------------+-----------+------+-------------+
| b751b947-32ca-4e27-b297-baa4020843b3 | ceph-vol-1 | available |    1 |             |
+--------------------------------------+------------+-----------+------+-------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list -f value -c ID | while read vid; do
  openstack volume delete "$vid"
done
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=False, Invalid volume: Volume status must be available or error or error_restoring or error_extending or error_managing and must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ 

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show b751b947-32ca-4e27-b297-baa4020843b3
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T14:45:27.000000           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | b751b947-32ca-4e27-b297-baa4020843b3 |
| multiattach                    | False                                |
| name                           | ceph-vol-1                           |
| os-vol-host-attr:host          | gelani-lab-1@ceph#ceph               |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | 9fb44e4466264364b4ac3eb936bdc4c2     |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | 62a0e87e-7f48-49a0-a409-c1c84ec1207a |
| shared_targets                 | False                                |
| size                           | 1                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | available                            |
| type                           | ceph                                 |
| updated_at                     | 2026-01-31T14:45:27.000000           |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --force b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=True, Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --force b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=True, Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume set --state error b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --force b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=True, Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls
volume-b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume rm volume-b751b947-32ca-4e27-b297-baa4020843b3
Removing image: 0% complete...failed.
rbd: image has snapshots - these must be deleted with 'rbd snap purge' before the image can be removed.
ubuntu@gelani-lab-1:/opt/stack/devstack$ rbd snap purge b751b947-32ca-4e27-b297-baa4020843b3
rbd: error opening default pool 'rbd'
Ensure that the default pool has been created or specify an alternate pool name.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --force b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=True, Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --force b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=True, Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list
openstack server list
+--------------------------------------+------------+--------+------+-------------+
| ID                                   | Name       | Status | Size | Attached to |
+--------------------------------------+------------+--------+------+-------------+
| b751b947-32ca-4e27-b297-baa4020843b3 | ceph-vol-1 | error  |    1 |             |
+--------------------------------------+------------+--------+------+-------------+


ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap ls volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
SNAPID  NAME                                           SIZE   PROTECTED  TIMESTAMP               
     4  snapshot-e21c5302-ba97-4be4-a8c5-f40b5b390c31  1 GiB  yes        Sat Jan 31 14:47:47 2026
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap purge volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
rbd: error removing snapshot(s) 'snapshot-e21c5302-ba97-4be4-a8c5-f40b5b390c31', which is protected - these must be unprotected with `rbd snap unprotect`.
Removing all snapshots: 0% complete...failed.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd rm volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
Removing image: 0% complete...failed.
rbd: image has snapshots - these must be deleted with 'rbd snap purge' before the image can be removed.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap purge volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
rbd: error removing snapshot(s) 'snapshot-e21c5302-ba97-4be4-a8c5-f40b5b390c31', which is protected - these must be unprotected with `rbd snap unprotect`.
Removing all snapshots: 0% complete...failed.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd rm volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
Removing image: 0% complete...failed.
rbd: image has snapshots - these must be deleted with 'rbd snap purge' before the image can be removed.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls
volume-b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume set --state error b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=False, Invalid volume: Volume status must be available or error or error_restoring or error_extending or error_managing and must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ 


ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap unprotect \
  volume/volume-b751b947-32ca-4e27-b297-baa4020843b3@snapshot-e21c5302-ba97-4be4-a8c5-f40b5b390c31
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap rm \
  volume/volume-b751b947-32ca-4e27-b297-baa4020843b3@snapshot-e21c5302-ba97-4be4-a8c5-f40b5b390c31
Removing snap: 100% complete...done.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap ls volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd rm volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
Removing image: 100% complete...done.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --cascade b751b947-32ca-4e27-b297-baa4020843b3
usage: openstack volume delete [-h] [--force | --purge] [--remote] <volume> [<volume> ...]
openstack volume delete: error: unrecognized arguments: --cascade
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete b751b947-32ca-4e27-b297-baa4020843b3 --force
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': BadRequestException: 400: Client Error for url: http://192.168.95.93/volume/v3/volumes/b751b947-32ca-4e27-b297-baa4020843b3?cascade=False&force=True, Invalid volume: Volume  must not be migrating, attached, belong to a group, have snapshots, awaiting a transfer, or be disassociated from snapshots after volume transfer.
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd snap ls volume/volume-b751b947-32ca-4e27-b297-baa4020843b3
openstack volume show b751b947-32ca-4e27-b297-baa4020843b3 -c status -c id -c attachments
rbd: error opening image volume-b751b947-32ca-4e27-b297-baa4020843b3: (2) No such file or directory
+-------------+--------------------------------------+
| Field       | Value                                |
+-------------+--------------------------------------+
| attachments | []                                   |
| id          | b751b947-32ca-4e27-b297-baa4020843b3 |
| status      | error                                |
+-------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ 

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --purge b751b947-32ca-4e27-b297-baa4020843b3
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show b751b947-32ca-4e27-b297-baa4020843b3
openstack volume list
No Volume found for b751b947-32ca-4e27-b297-baa4020843b3

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --purge b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': No Volume found for b751b947-32ca-4e27-b297-baa4020843b3
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show b751b947-32ca-4e27-b297-baa4020843b3
openstack volume list
No Volume found for b751b947-32ca-4e27-b297-baa4020843b3

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume snapshot list --volume b751b947-32ca-4e27-b297-baa4020843b3 
openstack volume snapshot list
No Volume found for b751b947-32ca-4e27-b297-baa4020843b3

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --purge b751b947-32ca-4e27-b297-baa4020843b3
Failed to delete volume with name or ID 'b751b947-32ca-4e27-b297-baa4020843b3': No Volume found for b751b947-32ca-4e27-b297-baa4020843b3
1 of 1 volumes failed to delete.
ubuntu@gelani-lab-1:/opt/stack/devstack$ 

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume service list
+------------------+-------------------+------+---------+-------+-------------------+---------+---------------+
| Binary           | Host              | Zone | Status  | State | Updated At        | Cluster | Backend State |
+------------------+-------------------+------+---------+-------+-------------------+---------+---------------+
| cinder-scheduler | gelani-lab-1      | nova | enabled | up    | 2026-01-          | None    | None          |
|                  |                   |      |         |       | 31T19:21:06.00000 |         |               |
|                  |                   |      |         |       | 0                 |         |               |
| cinder-volume    | gelani-           | nova | enabled | down  | 2026-01-          | None    | None          |
|                  | lab-1@lvmdriver-1 |      |         |       | 31T13:58:17.00000 |         |               |
|                  |                   |      |         |       | 0                 |         |               |
| cinder-volume    | gelani-lab-1@ceph | nova | enabled | up    | 2026-01-          | None    | None          |
|                  |                   |      |         |       | 31T19:21:04.00000 |         |               |
|                  |                   |      |         |       | 0                 |         |               |
+------------------+-------------------+------+---------+-------+-------------------+---------+---------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume type list
openstack volume type show ceph
+--------------------------------------+-------------+-----------+
| ID                                   | Name        | Is Public |
+--------------------------------------+-------------+-----------+
| b612d2b3-a3d9-4063-84ec-64a58b2c4411 | ceph        | True      |
| 77b0e4a9-b93d-437f-b732-2fdae0731d30 | lvmdriver-1 | True      |
| d05b7e56-8ca4-41d4-8ac5-e4d14a291df9 | __DEFAULT__ | True      |
+--------------------------------------+-------------+-----------+
+--------------------+--------------------------------------+
| Field              | Value                                |
+--------------------+--------------------------------------+
| access_project_ids | None                                 |
| description        | None                                 |
| id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
| is_public          | True                                 |
| name               | ceph                                 |
| properties         | volume_backend_name='ceph'           |
| qos_specs_id       | None                                 |
+--------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume type show ceph -c properties
+------------+----------------------------+
| Field      | Value                      |
+------------+----------------------------+
| properties | volume_backend_name='ceph' |
+------------+----------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --size 1 ceph-vol-test
openstack volume show ceph-vol-test -c id -c status -c type
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T19:22:47.732568           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | d6169e05-f29b-405c-a9b9-67eebf618d2c |
| multiattach                    | False                                |
| name                           | ceph-vol-test                        |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 1                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
+--------+--------------------------------------+
| Field  | Value                                |
+--------+--------------------------------------+
| id     | d6169e05-f29b-405c-a9b9-67eebf618d2c |
| status | available                            |
| type   | ceph                                 |
+--------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show ceph-vol-test -c id -c status -c type
+--------+--------------------------------------+
| Field  | Value                                |
+--------+--------------------------------------+
| id     | d6169e05-f29b-405c-a9b9-67eebf618d2c |
| status | available                            |
| type   | ceph                                 |
+--------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ VOL_ID=$(openstack volume show ceph-vol-test -f value -c id)
sudo rbd -p volume ls | grep $VOL_ID
volume-d6169e05-f29b-405c-a9b9-67eebf618d2c
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor 1 \
  --network af7ee1c4-02c6-438b-8784-93690f664a47 \
  --boot-from-volume 5 \
  --image cirros \
  ceph-boot-vm-1
No Image found for cirros
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-boot-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
No Server found for ceph-boot-vm-1
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-boot-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
No Server found for ceph-boot-vm-1
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume service list
+------------------+-------------------+------+---------+-------+-------------------+---------+---------------+
| Binary           | Host              | Zone | Status  | State | Updated At        | Cluster | Backend State |
+------------------+-------------------+------+---------+-------+-------------------+---------+---------------+
| cinder-scheduler | gelani-lab-1      | nova | enabled | up    | 2026-01-          | None    | None          |
|                  |                   |      |         |       | 31T19:21:06.00000 |         |               |
|                  |                   |      |         |       | 0                 |         |               |
| cinder-volume    | gelani-           | nova | enabled | down  | 2026-01-          | None    | None          |
|                  | lab-1@lvmdriver-1 |      |         |       | 31T13:58:17.00000 |         |               |
|                  |                   |      |         |       | 0                 |         |               |
| cinder-volume    | gelani-lab-1@ceph | nova | enabled | up    | 2026-01-          | None    | None          |
|                  |                   |      |         |       | 31T19:21:04.00000 |         |               |
|                  |                   |      |         |       | 0                 |         |               |
+------------------+-------------------+------+---------+-------+-------------------+---------+---------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume type list
openstack volume type show ceph
+--------------------------------------+-------------+-----------+
| ID                                   | Name        | Is Public |
+--------------------------------------+-------------+-----------+
| b612d2b3-a3d9-4063-84ec-64a58b2c4411 | ceph        | True      |
| 77b0e4a9-b93d-437f-b732-2fdae0731d30 | lvmdriver-1 | True      |
| d05b7e56-8ca4-41d4-8ac5-e4d14a291df9 | __DEFAULT__ | True      |
+--------------------------------------+-------------+-----------+
+--------------------+--------------------------------------+
| Field              | Value                                |
+--------------------+--------------------------------------+
| access_project_ids | None                                 |
| description        | None                                 |
| id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
| is_public          | True                                 |
| name               | ceph                                 |
| properties         | volume_backend_name='ceph'           |
| qos_specs_id       | None                                 |
+--------------------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume type show ceph -c properties
+------------+----------------------------+
| Field      | Value                      |
+------------+----------------------------+
| properties | volume_backend_name='ceph' |
+------------+----------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume create --type ceph --size 1 ceph-vol-test
openstack volume show ceph-vol-test -c id -c status -c type
+--------------------------------+--------------------------------------+
| Field                          | Value                                |
+--------------------------------+--------------------------------------+
| attachments                    | []                                   |
| availability_zone              | nova                                 |
| backup_id                      | None                                 |
| bootable                       | False                                |
| cluster_name                   | None                                 |
| consumes_quota                 | True                                 |
| created_at                     | 2026-01-31T19:22:47.732568           |
| description                    | None                                 |
| encrypted                      | False                                |
| group_id                       | None                                 |
| id                             | d6169e05-f29b-405c-a9b9-67eebf618d2c |
| multiattach                    | False                                |
| name                           | ceph-vol-test                        |
| os-vol-host-attr:host          | None                                 |
| os-vol-mig-status-attr:migstat | None                                 |
| os-vol-mig-status-attr:name_id | None                                 |
| os-vol-tenant-attr:tenant_id   | None                                 |
| properties                     |                                      |
| provider_id                    | None                                 |
| replication_status             | None                                 |
| service_uuid                   | None                                 |
| shared_targets                 | True                                 |
| size                           | 1                                    |
| snapshot_id                    | None                                 |
| source_volid                   | None                                 |
| status                         | creating                             |
| type                           | ceph                                 |
| updated_at                     | None                                 |
| user_id                        | 09805ebaab704a8cbf99fdc8a0c1859d     |
| volume_type_id                 | b612d2b3-a3d9-4063-84ec-64a58b2c4411 |
+--------------------------------+--------------------------------------+
+--------+--------------------------------------+
| Field  | Value                                |
+--------+--------------------------------------+
| id     | d6169e05-f29b-405c-a9b9-67eebf618d2c |
| status | available                            |
| type   | ceph                                 |
+--------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume show ceph-vol-test -c id -c status -c type
+--------+--------------------------------------+
| Field  | Value                                |
+--------+--------------------------------------+
| id     | d6169e05-f29b-405c-a9b9-67eebf618d2c |
| status | available                            |
| type   | ceph                                 |
+--------+--------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ VOL_ID=$(openstack volume show ceph-vol-test -f value -c id)
sudo rbd -p volume ls | grep $VOL_ID
volume-d6169e05-f29b-405c-a9b9-67eebf618d2c
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor 1 \
  --network af7ee1c4-02c6-438b-8784-93690f664a47 \
  --boot-from-volume 5 \
  --image cirros \
  ceph-boot-vm-1
No Image found for cirros
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-boot-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
No Server found for ceph-boot-vm-1
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-boot-vm-1 -c status -c OS-EXT-STS:vm_state -c OS-EXT-STS:task_state
No Server found for ceph-boot-vm-1
ubuntu@gelani-lab-1:/opt/stack/devstack$ 
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list -f value -c ID | while read id; do
  openstack server delete "$id"
done
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server list

ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list
+--------------------------------------+---------------+-----------+------+-------------+
| ID                                   | Name          | Status    | Size | Attached to |
+--------------------------------------+---------------+-----------+------+-------------+
| d6169e05-f29b-405c-a9b9-67eebf618d2c | ceph-vol-test | available |    1 |             |
+--------------------------------------+---------------+-----------+------+-------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume delete --purge d6169e05-f29b-405c-a9b9-67eebf618d2c
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list

ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls
ubuntu@gelani-lab-1:/opt/stack/devstack$ No Image found for cirros
No: command not found
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo rbd -p volume ls
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack image list
+--------------------------------------+---------------------------------+--------+
| ID                                   | Name                            | Status |
+--------------------------------------+---------------------------------+--------+
| 0fcd1b67-931f-4417-a407-b887577fda9f | Fedora-Cloud-Base-37-1.7.x86_64 | active |
| d3d0c59e-4eef-4932-b6dd-e436b761c6be | cirros-0.6.3-x86_64-disk        | active |
| b6e575cd-c986-4098-a75f-136eafa50af2 | ubuntu                          | active |
+--------------------------------------+---------------------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack network list
+--------------------------------------+----------+----------------------------------------------------+
| ID                                   | Name     | Subnets                                            |
+--------------------------------------+----------+----------------------------------------------------+
| 172b9757-3f94-4b3a-8588-aaef9f5d94e3 | public   | 0f51c1e9-b2bb-4546-a208-2f911e514369,              |
|                                      |          | 17c9de01-9f5b-422c-b9ce-53cc4a3f2cdc               |
| 34be5cb2-fc34-4a8b-b337-41595e361e6d | heat-net | 6914f2f9-8d4e-4138-8a06-b8bbd45bb3bb               |
| 68a7ad34-b3e9-48a4-a3cc-c178a4d89ddd | shared   | 13063700-83a4-402f-8cc9-0ca93ac96bf6               |
| af7ee1c4-02c6-438b-8784-93690f664a47 | private  | 6adea907-730d-4318-98d5-1908d2d013fc,              |
|                                      |          | ee882e21-e946-48f8-9873-826e2c5e68b8               |
+--------------------------------------+----------+----------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor m1.tiny \
  --network ee882e21-e946-48f8-9873-826e2c5e68b8  \
  --boot-from-volume 5 \
  --image "ubuntu" \
  ceph-vm-1
No Network found for ee882e21-e946-48f8-9873-826e2c5e68b8
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create   --flavor m1.tiny   --network 6adea907-730d-4318-98d5-1908d2d013fc,    --boot-from-volume 5   --image "ubuntu"   ceph-vm-1
usage: openstack server create [-h] [-f {json,shell,table,value,yaml}] [-c COLUMN] [--noindent] [--prefix PREFIX]
                               [--max-width <integer>] [--fit-width] [--print-empty] --flavor <flavor>
                               [--image <image> | --image-property <key=value> | --volume <volume> | --snapshot <snapshot>]
                               [--boot-from-volume <volume-size>] [--block-device-mapping <dev-name=mapping>]
                               [--block-device <block-device>] [--swap <swap>]
                               [--ephemeral <size=size[,format=format]>] [--network <network>] [--port <port>]
                               [--no-network] [--auto-network]
                               [--nic <net-id=net-uuid,port-id=port-uuid,v4-fixed-ip=ip-addr,v6-fixed-ip=ip-addr,tag=tag,auto,none>]
                               [--password <password>] [--no-security-group | --security-group <security-group>]
                               [--key-name <key-name>] [--property <key=value>]
                               [--file <dest-filename=source-filename>] [--user-data <user-data>]
                               [--description <description>] [--availability-zone <zone-name>] [--host <host>]
                               [--hypervisor-hostname <hypervisor-hostname>] [--server-group <server-group>]
                               [--hint <key=value>]
                               [--use-config-drive | --no-config-drive | --config-drive <config-drive-volume>|True]
                               [--min <count>] [--max <count>] [--tag <tag>] [--hostname <hostname>] [--wait]
                               [--trusted-image-cert <trusted-cert-id>]
                               <server-name>
openstack server create: error: argument --network: Invalid argument 6adea907-730d-4318-98d5-1908d2d013fc,; characters ',' and '=' are not allowed
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create   --flavor m1.tiny   --network 6adea907-730d-4318-98d5-1908d2d013fc    --boot-from-volume 5   --image "ubuntu"   ceph-vm-1
No Network found for 6adea907-730d-4318-98d5-1908d2d013fc
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack subnet show 6adea907-730d-4318-98d5-1908d2d013fc -c network_id -c name -f yaml
name: private-subnet
network_id: af7ee1c4-02c6-438b-8784-93690f664a47
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server create \
  --flavor m1.tiny \
  --network private \
  --boot-from-volume 5 \
  --image ubuntu \
  ceph-vm-1
+-------------------------------------+-----------------------------------------------------------------------------+
| Field                               | Value                                                                       |
+-------------------------------------+-----------------------------------------------------------------------------+
| OS-DCF:diskConfig                   | MANUAL                                                                      |
| OS-EXT-AZ:availability_zone         | None                                                                        |
| OS-EXT-SRV-ATTR:host                | None                                                                        |
| OS-EXT-SRV-ATTR:hostname            | ceph-vm-1                                                                   |
| OS-EXT-SRV-ATTR:hypervisor_hostname | None                                                                        |
| OS-EXT-SRV-ATTR:instance_name       | None                                                                        |
| OS-EXT-SRV-ATTR:kernel_id           | None                                                                        |
| OS-EXT-SRV-ATTR:launch_index        | None                                                                        |
| OS-EXT-SRV-ATTR:ramdisk_id          | None                                                                        |
| OS-EXT-SRV-ATTR:reservation_id      | r-2n00lvjf                                                                  |
| OS-EXT-SRV-ATTR:root_device_name    | None                                                                        |
| OS-EXT-SRV-ATTR:user_data           | None                                                                        |
| OS-EXT-STS:power_state              | N/A                                                                         |
| OS-EXT-STS:task_state               | scheduling                                                                  |
| OS-EXT-STS:vm_state                 | building                                                                    |
| OS-SRV-USG:launched_at              | None                                                                        |
| OS-SRV-USG:terminated_at            | None                                                                        |
| accessIPv4                          | None                                                                        |
| accessIPv6                          | None                                                                        |
| addresses                           | N/A                                                                         |
| adminPass                           | bNzUSivtqC2a                                                                |
| config_drive                        | None                                                                        |
| created                             | 2026-01-31T19:36:38Z                                                        |
| description                         | None                                                                        |
| flavor                              | description=, disk='1', ephemeral='0', extra_specs.hw_rng:allowed='True',   |
|                                     | id='m1.tiny', is_disabled=, is_public='True', location=, name='m1.tiny',    |
|                                     | original_name='m1.tiny', ram='512', rxtx_factor=, swap='0', vcpus='1'       |
| hostId                              | None                                                                        |
| host_status                         | None                                                                        |
| id                                  | a854d59a-25b5-4103-a0ac-62aa14105877                                        |
| image                               | N/A (booted from volume)                                                    |
| key_name                            | None                                                                        |
| locked                              | None                                                                        |
| locked_reason                       | None                                                                        |
| name                                | ceph-vm-1                                                                   |
| pinned_availability_zone            | None                                                                        |
| progress                            | None                                                                        |
| project_id                          | 9fb44e4466264364b4ac3eb936bdc4c2                                            |
| properties                          | None                                                                        |
| scheduler_hints                     |                                                                             |
| security_groups                     | name='default'                                                              |
| server_groups                       | None                                                                        |
| status                              | BUILD                                                                       |
| tags                                |                                                                             |
| trusted_image_certificates          | None                                                                        |
| updated                             | 2026-01-31T19:36:38Z                                                        |
| user_id                             | 09805ebaab704a8cbf99fdc8a0c1859d                                            |
| volumes_attached                    |                                                                             |
+-------------------------------------+-----------------------------------------------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1 \
  -c status \
  -c OS-EXT-STS:vm_state \
  -c OS-EXT-STS:task_state
+-----------------------+----------------------+
| Field                 | Value                |
+-----------------------+----------------------+
| OS-EXT-STS:task_state | block_device_mapping |
| OS-EXT-STS:vm_state   | building             |
| status                | BUILD                |
+-----------------------+----------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1   -c status   -c OS-EXT-STS:vm_state   -c OS-EXT-STS:task_state
+-----------------------+----------------------+
| Field                 | Value                |
+-----------------------+----------------------+
| OS-EXT-STS:task_state | block_device_mapping |
| OS-EXT-STS:vm_state   | building             |
| status                | BUILD                |
+-----------------------+----------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1   -c status   -c OS-EXT-STS:vm_state   -c OS-EXT-STS:task_state
+-----------------------+--------+
| Field                 | Value  |
+-----------------------+--------+
| OS-EXT-STS:task_state | None   |
| OS-EXT-STS:vm_state   | active |
| status                | ACTIVE |
+-----------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack server show ceph-vm-1   -c status   -c OS-EXT-STS:vm_state   -c OS-EXT-STS:task_state
+-----------------------+--------+
| Field                 | Value  |
+-----------------------+--------+
| OS-EXT-STS:task_state | None   |
| OS-EXT-STS:vm_state   | active |
| status                | ACTIVE |
+-----------------------+--------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ openstack volume list
+--------------------------------------+------+--------+------+------------------------------------+
| ID                                   | Name | Status | Size | Attached to                        |
+--------------------------------------+------+--------+------+------------------------------------+
| 5f2f64e1-6b28-41bf-88b2-e17204dbfbb0 |      | in-use |    5 | Attached to ceph-vm-1 on /dev/vda  |
+--------------------------------------+------+--------+------+------------------------------------+
ubuntu@gelani-lab-1:/opt/stack/devstack$ VOL_ID=$(openstack volume list -f value -c ID)
sudo rbd -p volume ls | grep $VOL_ID
volume-5f2f64e1-6b28-41bf-88b2-e17204dbfbb0
ubuntu@gelani-lab-1:/opt/stack/devstack$ sudo ls /var/lib/nova/instances
ls: cannot access '/var/lib/nova/instances': No such file or directory
ubuntu@gelani-lab-1:/opt/stack/devstack$ 


`` 
