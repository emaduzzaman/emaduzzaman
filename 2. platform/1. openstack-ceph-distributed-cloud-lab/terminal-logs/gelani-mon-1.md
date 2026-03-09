# Quick-System-Check

```
ubuntu@gelani-mon-1:~$ sudo apt update && sudo apt upgrade -y
Hit:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]
Fetched 384 kB in 32s (12.2 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
Get another security update through Ubuntu Pro with 'esm-apps' enabled:
  containerd
Learn more about Ubuntu Pro at https://ubuntu.com/pro
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-mon-1:~$ ceph -s
2026-02-15T06:25:34.593+0000 7f6836896640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-15T06:25:34.593+0000 7f6836896640 -1 AuthRegistry(0x7f68300645b8) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-15T06:25:34.593+0000 7f6836896640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-15T06:25:34.593+0000 7f6836896640 -1 AuthRegistry(0x7f6836894f80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-15T06:25:34.593+0000 7f682ffff640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T06:25:34.597+0000 7f682f7fe640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T06:25:34.601+0000 7f6834e33640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T06:25:34.601+0000 7f6836896640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 13] RADOS permission denied (error connecting to the cluster)
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 20h)
    mgr: gelani-mon-1.gzltah(active, since 20h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 2w), 6 in (since 2w)
    rgw: 2 daemons active (2 hosts, 1 zones)

  data:
    pools:   17 pools, 465 pgs
    objects: 936 objects, 2.5 GiB
    usage:   10 GiB used, 170 GiB / 180 GiB avail
    pgs:     465 active+clean

ubuntu@gelani-mon-1:~$ sudo -s
root@gelani-mon-1:/home/ubuntu# ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK

  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 20h)
    mgr: gelani-mon-1.gzltah(active, since 20h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 2w), 6 in (since 2w)
    rgw: 2 daemons active (2 hosts, 1 zones)

  data:
    pools:   17 pools, 465 pgs
    objects: 936 objects, 2.5 GiB
    usage:   10 GiB used, 170 GiB / 180 GiB avail
    pgs:     465 active+clean

root@gelani-mon-1:/home/ubuntu# ceph health detail
HEALTH_OK
root@gelani-mon-1:/home/ubuntu# ceph versions
{
    "mon": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 3
    },
    "mgr": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 3
    },
    "osd": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 6
    },
    "rgw": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 2
    },
    "overall": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 14
    }
}
root@gelani-mon-1:/home/ubuntu# ceph osd lspools
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
root@gelani-mon-1:/home/ubuntu# ceph osd pool ls detail
pool 1 '.mgr' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 1 pgp_num 1 autoscale_mode on last_change 140 flags hashpspool stripe_width 0 pg_num_max 32 pg_num_min 1 application mgr
pool 2 'volume' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 296 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 3 'images' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 320 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 4 'vms' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 146 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 5 'backups' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 148 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 6 'rgw.meta' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 150 flags hashpspool stripe_width 0 application rgw
pool 7 'rgw.control' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 152 flags hashpspool stripe_width 0 application rgw
pool 8 'rgw.log' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 154 flags hashpspool stripe_width 0 application rgw
pool 9 'rgw.buckets.data' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 64 pgp_num 64 autoscale_mode on last_change 156 flags hashpspool stripe_width 0 application rgw
pool 10 'rgw.buckets.index' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 158 flags hashpspool stripe_width 0 application rgw
pool 11 '.rgw.root' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/98 flags hashpspool stripe_width 0 application rgw
pool 12 'gelani-zone.rgw.log' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 288 lfor 0/0/106 flags hashpspool stripe_width 0 application rgw
pool 13 'gelani-zone.rgw.control' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/108 flags hashpspool stripe_width 0 application rgw
pool 14 'gelani-zone.rgw.meta' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/108 flags hashpspool stripe_width 0 pg_autoscale_bias 4 application rgw
pool 15 'gelani-zone.rgw.buckets.index' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/117 flags hashpspool stripe_width 0 pg_autoscale_bias 4 application rgw
pool 16 'gelani-zone.rgw.buckets.data' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 288 lfor 0/0/119 flags hashpspool stripe_width 0 application rgw
pool 17 'gelani-zone.rgw.buckets.non-ec' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/125 flags hashpspool stripe_width 0 application rgw

root@gelani-mon-1:/home/ubuntu# rbd pool ls
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
root@gelani-mon-1:/home/ubuntu# rbd ls -p images
root@gelani-mon-1:/home/ubuntu# rbd ls -p volumes
rbd: error opening pool 'volumes': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd ls -p vms
\root@gelani-mon-1:/home/ubuntu# rbd ls -p vm
rbd: error opening pool 'vm': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd ls -p volume
volume-116739e7-d1a7-408b-ba83-3ccda377cefa
volume-ca6c402b-4f70-4d5e-87cd-160b352722a9
root@gelani-mon-1:/home/ubuntu# rbd ls -p image
rbd: error opening pool 'image': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd du -p images
root@gelani-mon-1:/home/ubuntu# rbd du -p image
rbd: error opening pool 'image': (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd du -p volume
NAME                                         PROVISIONED  USED
volume-116739e7-d1a7-408b-ba83-3ccda377cefa       20 GiB  1.8 GiB
volume-ca6c402b-4f70-4d5e-87cd-160b352722a9        2 GiB  140 MiB
<TOTAL>                                           22 GiB  1.9 GiB
root@gelani-mon-1:/home/ubuntu# rbd du -p volumes
rbd: error opening pool 'volumes': (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd du -p vms
root@gelani-mon-1:/home/ubuntu# rbd du -p vm
rbd: error opening pool 'vm': (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# ceph auth list | egrep -n "client\.cinder|client\.glance|client\.nova|client\.openstack|caps" -n
3:      caps: [mgr] allow profile osd
4:      caps: [mon] allow profile osd
5:      caps: [osd] allow *
8:      caps: [mgr] allow profile osd
9:      caps: [mon] allow profile osd
10:     caps: [osd] allow *
13:     caps: [mgr] allow profile osd
14:     caps: [mon] allow profile osd
15:     caps: [osd] allow *
18:     caps: [mgr] allow profile osd
19:     caps: [mon] allow profile osd
20:     caps: [osd] allow *
23:     caps: [mgr] allow profile osd
24:     caps: [mon] allow profile osd
25:     caps: [osd] allow *
28:     caps: [mgr] allow profile osd
29:     caps: [mon] allow profile osd
30:     caps: [osd] allow *
33:     caps: [mds] allow *
34:     caps: [mgr] allow *
35:     caps: [mon] allow *
36:     caps: [osd] allow *
39:     caps: [mon] allow profile bootstrap-mds
42:     caps: [mon] allow profile bootstrap-mgr
45:     caps: [mon] allow profile bootstrap-osd
48:     caps: [mon] allow profile bootstrap-rbd
51:     caps: [mon] allow profile bootstrap-rbd-mirror
54:     caps: [mon] allow profile bootstrap-rgw
55:client.cinder
57:     caps: [mon] profile rbd
58:     caps: [osd] profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images
61:     caps: [mgr] profile crash
62:     caps: [mon] profile crash
65:     caps: [mgr] profile crash
66:     caps: [mon] profile crash
69:     caps: [mgr] profile crash
70:     caps: [mon] profile crash
73:     caps: [mgr] profile crash
74:     caps: [mon] profile crash
77:     caps: [mgr] profile crash
78:     caps: [mon] profile crash
79:client.glance
81:     caps: [mon] profile rbd
82:     caps: [osd] profile rbd pool=images
83:client.nova
85:     caps: [mon] profile rbd
86:     caps: [osd] profile rbd pool=vms
89:     caps: [mgr] allow rw
90:     caps: [mon] allow *
91:     caps: [osd] allow rwx tag rgw *=*
94:     caps: [mgr] allow rw
95:     caps: [mon] allow *
96:     caps: [osd] allow rwx tag rgw *=*
99:     caps: [mds] allow *
100:    caps: [mon] profile mgr
101:    caps: [osd] allow *
104:    caps: [mds] allow *
105:    caps: [mon] profile mgr
106:    caps: [osd] allow *
109:    caps: [mds] allow *
110:    caps: [mon] profile mgr
111:    caps: [osd] allow *
root@gelani-mon-1:/home/ubuntu#

ubuntu@gelani-mon-1:~$ sudo apt update && sudo apt upgrade -y
Hit:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy InRelease                    
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-updates InRelease [128 kB]   
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu jammy-backports InRelease [127 kB]
Get:4 http://security.ubuntu.com/ubuntu jammy-security InRelease [129 kB]                                                                                                                                                                  
Fetched 384 kB in 32s (12.2 kB/s)                      
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Calculating upgrade... Done
Get another security update through Ubuntu Pro with 'esm-apps' enabled:
  containerd
Learn more about Ubuntu Pro at https://ubuntu.com/pro
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-mon-1:~$ ceph -s
2026-02-15T06:25:34.593+0000 7f6836896640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-15T06:25:34.593+0000 7f6836896640 -1 AuthRegistry(0x7f68300645b8) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-15T06:25:34.593+0000 7f6836896640 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-15T06:25:34.593+0000 7f6836896640 -1 AuthRegistry(0x7f6836894f80) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-15T06:25:34.593+0000 7f682ffff640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T06:25:34.597+0000 7f682f7fe640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T06:25:34.601+0000 7f6834e33640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T06:25:34.601+0000 7f6836896640 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

[errno 13] RADOS permission denied (error connecting to the cluster)
ubuntu@gelani-mon-1:~$ sudo ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 20h)
    mgr: gelani-mon-1.gzltah(active, since 20h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 2w), 6 in (since 2w)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 936 objects, 2.5 GiB
    usage:   10 GiB used, 170 GiB / 180 GiB avail
    pgs:     465 active+clean
 
ubuntu@gelani-mon-1:~$ sudo -s
root@gelani-mon-1:/home/ubuntu# ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 20h)
    mgr: gelani-mon-1.gzltah(active, since 20h), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 2w), 6 in (since 2w)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 936 objects, 2.5 GiB
    usage:   10 GiB used, 170 GiB / 180 GiB avail
    pgs:     465 active+clean
 
root@gelani-mon-1:/home/ubuntu# ceph health detail
HEALTH_OK
root@gelani-mon-1:/home/ubuntu# ceph versions
{
    "mon": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 3
    },
    "mgr": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 3
    },
    "osd": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 6
    },
    "rgw": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 2
    },
    "overall": {
        "ceph version 17.2.8 (f817ceb7f187defb1d021d6328fa833eb8e943b3) quincy (stable)": 14
    }
}
root@gelani-mon-1:/home/ubuntu# ceph osd lspools
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
root@gelani-mon-1:/home/ubuntu# ceph osd pool ls detail
pool 1 '.mgr' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 1 pgp_num 1 autoscale_mode on last_change 140 flags hashpspool stripe_width 0 pg_num_max 32 pg_num_min 1 application mgr
pool 2 'volume' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 296 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 3 'images' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 320 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 4 'vms' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 146 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 5 'backups' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 148 flags hashpspool,selfmanaged_snaps stripe_width 0 application rbd
pool 6 'rgw.meta' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 150 flags hashpspool stripe_width 0 application rgw
pool 7 'rgw.control' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 152 flags hashpspool stripe_width 0 application rgw
pool 8 'rgw.log' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 16 pgp_num 16 autoscale_mode on last_change 154 flags hashpspool stripe_width 0 application rgw
pool 9 'rgw.buckets.data' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 64 pgp_num 64 autoscale_mode on last_change 156 flags hashpspool stripe_width 0 application rgw
pool 10 'rgw.buckets.index' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 158 flags hashpspool stripe_width 0 application rgw
pool 11 '.rgw.root' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/98 flags hashpspool stripe_width 0 application rgw
pool 12 'gelani-zone.rgw.log' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 288 lfor 0/0/106 flags hashpspool stripe_width 0 application rgw
pool 13 'gelani-zone.rgw.control' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/108 flags hashpspool stripe_width 0 application rgw
pool 14 'gelani-zone.rgw.meta' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/108 flags hashpspool stripe_width 0 pg_autoscale_bias 4 application rgw
pool 15 'gelani-zone.rgw.buckets.index' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/117 flags hashpspool stripe_width 0 pg_autoscale_bias 4 application rgw
pool 16 'gelani-zone.rgw.buckets.data' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 288 lfor 0/0/119 flags hashpspool stripe_width 0 application rgw
pool 17 'gelani-zone.rgw.buckets.non-ec' replicated size 2 min_size 1 crush_rule 0 object_hash rjenkins pg_num 32 pgp_num 32 autoscale_mode on last_change 173 lfor 0/0/125 flags hashpspool stripe_width 0 application rgw

root@gelani-mon-1:/home/ubuntu# rbd pool ls
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
root@gelani-mon-1:/home/ubuntu# rbd ls -p images
root@gelani-mon-1:/home/ubuntu# rbd ls -p volumes
rbd: error opening pool 'volumes': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd ls -p vms
\root@gelani-mon-1:/home/ubuntu# rbd ls -p vm
rbd: error opening pool 'vm': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd ls -p volume
volume-116739e7-d1a7-408b-ba83-3ccda377cefa
volume-ca6c402b-4f70-4d5e-87cd-160b352722a9
root@gelani-mon-1:/home/ubuntu# rbd ls -p image
rbd: error opening pool 'image': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd du -p images
root@gelani-mon-1:/home/ubuntu# rbd du -p image
rbd: error opening pool 'image': (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd du -p volume
NAME                                         PROVISIONED  USED   
volume-116739e7-d1a7-408b-ba83-3ccda377cefa       20 GiB  1.8 GiB
volume-ca6c402b-4f70-4d5e-87cd-160b352722a9        2 GiB  140 MiB
<TOTAL>                                           22 GiB  1.9 GiB
root@gelani-mon-1:/home/ubuntu# rbd du -p volumes
rbd: error opening pool 'volumes': (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# rbd du -p vms
root@gelani-mon-1:/home/ubuntu# rbd du -p vm
rbd: error opening pool 'vm': (2) No such file or directory
root@gelani-mon-1:/home/ubuntu# ceph auth list | egrep -n "client\.cinder|client\.glance|client\.nova|client\.openstack|caps" -n
3:      caps: [mgr] allow profile osd
4:      caps: [mon] allow profile osd
5:      caps: [osd] allow *
8:      caps: [mgr] allow profile osd
9:      caps: [mon] allow profile osd
10:     caps: [osd] allow *
13:     caps: [mgr] allow profile osd
14:     caps: [mon] allow profile osd
15:     caps: [osd] allow *
18:     caps: [mgr] allow profile osd
19:     caps: [mon] allow profile osd
20:     caps: [osd] allow *
23:     caps: [mgr] allow profile osd
24:     caps: [mon] allow profile osd
25:     caps: [osd] allow *
28:     caps: [mgr] allow profile osd
29:     caps: [mon] allow profile osd
30:     caps: [osd] allow *
33:     caps: [mds] allow *
34:     caps: [mgr] allow *
35:     caps: [mon] allow *
36:     caps: [osd] allow *
39:     caps: [mon] allow profile bootstrap-mds
42:     caps: [mon] allow profile bootstrap-mgr
45:     caps: [mon] allow profile bootstrap-osd
48:     caps: [mon] allow profile bootstrap-rbd
51:     caps: [mon] allow profile bootstrap-rbd-mirror
54:     caps: [mon] allow profile bootstrap-rgw
55:client.cinder
57:     caps: [mon] profile rbd
58:     caps: [osd] profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images
61:     caps: [mgr] profile crash
62:     caps: [mon] profile crash
65:     caps: [mgr] profile crash
66:     caps: [mon] profile crash
69:     caps: [mgr] profile crash
70:     caps: [mon] profile crash
73:     caps: [mgr] profile crash
74:     caps: [mon] profile crash
77:     caps: [mgr] profile crash
78:     caps: [mon] profile crash
79:client.glance
81:     caps: [mon] profile rbd
82:     caps: [osd] profile rbd pool=images
83:client.nova
85:     caps: [mon] profile rbd
86:     caps: [osd] profile rbd pool=vms
89:     caps: [mgr] allow rw
90:     caps: [mon] allow *
91:     caps: [osd] allow rwx tag rgw *=*
94:     caps: [mgr] allow rw
95:     caps: [mon] allow *
96:     caps: [osd] allow rwx tag rgw *=*
99:     caps: [mds] allow *
100:    caps: [mon] profile mgr
101:    caps: [osd] allow *
104:    caps: [mds] allow *
105:    caps: [mon] profile mgr
106:    caps: [osd] allow *
109:    caps: [mds] allow *
110:    caps: [mon] profile mgr
111:    caps: [osd] allow *
root@gelani-mon-1:/home/ubuntu# ceph osd lspools
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
root@gelani-mon-1:/home/ubuntu# ceph osd pool ls
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
root@gelani-mon-1:/home/ubuntu# rados lspools
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
root@gelani-mon-1:/home/ubuntu# rbd ls -p images --format json 2>/dev/null || rbd ls -p images
[]
root@gelani-mon-1:/home/ubuntu# rbd namespace ls -p images
root@gelani-mon-1:/home/ubuntu# rbd trash ls -p images
root@gelani-mon-1:/home/ubuntu#  sudo rdb ls -p image
sudo: rdb: command not found
root@gelani-mon-1:/home/ubuntu# rdb trash ls -p images
Command 'rdb' not found, but there are 24 similar ones.
root@gelani-mon-1:/home/ubuntu# rbd ls -p images
root@gelani-mon-1:/home/ubuntu# exit
exit
ubuntu@gelani-mon-1:~$ rbd ls -p images
2026-02-15T07:23:39.948+0000 7fe11d2b64c0 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-15T07:23:39.948+0000 7fe11d2b64c0 -1 AuthRegistry(0x555ecd024f18) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-15T07:23:39.948+0000 7fe11d2b64c0 -1 auth: unable to find a keyring on /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin: (2) No such file or directory

2026-02-15T07:23:39.948+0000 7fe11d2b64c0 -1 AuthRegistry(0x7ffc3d062a30) no keyring found at /etc/ceph/ceph.client.admin.keyring,/etc/ceph/ceph.keyring,/etc/ceph/keyring,/etc/ceph/keyring.bin, disabling cephx

2026-02-15T07:23:39.952+0000 7fe11bde9640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T07:23:39.952+0000 7fe11b5e8640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T07:23:39.952+0000 7fe11d04b640 -1 monclient(hunting): handle_auth_bad_method server allowed_methods [2] but i only support [1]

2026-02-15T07:23:39.952+0000 7fe11d2b64c0 -1 monclient: authenticate NOTE: no keyring found; disabled cephx authentication

rbd: couldn't connect to the cluster!
rbd: listing images failed: (13) Permission denied
ubuntu@gelani-mon-1:~$ sudo rbd ls -p images
ubuntu@gelani-mon-1:~$ ls -lh /opt/stack/data/glance/images/
ls: cannot access '/opt/stack/data/glance/images/': No such file or directory
ubuntu@gelani-mon-1:~$ sudo ls -lh /opt/stack/data/glance/images/
ls: cannot access '/opt/stack/data/glance/images/': No such file or directory
ubuntu@gelani-mon-1:~$ sudo rbd ls -p volumes
rbd: error opening pool 'volumes': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
ubuntu@gelani-mon-1:~$ sudo rbd ls -p volumes
rbd: error opening pool 'volumes': (2) No such file or directory
rbd: listing images failed: (2) No such file or directory
ubuntu@gelani-mon-1:~$ 






```

# clening and checking 

```

ubuntu@gelani-mon-1:~$ sudo bash
root@gelani-mon-1:/home/ubuntu# rbd ls -p volume
root@gelani-mon-1:/home/ubuntu# rbd ls -p volume
rbd ls -p images
rbd ls -p vms
rbd trash ls -p volume
rbd trash ls -p images
rbd trash ls -p vms
root@gelani-mon-1:/home/ubuntu# rbd trash purge -p volume --yes-i-really-mean-it
rbd trash purge -p images --yes-i-really-mean-it
rbd trash purge -p vms --yes-i-really-mean-it
rbd: unrecognised option '--yes-i-really-mean-it'
rbd: unrecognised option '--yes-i-really-mean-it'
rbd: unrecognised option '--yes-i-really-mean-it'
root@gelani-mon-1:/home/ubuntu# ceph -s
ceph osd pool ls
rbd ls -p volume
rbd ls -p images
rbd ls -p vms
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 2d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 2w), 6 in (since 2w)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 434 objects, 657 MiB
    usage:   8.5 GiB used, 172 GiB / 180 GiB avail
    pgs:     465 active+clean
 
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
root@gelani-mon-1:/home/ubuntu# ceph -s
rbd ls -p volume
rbd ls -p images
rbd ls -p vms
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 2d)
    mgr: gelani-mon-1.gzltah(active, since 2d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 2w), 6 in (since 2w)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 434 objects, 657 MiB
    usage:   8.5 GiB used, 172 GiB / 180 GiB avail
    pgs:     465 active+clean
 
root@gelani-mon-1:/home/ubuntu#



root@gelani-mon-1:/home/ubuntu# rbd ls -p volume
rbd ls -p images
rbd ls -p vms
root@gelani-mon-1:/home/ubuntu# 

```


# Reconnect The ceph since unpacked and repacked the devstack in the gelani-lab-1

```

ubuntu@gelani-mon-1:~$ sudo bash
root@gelani-mon-1:/home/ubuntu# ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 7d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3w), 6 in (since 3w)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 5.50k objects, 21 GiB
    usage:   49 GiB used, 131 GiB / 180 GiB avail
    pgs:     465 active+clean
 
root@gelani-mon-1:/home/ubuntu# scp /etc/ceph/ceph.conf ubuntu@gelani-lab-1:/tmp/
The authenticity of host 'gelani-lab-1 (192.168.95.23)' can't be established.
ED25519 key fingerprint is SHA256:ComoZV7NIRxvTh1iEYI3FkL/TbKLTtYPkRYMKdVLW3Q.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'gelani-lab-1' (ED25519) to the list of known hosts.
ubuntu@gelani-lab-1's password: 
ceph.conf                                                                                                                                                                                                 100%  281   771.6KB/s   00:00    
root@gelani-mon-1:/home/ubuntu# scp /etc/ceph/ceph.client.cinder.keyring ubuntu@gelani-lab-1:/tmp/
ubuntu@gelani-lab-1's password: 
ceph.client.cinder.keyring                                                                                                                                                                                100%   64    31.2KB/s   00:00    
root@gelani-mon-1:/home/ubuntu# 

root@gelani-mon-1:/home/ubuntu# ceph -s
  cluster:
    id:     a9625cff-fc0e-11f0-a1f6-6998182b0a5e
    health: HEALTH_OK
 
  services:
    mon: 3 daemons, quorum gelani-mon-1,gelani-mon-2,gelani-mon-3 (age 3d)
    mgr: gelani-mon-1.gzltah(active, since 7d), standbys: gelani-mon-2.qkfion, gelani-mon-3.scuoto
    osd: 6 osds: 6 up (since 3w), 6 in (since 3w)
    rgw: 2 daemons active (2 hosts, 1 zones)
 
  data:
    pools:   17 pools, 465 pgs
    objects: 5.50k objects, 21 GiB
    usage:   49 GiB used, 131 GiB / 180 GiB avail
    pgs:     465 active+clean
 
  io:
    client:   8.0 KiB/s rd, 0 B/s wr, 7 op/s rd, 5 op/s wr
 
root@gelani-mon-1:/home/ubuntu# osd pools
Command 'osd' not found, did you mean:
  command 'osm' from snap osmclient (v11.0.0rc1-32-g6b9ac93)
  command 'lsd' from snap lsd (0.16.0)
  command 'os8' from deb os8 (2.1-7)
  command 'ost' from deb openstructure (2.3.1-2build1)
  command 'nsd' from deb nsd (4.3.9-1)
  command 'osx' from deb opensp (1.5.2-13ubuntu3)
  command 'osc' from deb osc (0.169.1-1)
  command 'gsd' from deb python3-gsd (2.5.1-1build1)
  command 'od' from deb coreutils (8.32-4.1ubuntu1.2)
  command 'psd' from deb profile-sync-daemon (6.34-1)
  command 'osh' from deb omake (0.10.3-2.1)
  command 'xsd' from deb mono-devel (6.8.0.105+dfsg-3.2)
See 'snap info <snapname>' for additional versions.
root@gelani-mon-1:/home/ubuntu# ceph osd lspools
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
root@gelani-mon-1:/home/ubuntu# ceph auth get-or-create client.glance \
  mon 'profile rbd' \
  osd 'profile rbd pool=images' \
  -o /tmp/ceph.client.glance.keyring
root@gelani-mon-1:/home/ubuntu# ceph auth get-or-create client.glance \
  mon 'profile rbd' \
  osd 'profile rbd pool=images' \
  -o /tmp/ceph.client.glance.keyring
root@gelani-mon-1:/home/ubuntu# ceph auth get-or-create client.cinder \
  mon 'profile rbd' \
  osd 'profile rbd pool=volume, profile rbd pool=vms, profile rbd pool=backups, profile rbd pool=images' \
  -o /tmp/ceph.client.cinder.keyring
root@gelani-mon-1:/home/ubuntu# scp /etc/ceph/ceph.conf ubuntu@192.168.95.23:/tmp/
scp /tmp/ceph.client.glance.keyring ubuntu@192.168.95.23:/tmp/
scp /tmp/ceph.client.cinder.keyring ubuntu@192.168.95.23:/tmp/
scp /tmp/ceph.client.nova.keyring ubuntu@192.168.95.23:/tmp/
The authenticity of host '192.168.95.23 (192.168.95.23)' can't be established.
ED25519 key fingerprint is SHA256:ComoZV7NIRxvTh1iEYI3FkL/TbKLTtYPkRYMKdVLW3Q.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:17: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.95.23' (ED25519) to the list of known hosts.
ubuntu@192.168.95.23's password: 
ceph.conf                                                                                                                                                                                                 100%  281   622.4KB/s   00:00    
ubuntu@192.168.95.23's password: 
ceph.client.glance.keyring                                                                                                                                                                                100%   64   149.0KB/s   00:00    
ubuntu@192.168.95.23's password: 
ceph.client.cinder.keyring                                                                                                                                                                                100%   64   174.3KB/s   00:00    
ubuntu@192.168.95.23's password: 
/tmp/ceph.client.nova.keyring: No such file or directory
root@gelani-mon-1:/home/ubuntu# scp /etc/ceph/ceph.conf ubuntu@192.168.95.23:/tmp/
scp /tmp/ceph.client.glance.keyring ubuntu@192.168.95.23:/tmp/
scp /tmp/ceph.client.cinder.keyring ubuntu@192.168.95.23:/tmp/
scp /tmp/ceph.client.nova.keyring ubuntu@192.168.95.23:/tmp/
ubuntu@192.168.95.23's password: 
ceph.conf                                                                                                                                                                                                 100%  281   521.3KB/s   00:00    
ubuntu@192.168.95.23's password: 
ceph.client.glance.keyring                                                                                                                                                                                100%   64   115.7KB/s   00:00    
ubuntu@192.168.95.23's password: 
ceph.client.cinder.keyring                                                                                                                                                                                100%   64   187.1KB/s   00:00    
ubuntu@192.168.95.23's password: 
Permission denied, please try again.
ubuntu@192.168.95.23's password: 
/tmp/ceph.client.nova.keyring: No such file or directory
root@gelani-mon-1:/home/ubuntu# ceph auth get-or-create client.nova \
  mon 'profile rbd' \
  osd 'profile rbd pool=vms' \
  -o /tmp/ceph.client.nova.keyring
root@gelani-mon-1:/home/ubuntu# scp /tmp/ceph.client.nova.keyring ubuntu@192.168.95.23:/tmp/
ubuntu@192.168.95.23's password: 
ceph.client.nova.keyring                                                                                                                                                                                  100%   62   160.1KB/s   00:00    
root@gelani-mon-1:/home/ubuntu# scp /etc/ceph/ceph.conf \
    /tmp/ceph.client.glance.keyring \
    /tmp/ceph.client.cinder.keyring \
    /tmp/ceph.client.nova.keyring \
    ubuntu@192.168.95.23:/tmp/
ubuntu@192.168.95.23's password: 
ceph.conf                                                                                                                                                                                                 100%  281   778.9KB/s   00:00    
ceph.client.glance.keyring                                                                                                                                                                                100%   64   147.6KB/s   00:00    
ceph.client.cinder.keyring                                                                                                                                                                                100%   64   276.1KB/s   00:00    
ceph.client.nova.keyring                                                                                                                                                                                  100%   62   275.9KB/s   00:00    
root@gelani-mon-1:/home/ubuntu# client_loop: send disconnect: Broken pipe
emaduzzaman@emaduzzaman:~$ 

```

# just find out that glance is not using the ceph 
```
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ openstack image list
+--------------------------------------+-----------+--------+
| ID                                   | Name      | Status |
+--------------------------------------+-----------+--------+
| 56c0dd01-e45d-4553-ae2e-bc70cf7649be | debian-11 | active |
| 2c3f0e5f-e4c8-44f4-8ba5-e5bfce4a309d | debian-12 | active |
| d44beed8-7a00-4def-a329-42722a9009a9 | ubuntu-18 | active |
| e179fe93-50cb-43cc-9168-d76bc9ff1cc8 | ubuntu-20 | active |
| bd264126-237a-42a8-ad6a-c7816f2f1b20 | ubuntu-22 | active |
| e551c9db-7916-47d3-bbdd-f32d85e62a38 | ubuntu-24 | active |
+--------------------------------------+-----------+--------+

ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ rbd ls images
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 


ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ rbd ls volume
volume-135f0242-3e1a-499b-82eb-e0fe34b3fdb9
volume-1bfd1843-99e1-4837-bc00-7a7dcb7c0f58
volume-5f1a8f8e-8fbf-46eb-9e1a-9b420f59f978
volume-99d5a4f4-b819-4a00-8d4b-606723941e9e
volume-cf00317e-ee4c-4a6c-939a-cd7ff8b57cf7
volume-f9496107-fa67-4f03-afdc-e86851d3fac7


ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ openstack volume list
+--------------------------------------+-----------+-----------+------+-------------+
| ID                                   | Name      | Status    | Size | Attached to |
+--------------------------------------+-----------+-----------+------+-------------+
| 135f0242-3e1a-499b-82eb-e0fe34b3fdb9 | debian-12 | available |   15 |             |
| 99d5a4f4-b819-4a00-8d4b-606723941e9e | debian-11 | available |   15 |             |
| f9496107-fa67-4f03-afdc-e86851d3fac7 | ubuntu-24 | available |   15 |             |
| cf00317e-ee4c-4a6c-939a-cd7ff8b57cf7 | ubuntu-18 | available |   15 |             |
| 5f1a8f8e-8fbf-46eb-9e1a-9b420f59f978 | ubuntu-20 | available |   15 |             |
| 1bfd1843-99e1-4837-bc00-7a7dcb7c0f58 | ubuntu-22 | available |   15 |             |
+--------------------------------------+-----------+-----------+------+-------------+
```
# Also nova is not using the ceph
```
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ openstack server list
+--------------------------------------+------+--------+---------------------------------------------------------+--------------------------+----------+
| ID                                   | Name | Status | Networks                                                | Image                    | Flavor   |
+--------------------------------------+------+--------+---------------------------------------------------------+--------------------------+----------+
| 9e09121f-b3fd-4552-b2ac-88c568b3cde2 | vm   | ACTIVE | private=10.0.0.61, fd26:c403:304a:0:f816:3eff:fe4d:da7b | N/A (booted from volume) | m1.small |
+--------------------------------------+------+--------+---------------------------------------------------------+--------------------------+----------+


ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ rbd ls vms
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ 
```

# But Cinder is using the ceph perfectly
```
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ rbd ls volume
volume-135f0242-3e1a-499b-82eb-e0fe34b3fdb9
volume-1bfd1843-99e1-4837-bc00-7a7dcb7c0f58
volume-5f1a8f8e-8fbf-46eb-9e1a-9b420f59f978
volume-99d5a4f4-b819-4a00-8d4b-606723941e9e
volume-cf00317e-ee4c-4a6c-939a-cd7ff8b57cf7
volume-f9496107-fa67-4f03-afdc-e86851d3fac7
ubuntu@gelani-lab-1:/opt/stack/data/glance/images$ openstack volume list
+--------------------------------------+-----------+-----------+------+-------------+
| ID                                   | Name      | Status    | Size | Attached to |
+--------------------------------------+-----------+-----------+------+-------------+
| 135f0242-3e1a-499b-82eb-e0fe34b3fdb9 | debian-12 | available |   15 |             |
| 99d5a4f4-b819-4a00-8d4b-606723941e9e | debian-11 | available |   15 |             |
| f9496107-fa67-4f03-afdc-e86851d3fac7 | ubuntu-24 | available |   15 |             |
| cf00317e-ee4c-4a6c-939a-cd7ff8b57cf7 | ubuntu-18 | available |   15 |             |
| 5f1a8f8e-8fbf-46eb-9e1a-9b420f59f978 | ubuntu-20 | available |   15 |             |
| 1bfd1843-99e1-4837-bc00-7a7dcb7c0f58 | ubuntu-22 | available |   15 |             |
+--------------------------------------+-----------+-----------+------+-------------+
```


