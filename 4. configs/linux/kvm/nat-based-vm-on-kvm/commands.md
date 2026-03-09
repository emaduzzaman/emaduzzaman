```

    1  clear
    2  sudo apt update && sudo apt upgrade -y
    3  clear
    4  sudo apt update
    5  egrep -c '(vmx|svm)' /proc/cpuinfo
    6  lsmod | egrep 'kvm|kvm_intel|kvm_amd' || true
    7  sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients virtinst bridge-utils cloud-image-utils
    8  clear
    9  egrep -c '(vmx|svm)' /proc/cpuinfo
   10  lsmod | egrep 'kvm|kvm_intel|kvm_amd' || true
   11  clear
   12  sudo systemctl enable --now libvirtd
   13  sudo systemctl status libvirtd --no-pager
   14  sudo usermod -aG libvirt,kvm $USER
   15  exit
   16  clear
   17  virsh list --all
   18  virsh net-list --all
   19  ip a | grep -A2 virbr0 || true
   20  mkdir -p ~/kvm/nat-vm && cd ~/kvm/nat-vm
   21  wget -O ubuntu-24.04-server-cloudimg-amd64.img   https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
   22  clear
   23  qemu-img create -f qcow2 -F qcow2 -b ubuntu-24.04-server-cloudimg-amd64.img nat-vm1.qcow2 20G
   24  cat > user-data.yaml <<'EOF'
#cloud-config
users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    shell: /bin/bash
    lock_passwd: false
    passwd: $6$rounds=4096$wI6BqkEwWm$5XQvB5y2w1iQnT3d9mXQnQmXQzqv0a0o3g1u7oGQ0oYQm2zj6GmYd8c3Zy9qY8c9u7k1c3Xo3mW1
ssh_pwauth: true
package_update: true
packages:
  - qemu-guest-agent
runcmd:
  - systemctl enable --now qemu-guest-agent
EOF

   25  cloud-localds seed.iso user-data.yaml
   26  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=$PWD/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=$PWD/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import   --noautoconsole
   27  sudo mkdir -p /var/lib/libvirt/images/nat-vm1
   28  sudo mv /home/ubuntu/kvm/nat-vm/nat-vm1.qcow2 /var/lib/libvirt/images/nat-vm1/
   29  sudo mv /home/ubuntu/kvm/nat-vm/seed.iso /var/lib/libvirt/images/nat-vm1/
   30  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
   31  sudo chmod 750 /var/lib/libvirt/images/nat-vm1
   32  sudo chmod 640 /var/lib/libvirt/images/nat-vm1/*
   33  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import   --noautoconsole
   34  sudo mv /home/ubuntu/kvm/nat-vm/ubuntu-24.04-server-cloudimg-amd64.img /var/lib/libvirt/images/nat-vm1/
   35  sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img
   36  sudo chmod 640 /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img
   37  sudo qemu-img rebase -u   -b /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
   38  sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 | grep -i "backing"
   39  sudo rm -f /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
   40  sudo qemu-img create -f qcow2 /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 20G
   41  sudo virt-resize --expand /dev/sda1   /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
   42  clear
   43  sudo apt update
   44  sudo apt install -y libguestfs-tools
   45  clear
   46  sudo virsh destroy nat-vm1 2>/dev/null || true
   47  sudo virsh undefine nat-vm1 2>/dev/null || true
   48  sudo mkdir -p /var/lib/libvirt/images/nat-vm1
   49  cd /var/lib/libvirt/images/nat-vm1
   50  ls -lh
   51  sudo mv ubuntu-24.04-server-cloudimg-amd64.img base-ubuntu24.img
   52  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
   53  sudo chmod 750 /var/lib/libvirt/images/nat-vm1
   54  sudo chmod 640 /var/lib/libvirt/images/nat-vm1/*
   55  sudo chmod 444 /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img
   56  sudo rm -f /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
   57  sudo qemu-img create -f qcow2   -F qcow2 -b /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 20G
   58  sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 | egrep -i 'file format|virtual size|backing file|backing file format'
   59  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import
   60  sudo virsh domifaddr nat-vm1
   61  ssh ubuntu@192.168.122.105
   62  ls
   63  sudo cat /var/lib/cloud/instance/user-data.txt
   64  ssh ubuntu@192.168.122.105
   65  sudo virt-customize   -a /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2   --password ubuntu:password:Pico@1234
   66  ssh ubuntu@192.168.122.105
   67  clear
   68  sudo virsh destroy nat-vm1 2>/dev/null || true
   69  sudo virsh undefine nat-vm1 --nvram 2>/dev/null || true
   70  sudo virsh list --all
   71  sudo rm -rf /var/lib/libvirt/images/nat-vm1
   72  ls /var/lib/libvirt/images/
   73  sudo ls /var/lib/libvirt/images/
   74  rm -rf ~/kvm/nat-vm
   75  virsh net-list --all
   76  ip a | grep virbr0
   77  sudo mkdir -p /var/lib/libvirt/images/nat-vm1
   78  sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
   79  cd /var/lib/libvirt/images/nat-vm1
   80  sudo wget -O ubuntu24-base.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
   81  sudo chown libvirt-qemu:kvm ubuntu24-base.img
   82  sudo chmod 644 ubuntu24-base.img
   83  sudo qemu-img create -f qcow2 nat-vm1.qcow2 20G
   84  sudo virt-resize --expand /dev/sda1 ubuntu24-base.img nat-vm1.qcow2
   85  sudo apt install -y libguestfs-tools
   86  sudo nano /var/lib/libvirt/images/nat-vm1/user-data.yaml
   87  sudo cat /var/lib/libvirt/images/nat-vm1/user-data.yaml
   88  sudo cloud-localds seed.iso user-data.yaml
   89  sudo chown libvirt-qemu:kvm seed.iso
   90  clear
   91  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import
   92  sudo virsh list --all
   93  sudo virsh net-dhcp-leases default
   94  ssh ubuntu@192.168.122.105
   95  ping 192.168.122.105
   96  sudo virsh list --all
   97  sudo virsh domiflist nat-vm1
   98  sudo virsh domifaddr nat-vm1
   99  ip a show virbr0
  100  ip link show virbr0
  101  ip route | grep 192.168.122
  102  sudo virsh net-list --all
  103  sudo virsh net-info default
  104  sudo virsh net-dumpxml default | egrep -i 'bridge|ip address|dhcp' -n
  105  sudo nft flush ruleset
  106  ping 192.168.122.105
  107  ssh ubuntu@192.168.122.105
  108  ping -c 3 192.168.122.105
  109  sudo ufw status
  110  sudo virsh net-dhcp-leases default
  111  sudo virsh list --all
  112  sudo virsh domiflist nat-vm1
  113  ip a show virbr0
  114  ip route | grep 192.168.122 || true
  115  sudo ufw status verbose || true
  116  sudo virsh net-info default
  117  clear
  118  history
  119  clear
  120  sudo virsh net-destroy default
  121  sudo virsh net-start default
  122  sudo apt update
  123  sudo apt install -y nftables iptables
  124  sudo systemctl enable --now nftables
  125  sudo systemctl restart nftables
  126  sudo iptables -F
  127  sudo iptables -t nat -F
  128  sudo iptables -t mangle -F
  129  sudo iptables -X
  130  sudo iptables -t nat -X
  131  sudo iptables -t mangle -X~
  132  sudo iptables -t mangle -X~
  133  V
  134  sudo systemctl restart libvirtd
  135  sudo systemctl status libvirtd --no-pager
  136  sudo virsh net-start default
  137  sudo virsh net-autostart default
  138  sudo virsh net-list --all
  139  sudo virsh reboot nat-vm1
  140  sudo virsh domiflist nat-vm1
  141  sudo virsh net-dhcp-leases default
  142  ping -c 3 192.168.122.105
  143  sudo iptables -V
  144  sudo update-alternatives --display iptables
  145  ls
  146  virnish list
  147  virsh list
  148  clear
  149  sudo rm -f /var/lib/libvirt/dnsmasq/default.leases            /var/lib/libvirt/dnsmasq/default.status 2>/dev/null || true
  150  sudo systemctl restart libvirtd
  151  sudo virsh net-destroy default 2>/dev/null || true
  152  sudo virsh net-start default
  153  sudo virsh reboot nat-vm1
  154  sudo virsh domiflist nat-vm1
  155  sudo virsh net-dhcp-leases default
  156  ping -c 3 192.168.122.105
  157  iptables -V
  158  readlink -f $(which iptables)
  159  sudo update-alternatives --display iptables | sed -n '1,120p'
  160  sudo journalctl -u libvirtd -n 120 --no-pager
  161  sudo virsh net-start default
  162  clear
  163  sudo virsh console nat-vm1
  164  sudo virsh domstate nat-vm1
  165  sudo virsh dominfo nat-vm1 | egrep -i 'State|CPU|Memory|Autostart'
  166  ps -ef | grep -E 'qemu.*nat-vm1' | grep -v grep
  167  sudo virsh dumpxml nat-vm1 | egrep -n 'console|serial|graphics|video|channel|target port'
  168  sudo apt install -y virt-viewer
  169  sudo virt-viewer --connect qemu:///system nat-vm1
  170  sudo virsh edit nat-vm1
  171  clear
  172  sudo virsh list --all
  173  sudo virsh domstate nat-vm1
  174  ps -ef | grep -E 'qemu.*nat-vm1' | grep -v grep
  175  sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
  176  sudo ls -lh /var/lib/libvirt/images/nat-vm1/
  177  sudo virsh domiflist nat-vm1
  178  ip link show vnet0
  179  bridge link | grep vnet0 || true
  180  sudo virsh net-list --all
  181  ip a show virbr0
  182  sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
  183  sudo virsh dumpxml nat-vm1 | grep -E 'console|serial|graphics'
  184  clear
  185  sudo virsh destroy nat-vm1
  186  sudo virsh net-destroy default
  187  sudo systemctl restart libvirtd
  188  sudo virsh net-start default
  189  ip a show virbr0
  190  sudo virsh start nat-vm1
  191  ip link show vnet0
  192  bridge link | grep -n vnet0 || true
  193  sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
  194  sudo virsh reboot nat-vm1
  195  sudo virsh net-dhcp-leases default
  196  ping 192.168.122.105
  197  ssh ubuntu@192.168.122.105
  198  sudo ip link set vnet0 master virbr0
  199  sudo ip link set virbr0 up
  200  sudo ip link set vnet0 up
  201  bridge link | grep -n vnet0 || true
  202  sudo virsh domstate nat-vm1
  203  sudo virsh destroy nat-vm1
  204  sudo virsh net-destroy default
  205  sudo systemctl restart libvirtd
  206  sudo virsh net-start default
  207  ip a show virbr0
  208  sudo virsh start nat-vm1
  209  bridge link | grep -n vnet0 || true
  210  sudo virsh domstate nat-vm1
  211  ping 192.158.122.105
  212  ping 192.168.122.105
  213  sudo virsh destroy nat-vm1
  214  sudo pkill -f "dnsmasq.*libvirt" || true
  215  sudo pkill -f "/usr/sbin/dnsmasq.*virbr0" || true
  216  sudo rm -f /var/lib/libvirt/dnsmasq/default.leases             /var/lib/libvirt/dnsmasq/default.status             /var/lib/libvirt/dnsmasq/default.pid 2>/dev/null || true
  217  sudo systemctl restart libvirtd
  218  sudo virsh net-destroy default 2>/dev/null || true
  219  sudo virsh net-start default
  220  sudo virsh net-autostart default
  221  sudo ip link set virbr0 up
  222  ip a show virbr0
  223  sudo virsh start nat-vm1
  224  sudo tcpdump -ni virbr0 -vv 'port 67 or port 68'
  225  sudo virsh domstate nat-vm1
  226  ping 192.168.122.105
  227  ip a
  228  sudo virsh resume nat-vm1
  229  sudo virsh net-dhcp-leases default
  230  sudo tcpdump -ni virbr0 port 67 or port 68 -c 5
  231  ssh ubuntu@192.168.122.105
  232  sudo virsh destroy nat-vm1
  233  sudo virsh dumpxml nat-vm1 | egrep -n 'start|paused|qemu:commandline|qemu:arg' -n
  234  sudo virsh dumpxml nat-vm1 > /tmp/nat-vm1.xml
  235  sudo nano /tmp/nat-vm1.xml
  236  clear
  237  cd ~
  238  sudo virsh destroy nat-vm1 2>/dev/null || true
  239  sudo virsh undefine nat-vm1 --nvram 2>/dev/null || true
  240  sudo rm -rf /var/lib/libvirt/images/nat-vm1
  241  sudo virsh net-destroy default 2>/dev/null || true
  242  sudo virsh net-undefine default 2>/dev/null || true
  243  sudo virsh net-define /usr/share/libvirt/networks/default.xml
  244  sudo virsh net-start default
  245  sudo virsh net-autostart default
  246  sudo systemctl restart libvirtd
  247  sudo mkdir -p /var/lib/libvirt/images/_base
  248  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/_base
  249  sudo chmod 755 /var/lib/libvirt/images/_base
  250  sudo wget -O /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
  251  sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
  252  sudo chmod 444 /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
  253  sudo mkdir -p /var/lib/libvirt/images/vms/nat-vm1
  254  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/vms/nat-vm1
  255  sudo chmod 750 /var/lib/libvirt/images/vms/nat-vm1
  256  cd /var/lib/libvirt/images/vms/nat-vm1
  257  sudo qemu-img create -f qcow2   -F qcow2 -b /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2   nat-vm1.qcow2 20G
  258  sudo qemu-img info nat-vm1.qcow2 | egrep -i 'file format|virtual size|backing file|backing file format'
  259  cat | sudo tee user-data.yaml > /dev/null <<'EOF'
#cloud-config
users:
  - name: ubuntu
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    shell: /bin/bash
    lock_passwd: false

ssh_pwauth: true

chpasswd:
  list: |
    ubuntu:1234
  expire: false

package_update: true

packages:
  - qemu-guest-agent

runcmd:
  - systemctl enable --now qemu-guest-agent
EOF

  260  cat | sudo tee meta-data.yaml > /dev/null <<'EOF'
instance-id: nat-vm1
local-hostname: nat-vm1
EOF

  261  sudo cloud-localds -v seed.iso user-data.yaml meta-data.yaml
  262  sudo chown libvirt-qemu:kvm seed.iso user-data.yaml meta-data.yaml
  263  sudo chmod 640 seed.iso user-data.yaml meta-data.yaml
  264  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/vms/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/vms/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import   --noautoconsole
  265  sudo virsh net-dhcp-leases default
  266  sudo virsh domiflist nat-vm1
  267  sudo tcpdump -ni virbr0 -c 10 'port 67 or port 68'
  268  virsh
  269  virsh list
  270  sudo virsh net-dhcp-leases default
  271  ssh ubuntu@192.168.122.160
  272  clear
  273  history


```