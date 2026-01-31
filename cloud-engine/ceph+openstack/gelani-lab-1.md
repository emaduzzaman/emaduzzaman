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
`` 
