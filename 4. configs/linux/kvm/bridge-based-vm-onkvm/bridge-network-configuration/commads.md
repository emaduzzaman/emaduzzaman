```
ubuntu@gelani-lab-2:~$ history
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
   16  sudo virsh reboot nat-vm1
   17  exit
   18  clear
   19  ls -l /etc/netplan
   20  for f in /etc/netplan/*.yaml; do echo "===== $f ====="; sudo cat "$f"; echo; done
   21  ip -br addr
   22  ip route
   23  resolvectl status | sed -n '1,200p'
   24  networkctl status --no-pager
   25  networkctl list --no-pager
   26  systemctl is-active NetworkManager || true
   27  nmcli dev status 2>/dev/null || true
   28  ip -br link
   29  clear
   30  sudo tee /etc/netplan/50-cloud-init.yaml > /dev/null <<'EOF'
   31  network:
   32    version: 2
   33    renderer: networkd
   34    ethernets:
   35      ens3:
   36        match:
   37          macaddress: "fa:16:3e:5f:8a:1d"
   38        set-name: "ens3"
   39        dhcp4: false
   40        mtu: 8942
   41    bridges:
   42      br0:
   43        interfaces: [ens3]
   44        dhcp4: true
   45        mtu: 8942
   46        parameters:
   47          stp: false
   48          forward-delay: 0
   49  EOF
   50  sudo netplan generate
   51  sudo netplan apply
   52  nano /etc/netplan/50-cloud-init.yaml
   53  sudo nano /etc/netplan/50-cloud-init.yaml
   54  sudo netplan apply
   55  ls
   56  cat /etc/netplan/50-cloud-init.yaml
   57  sudo cat /etc/netplan/50-cloud-init.yaml
   58  sudo mkdir -p /etc/cloud/cloud.cfg.d
   59  echo "network: {config: disabled}" | sudo tee /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg
   60  sudo nano /etc/netplan/01-br0.yaml
   61  sudo netplan apply
   62  clear
   63  virsh list --all
   64  virsh net-list --all
   65  ip a | grep -A2 virbr0 || true
   66  mkdir -p ~/kvm/nat-vm && cd ~/kvm/nat-vm
   67  wget -O ubuntu-24.04-server-cloudimg-amd64.img   https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
   68  clear
   69  qemu-img create -f qcow2 -F qcow2 -b ubuntu-24.04-server-cloudimg-amd64.img nat-vm1.qcow2 20G
   70  cat > user-data.yaml <<'EOF'
   71  #cloud-config
   72  users:
   73    - name: ubuntu
   74      sudo: ALL=(ALL) NOPASSWD:ALL
   75      groups: users, admin
   76      shell: /bin/bash
   77      lock_passwd: false
   78      passwd: $6$rounds=4096$wI6BqkEwWm$5XQvB5y2w1iQnT3d9mXQnQmXQzqv0a0o3g1u7oGQ0oYQm2zj6GmYd8c3Zy9qY8c9u7k1c3Xo3mW1
   79  ssh_pwauth: true
   80  package_update: true
   81  packages:
   82    - qemu-guest-agent
   83  runcmd:
   84    - systemctl enable --now qemu-guest-agent
   85  EOF
   86  cloud-localds seed.iso user-data.yaml
   87  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=$PWD/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=$PWD/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import   --noautoconsole
   88  sudo mkdir -p /var/lib/libvirt/images/nat-vm1
   89  sudo mv /home/ubuntu/kvm/nat-vm/nat-vm1.qcow2 /var/lib/libvirt/images/nat-vm1/
   90  sudo mv /home/ubuntu/kvm/nat-vm/seed.iso /var/lib/libvirt/images/nat-vm1/
   91  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
   92  sudo chmod 750 /var/lib/libvirt/images/nat-vm1
   93  sudo chmod 640 /var/lib/libvirt/images/nat-vm1/*
   94  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import   --noautoconsole
   95  sudo mv /home/ubuntu/kvm/nat-vm/ubuntu-24.04-server-cloudimg-amd64.img /var/lib/libvirt/images/nat-vm1/
   96  sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img
   97  sudo chmod 640 /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img
   98  sudo qemu-img rebase -u   -b /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
   99  sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 | grep -i "backing"
  100  sudo rm -f /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
  101  sudo qemu-img create -f qcow2 /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 20G
  102  sudo virt-resize --expand /dev/sda1   /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
  103  clear
  104  sudo apt update
  105  sudo apt install -y libguestfs-tools
  106  clear
  107  sudo virsh destroy nat-vm1 2>/dev/null || true
  108  sudo virsh undefine nat-vm1 2>/dev/null || true
  109  sudo mkdir -p /var/lib/libvirt/images/nat-vm1
  110  cd /var/lib/libvirt/images/nat-vm1
  111  ls -lh
  112  sudo mv ubuntu-24.04-server-cloudimg-amd64.img base-ubuntu24.img
  113  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
  114  sudo chmod 750 /var/lib/libvirt/images/nat-vm1
  115  sudo chmod 640 /var/lib/libvirt/images/nat-vm1/*
  116  sudo chmod 444 /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img
  117  sudo rm -f /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
  118  sudo qemu-img create -f qcow2   -F qcow2 -b /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 20G
  119  sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 | egrep -i 'file format|virtual size|backing file|backing file format'
  120  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import
  121  sudo virsh domifaddr nat-vm1
  122  ssh ubuntu@192.168.122.105
  123  ls
  124  sudo cat /var/lib/cloud/instance/user-data.txt
  125  ssh ubuntu@192.168.122.105
  126  sudo virt-customize   -a /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2   --password ubuntu:password:Pico@1234
  127  ssh ubuntu@192.168.122.105
  128  clear
  129  sudo virsh destroy nat-vm1 2>/dev/null || true
  130  sudo virsh undefine nat-vm1 --nvram 2>/dev/null || true
  131  sudo virsh list --all
  132  sudo rm -rf /var/lib/libvirt/images/nat-vm1
  133  ls /var/lib/libvirt/images/
  134  sudo ls /var/lib/libvirt/images/
  135  rm -rf ~/kvm/nat-vm
  136  virsh net-list --all
  137  ip a | grep virbr0
  138  sudo mkdir -p /var/lib/libvirt/images/nat-vm1
  139  sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
  140  cd /var/lib/libvirt/images/nat-vm1
  141  sudo wget -O ubuntu24-base.img https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
  142  sudo chown libvirt-qemu:kvm ubuntu24-base.img
  143  sudo chmod 644 ubuntu24-base.img
  144  sudo qemu-img create -f qcow2 nat-vm1.qcow2 20G
  145  sudo virt-resize --expand /dev/sda1 ubuntu24-base.img nat-vm1.qcow2
  146  sudo apt install -y libguestfs-tools
  147  sudo nano /var/lib/libvirt/images/nat-vm1/user-data.yaml
  148  sudo cat /var/lib/libvirt/images/nat-vm1/user-data.yaml
  149  sudo cloud-localds seed.iso user-data.yaml
  150  sudo chown libvirt-qemu:kvm seed.iso
  151  clear
  152  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import
  153  sudo virsh list --all
  154  sudo virsh net-dhcp-leases default
  155  ssh ubuntu@192.168.122.105
  156  ping 192.168.122.105
  157  sudo virsh list --all
  158  sudo virsh domiflist nat-vm1
  159  sudo virsh domifaddr nat-vm1
  160  ip a show virbr0
  161  ip link show virbr0
  162  ip route | grep 192.168.122
  163  sudo virsh net-list --all
  164  sudo virsh net-info default
  165  sudo virsh net-dumpxml default | egrep -i 'bridge|ip address|dhcp' -n
  166  sudo nft flush ruleset
  167  ping 192.168.122.105
  168  ssh ubuntu@192.168.122.105
  169  ping -c 3 192.168.122.105
  170  sudo ufw status
  171  sudo virsh net-dhcp-leases default
  172  sudo virsh list --all
  173  sudo virsh domiflist nat-vm1
  174  ip a show virbr0
  175  ip route | grep 192.168.122 || true
  176  sudo ufw status verbose || true
  177  sudo virsh net-info default
  178  clear
  179  history
  180  clear
  181  sudo virsh net-destroy default
  182  sudo virsh net-start default
  183  sudo apt update
  184  sudo apt install -y nftables iptables
  185  sudo systemctl enable --now nftables
  186  sudo systemctl restart nftables
  187  sudo iptables -F
  188  sudo iptables -t nat -F
  189  sudo iptables -t mangle -F
  190  sudo iptables -X
  191  sudo iptables -t nat -X
  192  sudo iptables -t mangle -X~
  193  sudo iptables -t mangle -X~
  194  V
  195  sudo systemctl restart libvirtd
  196  sudo systemctl status libvirtd --no-pager
  197  sudo virsh net-start default
  198  sudo virsh net-autostart default
  199  sudo virsh net-list --all
  200  sudo virsh reboot nat-vm1
  201  sudo virsh domiflist nat-vm1
  202  sudo virsh net-dhcp-leases default
  203  ping -c 3 192.168.122.105
  204  sudo iptables -V
  205  sudo update-alternatives --display iptables
  206  ls
  207  virnish list
  208  virsh list
  209  clear
  210  sudo rm -f /var/lib/libvirt/dnsmasq/default.leases            /var/lib/libvirt/dnsmasq/default.status 2>/dev/null || true
  211  sudo systemctl restart libvirtd
  212  sudo virsh net-destroy default 2>/dev/null || true
  213  sudo virsh net-start default
  214  sudo virsh reboot nat-vm1
  215  sudo virsh domiflist nat-vm1
  216  sudo virsh net-dhcp-leases default
  217  ping -c 3 192.168.122.105
  218  iptables -V
  219  readlink -f $(which iptables)
  220  sudo update-alternatives --display iptables | sed -n '1,120p'
  221  sudo journalctl -u libvirtd -n 120 --no-pager
  222  sudo virsh net-start default
  223  clear
  224  sudo virsh console nat-vm1
  225  sudo virsh domstate nat-vm1
  226  sudo virsh dominfo nat-vm1 | egrep -i 'State|CPU|Memory|Autostart'
  227  ps -ef | grep -E 'qemu.*nat-vm1' | grep -v grep
  228  sudo virsh dumpxml nat-vm1 | egrep -n 'console|serial|graphics|video|channel|target port'
  229  sudo apt install -y virt-viewer
  230  sudo virt-viewer --connect qemu:///system nat-vm1
  231  sudo virsh edit nat-vm1
  232  clear
  233  sudo virsh list --all
  234  sudo virsh domstate nat-vm1
  235  ps -ef | grep -E 'qemu.*nat-vm1' | grep -v grep
  236  sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
  237  sudo ls -lh /var/lib/libvirt/images/nat-vm1/
  238  sudo virsh domiflist nat-vm1
  239  ip link show vnet0
  240  bridge link | grep vnet0 || true
  241  sudo virsh net-list --all
  242  ip a show virbr0
  243  sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
  244  sudo virsh dumpxml nat-vm1 | grep -E 'console|serial|graphics'
  245  clear
  246  sudo virsh destroy nat-vm1
  247  sudo virsh net-destroy default
  248  sudo systemctl restart libvirtd
  249  sudo virsh net-start default
  250  ip a show virbr0
  251  sudo virsh start nat-vm1
  252  ip link show vnet0
  253  bridge link | grep -n vnet0 || true
  254  sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
  255  sudo virsh reboot nat-vm1
  256  sudo virsh net-dhcp-leases default
  257  ping 192.168.122.105
  258  ssh ubuntu@192.168.122.105
  259  sudo ip link set vnet0 master virbr0
  260  sudo ip link set virbr0 up
  261  sudo ip link set vnet0 up
  262  bridge link | grep -n vnet0 || true
  263  sudo virsh domstate nat-vm1
  264  sudo virsh destroy nat-vm1
  265  sudo virsh net-destroy default
  266  sudo systemctl restart libvirtd
  267  sudo virsh net-start default
  268  ip a show virbr0
  269  sudo virsh start nat-vm1
  270  bridge link | grep -n vnet0 || true
  271  sudo virsh domstate nat-vm1
  272  ping 192.158.122.105
  273  ping 192.168.122.105
  274  sudo virsh destroy nat-vm1
  275  sudo pkill -f "dnsmasq.*libvirt" || true
  276  sudo pkill -f "/usr/sbin/dnsmasq.*virbr0" || true
  277  sudo rm -f /var/lib/libvirt/dnsmasq/default.leases             /var/lib/libvirt/dnsmasq/default.status             /var/lib/libvirt/dnsmasq/default.pid 2>/dev/null || true
  278  sudo systemctl restart libvirtd
  279  sudo virsh net-destroy default 2>/dev/null || true
  280  sudo virsh net-start default
  281  sudo virsh net-autostart default
  282  sudo ip link set virbr0 up
  283  ip a show virbr0
  284  sudo virsh start nat-vm1
  285  sudo tcpdump -ni virbr0 -vv 'port 67 or port 68'
  286  sudo virsh domstate nat-vm1
  287  ping 192.168.122.105
  288  ip a
  289  sudo virsh resume nat-vm1
  290  sudo virsh net-dhcp-leases default
  291  sudo tcpdump -ni virbr0 port 67 or port 68 -c 5
  292  ssh ubuntu@192.168.122.105
  293  sudo virsh destroy nat-vm1
  294  sudo virsh dumpxml nat-vm1 | egrep -n 'start|paused|qemu:commandline|qemu:arg' -n
  295  sudo virsh dumpxml nat-vm1 > /tmp/nat-vm1.xml
  296  sudo nano /tmp/nat-vm1.xml
  297  clear
  298  cd ~
  299  sudo virsh destroy nat-vm1 2>/dev/null || true
  300  sudo virsh undefine nat-vm1 --nvram 2>/dev/null || true
  301  sudo rm -rf /var/lib/libvirt/images/nat-vm1
  302  sudo virsh net-destroy default 2>/dev/null || true
  303  sudo virsh net-undefine default 2>/dev/null || true
  304  sudo virsh net-define /usr/share/libvirt/networks/default.xml
  305  sudo virsh net-start default
  306  sudo virsh net-autostart default
  307  sudo systemctl restart libvirtd
  308  sudo mkdir -p /var/lib/libvirt/images/_base
  309  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/_base
  310  sudo chmod 755 /var/lib/libvirt/images/_base
  311  sudo wget -O /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
  312  sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
  313  sudo chmod 444 /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
  314  sudo mkdir -p /var/lib/libvirt/images/vms/nat-vm1
  315  sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/vms/nat-vm1
  316  sudo chmod 750 /var/lib/libvirt/images/vms/nat-vm1
  317  cd /var/lib/libvirt/images/vms/nat-vm1
  318  sudo qemu-img create -f qcow2   -F qcow2 -b /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2   nat-vm1.qcow2 20G
  319  sudo qemu-img info nat-vm1.qcow2 | egrep -i 'file format|virtual size|backing file|backing file format'
  320  cat | sudo tee user-data.yaml > /dev/null <<'EOF'
  321  #cloud-config
  322  users:
  323    - name: ubuntu
  324      sudo: ALL=(ALL) NOPASSWD:ALL
  325      groups: users, admin
  326      shell: /bin/bash
  327      lock_passwd: false
  328  ssh_pwauth: true
  329  chpasswd:
  330    list: |
  331      ubuntu:1234
  332    expire: false
  333  package_update: true
  334  packages:
  335    - qemu-guest-agent
  336  runcmd:
  337    - systemctl enable --now qemu-guest-agent
  338  EOF
  339  cat | sudo tee meta-data.yaml > /dev/null <<'EOF'
  340  instance-id: nat-vm1
  341  local-hostname: nat-vm1
  342  EOF
  343  sudo cloud-localds -v seed.iso user-data.yaml meta-data.yaml
  344  sudo chown libvirt-qemu:kvm seed.iso user-data.yaml meta-data.yaml
  345  sudo chmod 640 seed.iso user-data.yaml meta-data.yaml
  346  sudo virt-install   --name nat-vm1   --memory 2048   --vcpus 2   --disk path=/var/lib/libvirt/images/vms/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio   --disk path=/var/lib/libvirt/images/vms/nat-vm1/seed.iso,device=cdrom   --os-variant ubuntu24.04   --network network=default,model=virtio   --graphics none   --console pty,target_type=serial   --import   --noautoconsole
  347  sudo virsh net-dhcp-leases default
  348  sudo virsh domiflist nat-vm1
  349  sudo tcpdump -ni virbr0 -c 10 'port 67 or port 68'
  350  virsh
  351  virsh list
  352  sudo virsh net-dhcp-leases default
  353  ssh ubuntu@192.168.122.160
  354  clear
  355  history
  356  clear
  357  ip -br link
  358  ip -br addr | grep -E 'ens|enp|eth'
  359  sudo cp -a /etc/netplan /etc/netplan.bak.$(date +%F-%H%M)
  360  ls -l /etc/netplan
  361  ls /etc/netplan
  362  cd /etc/netpaln
  363  ls
  364  cd /etc/netplan
  365  ls
  366  cp 50-cloud-init.yaml 50-cloud-init.yaml.bak
  367  sudo cp 50-cloud-init.yaml 50-cloud-init.yaml.bak
  368  ls
  369  sudo nano /etc/netplan/50-cloud-init.yaml
  370  sudo cat /etc/netplan/50-cloud-init.yaml
  371  sudo nano /etc/netplan/50-cloud-init.yaml
  372  sudo netplan generate
  373  sudo netplan apply
  374  clear
  375  ip -br addr | egrep 'br0|ens3'
  376  ping google.com
  377  cd /etc/netplan
  378  ls
  379  cd ..
  380  ls
  381  ls grep netplan
  382  clear
  383  cd netplan
  384  ls
  385  nano 50-cloud-init.yaml
  386  sudo bash
  387  cd /etc/netplan
  388  ls
  389  nano 01-br0.yaml.bak 
  390  sudo bash
  391  sudo reboot
  392  sudo shutdown now
  393  sudo dhclient -v br0
  394  sudo nano /etc/netplan/50-cloud-init.yaml
  395  sudo chown root:root /etc/netplan/50-cloud-init.yaml
  396  sudo chmod 600 /etc/netplan/50-cloud-init.yaml
  397  sudo netplan generate
  398  sudo netplan apply
  399  clear
  400  sudo nano /etc/netplan/50-cloud-init.yaml
  401  sudo chmod 600 /etc/netplan/50-cloud-init.yaml
  402  sudo cat /etc/netplan/50-cloud-init.yaml
  403  sudo netplan try
  404  ping google.com
  405  ip -br addr
  406  history

```
