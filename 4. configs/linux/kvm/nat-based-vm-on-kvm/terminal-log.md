 ```
ubuntu@gelani-lab-2:~$ egrep -c '(vmx|svm)' /proc/cpuinfo
4
ubuntu@gelani-lab-2:~$ lsmod | egrep 'kvm|kvm_intel|kvm_amd' || true
kvm_amd               208896  0
ccp                   143360  1 kvm_amd
kvm                  1409024  1 kvm_amd
irqbypass              12288  1 kvm
ubuntu@gelani-lab-2:~$ 

ubuntu@gelani-lab-2:~$ sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients virtinst bridge-utils cloud-image-utils

Get:134 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgdk-pixbuf2.0-bin amd64 2.42.10+dfsg-3ubuntu3.2 [13.9 kB]                                                                                        
Get:135 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libvulkan1 amd64 1.3.275.0-1build1 [142 kB]                                                                                                                 
Get:136 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgl1-mesa-dri amd64 25.2.8-0ubuntu0.24.04.1 [37.9 kB]                                                                                             
Get:137 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libxcb-glx0 amd64 1.15-1ubuntu2 [24.8 kB]                                                                                                                   
Get:138 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libxxf86vm1 amd64 1:1.1.4-1build4 [9,282 B]                                                                                                                 
Get:139 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libglx-mesa0 amd64 25.2.8-0ubuntu0.24.04.1 [110 kB]                                                                                                 
Get:140 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgtk-3-bin amd64 3.24.41-4ubuntu1.3 [73.9 kB]                                                                                                     
Get:141 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libgvnc-1.0-0 amd64 1.3.1-1build2 [67.1 kB]                                                                                                             
Get:142 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libgtk-vnc-2.0-0 amd64 1.3.1-1build2 [28.9 kB]                                                                                                          
Get:143 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 librdmacm1t64 amd64 50.0-2ubuntu0.2 [70.7 kB]                                                                                                       
Get:144 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libiscsi7 amd64 1.19.0-3build4 [68.7 kB]                                                                                                                    
Get:145 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libisofs6t64 amd64 1.5.6.pl01-1.1ubuntu2 [220 kB]                                                                                                           
Get:146 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libisoburn1t64 amd64 1:1.5.6-1.1ubuntu3 [405 kB]                                                                                                            
Get:147 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libsamplerate0 amd64 0.2.2-4build1 [1,344 kB]                                                                                                               
Get:148 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libjack-jackd2-0 amd64 1.9.21~dfsg-3ubuntu3 [289 kB]                                                                                                        
Get:149 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libndctl6 amd64 77-2ubuntu2 [62.8 kB]                                                                                                                       
Get:150 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libnfs14 amd64 5.0.2-1build1 [109 kB]                                                                                                                       
Get:151 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libphodav-3.0-common all 3.0-8build3 [14.9 kB]                                                                                                          
Get:152 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libphodav-3.0-0 amd64 3.0-8build3 [29.9 kB]                                                                                                             
Get:153 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libwebrtc-audio-processing1 amd64 0.3.1-0ubuntu6 [290 kB]                                                                                                   
Get:154 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libspa-0.2-modules amd64 1.0.5-1ubuntu3.2 [627 kB]                                                                                                  
Get:155 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpipewire-0.3-0t64 amd64 1.0.5-1ubuntu3.2 [252 kB]                                                                                                
Get:156 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libpipewire-0.3-common all 1.0.5-1ubuntu3.2 [19.1 kB]                                                                                               
Get:157 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libpmem1 amd64 1.13.1-1.1ubuntu2 [84.8 kB]                                                                                                                  
Get:158 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libpmemobj1 amd64 1.13.1-1.1ubuntu2 [116 kB]                                                                                                                
Get:159 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 librados2 amd64 19.2.3-0ubuntu0.24.04.2 [4,041 kB]                                                                                                  
Get:160 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 librbd1 amd64 19.2.3-0ubuntu0.24.04.2 [3,413 kB]                                                                                                    
Get:161 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 librsvg2-2 amd64 2.58.0+dfsg-1build1 [2,135 kB]                                                                                                             
Get:162 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 librsvg2-common amd64 2.58.0+dfsg-1build1 [11.8 kB]                                                                                                         
Get:163 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libxss1 amd64 1:1.2.3-1build3 [7,204 B]                                                                                                                     
Get:164 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libsdl2-2.0-0 amd64 2.30.0+dfsg-1ubuntu3.1 [686 kB]                                                                                                 
Get:165 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libslirp0 amd64 4.7.0-1ubuntu3 [63.8 kB]                                                                                                                    
Get:166 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 spice-client-glib-usb-acl-helper amd64 0.42-2ubuntu2 [12.5 kB]                                                                                          
Get:167 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libusbredirparser1t64 amd64 0.13.0-2.1build1 [16.5 kB]                                                                                                      
Get:168 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libusbredirhost1t64 amd64 0.13.0-2.1build1 [20.0 kB]                                                                                                        
Get:169 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libspice-client-glib-2.0-8 amd64 0.42-2ubuntu2 [314 kB]                                                                                                 
Get:170 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 libva-x11-2 amd64 2.20.0-2ubuntu0.1 [12.0 kB]                                                                                                   
Get:171 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libwayland-server0 amd64 1.22.0-2.1build1 [33.9 kB]                                                                                                         
Get:172 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libspice-client-gtk-3.0-5 amd64 0.42-2ubuntu2 [56.6 kB]                                                                                                 
Get:173 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libspice-server1 amd64 0.15.1-1build2 [349 kB]                                                                                                              
Get:174 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libtpms0 amd64 0.9.3-0ubuntu4.24.04.1 [373 kB]                                                                                                      
Get:175 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liburing2 amd64 2.5-1build1 [21.1 kB]                                                                                                                       
Get:176 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libvirglrenderer1 amd64 1.0.0-1ubuntu2 [226 kB]                                                                                                             
Get:177 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libyajl2 amd64 2.1.0-5build1 [20.2 kB]                                                                                                                      
Get:178 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt0 amd64 10.0.0-2ubuntu8.11 [1,830 kB]                                                                                                        
Get:179 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-clients amd64 10.0.0-2ubuntu8.11 [438 kB]                                                                                                   
Get:180 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-daemon-driver-qemu amd64 10.0.0-2ubuntu8.11 [740 kB]                                                                                        
Get:181 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-daemon amd64 10.0.0-2ubuntu8.11 [431 kB]                                                                                                    
Get:182 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-daemon-config-network all 10.0.0-2ubuntu8.11 [3,118 B]                                                                                      
Get:183 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-daemon-config-nwfilter all 10.0.0-2ubuntu8.11 [6,040 B]                                                                                     
Get:184 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 systemd-container amd64 255.4-1ubuntu8.12 [417 kB]                                                                                                  
Get:185 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-daemon-system-systemd all 10.0.0-2ubuntu8.11 [1,380 B]                                                                                      
Get:186 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-daemon-system amd64 10.0.0-2ubuntu8.11 [49.5 kB]                                                                                            
Get:187 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libvirt-glib-1.0-data all 5.0.0-2build3 [17.3 kB]                                                                                                       
Get:188 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvirt-l10n all 10.0.0-2ubuntu8.11 [1,156 B]                                                                                                       
Get:189 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvte-2.91-common amd64 0.76.0-1ubuntu0.1 [13.5 kB]                                                                                                
Get:190 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libvte-2.91-0 amd64 0.76.0-1ubuntu0.1 [230 kB]                                                                                                      
Get:191 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libxml2-utils amd64 2.9.14+dfsg-1.3ubuntu3.7 [39.4 kB]                                                                                              
Get:192 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 mdevctl amd64 1.3.0-1ubuntu2.1 [959 kB]                                                                                                             
Get:193 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 mesa-va-drivers amd64 25.2.8-0ubuntu0.24.04.1 [6,776 B]                                                                                         
Get:194 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 mesa-vulkan-drivers amd64 25.2.8-0ubuntu0.24.04.1 [17.5 MB]                                                                                         
Get:195 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 osinfo-db all 0.20250606-0ubuntu0.24.04.1 [178 kB]                                                                                              
Get:196 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 python3-libvirt amd64 10.0.0-1build1 [164 kB]                                                                                                               
Get:197 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 python3-libxml2 amd64 2.9.14+dfsg-1.3ubuntu3.7 [140 kB]                                                                                         
Get:198 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libfdt1 amd64 1.7.0-2build1 [20.1 kB]                                                                                                                       
Get:199 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-system-common amd64 1:8.2.2+ds-0ubuntu1.12 [1,254 kB]                                                                                          
Get:200 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-system-data all 1:8.2.2+ds-0ubuntu1.12 [1,795 kB]                                                                                              
Get:201 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 seabios all 1.16.3-2 [175 kB]                                                                                                                               
Get:202 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-system-x86 amd64 1:8.2.2+ds-0ubuntu1.12 [11.2 MB]                                                                                              
Get:203 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-utils amd64 1:8.2.2+ds-0ubuntu1.12 [2,219 kB]                                                                                                  
Get:204 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-block-extra amd64 1:8.2.2+ds-0ubuntu1.12 [113 kB]                                                                                              
Get:205 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-system-modules-opengl amd64 1:8.2.2+ds-0ubuntu1.12 [185 kB]                                                                                    
Get:206 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libglvnd0 amd64 1.7.0-1build1 [69.6 kB]                                                                                                                     
Get:207 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libglx0 amd64 1.7.0-1build1 [38.6 kB]                                                                                                                       
Get:208 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libgl1 amd64 1.7.0-1build1 [102 kB]                                                                                                                         
Get:209 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-system-gui amd64 1:8.2.2+ds-0ubuntu1.12 [314 kB]                                                                                               
Get:210 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 qemu-system-modules-spice amd64 1:8.2.2+ds-0ubuntu1.12 [70.2 kB]                                                                                    
Get:211 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 swtpm amd64 0.7.3-0ubuntu5.24.04.1 [53.1 kB]                                                                                                        
Get:212 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 swtpm-tools amd64 0.7.3-0ubuntu5.24.04.1 [92.9 kB]                                                                                                  
Get:213 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 i965-va-driver amd64 2.4.1+dfsg1-1ubuntu0.1 [332 kB]                                                                                            
Get:214 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 va-driver-all amd64 2.20.0-2ubuntu0.1 [4,946 B]                                                                                                 
Get:215 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libvirt-glib-1.0-0 amd64 5.0.0-2build3 [121 kB]                                                                                                         
Get:216 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 virt-viewer amd64 11.0-3build2 [285 kB]                                                                                                                 
Get:217 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 xorriso amd64 1:1.5.6-1.1ubuntu3 [297 kB]                                                                                                                   
Get:218 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 cloud-image-utils all 0.33-1 [19.6 kB]                                                                                                                      
Get:219 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libosinfo-l10n all 1.11.0-2build3 [50.6 kB]                                                                                                             
Get:220 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libosinfo-1.0-0 amd64 1.11.0-2build3 [91.5 kB]                                                                                                          
Get:221 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 gir1.2-libosinfo-1.0 amd64 1.11.0-2build3 [18.6 kB]                                                                                                     
Get:222 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libnss-mymachines amd64 255.4-1ubuntu8.12 [153 kB]                                                                                                  
Get:223 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 ovmf all 2024.02-2ubuntu0.7 [5,176 kB]                                                                                                              
Get:224 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/universe amd64 virtinst all 1:4.1.0-3ubuntu0.1 [891 kB]                                                                                                        
Fetched 133 MB in 24s (5,597 kB/s)                                                                                                                                                                                                         
Extracting templates from packages: 100%
Preconfiguring packages ...
Selecting previously unselected package acl.
(Reading database ... 106434 files and directories currently installed.)
Preparing to unpack .../000-acl_2.3.2-1build1.1_amd64.deb ...
Unpacking acl (2.3.2-1build1.1) ...
Selecting previously unselected package libgdk-pixbuf2.0-common.
Preparing to unpack .../001-libgdk-pixbuf2.0-common_2.42.10+dfsg-3ubuntu3.2_all.deb ...
Unpacking libgdk-pixbuf2.0-common (2.42.10+dfsg-3ubuntu3.2) ...
Selecting previously unselected package libgdk-pixbuf-2.0-0:amd64.
Preparing to unpack .../002-libgdk-pixbuf-2.0-0_2.42.10+dfsg-3ubuntu3.2_amd64.deb ...
Unpacking libgdk-pixbuf-2.0-0:amd64 (2.42.10+dfsg-3ubuntu3.2) ...
Selecting previously unselected package gtk-update-icon-cache.
Preparing to unpack .../003-gtk-update-icon-cache_3.24.41-4ubuntu1.3_amd64.deb ...
Unpacking gtk-update-icon-cache (3.24.41-4ubuntu1.3) ...
Selecting previously unselected package hicolor-icon-theme.
Preparing to unpack .../004-hicolor-icon-theme_0.17-2_all.deb ...
Unpacking hicolor-icon-theme (0.17-2) ...
Selecting previously unselected package humanity-icon-theme.
Preparing to unpack .../005-humanity-icon-theme_0.6.16_all.deb ...
Unpacking humanity-icon-theme (0.6.16) ...
Selecting previously unselected package ubuntu-mono.
Preparing to unpack .../006-ubuntu-mono_24.04-0ubuntu1_all.deb ...
Unpacking ubuntu-mono (24.04-0ubuntu1) ...
Selecting previously unselected package adwaita-icon-theme.
Preparing to unpack .../007-adwaita-icon-theme_46.0-1_all.deb ...
Unpacking adwaita-icon-theme (46.0-1) ...
Selecting previously unselected package alsa-topology-conf.
Preparing to unpack .../008-alsa-topology-conf_1.2.5.1-2_all.deb ...
Unpacking alsa-topology-conf (1.2.5.1-2) ...
Selecting previously unselected package libasound2-data.
Preparing to unpack .../009-libasound2-data_1.2.11-1ubuntu0.1_all.deb ...
Unpacking libasound2-data (1.2.11-1ubuntu0.1) ...
Selecting previously unselected package libasound2t64:amd64.
Preparing to unpack .../010-libasound2t64_1.2.11-1ubuntu0.1_amd64.deb ...
Unpacking libasound2t64:amd64 (1.2.11-1ubuntu0.1) ...
Selecting previously unselected package alsa-ucm-conf.
Preparing to unpack .../011-alsa-ucm-conf_1.2.10-1ubuntu5.9_all.deb ...
Unpacking alsa-ucm-conf (1.2.10-1ubuntu5.9) ...
Selecting previously unselected package at-spi2-common.
Preparing to unpack .../012-at-spi2-common_2.52.0-1build1_all.deb ...
Unpacking at-spi2-common (2.52.0-1build1) ...
Selecting previously unselected package libxi6:amd64.
Preparing to unpack .../013-libxi6_2%3a1.8.1-1build1_amd64.deb ...
Unpacking libxi6:amd64 (2:1.8.1-1build1) ...
Selecting previously unselected package libatspi2.0-0t64:amd64.
Preparing to unpack .../014-libatspi2.0-0t64_2.52.0-1build1_amd64.deb ...
Unpacking libatspi2.0-0t64:amd64 (2.52.0-1build1) ...
Selecting previously unselected package x11-common.
Preparing to unpack .../015-x11-common_1%3a7.7+23ubuntu3_all.deb ...
Unpacking x11-common (1:7.7+23ubuntu3) ...
Selecting previously unselected package libxtst6:amd64.
Preparing to unpack .../016-libxtst6_2%3a1.2.3-1.1build1_amd64.deb ...
Unpacking libxtst6:amd64 (2:1.2.3-1.1build1) ...
Selecting previously unselected package libdconf1:amd64.
Preparing to unpack .../017-libdconf1_0.40.0-4ubuntu0.1_amd64.deb ...
Unpacking libdconf1:amd64 (0.40.0-4ubuntu0.1) ...
Selecting previously unselected package dconf-service.
Preparing to unpack .../018-dconf-service_0.40.0-4ubuntu0.1_amd64.deb ...
Unpacking dconf-service (0.40.0-4ubuntu0.1) ...
Selecting previously unselected package dconf-gsettings-backend:amd64.
Preparing to unpack .../019-dconf-gsettings-backend_0.40.0-4ubuntu0.1_amd64.deb ...
Unpacking dconf-gsettings-backend:amd64 (0.40.0-4ubuntu0.1) ...
Selecting previously unselected package session-migration.
Preparing to unpack .../020-session-migration_0.3.9build1_amd64.deb ...
Unpacking session-migration (0.3.9build1) ...
Selecting previously unselected package gsettings-desktop-schemas.
Preparing to unpack .../021-gsettings-desktop-schemas_46.1-0ubuntu1_all.deb ...
Unpacking gsettings-desktop-schemas (46.1-0ubuntu1) ...
Selecting previously unselected package at-spi2-core.
Preparing to unpack .../022-at-spi2-core_2.52.0-1build1_amd64.deb ...
Unpacking at-spi2-core (2.52.0-1build1) ...
Selecting previously unselected package bridge-utils.
Preparing to unpack .../023-bridge-utils_1.7.1-1ubuntu2_amd64.deb ...
Unpacking bridge-utils (1.7.1-1ubuntu2) ...
Selecting previously unselected package msr-tools.
Preparing to unpack .../024-msr-tools_1.3-5build1_amd64.deb ...
Unpacking msr-tools (1.3-5build1) ...
Selecting previously unselected package cpu-checker.
Preparing to unpack .../025-cpu-checker_0.7-1.3build2_amd64.deb ...
Unpacking cpu-checker (0.7-1.3build2) ...
Selecting previously unselected package dns-root-data.
Preparing to unpack .../026-dns-root-data_2024071801~ubuntu0.24.04.1_all.deb ...
Unpacking dns-root-data (2024071801~ubuntu0.24.04.1) ...
Selecting previously unselected package dnsmasq-base.
Preparing to unpack .../027-dnsmasq-base_2.90-2ubuntu0.1_amd64.deb ...
Unpacking dnsmasq-base (2.90-2ubuntu0.1) ...
Selecting previously unselected package fontconfig.
Preparing to unpack .../028-fontconfig_2.15.0-1.1ubuntu2_amd64.deb ...
Unpacking fontconfig (2.15.0-1.1ubuntu2) ...
Selecting previously unselected package genisoimage.
Preparing to unpack .../029-genisoimage_9%3a1.1.11-3.5_amd64.deb ...
Unpacking genisoimage (9:1.1.11-3.5) ...
Selecting previously unselected package libpixman-1-0:amd64.
Preparing to unpack .../030-libpixman-1-0_0.42.2-1build1_amd64.deb ...
Unpacking libpixman-1-0:amd64 (0.42.2-1build1) ...
Selecting previously unselected package libxcb-render0:amd64.
Preparing to unpack .../031-libxcb-render0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-render0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxcb-shm0:amd64.
Preparing to unpack .../032-libxcb-shm0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-shm0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxrender1:amd64.
Preparing to unpack .../033-libxrender1_1%3a0.9.10-1.1build1_amd64.deb ...
Unpacking libxrender1:amd64 (1:0.9.10-1.1build1) ...
Selecting previously unselected package libcairo2:amd64.
Preparing to unpack .../034-libcairo2_1.18.0-3build1_amd64.deb ...
Unpacking libcairo2:amd64 (1.18.0-3build1) ...
Selecting previously unselected package libcairo-gobject2:amd64.
Preparing to unpack .../035-libcairo-gobject2_1.18.0-3build1_amd64.deb ...
Unpacking libcairo-gobject2:amd64 (1.18.0-3build1) ...
Selecting previously unselected package gir1.2-freedesktop:amd64.
Preparing to unpack .../036-gir1.2-freedesktop_1.80.1-1_amd64.deb ...
Unpacking gir1.2-freedesktop:amd64 (1.80.1-1) ...
Selecting previously unselected package libproxy1v5:amd64.
Preparing to unpack .../037-libproxy1v5_0.5.4-4build1_amd64.deb ...
Unpacking libproxy1v5:amd64 (0.5.4-4build1) ...
Selecting previously unselected package glib-networking-common.
Preparing to unpack .../038-glib-networking-common_2.80.0-1build1_all.deb ...
Unpacking glib-networking-common (2.80.0-1build1) ...
Selecting previously unselected package glib-networking-services.
Preparing to unpack .../039-glib-networking-services_2.80.0-1build1_amd64.deb ...
Unpacking glib-networking-services (2.80.0-1build1) ...
Selecting previously unselected package glib-networking:amd64.
Preparing to unpack .../040-glib-networking_2.80.0-1build1_amd64.deb ...
Unpacking glib-networking:amd64 (2.80.0-1build1) ...
Selecting previously unselected package libcdparanoia0:amd64.
Preparing to unpack .../041-libcdparanoia0_3.10.2+debian-14build3_amd64.deb ...
Unpacking libcdparanoia0:amd64 (3.10.2+debian-14build3) ...
Selecting previously unselected package liborc-0.4-0t64:amd64.
Preparing to unpack .../042-liborc-0.4-0t64_1%3a0.4.38-1ubuntu0.1_amd64.deb ...
Unpacking liborc-0.4-0t64:amd64 (1:0.4.38-1ubuntu0.1) ...
Selecting previously unselected package libgstreamer-plugins-base1.0-0:amd64.
Preparing to unpack .../043-libgstreamer-plugins-base1.0-0_1.24.2-1ubuntu0.3_amd64.deb ...
Unpacking libgstreamer-plugins-base1.0-0:amd64 (1.24.2-1ubuntu0.3) ...
Selecting previously unselected package libogg0:amd64.
Preparing to unpack .../044-libogg0_1.3.5-3build1_amd64.deb ...
Unpacking libogg0:amd64 (1.3.5-3build1) ...
Selecting previously unselected package libopus0:amd64.
Preparing to unpack .../045-libopus0_1.4-1build1_amd64.deb ...
Unpacking libopus0:amd64 (1.4-1build1) ...
Selecting previously unselected package libtheora0:amd64.
Preparing to unpack .../046-libtheora0_1.1.1+dfsg.1-16.1build3_amd64.deb ...
Unpacking libtheora0:amd64 (1.1.1+dfsg.1-16.1build3) ...
Selecting previously unselected package libvisual-0.4-0:amd64.
Preparing to unpack .../047-libvisual-0.4-0_0.4.2-2build1_amd64.deb ...
Unpacking libvisual-0.4-0:amd64 (0.4.2-2build1) ...
Selecting previously unselected package libvorbis0a:amd64.
Preparing to unpack .../048-libvorbis0a_1.3.7-1build3_amd64.deb ...
Unpacking libvorbis0a:amd64 (1.3.7-1build3) ...
Selecting previously unselected package libvorbisenc2:amd64.
Preparing to unpack .../049-libvorbisenc2_1.3.7-1build3_amd64.deb ...
Unpacking libvorbisenc2:amd64 (1.3.7-1build3) ...
Selecting previously unselected package gstreamer1.0-plugins-base:amd64.
Preparing to unpack .../050-gstreamer1.0-plugins-base_1.24.2-1ubuntu0.3_amd64.deb ...
Unpacking gstreamer1.0-plugins-base:amd64 (1.24.2-1ubuntu0.3) ...
Selecting previously unselected package libaa1:amd64.
Preparing to unpack .../051-libaa1_1.4p5-51.1_amd64.deb ...
Unpacking libaa1:amd64 (1.4p5-51.1) ...
Selecting previously unselected package libraw1394-11:amd64.
Preparing to unpack .../052-libraw1394-11_2.1.2-2build3_amd64.deb ...
Unpacking libraw1394-11:amd64 (2.1.2-2build3) ...
Selecting previously unselected package libavc1394-0:amd64.
Preparing to unpack .../053-libavc1394-0_0.5.4-5build3_amd64.deb ...
Unpacking libavc1394-0:amd64 (0.5.4-5build3) ...
Selecting previously unselected package libcaca0:amd64.
Preparing to unpack .../054-libcaca0_0.99.beta20-4ubuntu0.1_amd64.deb ...
Unpacking libcaca0:amd64 (0.99.beta20-4ubuntu0.1) ...
Selecting previously unselected package libdv4t64:amd64.
Preparing to unpack .../055-libdv4t64_1.0.0-17.1build1_amd64.deb ...
Unpacking libdv4t64:amd64 (1.0.0-17.1build1) ...
Selecting previously unselected package libflac12t64:amd64.
Preparing to unpack .../056-libflac12t64_1.4.3+ds-2.1ubuntu2_amd64.deb ...
Unpacking libflac12t64:amd64 (1.4.3+ds-2.1ubuntu2) ...
Selecting previously unselected package libgstreamer-plugins-good1.0-0:amd64.
Preparing to unpack .../057-libgstreamer-plugins-good1.0-0_1.24.2-1ubuntu1.2_amd64.deb ...
Unpacking libgstreamer-plugins-good1.0-0:amd64 (1.24.2-1ubuntu1.2) ...
Selecting previously unselected package libiec61883-0:amd64.
Preparing to unpack .../058-libiec61883-0_1.2.0-6build1_amd64.deb ...
Unpacking libiec61883-0:amd64 (1.2.0-6build1) ...
Selecting previously unselected package libmp3lame0:amd64.
Preparing to unpack .../059-libmp3lame0_3.100-6build1_amd64.deb ...
Unpacking libmp3lame0:amd64 (3.100-6build1) ...
Selecting previously unselected package libmpg123-0t64:amd64.
Preparing to unpack .../060-libmpg123-0t64_1.32.5-1ubuntu1.1_amd64.deb ...
Unpacking libmpg123-0t64:amd64 (1.32.5-1ubuntu1.1) ...
Selecting previously unselected package libasyncns0:amd64.
Preparing to unpack .../061-libasyncns0_0.8-6build4_amd64.deb ...
Unpacking libasyncns0:amd64 (0.8-6build4) ...
Selecting previously unselected package libsndfile1:amd64.
Preparing to unpack .../062-libsndfile1_1.2.2-1ubuntu5.24.04.1_amd64.deb ...
Unpacking libsndfile1:amd64 (1.2.2-1ubuntu5.24.04.1) ...
Selecting previously unselected package libx11-xcb1:amd64.
Preparing to unpack .../063-libx11-xcb1_2%3a1.8.7-1build1_amd64.deb ...
Unpacking libx11-xcb1:amd64 (2:1.8.7-1build1) ...
Selecting previously unselected package libpulse0:amd64.
Preparing to unpack .../064-libpulse0_1%3a16.1+dfsg1-2ubuntu10.1_amd64.deb ...
Unpacking libpulse0:amd64 (1:16.1+dfsg1-2ubuntu10.1) ...
Selecting previously unselected package libspeex1:amd64.
Preparing to unpack .../065-libspeex1_1.2.1-2ubuntu2.24.04.1_amd64.deb ...
Unpacking libspeex1:amd64 (1.2.1-2ubuntu2.24.04.1) ...
Selecting previously unselected package libshout3:amd64.
Preparing to unpack .../066-libshout3_2.4.6-1build2_amd64.deb ...
Unpacking libshout3:amd64 (2.4.6-1build2) ...
Selecting previously unselected package libtag1v5-vanilla:amd64.
Preparing to unpack .../067-libtag1v5-vanilla_1.13.1-1build1_amd64.deb ...
Unpacking libtag1v5-vanilla:amd64 (1.13.1-1build1) ...
Selecting previously unselected package libtag1v5:amd64.
Preparing to unpack .../068-libtag1v5_1.13.1-1build1_amd64.deb ...
Unpacking libtag1v5:amd64 (1.13.1-1build1) ...
Selecting previously unselected package libtwolame0:amd64.
Preparing to unpack .../069-libtwolame0_0.4.0-2build3_amd64.deb ...
Unpacking libtwolame0:amd64 (0.4.0-2build3) ...
Selecting previously unselected package libv4lconvert0t64:amd64.
Preparing to unpack .../070-libv4lconvert0t64_1.26.1-4build3_amd64.deb ...
Unpacking libv4lconvert0t64:amd64 (1.26.1-4build3) ...
Selecting previously unselected package libv4l-0t64:amd64.
Preparing to unpack .../071-libv4l-0t64_1.26.1-4build3_amd64.deb ...
Unpacking libv4l-0t64:amd64 (1.26.1-4build3) ...
Selecting previously unselected package libvpx9:amd64.
Preparing to unpack .../072-libvpx9_1.14.0-1ubuntu2.2_amd64.deb ...
Unpacking libvpx9:amd64 (1.14.0-1ubuntu2.2) ...
Selecting previously unselected package libwavpack1:amd64.
Preparing to unpack .../073-libwavpack1_5.6.0-1build1_amd64.deb ...
Unpacking libwavpack1:amd64 (5.6.0-1build1) ...
Selecting previously unselected package libxdamage1:amd64.
Preparing to unpack .../074-libxdamage1_1%3a1.1.6-1build1_amd64.deb ...
Unpacking libxdamage1:amd64 (1:1.1.6-1build1) ...
Selecting previously unselected package libxfixes3:amd64.
Preparing to unpack .../075-libxfixes3_1%3a6.0.0-2build1_amd64.deb ...
Unpacking libxfixes3:amd64 (1:6.0.0-2build1) ...
Selecting previously unselected package libsoup-3.0-common.
Preparing to unpack .../076-libsoup-3.0-common_3.4.4-5ubuntu0.6_all.deb ...
Unpacking libsoup-3.0-common (3.4.4-5ubuntu0.6) ...
Selecting previously unselected package libsoup-3.0-0:amd64.
Preparing to unpack .../077-libsoup-3.0-0_3.4.4-5ubuntu0.6_amd64.deb ...
Unpacking libsoup-3.0-0:amd64 (3.4.4-5ubuntu0.6) ...
Selecting previously unselected package gstreamer1.0-plugins-good:amd64.
Preparing to unpack .../078-gstreamer1.0-plugins-good_1.24.2-1ubuntu1.2_amd64.deb ...
Unpacking gstreamer1.0-plugins-good:amd64 (1.24.2-1ubuntu1.2) ...
Selecting previously unselected package libgraphite2-3:amd64.
Preparing to unpack .../079-libgraphite2-3_1.3.14-2build1_amd64.deb ...
Unpacking libgraphite2-3:amd64 (1.3.14-2build1) ...
Selecting previously unselected package libharfbuzz0b:amd64.
Preparing to unpack .../080-libharfbuzz0b_8.3.0-2build2_amd64.deb ...
Unpacking libharfbuzz0b:amd64 (8.3.0-2build2) ...
Selecting previously unselected package libthai-data.
Preparing to unpack .../081-libthai-data_0.1.29-2build1_all.deb ...
Unpacking libthai-data (0.1.29-2build1) ...
Selecting previously unselected package libdatrie1:amd64.
Preparing to unpack .../082-libdatrie1_0.2.13-3build1_amd64.deb ...
Unpacking libdatrie1:amd64 (0.2.13-3build1) ...
Selecting previously unselected package libthai0:amd64.
Preparing to unpack .../083-libthai0_0.1.29-2build1_amd64.deb ...
Unpacking libthai0:amd64 (0.1.29-2build1) ...
Selecting previously unselected package libpango-1.0-0:amd64.
Preparing to unpack .../084-libpango-1.0-0_1.52.1+ds-1build1_amd64.deb ...
Unpacking libpango-1.0-0:amd64 (1.52.1+ds-1build1) ...
Selecting previously unselected package libpangoft2-1.0-0:amd64.
Preparing to unpack .../085-libpangoft2-1.0-0_1.52.1+ds-1build1_amd64.deb ...
Unpacking libpangoft2-1.0-0:amd64 (1.52.1+ds-1build1) ...
Selecting previously unselected package libpangocairo-1.0-0:amd64.
Preparing to unpack .../086-libpangocairo-1.0-0_1.52.1+ds-1build1_amd64.deb ...
Unpacking libpangocairo-1.0-0:amd64 (1.52.1+ds-1build1) ...
Selecting previously unselected package libxv1:amd64.
Preparing to unpack .../087-libxv1_2%3a1.0.11-1.1build1_amd64.deb ...
Unpacking libxv1:amd64 (2:1.0.11-1.1build1) ...
Selecting previously unselected package gstreamer1.0-x:amd64.
Preparing to unpack .../088-gstreamer1.0-x_1.24.2-1ubuntu0.3_amd64.deb ...
Unpacking gstreamer1.0-x:amd64 (1.24.2-1ubuntu0.3) ...
Selecting previously unselected package libva2:amd64.
Preparing to unpack .../089-libva2_2.20.0-2ubuntu0.1_amd64.deb ...
Unpacking libva2:amd64 (2.20.0-2ubuntu0.1) ...
Selecting previously unselected package libigdgmm12:amd64.
Preparing to unpack .../090-libigdgmm12_22.3.17+ds1-1_amd64.deb ...
Unpacking libigdgmm12:amd64 (22.3.17+ds1-1) ...
Selecting previously unselected package intel-media-va-driver:amd64.
Preparing to unpack .../091-intel-media-va-driver_24.1.0+dfsg1-1ubuntu0.1_amd64.deb ...
Unpacking intel-media-va-driver:amd64 (24.1.0+dfsg1-1ubuntu0.1) ...
Selecting previously unselected package ipxe-qemu.
Preparing to unpack .../092-ipxe-qemu_1.21.1+git-20220113.fbbdc3926-0ubuntu2_all.deb ...
Unpacking ipxe-qemu (1.21.1+git-20220113.fbbdc3926-0ubuntu2) ...
Selecting previously unselected package ipxe-qemu-256k-compat-efi-roms.
Preparing to unpack .../093-ipxe-qemu-256k-compat-efi-roms_1.0.0+git-20150424.a25a16d-0ubuntu5_all.deb ...
Unpacking ipxe-qemu-256k-compat-efi-roms (1.0.0+git-20150424.a25a16d-0ubuntu5) ...
Selecting previously unselected package libatk1.0-0t64:amd64.
Preparing to unpack .../094-libatk1.0-0t64_2.52.0-1build1_amd64.deb ...
Unpacking libatk1.0-0t64:amd64 (2.52.0-1build1) ...
Selecting previously unselected package libatk-bridge2.0-0t64:amd64.
Preparing to unpack .../095-libatk-bridge2.0-0t64_2.52.0-1build1_amd64.deb ...
Unpacking libatk-bridge2.0-0t64:amd64 (2.52.0-1build1) ...
Selecting previously unselected package libavahi-common-data:amd64.
Preparing to unpack .../096-libavahi-common-data_0.8-13ubuntu6.1_amd64.deb ...
Unpacking libavahi-common-data:amd64 (0.8-13ubuntu6.1) ...
Selecting previously unselected package libavahi-common3:amd64.
Preparing to unpack .../097-libavahi-common3_0.8-13ubuntu6.1_amd64.deb ...
Unpacking libavahi-common3:amd64 (0.8-13ubuntu6.1) ...
Selecting previously unselected package libavahi-client3:amd64.
Preparing to unpack .../098-libavahi-client3_0.8-13ubuntu6.1_amd64.deb ...
Unpacking libavahi-client3:amd64 (0.8-13ubuntu6.1) ...
Selecting previously unselected package libboost-iostreams1.83.0:amd64.
Preparing to unpack .../099-libboost-iostreams1.83.0_1.83.0-2.1ubuntu3.2_amd64.deb ...
Unpacking libboost-iostreams1.83.0:amd64 (1.83.0-2.1ubuntu3.2) ...
Selecting previously unselected package libboost-thread1.83.0:amd64.
Preparing to unpack .../100-libboost-thread1.83.0_1.83.0-2.1ubuntu3.2_amd64.deb ...
Unpacking libboost-thread1.83.0:amd64 (1.83.0-2.1ubuntu3.2) ...
Selecting previously unselected package libbrlapi0.8:amd64.
Preparing to unpack .../101-libbrlapi0.8_6.6-4ubuntu5_amd64.deb ...
Unpacking libbrlapi0.8:amd64 (6.6-4ubuntu5) ...
Selecting previously unselected package libburn4t64:amd64.
Preparing to unpack .../102-libburn4t64_1.5.6-1.1build1_amd64.deb ...
Unpacking libburn4t64:amd64 (1.5.6-1.1build1) ...
Selecting previously unselected package libpcsclite1:amd64.
Preparing to unpack .../103-libpcsclite1_2.0.3-1build1_amd64.deb ...
Unpacking libpcsclite1:amd64 (2.0.3-1build1) ...
Selecting previously unselected package libcacard0:amd64.
Preparing to unpack .../104-libcacard0_1%3a2.8.0-3build4_amd64.deb ...
Unpacking libcacard0:amd64 (1:2.8.0-3build4) ...
Selecting previously unselected package liblcms2-2:amd64.
Preparing to unpack .../105-liblcms2-2_2.14-2build1_amd64.deb ...
Unpacking liblcms2-2:amd64 (2.14-2build1) ...
Selecting previously unselected package libcolord2:amd64.
Preparing to unpack .../106-libcolord2_1.4.7-1build2_amd64.deb ...
Unpacking libcolord2:amd64 (1.4.7-1build2) ...
Selecting previously unselected package libcups2t64:amd64.
Preparing to unpack .../107-libcups2t64_2.4.7-1.2ubuntu7.9_amd64.deb ...
Unpacking libcups2t64:amd64 (2.4.7-1.2ubuntu7.9) ...
Selecting previously unselected package libdaxctl1:amd64.
Preparing to unpack .../108-libdaxctl1_77-2ubuntu2_amd64.deb ...
Unpacking libdaxctl1:amd64 (77-2ubuntu2) ...
Selecting previously unselected package libwayland-client0:amd64.
Preparing to unpack .../109-libwayland-client0_1.22.0-2.1build1_amd64.deb ...
Unpacking libwayland-client0:amd64 (1.22.0-2.1build1) ...
Selecting previously unselected package libdecor-0-0:amd64.
Preparing to unpack .../110-libdecor-0-0_0.2.2-1build2_amd64.deb ...
Unpacking libdecor-0-0:amd64 (0.2.2-1build2) ...
Selecting previously unselected package libepoxy0:amd64.
Preparing to unpack .../111-libepoxy0_1.5.10-1build1_amd64.deb ...
Unpacking libepoxy0:amd64 (1.5.10-1build1) ...
Selecting previously unselected package libwayland-cursor0:amd64.
Preparing to unpack .../112-libwayland-cursor0_1.22.0-2.1build1_amd64.deb ...
Unpacking libwayland-cursor0:amd64 (1.22.0-2.1build1) ...
Selecting previously unselected package libwayland-egl1:amd64.
Preparing to unpack .../113-libwayland-egl1_1.22.0-2.1build1_amd64.deb ...
Unpacking libwayland-egl1:amd64 (1.22.0-2.1build1) ...
Selecting previously unselected package libxcomposite1:amd64.
Preparing to unpack .../114-libxcomposite1_1%3a0.4.5-1build3_amd64.deb ...
Unpacking libxcomposite1:amd64 (1:0.4.5-1build3) ...
Selecting previously unselected package libxcursor1:amd64.
Preparing to unpack .../115-libxcursor1_1%3a1.2.1-1build1_amd64.deb ...
Unpacking libxcursor1:amd64 (1:1.2.1-1build1) ...
Selecting previously unselected package libxinerama1:amd64.
Preparing to unpack .../116-libxinerama1_2%3a1.1.4-3build1_amd64.deb ...
Unpacking libxinerama1:amd64 (2:1.1.4-3build1) ...
Selecting previously unselected package libxrandr2:amd64.
Preparing to unpack .../117-libxrandr2_2%3a1.5.2-2build1_amd64.deb ...
Unpacking libxrandr2:amd64 (2:1.5.2-2build1) ...
Selecting previously unselected package libgtk-3-common.
Preparing to unpack .../118-libgtk-3-common_3.24.41-4ubuntu1.3_all.deb ...
Unpacking libgtk-3-common (3.24.41-4ubuntu1.3) ...
Selecting previously unselected package libgtk-3-0t64:amd64.
Preparing to unpack .../119-libgtk-3-0t64_3.24.41-4ubuntu1.3_amd64.deb ...
Unpacking libgtk-3-0t64:amd64 (3.24.41-4ubuntu1.3) ...
Selecting previously unselected package libdecor-0-plugin-1-gtk:amd64.
Preparing to unpack .../120-libdecor-0-plugin-1-gtk_0.2.2-1build2_amd64.deb ...
Unpacking libdecor-0-plugin-1-gtk:amd64 (0.2.2-1build2) ...
Selecting previously unselected package libdrm-amdgpu1:amd64.
Preparing to unpack .../121-libdrm-amdgpu1_2.4.125-1ubuntu0.1~24.04.1_amd64.deb ...
Unpacking libdrm-amdgpu1:amd64 (2.4.125-1ubuntu0.1~24.04.1) ...
Selecting previously unselected package libpciaccess0:amd64.
Preparing to unpack .../122-libpciaccess0_0.17-3ubuntu0.24.04.2_amd64.deb ...
Unpacking libpciaccess0:amd64 (0.17-3ubuntu0.24.04.2) ...
Selecting previously unselected package libdrm-intel1:amd64.
Preparing to unpack .../123-libdrm-intel1_2.4.125-1ubuntu0.1~24.04.1_amd64.deb ...
Unpacking libdrm-intel1:amd64 (2.4.125-1ubuntu0.1~24.04.1) ...
Selecting previously unselected package libllvm20:amd64.
Preparing to unpack .../124-libllvm20_1%3a20.1.2-0ubuntu1~24.04.2_amd64.deb ...
Unpacking libllvm20:amd64 (1:20.1.2-0ubuntu1~24.04.2) ...
Selecting previously unselected package libxcb-dri3-0:amd64.
Preparing to unpack .../125-libxcb-dri3-0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-dri3-0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxcb-present0:amd64.
Preparing to unpack .../126-libxcb-present0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-present0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxcb-randr0:amd64.
Preparing to unpack .../127-libxcb-randr0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-randr0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxcb-sync1:amd64.
Preparing to unpack .../128-libxcb-sync1_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-sync1:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxcb-xfixes0:amd64.
Preparing to unpack .../129-libxcb-xfixes0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-xfixes0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxshmfence1:amd64.
Preparing to unpack .../130-libxshmfence1_1.3-1build5_amd64.deb ...
Unpacking libxshmfence1:amd64 (1.3-1build5) ...
Selecting previously unselected package mesa-libgallium:amd64.
Preparing to unpack .../131-mesa-libgallium_25.2.8-0ubuntu0.24.04.1_amd64.deb ...
Unpacking mesa-libgallium:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Selecting previously unselected package libgbm1:amd64.
Preparing to unpack .../132-libgbm1_25.2.8-0ubuntu0.24.04.1_amd64.deb ...
Unpacking libgbm1:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Selecting previously unselected package libgdk-pixbuf2.0-bin.
Preparing to unpack .../133-libgdk-pixbuf2.0-bin_2.42.10+dfsg-3ubuntu3.2_amd64.deb ...
Unpacking libgdk-pixbuf2.0-bin (2.42.10+dfsg-3ubuntu3.2) ...
Selecting previously unselected package libvulkan1:amd64.
Preparing to unpack .../134-libvulkan1_1.3.275.0-1build1_amd64.deb ...
Unpacking libvulkan1:amd64 (1.3.275.0-1build1) ...
Selecting previously unselected package libgl1-mesa-dri:amd64.
Preparing to unpack .../135-libgl1-mesa-dri_25.2.8-0ubuntu0.24.04.1_amd64.deb ...
Unpacking libgl1-mesa-dri:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Selecting previously unselected package libxcb-glx0:amd64.
Preparing to unpack .../136-libxcb-glx0_1.15-1ubuntu2_amd64.deb ...
Unpacking libxcb-glx0:amd64 (1.15-1ubuntu2) ...
Selecting previously unselected package libxxf86vm1:amd64.
Preparing to unpack .../137-libxxf86vm1_1%3a1.1.4-1build4_amd64.deb ...
Unpacking libxxf86vm1:amd64 (1:1.1.4-1build4) ...
Selecting previously unselected package libglx-mesa0:amd64.
Preparing to unpack .../138-libglx-mesa0_25.2.8-0ubuntu0.24.04.1_amd64.deb ...
Unpacking libglx-mesa0:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Selecting previously unselected package libgtk-3-bin.
Preparing to unpack .../139-libgtk-3-bin_3.24.41-4ubuntu1.3_amd64.deb ...
Unpacking libgtk-3-bin (3.24.41-4ubuntu1.3) ...
Selecting previously unselected package libgvnc-1.0-0:amd64.
Preparing to unpack .../140-libgvnc-1.0-0_1.3.1-1build2_amd64.deb ...
Unpacking libgvnc-1.0-0:amd64 (1.3.1-1build2) ...
Selecting previously unselected package libgtk-vnc-2.0-0:amd64.
Preparing to unpack .../141-libgtk-vnc-2.0-0_1.3.1-1build2_amd64.deb ...
Unpacking libgtk-vnc-2.0-0:amd64 (1.3.1-1build2) ...
Selecting previously unselected package librdmacm1t64:amd64.
Preparing to unpack .../142-librdmacm1t64_50.0-2ubuntu0.2_amd64.deb ...
Unpacking librdmacm1t64:amd64 (50.0-2ubuntu0.2) ...
Selecting previously unselected package libiscsi7:amd64.
Preparing to unpack .../143-libiscsi7_1.19.0-3build4_amd64.deb ...
Unpacking libiscsi7:amd64 (1.19.0-3build4) ...
Selecting previously unselected package libisofs6t64:amd64.
Preparing to unpack .../144-libisofs6t64_1.5.6.pl01-1.1ubuntu2_amd64.deb ...
Unpacking libisofs6t64:amd64 (1.5.6.pl01-1.1ubuntu2) ...
Selecting previously unselected package libisoburn1t64:amd64.
Preparing to unpack .../145-libisoburn1t64_1%3a1.5.6-1.1ubuntu3_amd64.deb ...
Unpacking libisoburn1t64:amd64 (1:1.5.6-1.1ubuntu3) ...
Selecting previously unselected package libsamplerate0:amd64.
Preparing to unpack .../146-libsamplerate0_0.2.2-4build1_amd64.deb ...
Unpacking libsamplerate0:amd64 (0.2.2-4build1) ...
Selecting previously unselected package libjack-jackd2-0:amd64.
Preparing to unpack .../147-libjack-jackd2-0_1.9.21~dfsg-3ubuntu3_amd64.deb ...
Unpacking libjack-jackd2-0:amd64 (1.9.21~dfsg-3ubuntu3) ...
Selecting previously unselected package libndctl6:amd64.
Preparing to unpack .../148-libndctl6_77-2ubuntu2_amd64.deb ...
Unpacking libndctl6:amd64 (77-2ubuntu2) ...
Selecting previously unselected package libnfs14:amd64.
Preparing to unpack .../149-libnfs14_5.0.2-1build1_amd64.deb ...
Unpacking libnfs14:amd64 (5.0.2-1build1) ...
Selecting previously unselected package libphodav-3.0-common.
Preparing to unpack .../150-libphodav-3.0-common_3.0-8build3_all.deb ...
Unpacking libphodav-3.0-common (3.0-8build3) ...
Selecting previously unselected package libphodav-3.0-0:amd64.
Preparing to unpack .../151-libphodav-3.0-0_3.0-8build3_amd64.deb ...
Unpacking libphodav-3.0-0:amd64 (3.0-8build3) ...
Selecting previously unselected package libwebrtc-audio-processing1:amd64.
Preparing to unpack .../152-libwebrtc-audio-processing1_0.3.1-0ubuntu6_amd64.deb ...
Unpacking libwebrtc-audio-processing1:amd64 (0.3.1-0ubuntu6) ...
Selecting previously unselected package libspa-0.2-modules:amd64.
Preparing to unpack .../153-libspa-0.2-modules_1.0.5-1ubuntu3.2_amd64.deb ...
Unpacking libspa-0.2-modules:amd64 (1.0.5-1ubuntu3.2) ...
Selecting previously unselected package libpipewire-0.3-0t64:amd64.
Preparing to unpack .../154-libpipewire-0.3-0t64_1.0.5-1ubuntu3.2_amd64.deb ...
Unpacking libpipewire-0.3-0t64:amd64 (1.0.5-1ubuntu3.2) ...
Selecting previously unselected package libpipewire-0.3-common.
Preparing to unpack .../155-libpipewire-0.3-common_1.0.5-1ubuntu3.2_all.deb ...
Unpacking libpipewire-0.3-common (1.0.5-1ubuntu3.2) ...
Selecting previously unselected package libpmem1:amd64.
Preparing to unpack .../156-libpmem1_1.13.1-1.1ubuntu2_amd64.deb ...
Unpacking libpmem1:amd64 (1.13.1-1.1ubuntu2) ...
Selecting previously unselected package libpmemobj1:amd64.
Preparing to unpack .../157-libpmemobj1_1.13.1-1.1ubuntu2_amd64.deb ...
Unpacking libpmemobj1:amd64 (1.13.1-1.1ubuntu2) ...
Selecting previously unselected package librados2.
Preparing to unpack .../158-librados2_19.2.3-0ubuntu0.24.04.2_amd64.deb ...
Unpacking librados2 (19.2.3-0ubuntu0.24.04.2) ...
Selecting previously unselected package librbd1.
Preparing to unpack .../159-librbd1_19.2.3-0ubuntu0.24.04.2_amd64.deb ...
Unpacking librbd1 (19.2.3-0ubuntu0.24.04.2) ...
Selecting previously unselected package librsvg2-2:amd64.
Preparing to unpack .../160-librsvg2-2_2.58.0+dfsg-1build1_amd64.deb ...
Unpacking librsvg2-2:amd64 (2.58.0+dfsg-1build1) ...
Selecting previously unselected package librsvg2-common:amd64.
Preparing to unpack .../161-librsvg2-common_2.58.0+dfsg-1build1_amd64.deb ...
Unpacking librsvg2-common:amd64 (2.58.0+dfsg-1build1) ...
Selecting previously unselected package libxss1:amd64.
Preparing to unpack .../162-libxss1_1%3a1.2.3-1build3_amd64.deb ...
Unpacking libxss1:amd64 (1:1.2.3-1build3) ...
Selecting previously unselected package libsdl2-2.0-0:amd64.
Preparing to unpack .../163-libsdl2-2.0-0_2.30.0+dfsg-1ubuntu3.1_amd64.deb ...
Unpacking libsdl2-2.0-0:amd64 (2.30.0+dfsg-1ubuntu3.1) ...
Selecting previously unselected package libslirp0:amd64.
Preparing to unpack .../164-libslirp0_4.7.0-1ubuntu3_amd64.deb ...
Unpacking libslirp0:amd64 (4.7.0-1ubuntu3) ...
Selecting previously unselected package spice-client-glib-usb-acl-helper.
Preparing to unpack .../165-spice-client-glib-usb-acl-helper_0.42-2ubuntu2_amd64.deb ...
Unpacking spice-client-glib-usb-acl-helper (0.42-2ubuntu2) ...
Selecting previously unselected package libusbredirparser1t64:amd64.
Preparing to unpack .../166-libusbredirparser1t64_0.13.0-2.1build1_amd64.deb ...
Unpacking libusbredirparser1t64:amd64 (0.13.0-2.1build1) ...
Selecting previously unselected package libusbredirhost1t64:amd64.
Preparing to unpack .../167-libusbredirhost1t64_0.13.0-2.1build1_amd64.deb ...
Unpacking libusbredirhost1t64:amd64 (0.13.0-2.1build1) ...
Selecting previously unselected package libspice-client-glib-2.0-8:amd64.
Preparing to unpack .../168-libspice-client-glib-2.0-8_0.42-2ubuntu2_amd64.deb ...
Unpacking libspice-client-glib-2.0-8:amd64 (0.42-2ubuntu2) ...
Selecting previously unselected package libva-x11-2:amd64.
Preparing to unpack .../169-libva-x11-2_2.20.0-2ubuntu0.1_amd64.deb ...
Unpacking libva-x11-2:amd64 (2.20.0-2ubuntu0.1) ...
Selecting previously unselected package libwayland-server0:amd64.
Preparing to unpack .../170-libwayland-server0_1.22.0-2.1build1_amd64.deb ...
Unpacking libwayland-server0:amd64 (1.22.0-2.1build1) ...
Selecting previously unselected package libspice-client-gtk-3.0-5:amd64.
Preparing to unpack .../171-libspice-client-gtk-3.0-5_0.42-2ubuntu2_amd64.deb ...
Unpacking libspice-client-gtk-3.0-5:amd64 (0.42-2ubuntu2) ...
Selecting previously unselected package libspice-server1:amd64.
Preparing to unpack .../172-libspice-server1_0.15.1-1build2_amd64.deb ...
Unpacking libspice-server1:amd64 (0.15.1-1build2) ...
Selecting previously unselected package libtpms0:amd64.
Preparing to unpack .../173-libtpms0_0.9.3-0ubuntu4.24.04.1_amd64.deb ...
Unpacking libtpms0:amd64 (0.9.3-0ubuntu4.24.04.1) ...
Selecting previously unselected package liburing2:amd64.
Preparing to unpack .../174-liburing2_2.5-1build1_amd64.deb ...
Unpacking liburing2:amd64 (2.5-1build1) ...
Selecting previously unselected package libvirglrenderer1:amd64.
Preparing to unpack .../175-libvirglrenderer1_1.0.0-1ubuntu2_amd64.deb ...
Unpacking libvirglrenderer1:amd64 (1.0.0-1ubuntu2) ...
Selecting previously unselected package libyajl2:amd64.
Preparing to unpack .../176-libyajl2_2.1.0-5build1_amd64.deb ...
Unpacking libyajl2:amd64 (2.1.0-5build1) ...
Selecting previously unselected package libvirt0:amd64.
Preparing to unpack .../177-libvirt0_10.0.0-2ubuntu8.11_amd64.deb ...
Unpacking libvirt0:amd64 (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-clients.
Preparing to unpack .../178-libvirt-clients_10.0.0-2ubuntu8.11_amd64.deb ...
Unpacking libvirt-clients (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-daemon-driver-qemu.
Preparing to unpack .../179-libvirt-daemon-driver-qemu_10.0.0-2ubuntu8.11_amd64.deb ...
Unpacking libvirt-daemon-driver-qemu (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-daemon.
Preparing to unpack .../180-libvirt-daemon_10.0.0-2ubuntu8.11_amd64.deb ...
Unpacking libvirt-daemon (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-daemon-config-network.
Preparing to unpack .../181-libvirt-daemon-config-network_10.0.0-2ubuntu8.11_all.deb ...
Unpacking libvirt-daemon-config-network (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-daemon-config-nwfilter.
Preparing to unpack .../182-libvirt-daemon-config-nwfilter_10.0.0-2ubuntu8.11_all.deb ...
Unpacking libvirt-daemon-config-nwfilter (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package systemd-container.
Preparing to unpack .../183-systemd-container_255.4-1ubuntu8.12_amd64.deb ...
Unpacking systemd-container (255.4-1ubuntu8.12) ...
Selecting previously unselected package libvirt-daemon-system-systemd.
Preparing to unpack .../184-libvirt-daemon-system-systemd_10.0.0-2ubuntu8.11_all.deb ...
Unpacking libvirt-daemon-system-systemd (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-daemon-system.
Preparing to unpack .../185-libvirt-daemon-system_10.0.0-2ubuntu8.11_amd64.deb ...
Unpacking libvirt-daemon-system (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvirt-glib-1.0-data.
Preparing to unpack .../186-libvirt-glib-1.0-data_5.0.0-2build3_all.deb ...
Unpacking libvirt-glib-1.0-data (5.0.0-2build3) ...
Selecting previously unselected package libvirt-l10n.
Preparing to unpack .../187-libvirt-l10n_10.0.0-2ubuntu8.11_all.deb ...
Unpacking libvirt-l10n (10.0.0-2ubuntu8.11) ...
Selecting previously unselected package libvte-2.91-common.
Preparing to unpack .../188-libvte-2.91-common_0.76.0-1ubuntu0.1_amd64.deb ...
Unpacking libvte-2.91-common (0.76.0-1ubuntu0.1) ...
Selecting previously unselected package libvte-2.91-0:amd64.
Preparing to unpack .../189-libvte-2.91-0_0.76.0-1ubuntu0.1_amd64.deb ...
Unpacking libvte-2.91-0:amd64 (0.76.0-1ubuntu0.1) ...
Selecting previously unselected package libxml2-utils.
Preparing to unpack .../190-libxml2-utils_2.9.14+dfsg-1.3ubuntu3.7_amd64.deb ...
Unpacking libxml2-utils (2.9.14+dfsg-1.3ubuntu3.7) ...
Selecting previously unselected package mdevctl.
Preparing to unpack .../191-mdevctl_1.3.0-1ubuntu2.1_amd64.deb ...
Unpacking mdevctl (1.3.0-1ubuntu2.1) ...
Selecting previously unselected package mesa-va-drivers:amd64.
Preparing to unpack .../192-mesa-va-drivers_25.2.8-0ubuntu0.24.04.1_amd64.deb ...
Unpacking mesa-va-drivers:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Selecting previously unselected package mesa-vulkan-drivers:amd64.
Preparing to unpack .../193-mesa-vulkan-drivers_25.2.8-0ubuntu0.24.04.1_amd64.deb ...
Unpacking mesa-vulkan-drivers:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Selecting previously unselected package osinfo-db.
Preparing to unpack .../194-osinfo-db_0.20250606-0ubuntu0.24.04.1_all.deb ...
Unpacking osinfo-db (0.20250606-0ubuntu0.24.04.1) ...
Selecting previously unselected package python3-libvirt.
Preparing to unpack .../195-python3-libvirt_10.0.0-1build1_amd64.deb ...
Unpacking python3-libvirt (10.0.0-1build1) ...
Selecting previously unselected package python3-libxml2:amd64.
Preparing to unpack .../196-python3-libxml2_2.9.14+dfsg-1.3ubuntu3.7_amd64.deb ...
Unpacking python3-libxml2:amd64 (2.9.14+dfsg-1.3ubuntu3.7) ...
Selecting previously unselected package libfdt1:amd64.
Preparing to unpack .../197-libfdt1_1.7.0-2build1_amd64.deb ...
Unpacking libfdt1:amd64 (1.7.0-2build1) ...
Selecting previously unselected package qemu-system-common.
Preparing to unpack .../198-qemu-system-common_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-system-common (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package qemu-system-data.
Preparing to unpack .../199-qemu-system-data_1%3a8.2.2+ds-0ubuntu1.12_all.deb ...
Unpacking qemu-system-data (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package seabios.
Preparing to unpack .../200-seabios_1.16.3-2_all.deb ...
Unpacking seabios (1.16.3-2) ...
Selecting previously unselected package qemu-system-x86.
Preparing to unpack .../201-qemu-system-x86_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-system-x86 (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package qemu-utils.
Preparing to unpack .../202-qemu-utils_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-utils (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package qemu-block-extra.
Preparing to unpack .../203-qemu-block-extra_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-block-extra (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package qemu-system-modules-opengl.
Preparing to unpack .../204-qemu-system-modules-opengl_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-system-modules-opengl (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package libglvnd0:amd64.
Preparing to unpack .../205-libglvnd0_1.7.0-1build1_amd64.deb ...
Unpacking libglvnd0:amd64 (1.7.0-1build1) ...
Selecting previously unselected package libglx0:amd64.
Preparing to unpack .../206-libglx0_1.7.0-1build1_amd64.deb ...
Unpacking libglx0:amd64 (1.7.0-1build1) ...
Selecting previously unselected package libgl1:amd64.
Preparing to unpack .../207-libgl1_1.7.0-1build1_amd64.deb ...
Unpacking libgl1:amd64 (1.7.0-1build1) ...
Selecting previously unselected package qemu-system-gui.
Preparing to unpack .../208-qemu-system-gui_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-system-gui (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package qemu-system-modules-spice.
Preparing to unpack .../209-qemu-system-modules-spice_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
Unpacking qemu-system-modules-spice (1:8.2.2+ds-0ubuntu1.12) ...
Selecting previously unselected package swtpm.
Preparing to unpack .../210-swtpm_0.7.3-0ubuntu5.24.04.1_amd64.deb ...
Unpacking swtpm (0.7.3-0ubuntu5.24.04.1) ...
Selecting previously unselected package swtpm-tools.
Preparing to unpack .../211-swtpm-tools_0.7.3-0ubuntu5.24.04.1_amd64.deb ...
Unpacking swtpm-tools (0.7.3-0ubuntu5.24.04.1) ...
Selecting previously unselected package i965-va-driver:amd64.
Preparing to unpack .../212-i965-va-driver_2.4.1+dfsg1-1ubuntu0.1_amd64.deb ...
Unpacking i965-va-driver:amd64 (2.4.1+dfsg1-1ubuntu0.1) ...
Selecting previously unselected package va-driver-all:amd64.
Preparing to unpack .../213-va-driver-all_2.20.0-2ubuntu0.1_amd64.deb ...
Unpacking va-driver-all:amd64 (2.20.0-2ubuntu0.1) ...
Selecting previously unselected package libvirt-glib-1.0-0:amd64.
Preparing to unpack .../214-libvirt-glib-1.0-0_5.0.0-2build3_amd64.deb ...
Unpacking libvirt-glib-1.0-0:amd64 (5.0.0-2build3) ...
Selecting previously unselected package virt-viewer.
Preparing to unpack .../215-virt-viewer_11.0-3build2_amd64.deb ...
Unpacking virt-viewer (11.0-3build2) ...
Selecting previously unselected package xorriso.
Preparing to unpack .../216-xorriso_1%3a1.5.6-1.1ubuntu3_amd64.deb ...
Unpacking xorriso (1:1.5.6-1.1ubuntu3) ...
Selecting previously unselected package cloud-image-utils.
Preparing to unpack .../217-cloud-image-utils_0.33-1_all.deb ...
Unpacking cloud-image-utils (0.33-1) ...
Selecting previously unselected package libosinfo-l10n.
Preparing to unpack .../218-libosinfo-l10n_1.11.0-2build3_all.deb ...
Unpacking libosinfo-l10n (1.11.0-2build3) ...
Selecting previously unselected package libosinfo-1.0-0:amd64.
Preparing to unpack .../219-libosinfo-1.0-0_1.11.0-2build3_amd64.deb ...
Unpacking libosinfo-1.0-0:amd64 (1.11.0-2build3) ...
Selecting previously unselected package gir1.2-libosinfo-1.0:amd64.
Preparing to unpack .../220-gir1.2-libosinfo-1.0_1.11.0-2build3_amd64.deb ...
Unpacking gir1.2-libosinfo-1.0:amd64 (1.11.0-2build3) ...
Selecting previously unselected package libnss-mymachines:amd64.
Preparing to unpack .../221-libnss-mymachines_255.4-1ubuntu8.12_amd64.deb ...
Unpacking libnss-mymachines:amd64 (255.4-1ubuntu8.12) ...
Selecting previously unselected package ovmf.
Preparing to unpack .../222-ovmf_2024.02-2ubuntu0.7_all.deb ...
Unpacking ovmf (2024.02-2ubuntu0.7) ...
Selecting previously unselected package virtinst.
Preparing to unpack .../223-virtinst_1%3a4.1.0-3ubuntu0.1_all.deb ...
Unpacking virtinst (1:4.1.0-3ubuntu0.1) ...
Setting up libpipewire-0.3-common (1.0.5-1ubuntu3.2) ...
Setting up genisoimage (9:1.1.11-3.5) ...
Setting up libgraphite2-3:amd64 (1.3.14-2build1) ...
Setting up libxcb-dri3-0:amd64 (1.15-1ubuntu2) ...
Setting up liblcms2-2:amd64 (2.14-2build1) ...
Setting up libpixman-1-0:amd64 (0.42.2-1build1) ...
Setting up libcdparanoia0:amd64 (3.10.2+debian-14build3) ...
Setting up libwayland-server0:amd64 (1.22.0-2.1build1) ...
Setting up libx11-xcb1:amd64 (2:1.8.7-1build1) ...
Setting up libpciaccess0:amd64 (0.17-3ubuntu0.24.04.2) ...
Setting up session-migration (0.3.9build1) ...
Created symlink /etc/systemd/user/graphical-session-pre.target.wants/session-migration.service → /usr/lib/systemd/user/session-migration.service.
Setting up fontconfig (2.15.0-1.1ubuntu2) ...
Regenerating fonts cache... done.
Setting up libraw1394-11:amd64 (2.1.2-2build3) ...
Setting up libproxy1v5:amd64 (0.5.4-4build1) ...
Setting up libtag1v5-vanilla:amd64 (1.13.1-1build1) ...
Setting up libxdamage1:amd64 (1:1.1.6-1build1) ...
Setting up libxcb-xfixes0:amd64 (1.15-1ubuntu2) ...
Setting up libogg0:amd64 (1.3.5-3build1) ...
Setting up libphodav-3.0-common (3.0-8build3) ...
Setting up libspeex1:amd64 (1.2.1-2ubuntu2.24.04.1) ...
Setting up libcaca0:amd64 (0.99.beta20-4ubuntu0.1) ...
Setting up libv4lconvert0t64:amd64 (1.26.1-4build3) ...
Setting up hicolor-icon-theme (0.17-2) ...
Setting up libxi6:amd64 (2:1.8.1-1build1) ...
Setting up libtwolame0:amd64 (0.4.0-2build3) ...
Setting up libxrender1:amd64 (1:0.9.10-1.1build1) ...
Setting up libvte-2.91-common (0.76.0-1ubuntu0.1) ...
Setting up libdatrie1:amd64 (0.2.13-3build1) ...
Setting up libvisual-0.4-0:amd64 (0.4.2-2build1) ...
Setting up libxcb-render0:amd64 (1.15-1ubuntu2) ...
Setting up libglvnd0:amd64 (1.7.0-1build1) ...
Setting up libxcb-glx0:amd64 (1.15-1ubuntu2) ...
Setting up libdrm-intel1:amd64 (2.4.125-1ubuntu0.1~24.04.1) ...
Setting up libgdk-pixbuf2.0-common (2.42.10+dfsg-3ubuntu3.2) ...
Setting up spice-client-glib-usb-acl-helper (0.42-2ubuntu2) ...
Setting up libyajl2:amd64 (2.1.0-5build1) ...
Setting up x11-common (1:7.7+23ubuntu3) ...
Setting up msr-tools (1.3-5build1) ...
Setting up libwebrtc-audio-processing1:amd64 (0.3.1-0ubuntu6) ...
Setting up libboost-thread1.83.0:amd64 (1.83.0-2.1ubuntu3.2) ...
Setting up libxcb-shm0:amd64 (1.15-1ubuntu2) ...
Setting up libigdgmm12:amd64 (22.3.17+ds1-1) ...
Setting up libsoup-3.0-common (3.4.4-5ubuntu0.6) ...
Setting up dnsmasq-base (2.90-2ubuntu0.1) ...
Setting up libmpg123-0t64:amd64 (1.32.5-1ubuntu1.1) ...
Setting up libfdt1:amd64 (1.7.0-2build1) ...
Setting up libcairo2:amd64 (1.18.0-3build1) ...
Setting up libcolord2:amd64 (1.4.7-1build2) ...
Setting up libnfs14:amd64 (5.0.2-1build1) ...
Setting up libxxf86vm1:amd64 (1:1.1.4-1build4) ...
Setting up liborc-0.4-0t64:amd64 (1:0.4.38-1ubuntu0.1) ...
Setting up acl (2.3.2-1build1.1) ...
Setting up ovmf (2024.02-2ubuntu0.7) ...
Setting up dns-root-data (2024071801~ubuntu0.24.04.1) ...
Setting up libxcb-present0:amd64 (1.15-1ubuntu2) ...
Setting up libdconf1:amd64 (0.40.0-4ubuntu0.1) ...
Setting up python3-libxml2:amd64 (2.9.14+dfsg-1.3ubuntu3.7) ...
Setting up libasound2-data (1.2.11-1ubuntu0.1) ...
Setting up libasound2t64:amd64 (1.2.11-1ubuntu0.1) ...
Setting up libvirt-glib-1.0-data (5.0.0-2build3) ...
Setting up libva2:amd64 (2.20.0-2ubuntu0.1) ...
Setting up libepoxy0:amd64 (1.5.10-1build1) ...
Setting up libspa-0.2-modules:amd64 (1.0.5-1ubuntu3.2) ...
Setting up libxfixes3:amd64 (1:6.0.0-2build1) ...
Setting up libxcb-sync1:amd64 (1.15-1ubuntu2) ...
Setting up libboost-iostreams1.83.0:amd64 (1.83.0-2.1ubuntu3.2) ...
Setting up libavahi-common-data:amd64 (0.8-13ubuntu6.1) ...
Setting up libatspi2.0-0t64:amd64 (2.52.0-1build1) ...
Setting up libopus0:amd64 (1.4-1build1) ...
Setting up libxinerama1:amd64 (2:1.1.4-3build1) ...
Setting up intel-media-va-driver:amd64 (24.1.0+dfsg1-1ubuntu0.1) ...
Setting up libxv1:amd64 (2:1.0.11-1.1build1) ...
Setting up libvorbis0a:amd64 (1.3.7-1build3) ...
Setting up libxrandr2:amd64 (2:1.5.2-2build1) ...
Setting up libllvm20:amd64 (1:20.1.2-0ubuntu1~24.04.2) ...
Setting up libdv4t64:amd64 (1.0.0-17.1build1) ...
Setting up osinfo-db (0.20250606-0ubuntu0.24.04.1) ...
Setting up libpcsclite1:amd64 (2.0.3-1build1) ...
Setting up libdaxctl1:amd64 (77-2ubuntu2) ...
Setting up qemu-system-data (1:8.2.2+ds-0ubuntu1.12) ...
Setting up bridge-utils (1.7.1-1ubuntu2) ...
Setting up libvulkan1:amd64 (1.3.275.0-1build1) ...
Setting up seabios (1.16.3-2) ...
Setting up libv4l-0t64:amd64 (1.26.1-4build3) ...
Setting up libvirt0:amd64 (10.0.0-2ubuntu8.11) ...
Setting up systemd-container (255.4-1ubuntu8.12) ...
Created symlink /etc/systemd/system/multi-user.target.wants/machines.target → /usr/lib/systemd/system/machines.target.
Setting up libvpx9:amd64 (1.14.0-1ubuntu2.2) ...
Setting up libslirp0:amd64 (4.7.0-1ubuntu3) ...
Setting up alsa-topology-conf (1.2.5.1-2) ...
Setting up libtag1v5:amd64 (1.13.1-1build1) ...
Setting up libvirt-glib-1.0-0:amd64 (5.0.0-2build3) ...
Setting up cpu-checker (0.7-1.3build2) ...
Setting up libisofs6t64:amd64 (1.5.6.pl01-1.1ubuntu2) ...
Setting up libasyncns0:amd64 (0.8-6build4) ...
Setting up libxshmfence1:amd64 (1.3-1build5) ...
Setting up at-spi2-common (2.52.0-1build1) ...
Setting up libwavpack1:amd64 (5.6.0-1build1) ...
Setting up libusbredirparser1t64:amd64 (0.13.0-2.1build1) ...
Setting up libxcb-randr0:amd64 (1.15-1ubuntu2) ...
Setting up ipxe-qemu (1.21.1+git-20220113.fbbdc3926-0ubuntu2) ...
Setting up libtheora0:amd64 (1.1.1+dfsg.1-16.1build3) ...
Setting up libburn4t64:amd64 (1.5.6-1.1build1) ...
Setting up libndctl6:amd64 (77-2ubuntu2) ...
Setting up librdmacm1t64:amd64 (50.0-2ubuntu0.2) ...
Setting up libharfbuzz0b:amd64 (8.3.0-2build2) ...
Setting up libthai-data (0.1.29-2build1) ...
Setting up ipxe-qemu-256k-compat-efi-roms (1.0.0+git-20150424.a25a16d-0ubuntu5) ...
Setting up libgdk-pixbuf-2.0-0:amd64 (2.42.10+dfsg-3ubuntu3.2) ...
Setting up libcairo-gobject2:amd64 (1.18.0-3build1) ...
Setting up libflac12t64:amd64 (1.4.3+ds-2.1ubuntu2) ...
Setting up libbrlapi0.8:amd64 (6.6-4ubuntu5) ...
Setting up libwayland-egl1:amd64 (1.22.0-2.1build1) ...
Setting up libxss1:amd64 (1:1.2.3-1build3) ...
Setting up libtpms0:amd64 (0.9.3-0ubuntu4.24.04.1) ...
Setting up glib-networking-common (2.80.0-1build1) ...
Setting up liburing2:amd64 (2.5-1build1) ...
Setting up libiscsi7:amd64 (1.19.0-3build4) ...
Setting up libisoburn1t64:amd64 (1:1.5.6-1.1ubuntu3) ...
Setting up libxml2-utils (2.9.14+dfsg-1.3ubuntu3.7) ...
Setting up libvirt-daemon-config-nwfilter (10.0.0-2ubuntu8.11) ...
Setting up xorriso (1:1.5.6-1.1ubuntu3) ...
Setting up libsamplerate0:amd64 (0.2.2-4build1) ...
Setting up libpmem1:amd64 (1.13.1-1.1ubuntu2) ...
Setting up libva-x11-2:amd64 (2.20.0-2ubuntu0.1) ...
Setting up libxcomposite1:amd64 (1:0.4.5-1build3) ...
Setting up libpipewire-0.3-0t64:amd64 (1.0.5-1ubuntu3.2) ...
Setting up libmp3lame0:amd64 (3.100-6build1) ...
Setting up i965-va-driver:amd64 (2.4.1+dfsg1-1ubuntu0.1) ...
Setting up libosinfo-l10n (1.11.0-2build3) ...
Setting up libvorbisenc2:amd64 (1.3.7-1build3) ...
Setting up libaa1:amd64 (1.4p5-51.1) ...
Setting up libiec61883-0:amd64 (1.2.0-6build1) ...
Setting up libdrm-amdgpu1:amd64 (2.4.125-1ubuntu0.1~24.04.1) ...
Setting up mdevctl (1.3.0-1ubuntu2.1) ...
Setting up libwayland-client0:amd64 (1.22.0-2.1build1) ...
Setting up libavc1394-0:amd64 (0.5.4-5build3) ...
Setting up mesa-vulkan-drivers:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Setting up glib-networking-services (2.80.0-1build1) ...
Setting up gtk-update-icon-cache (3.24.41-4ubuntu1.3) ...
Setting up libvirt-daemon-config-network (10.0.0-2ubuntu8.11) ...
Setting up mesa-libgallium:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Setting up librados2 (19.2.3-0ubuntu0.24.04.2) ...
Setting up gir1.2-freedesktop:amd64 (1.80.1-1) ...
Setting up libatk1.0-0t64:amd64 (2.52.0-1build1) ...
Setting up libgbm1:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Setting up alsa-ucm-conf (1.2.10-1ubuntu5.9) ...
Setting up python3-libvirt (10.0.0-1build1) ...
Setting up libxtst6:amd64 (2:1.2.3-1.1build1) ...
Setting up libvirt-clients (10.0.0-2ubuntu8.11) ...
Setting up libxcursor1:amd64 (1:1.2.1-1build1) ...
Setting up libgl1-mesa-dri:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Setting up libavahi-common3:amd64 (0.8-13ubuntu6.1) ...
Setting up libgstreamer-plugins-base1.0-0:amd64 (1.24.2-1ubuntu0.3) ...
Setting up dconf-service (0.40.0-4ubuntu0.1) ...
Setting up libcacard0:amd64 (1:2.8.0-3build4) ...
Setting up libusbredirhost1t64:amd64 (0.13.0-2.1build1) ...
Setting up libthai0:amd64 (0.1.29-2build1) ...
Setting up libgstreamer-plugins-good1.0-0:amd64 (1.24.2-1ubuntu1.2) ...
Setting up gstreamer1.0-plugins-base:amd64 (1.24.2-1ubuntu0.3) ...
Setting up libvirglrenderer1:amd64 (1.0.0-1ubuntu2) ...
Setting up libvirt-l10n (10.0.0-2ubuntu8.11) ...
Setting up libnss-mymachines:amd64 (255.4-1ubuntu8.12) ...
Setting up swtpm (0.7.3-0ubuntu5.24.04.1) ...
Setting up libshout3:amd64 (2.4.6-1build2) ...
Setting up libpmemobj1:amd64 (1.13.1-1.1ubuntu2) ...
Setting up libvirt-daemon-driver-qemu (10.0.0-2ubuntu8.11) ...
Setting up librbd1 (19.2.3-0ubuntu0.24.04.2) ...
Setting up libvirt-daemon-system-systemd (10.0.0-2ubuntu8.11) ...
Setting up libjack-jackd2-0:amd64 (1.9.21~dfsg-3ubuntu3) ...
Setting up libgdk-pixbuf2.0-bin (2.42.10+dfsg-3ubuntu3.2) ...
Setting up libwayland-cursor0:amd64 (1.22.0-2.1build1) ...
Setting up libdecor-0-0:amd64 (0.2.2-1build2) ...
Setting up libsndfile1:amd64 (1.2.2-1ubuntu5.24.04.1) ...
Setting up qemu-utils (1:8.2.2+ds-0ubuntu1.12) ...
Setting up mesa-va-drivers:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Setting up libvirt-daemon (10.0.0-2ubuntu8.11) ...
Setting up qemu-block-extra (1:8.2.2+ds-0ubuntu1.12) ...
Created symlink /etc/systemd/system/multi-user.target.wants/run-qemu.mount → /usr/lib/systemd/system/run-qemu.mount.
Setting up libavahi-client3:amd64 (0.8-13ubuntu6.1) ...
Setting up libatk-bridge2.0-0t64:amd64 (2.52.0-1build1) ...
Setting up libglx-mesa0:amd64 (25.2.8-0ubuntu0.24.04.1) ...
Setting up qemu-system-common (1:8.2.2+ds-0ubuntu1.12) ...
Created symlink /etc/systemd/system/multi-user.target.wants/qemu-kvm.service → /usr/lib/systemd/system/qemu-kvm.service.
Setting up libglx0:amd64 (1.7.0-1build1) ...
Setting up dconf-gsettings-backend:amd64 (0.40.0-4ubuntu0.1) ...
Setting up libpulse0:amd64 (1:16.1+dfsg1-2ubuntu10.1) ...
Setting up libspice-server1:amd64 (0.15.1-1build2) ...
Setting up libpango-1.0-0:amd64 (1.52.1+ds-1build1) ...
Setting up qemu-system-x86 (1:8.2.2+ds-0ubuntu1.12) ...
Setting up cloud-image-utils (0.33-1) ...
Setting up libgvnc-1.0-0:amd64 (1.3.1-1build2) ...
Setting up swtpm-tools (0.7.3-0ubuntu5.24.04.1) ...
info: Selecting GID from range 100 to 999 ...
info: Adding group `swtpm' (GID 112) ...
info: The home dir /var/lib/swtpm you specified can't be accessed: No such file or directory

info: Selecting UID from range 100 to 999 ...

info: Adding system user `swtpm' (UID 109) ...
info: Adding new user `swtpm' (UID 109) with group `swtpm' ...
info: Not creating home directory `/var/lib/swtpm'.
Setting up libgl1:amd64 (1.7.0-1build1) ...
Setting up va-driver-all:amd64 (2.20.0-2ubuntu0.1) ...
Setting up libvirt-daemon-system (10.0.0-2ubuntu8.11) ...
useradd warning: libvirt-qemu's uid 64055 is greater than SYS_UID_MAX 999
Enabling libvirt default network
Created symlink /etc/systemd/system/multi-user.target.wants/libvirtd.service → /usr/lib/systemd/system/libvirtd.service.
Created symlink /etc/systemd/system/sockets.target.wants/virtlockd.socket → /usr/lib/systemd/system/virtlockd.socket.
Created symlink /etc/systemd/system/sockets.target.wants/virtlogd.socket → /usr/lib/systemd/system/virtlogd.socket.
Created symlink /etc/systemd/system/sockets.target.wants/libvirtd.socket → /usr/lib/systemd/system/libvirtd.socket.
Created symlink /etc/systemd/system/sockets.target.wants/libvirtd-ro.socket → /usr/lib/systemd/system/libvirtd-ro.socket.
Created symlink /etc/systemd/system/sockets.target.wants/libvirtd-admin.socket → /usr/lib/systemd/system/libvirtd-admin.socket.
Created symlink /etc/systemd/system/sockets.target.wants/virtlockd-admin.socket → /usr/lib/systemd/system/virtlockd-admin.socket.
Created symlink /etc/systemd/system/sockets.target.wants/virtlogd-admin.socket → /usr/lib/systemd/system/virtlogd-admin.socket.
Created symlink /etc/systemd/system/multi-user.target.wants/libvirt-guests.service → /usr/lib/systemd/system/libvirt-guests.service.
Created symlink /etc/systemd/system/multi-user.target.wants/virtlockd.service → /usr/lib/systemd/system/virtlockd.service.
Created symlink /etc/systemd/system/multi-user.target.wants/virtlogd.service → /usr/lib/systemd/system/virtlogd.service.
Setting up libvirt-daemon dnsmasq configuration.
Setting up libpangoft2-1.0-0:amd64 (1.52.1+ds-1build1) ...
Setting up libsdl2-2.0-0:amd64 (2.30.0+dfsg-1ubuntu3.1) ...
Setting up libcups2t64:amd64 (2.4.7-1.2ubuntu7.9) ...
Setting up libgtk-3-common (3.24.41-4ubuntu1.3) ...
Setting up libpangocairo-1.0-0:amd64 (1.52.1+ds-1build1) ...
Setting up gsettings-desktop-schemas (46.1-0ubuntu1) ...
Setting up gstreamer1.0-x:amd64 (1.24.2-1ubuntu0.3) ...
Setting up qemu-system-modules-opengl (1:8.2.2+ds-0ubuntu1.12) ...
Setting up librsvg2-2:amd64 (2.58.0+dfsg-1build1) ...
Setting up librsvg2-common:amd64 (2.58.0+dfsg-1build1) ...
Setting up qemu-system-modules-spice (1:8.2.2+ds-0ubuntu1.12) ...
Setting up adwaita-icon-theme (46.0-1) ...
update-alternatives: using /usr/share/icons/Adwaita/cursor.theme to provide /usr/share/icons/default/index.theme (x-cursor-theme) in auto mode
Setting up humanity-icon-theme (0.6.16) ...
Setting up ubuntu-mono (24.04-0ubuntu1) ...
Processing triggers for man-db (2.12.0-4build2) ...
Processing triggers for libglib2.0-0t64:amd64 (2.80.0-6ubuntu3.8) ...
Processing triggers for dbus (1.14.10-4ubuntu4.1) ...
Setting up libgtk-3-0t64:amd64 (3.24.41-4ubuntu1.3) ...
Processing triggers for shared-mime-info (2.4-4) ...
Setting up at-spi2-core (2.52.0-1build1) ...
Setting up glib-networking:amd64 (2.80.0-1build1) ...
Processing triggers for install-info (7.1-3build2) ...
Setting up libdecor-0-plugin-1-gtk:amd64 (0.2.2-1build2) ...
Setting up libgtk-vnc-2.0-0:amd64 (1.3.1-1build2) ...
Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
Setting up libsoup-3.0-0:amd64 (3.4.4-5ubuntu0.6) ...
Setting up libgtk-3-bin (3.24.41-4ubuntu1.3) ...
Setting up libphodav-3.0-0:amd64 (3.0-8build3) ...
Setting up libvte-2.91-0:amd64 (0.76.0-1ubuntu0.1) ...
Setting up libosinfo-1.0-0:amd64 (1.11.0-2build3) ...
Setting up gir1.2-libosinfo-1.0:amd64 (1.11.0-2build3) ...
Setting up libspice-client-glib-2.0-8:amd64 (0.42-2ubuntu2) ...
Setting up virtinst (1:4.1.0-3ubuntu0.1) ...
Setting up qemu-system-gui (1:8.2.2+ds-0ubuntu1.12) ...
Setting up gstreamer1.0-plugins-good:amd64 (1.24.2-1ubuntu1.2) ...
Setting up libspice-client-gtk-3.0-5:amd64 (0.42-2ubuntu2) ...
Setting up virt-viewer (11.0-3build2) ...
Processing triggers for libgdk-pixbuf-2.0-0:amd64 (2.42.10+dfsg-3ubuntu3.2) ...
Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
Scanning processes...                                                                                                                                                                                                                       
Scanning candidates...                                                                                                                                                                                                                      
Scanning linux images...                                                                                                                                                                                                                    

Pending kernel upgrade!
Running kernel version:
  6.8.0-62-generic
Diagnostics:
  The currently running kernel version is not the expected kernel version 6.8.0-100-generic.

Restarting the system to load the new kernel will not be handled automatically, so you should consider rebooting.

Restarting services...

Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart getty@tty1.service
 systemctl restart serial-getty@ttyS0.service
 systemctl restart systemd-logind.service
 systemctl restart unattended-upgrades.service

No containers need to be restarted.

User sessions running outdated binaries:
 ubuntu @ session #116: sshd[2564,2680]
 ubuntu @ user manager service: systemd[2569]

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@gelani-lab-2:~$ 


ubuntu@gelani-lab-2:~$ sudo systemctl enable --now libvirtd
ubuntu@gelani-lab-2:~$ sudo systemctl status libvirtd --no-pager
● libvirtd.service - libvirt legacy monolithic daemon
     Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
     Active: active (running) since Sun 2026-02-08 04:27:35 UTC; 5s ago
TriggeredBy: ● libvirtd-ro.socket
             ● libvirtd-admin.socket
             ● libvirtd.socket
       Docs: man:libvirtd(8)
             https://libvirt.org/
   Main PID: 22003 (libvirtd)
      Tasks: 22 (limit: 32768)
     Memory: 9.3M (peak: 11.2M)
        CPU: 248ms
     CGroup: /system.slice/libvirtd.service
             ├─21634 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/lib/libvirt/libvirt_leaseshelper
             ├─21635 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/lib/libvirt/libvirt_leaseshelper
             └─22003 /usr/sbin/libvirtd --timeout 120

Feb 08 04:27:35 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:27:35 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:27:36 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:27:36 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:27:36 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
ubuntu@gelani-lab-2:~$ 

ubuntu@gelani-lab-2:~$ sudo systemctl enable --now libvirtd
ubuntu@gelani-lab-2:~$ sudo systemctl status libvirtd --no-pager
● libvirtd.service - libvirt legacy monolithic daemon
     Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
     Active: active (running) since Sun 2026-02-08 04:27:35 UTC; 5s ago
TriggeredBy: ● libvirtd-ro.socket
             ● libvirtd-admin.socket
             ● libvirtd.socket
       Docs: man:libvirtd(8)
             https://libvirt.org/
   Main PID: 22003 (libvirtd)
      Tasks: 22 (limit: 32768)
     Memory: 9.3M (peak: 11.2M)
        CPU: 248ms
     CGroup: /system.slice/libvirtd.service
             ├─21634 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/lib/libvirt/libvirt_leaseshelper
             ├─21635 /usr/sbin/dnsmasq --conf-file=/var/lib/libvirt/dnsmasq/default.conf --leasefile-ro --dhcp-script=/usr/lib/libvirt/libvirt_leaseshelper
             └─22003 /usr/sbin/libvirtd --timeout 120

Feb 08 04:27:35 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:27:35 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:27:36 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:27:36 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:27:36 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
ubuntu@gelani-lab-2:~$ sudo usermod -aG libvirt,kvm $USER
ubuntu@gelani-lab-2:~$ exit
logout
Connection to 192.168.95.113 closed.
emaduzzaman@emaduzzaman:~$ ssh ubuntu@192.168.95.113
ubuntu@192.168.95.113's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-62-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 04:28:14 UTC 2026

  System load:  0.01              Processes:             144
  Usage of /:   5.7% of 47.39GB   Users logged in:       0
  Memory usage: 5%                IPv4 address for ens3: 192.168.95.113
  Swap usage:   0%

 * Strictly confined Kubernetes makes edge and IoT secure. Learn how MicroK8s
   just raised the bar for easy, resilient and secure K8s cluster deployment.

   https://ubuntu.com/engage/secure-kubernetes-at-the-edge

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


*** System restart required ***
Last login: Sun Feb  8 04:06:41 2026 from 192.168.95.86
ubuntu@gelani-lab-2:~$ 
ubuntu@gelani-lab-2:~$ virsh list --all
 Id   Name   State
--------------------

ubuntu@gelani-lab-2:~$ virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes

ubuntu@gelani-lab-2:~$ ip a | grep -A2 virbr0 || true
3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:~$ mkdir -p ~/kvm/nat-vm && cd ~/kvm/nat-vm
wget -O ubuntu-24.04-server-cloudimg-amd64.img \
  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-02-08 04:29:17--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 626836992 (598M) [application/octet-stream]
Saving to: ‘ubuntu-24.04-server-cloudimg-amd64.img’

ubuntu-24.04-server-cloudimg-amd64.img                     100%[========================================================================================================================================>] 597.80M  20.3MB/s    in 31s     

2026-02-08 04:29:49 (19.0 MB/s) - ‘ubuntu-24.04-server-cloudimg-amd64.img’ saved [626836992/626836992]

ubuntu@gelani-lab-2:~/kvm/nat-vm$ 
ubuntu@gelani-lab-2:~/kvm/nat-vm$ qemu-img create -f qcow2 -F qcow2 -b ubuntu-24.04-server-cloudimg-amd64.img nat-vm1.qcow2 20G
Formatting 'nat-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 backing_file=ubuntu-24.04-server-cloudimg-amd64.img backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
ubuntu@gelani-lab-2:~/kvm/nat-vm$ cat > user-data.yaml <<'EOF'
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
ubuntu@gelani-lab-2:~/kvm/nat-vm$ cloud-localds seed.iso user-data.yaml
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=$PWD/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=$PWD/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import \
  --noautoconsole
WARNING  /home/ubuntu/kvm/nat-vm/nat-vm1.qcow2 may not be accessible by the hypervisor. You will need to grant the 'libvirt-qemu' user search permissions for the following directories: ['/home/ubuntu']
WARNING  /home/ubuntu/kvm/nat-vm/seed.iso may not be accessible by the hypervisor. You will need to grant the 'libvirt-qemu' user search permissions for the following directories: ['/home/ubuntu']
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
ERROR    Cannot access storage file '/home/ubuntu/kvm/nat-vm/nat-vm1.qcow2' (as uid:64055, gid:993): Permission denied
Domain installation does not appear to have been successful.
If it was, you can restart your domain by running:
  virsh --connect qemu:///system start nat-vm1
otherwise, please restart your installation.
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo mkdir -p /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo mv /home/ubuntu/kvm/nat-vm/nat-vm1.qcow2 /var/lib/libvirt/images/nat-vm1/
sudo mv /home/ubuntu/kvm/nat-vm/seed.iso /var/lib/libvirt/images/nat-vm1/
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
sudo chmod 750 /var/lib/libvirt/images/nat-vm1
sudo chmod 640 /var/lib/libvirt/images/nat-vm1/*
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import \
  --noautoconsole
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
ERROR    Cannot access backing file '/var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img' of storage file '/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2' (as uid:64055, gid:993): No such file or directory
Domain installation does not appear to have been successful.
If it was, you can restart your domain by running:
  virsh --connect qemu:///system start nat-vm1
otherwise, please restart your installation.
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo mv /home/ubuntu/kvm/nat-vm/ubuntu-24.04-server-cloudimg-amd64.img /var/lib/libvirt/images/nat-vm1/
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img
sudo chmod 640 /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo qemu-img rebase -u \
  -b /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img \
  /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
qemu-img: Could not change the backing file to '/var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img': backing format must be specified
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo qemu-img rebase -u   -b /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img   /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
qemu-img: Could not change the backing file to '/var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img': backing format must be specified
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 | grep -i "backing"
backing file: ubuntu-24.04-server-cloudimg-amd64.img (actual path: /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img)
backing file format: qcow2
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo rm -f /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo qemu-img create -f qcow2 /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 20G
sudo virt-resize --expand /dev/sda1 \
  /var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img \
  /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
Formatting '/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 lazy_refcounts=off refcount_bits=16
sudo: virt-resize: command not found
ubuntu@gelani-lab-2:~/kvm/nat-vm$ 
ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo apt update
sudo apt install -y libguestfs-tools
Hit:1 http://security.ubuntu.com/ubuntu noble-security InRelease
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble InRelease
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  attr augeas-lenses binutils binutils-common binutils-x86-64-linux-gnu bzip2 db-util db5.3-util exfatprogs extlinux f2fs-tools fonts-droid-fallback fonts-noto-mono fonts-urw-base35 ghostscript guestfish guestfs-tools guestmount
  hfsplus icoutils ldmtool libafflib0t64 libaugeas0 libauthen-sasl-perl libbfio1 libbinutils libclone-perl libconfig9 libctf-nobfd0 libctf0 libdata-dump-perl libdate-manip-perl libencode-locale-perl libewf2 libfile-listing-perl
  libfont-afm-perl libfontenc1 libfuse2t64 libgprofng0 libgs-common libgs10 libgs10-common libguestfs-hfsplus libguestfs-perl libguestfs-reiserfs libguestfs-xfs libguestfs0t64 libhfsp0t64 libhivex0 libhtml-form-perl
  libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libice6 libidn12 libijs-0.35 libio-html-perl
  libio-socket-ssl-perl libjbig2dec0 libldm-1.0-0t64 liblua5.3-0 liblwp-mediatypes-perl liblwp-protocol-https-perl libmailtools-perl libnet-http-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnetpbm11t64 libopenjp2-7 libpaper-utils
  libpaper1 librpm9t64 librpmio9t64 libsframe1 libsm6 libstring-shellquote-perl libsys-virt-perl libtimedate-perl libtry-tiny-perl libtsk19t64 liburi-perl libvhdi1 libvmdk1 libwin-hivex-perl libwww-perl libwww-robotrules-perl
  libxml-parser-perl libxml-xpath-perl libxt6t64 libyara10 lsscsi lzop mtools netpbm perl-openssl-defaults poppler-data reiserfsprogs rpm-common scrub sleuthkit supermin syslinux syslinux-common virt-p2v xfonts-encodings xfonts-utils
Suggested packages:
  augeas-doc binutils-doc gprofng-gui bzip2-doc fonts-noto fonts-freefont-otf | fonts-freefont-ttf fonts-texgyre texlive-binaries libterm-readline-gnu-perl | libterm-readline-perl-perl augeas-tools libdigest-hmac-perl libgssapi-perl
  libguestfs-gfs2 libguestfs-jfs libguestfs-nilfs libguestfs-rescue libguestfs-rsync libguestfs-zfs libio-compress-brotli-perl libcrypt-ssleay-perl libsub-name-perl libbusiness-isbn-perl libregexp-ipv6-perl libauthen-ntlm-perl floppyd
  debhelper poppler-utils fonts-japanese-mincho | fonts-ipafont-mincho fonts-japanese-gothic | fonts-ipafont-gothic fonts-arphic-ukai fonts-arphic-uming fonts-nanum autopsy mac-robber
Recommended packages:
  linux-image-amd64
The following NEW packages will be installed:
  attr augeas-lenses binutils binutils-common binutils-x86-64-linux-gnu bzip2 db-util db5.3-util exfatprogs extlinux f2fs-tools fonts-droid-fallback fonts-noto-mono fonts-urw-base35 ghostscript guestfish guestfs-tools guestmount
  hfsplus icoutils ldmtool libafflib0t64 libaugeas0 libauthen-sasl-perl libbfio1 libbinutils libclone-perl libconfig9 libctf-nobfd0 libctf0 libdata-dump-perl libdate-manip-perl libencode-locale-perl libewf2 libfile-listing-perl
  libfont-afm-perl libfontenc1 libfuse2t64 libgprofng0 libgs-common libgs10 libgs10-common libguestfs-hfsplus libguestfs-perl libguestfs-reiserfs libguestfs-tools libguestfs-xfs libguestfs0t64 libhfsp0t64 libhivex0 libhtml-form-perl
  libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libice6 libidn12 libijs-0.35 libio-html-perl
  libio-socket-ssl-perl libjbig2dec0 libldm-1.0-0t64 liblua5.3-0 liblwp-mediatypes-perl liblwp-protocol-https-perl libmailtools-perl libnet-http-perl libnet-smtp-ssl-perl libnet-ssleay-perl libnetpbm11t64 libopenjp2-7 libpaper-utils
  libpaper1 librpm9t64 librpmio9t64 libsframe1 libsm6 libstring-shellquote-perl libsys-virt-perl libtimedate-perl libtry-tiny-perl libtsk19t64 liburi-perl libvhdi1 libvmdk1 libwin-hivex-perl libwww-perl libwww-robotrules-perl
  libxml-parser-perl libxml-xpath-perl libxt6t64 libyara10 lsscsi lzop mtools netpbm perl-openssl-defaults poppler-data reiserfsprogs rpm-common scrub sleuthkit supermin syslinux syslinux-common virt-p2v xfonts-encodings xfonts-utils
0 upgraded, 113 newly installed, 0 to remove and 0 not upgraded.
Need to get 46.7 MB of archives.
After this operation, 180 MB of additional disk space will be used.
Get:1 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 fonts-droid-fallback all 1:6.0.1r16-1.1build1 [1,805 kB]
Get:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 poppler-data all 0.4.12-1 [2,060 kB]
Get:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 attr amd64 1:2.5.2-1build1.1 [22.8 kB]
Get:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 augeas-lenses all 1.14.1-1build2 [323 kB]
Get:5 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 binutils-common amd64 2.42-4ubuntu2.8 [240 kB]
Get:6 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libsframe1 amd64 2.42-4ubuntu2.8 [15.6 kB]
Get:7 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libbinutils amd64 2.42-4ubuntu2.8 [576 kB]
Get:8 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libctf-nobfd0 amd64 2.42-4ubuntu2.8 [97.9 kB]
Get:9 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libctf0 amd64 2.42-4ubuntu2.8 [94.5 kB]
Get:10 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgprofng0 amd64 2.42-4ubuntu2.8 [849 kB]
Get:11 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 binutils-x86-64-linux-gnu amd64 2.42-4ubuntu2.8 [2,463 kB]
Get:12 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 binutils amd64 2.42-4ubuntu2.8 [18.1 kB]
Get:13 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 bzip2 amd64 1.0.8-5.1build0.1 [34.5 kB]
Get:14 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 db5.3-util amd64 5.3.28+dfsg2-7 [71.7 kB]
Get:15 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 exfatprogs amd64 1.2.2-1build1 [65.9 kB]
Get:16 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 extlinux amd64 3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3 [147 kB]
Get:17 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 f2fs-tools amd64 1.16.0-1 [202 kB]
Get:18 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 fonts-noto-mono all 20201225-2 [435 kB]
Get:19 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libfontenc1 amd64 1:1.1.8-1build1 [14.0 kB]
Get:20 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 xfonts-encodings all 1:1.0.5-0ubuntu2 [578 kB]
Get:21 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 xfonts-utils amd64 1:7.7+6build3 [94.4 kB]
Get:22 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 fonts-urw-base35 all 20200910-8 [11.0 MB]
Get:23 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgs-common all 10.02.1~dfsg1-0ubuntu7.8 [176 kB]
Get:24 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgs10-common all 10.02.1~dfsg1-0ubuntu7.8 [488 kB]
Get:25 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libidn12 amd64 1.42-1build1 [55.9 kB]
Get:26 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libijs-0.35 amd64 0.35-15.1build1 [15.3 kB]
Get:27 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libjbig2dec0 amd64 0.20-1build3 [65.0 kB]
Get:28 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libopenjp2-7 amd64 2.5.0-2ubuntu0.4 [173 kB]
Get:29 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libpaper1 amd64 1.1.29build1 [13.4 kB]
Get:30 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libice6 amd64 2:1.0.10-1build3 [41.4 kB]
Get:31 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libsm6 amd64 2:1.2.3-1build3 [15.7 kB]
Get:32 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libxt6t64 amd64 1:1.2.1-1.2build1 [171 kB]
Get:33 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 libgs10 amd64 10.02.1~dfsg1-0ubuntu7.8 [3,897 kB]
Get:34 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates/main amd64 ghostscript amd64 10.02.1~dfsg1-0ubuntu7.8 [43.4 kB]                                                                                                 
Get:35 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libaugeas0 amd64 1.14.1-1build2 [166 kB]                                                                                                                 
Get:36 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libfuse2t64 amd64 2.9.9-8.1build1 [89.9 kB]                                                                                                              
Get:37 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libhivex0 amd64 1.3.23-1build7 [26.4 kB]                                                                                                                 
Get:38 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 liblua5.3-0 amd64 5.3.6-2build2 [143 kB]                                                                                                                 
Get:39 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 librpmio9t64 amd64 4.18.2+dfsg-2.1build2 [95.2 kB]                                                                                                       
Get:40 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 librpm9t64 amd64 4.18.2+dfsg-2.1build2 [217 kB]                                                                                                          
Get:41 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libafflib0t64 amd64 3.7.20-1.1ubuntu5 [224 kB]                                                                                                           
Get:42 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libewf2 amd64 20140814-1build3 [573 kB]                                                                                                                  
Get:43 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libvhdi1 amd64 20210425-1build5 [425 kB]                                                                                                                 
Get:44 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libbfio1 amd64 20170123-6 [306 kB]                                                                                                                       
Get:45 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libvmdk1 amd64 20200926-2build5 [453 kB]                                                                                                                 
Get:46 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libtsk19t64 amd64 4.12.1+dfsg-1.1ubuntu2 [435 kB]                                                                                                        
Get:47 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libyara10 amd64 4.5.0-1build2 [203 kB]                                                                                                                   
Get:48 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 supermin amd64 5.2.2-4ubuntu4 [529 kB]                                                                                                                   
Get:49 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 db-util all 1:5.3.21ubuntu2 [2,412 B]                                                                                                                        
Get:50 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libencode-locale-perl all 1.05-3 [11.6 kB]                                                                                                                   
Get:51 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libtimedate-perl all 2.3300-2 [34.0 kB]                                                                                                                      
Get:52 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhttp-date-perl all 6.06-1 [10.2 kB]                                                                                                                       
Get:53 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libfile-listing-perl all 6.16-1 [11.3 kB]                                                                                                                    
Get:54 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhtml-tagset-perl all 3.20-6 [11.3 kB]                                                                                                                     
Get:55 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liburi-perl all 5.27-1 [88.0 kB]                                                                                                                             
Get:56 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhtml-parser-perl amd64 3.81-1build3 [85.8 kB]                                                                                                             
Get:57 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhtml-tree-perl all 5.07-3 [200 kB]                                                                                                                        
Get:58 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libclone-perl amd64 0.46-1build3 [10.7 kB]                                                                                                                   
Get:59 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libio-html-perl all 1.004-3 [15.9 kB]                                                                                                                        
Get:60 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liblwp-mediatypes-perl all 6.04-2 [20.1 kB]                                                                                                                  
Get:61 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhttp-message-perl all 6.45-1ubuntu1 [78.2 kB]                                                                                                             
Get:62 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhttp-cookies-perl all 6.11-1 [18.2 kB]                                                                                                                    
Get:63 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhttp-negotiate-perl all 6.01-2 [12.4 kB]                                                                                                                  
Get:64 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 perl-openssl-defaults amd64 7build3 [6,626 B]                                                                                                                
Get:65 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libnet-ssleay-perl amd64 1.94-1build4 [316 kB]                                                                                                               
Get:66 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libio-socket-ssl-perl all 2.085-1 [195 kB]                                                                                                                   
Get:67 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libnet-http-perl all 6.23-1 [22.3 kB]                                                                                                                        
Get:68 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 liblwp-protocol-https-perl all 6.13-1 [9,006 B]                                                                                                              
Get:69 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libtry-tiny-perl all 0.31-2 [20.8 kB]                                                                                                                        
Get:70 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libwww-robotrules-perl all 6.02-1 [12.6 kB]                                                                                                                  
Get:71 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libwww-perl all 6.76-1 [138 kB]                                                                                                                              
Get:72 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 icoutils amd64 0.32.3-4build2 [55.7 kB]                                                                                                                  
Get:73 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libnetpbm11t64 amd64 2:11.05.02-1.1build1 [114 kB]                                                                                                       
Get:74 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 netpbm amd64 2:11.05.02-1.1build1 [2,054 kB]                                                                                                             
Get:75 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libldm-1.0-0t64 amd64 0.2.5-1.1build2 [24.3 kB]                                                                                                          
Get:76 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 ldmtool amd64 0.2.5-1.1build2 [13.8 kB]                                                                                                                  
Get:77 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 lsscsi amd64 0.32-1build1 [48.2 kB]                                                                                                                          
Get:78 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 lzop amd64 1.04-2build3 [82.2 kB]                                                                                                                            
Get:79 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 mtools amd64 4.0.43-1build1 [197 kB]                                                                                                                         
Get:80 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 scrub amd64 2.6.1-1build2 [30.8 kB]                                                                                                                      
Get:81 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libdate-manip-perl all 6.95-1 [923 kB]                                                                                                                       
Get:82 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 sleuthkit amd64 4.12.1+dfsg-1.1ubuntu2 [383 kB]                                                                                                          
Get:83 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 syslinux amd64 3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3 [157 kB]                                                                                       
Get:84 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libguestfs0t64 amd64 1:1.52.0-5ubuntu3 [3,213 kB]                                                                                                        
Get:85 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libconfig9 amd64 1.5-0.4build2 [23.2 kB]                                                                                                                 
Get:86 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 guestfish amd64 1:1.52.0-5ubuntu3 [624 kB]                                                                                                               
Get:87 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libxml-parser-perl amd64 2.47-1build3 [204 kB]                                                                                                               
Get:88 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libxml-xpath-perl all 1.48-1 [67.5 kB]                                                                                                                   
Get:89 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libwin-hivex-perl amd64 1.3.23-1build7 [36.5 kB]                                                                                                         
Get:90 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libsys-virt-perl amd64 10.0.0-1build2 [268 kB]                                                                                                           
Get:91 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libguestfs-perl amd64 1:1.52.0-5ubuntu3 [276 kB]                                                                                                         
Get:92 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libstring-shellquote-perl all 1.04-3 [11.3 kB]                                                                                                               
Get:93 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 guestfs-tools amd64 1.52.0-2ubuntu5 [4,284 kB]                                                                                                           
Get:94 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 guestmount amd64 1:1.52.0-5ubuntu3 [58.0 kB]                                                                                                             
Get:95 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhfsp0t64 amd64 1.0.4-17.1build1 [36.8 kB]                                                                                                                 
Get:96 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 hfsplus amd64 1.0.4-17.1build1 [37.4 kB]                                                                                                                     
Get:97 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libdata-dump-perl all 1.25-1 [25.9 kB]                                                                                                                       
Get:98 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libfont-afm-perl all 1.20-4 [13.0 kB]                                                                                                                        
Get:99 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhtml-form-perl all 6.11-1 [32.1 kB]                                                                                                                       
Get:100 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhtml-format-perl all 2.16-2 [36.9 kB]                                                                                                                    
Get:101 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libhttp-daemon-perl all 6.16-1 [22.4 kB]                                                                                                                    
Get:102 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libnet-smtp-ssl-perl all 1.04-2 [6,218 B]                                                                                                                   
Get:103 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libmailtools-perl all 2.21-2 [80.4 kB]                                                                                                                      
Get:104 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libpaper-utils amd64 1.1.29build1 [8,650 B]                                                                                                                 
Get:105 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 reiserfsprogs amd64 1:3.6.27-7.1build1 [143 kB]                                                                                                             
Get:106 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 rpm-common amd64 4.18.2+dfsg-2.1build2 [34.0 kB]                                                                                                        
Get:107 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 syslinux-common all 3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3 [1,261 kB]                                                                                   
Get:108 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libguestfs-tools amd64 1:1.52.0-5ubuntu3 [32.5 kB]                                                                                                      
Get:109 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 virt-p2v amd64 1.42.3-1 [232 kB]                                                                                                                        
Get:110 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/main amd64 libauthen-sasl-perl all 2.1700-1 [42.9 kB]                                                                                                                  
Get:111 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libguestfs-hfsplus amd64 1:1.52.0-5ubuntu3 [1,576 B]                                                                                                    
Get:112 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libguestfs-reiserfs amd64 1:1.52.0-5ubuntu3 [1,590 B]                                                                                                   
Get:113 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble/universe amd64 libguestfs-xfs amd64 1:1.52.0-5ubuntu3 [1,580 B]                                                                                                        
Fetched 46.7 MB in 10s (4,792 kB/s)                                                                                                                                                                                                        
Extracting templates from packages: 100%
Preconfiguring packages ...
Selecting previously unselected package fonts-droid-fallback.
(Reading database ... 123933 files and directories currently installed.)
Preparing to unpack .../000-fonts-droid-fallback_1%3a6.0.1r16-1.1build1_all.deb ...
Unpacking fonts-droid-fallback (1:6.0.1r16-1.1build1) ...
Selecting previously unselected package poppler-data.
Preparing to unpack .../001-poppler-data_0.4.12-1_all.deb ...
Unpacking poppler-data (0.4.12-1) ...
Selecting previously unselected package attr.
Preparing to unpack .../002-attr_1%3a2.5.2-1build1.1_amd64.deb ...
Unpacking attr (1:2.5.2-1build1.1) ...
Selecting previously unselected package augeas-lenses.
Preparing to unpack .../003-augeas-lenses_1.14.1-1build2_all.deb ...
Unpacking augeas-lenses (1.14.1-1build2) ...
Selecting previously unselected package binutils-common:amd64.
Preparing to unpack .../004-binutils-common_2.42-4ubuntu2.8_amd64.deb ...
Unpacking binutils-common:amd64 (2.42-4ubuntu2.8) ...
Selecting previously unselected package libsframe1:amd64.
Preparing to unpack .../005-libsframe1_2.42-4ubuntu2.8_amd64.deb ...
Unpacking libsframe1:amd64 (2.42-4ubuntu2.8) ...
Selecting previously unselected package libbinutils:amd64.
Preparing to unpack .../006-libbinutils_2.42-4ubuntu2.8_amd64.deb ...
Unpacking libbinutils:amd64 (2.42-4ubuntu2.8) ...
Selecting previously unselected package libctf-nobfd0:amd64.
Preparing to unpack .../007-libctf-nobfd0_2.42-4ubuntu2.8_amd64.deb ...
Unpacking libctf-nobfd0:amd64 (2.42-4ubuntu2.8) ...
Selecting previously unselected package libctf0:amd64.
Preparing to unpack .../008-libctf0_2.42-4ubuntu2.8_amd64.deb ...
Unpacking libctf0:amd64 (2.42-4ubuntu2.8) ...
Selecting previously unselected package libgprofng0:amd64.
Preparing to unpack .../009-libgprofng0_2.42-4ubuntu2.8_amd64.deb ...
Unpacking libgprofng0:amd64 (2.42-4ubuntu2.8) ...
Selecting previously unselected package binutils-x86-64-linux-gnu.
Preparing to unpack .../010-binutils-x86-64-linux-gnu_2.42-4ubuntu2.8_amd64.deb ...
Unpacking binutils-x86-64-linux-gnu (2.42-4ubuntu2.8) ...
Selecting previously unselected package binutils.
Preparing to unpack .../011-binutils_2.42-4ubuntu2.8_amd64.deb ...
Unpacking binutils (2.42-4ubuntu2.8) ...
Selecting previously unselected package bzip2.
Preparing to unpack .../012-bzip2_1.0.8-5.1build0.1_amd64.deb ...
Unpacking bzip2 (1.0.8-5.1build0.1) ...
Selecting previously unselected package db5.3-util.
Preparing to unpack .../013-db5.3-util_5.3.28+dfsg2-7_amd64.deb ...
Unpacking db5.3-util (5.3.28+dfsg2-7) ...
Selecting previously unselected package exfatprogs.
Preparing to unpack .../014-exfatprogs_1.2.2-1build1_amd64.deb ...
Unpacking exfatprogs (1.2.2-1build1) ...
Selecting previously unselected package extlinux.
Preparing to unpack .../015-extlinux_3%3a6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3_amd64.deb ...
Unpacking extlinux (3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3) ...
Selecting previously unselected package f2fs-tools.
Preparing to unpack .../016-f2fs-tools_1.16.0-1_amd64.deb ...
Unpacking f2fs-tools (1.16.0-1) ...
Selecting previously unselected package fonts-noto-mono.
Preparing to unpack .../017-fonts-noto-mono_20201225-2_all.deb ...
Unpacking fonts-noto-mono (20201225-2) ...
Selecting previously unselected package libfontenc1:amd64.
Preparing to unpack .../018-libfontenc1_1%3a1.1.8-1build1_amd64.deb ...
Unpacking libfontenc1:amd64 (1:1.1.8-1build1) ...
Selecting previously unselected package xfonts-encodings.
Preparing to unpack .../019-xfonts-encodings_1%3a1.0.5-0ubuntu2_all.deb ...
Unpacking xfonts-encodings (1:1.0.5-0ubuntu2) ...
Selecting previously unselected package xfonts-utils.
Preparing to unpack .../020-xfonts-utils_1%3a7.7+6build3_amd64.deb ...
Unpacking xfonts-utils (1:7.7+6build3) ...
Selecting previously unselected package fonts-urw-base35.
Preparing to unpack .../021-fonts-urw-base35_20200910-8_all.deb ...
Unpacking fonts-urw-base35 (20200910-8) ...
Selecting previously unselected package libgs-common.
Preparing to unpack .../022-libgs-common_10.02.1~dfsg1-0ubuntu7.8_all.deb ...
Unpacking libgs-common (10.02.1~dfsg1-0ubuntu7.8) ...
Selecting previously unselected package libgs10-common.
Preparing to unpack .../023-libgs10-common_10.02.1~dfsg1-0ubuntu7.8_all.deb ...
Unpacking libgs10-common (10.02.1~dfsg1-0ubuntu7.8) ...
Selecting previously unselected package libidn12:amd64.
Preparing to unpack .../024-libidn12_1.42-1build1_amd64.deb ...
Unpacking libidn12:amd64 (1.42-1build1) ...
Selecting previously unselected package libijs-0.35:amd64.
Preparing to unpack .../025-libijs-0.35_0.35-15.1build1_amd64.deb ...
Unpacking libijs-0.35:amd64 (0.35-15.1build1) ...
Selecting previously unselected package libjbig2dec0:amd64.
Preparing to unpack .../026-libjbig2dec0_0.20-1build3_amd64.deb ...
Unpacking libjbig2dec0:amd64 (0.20-1build3) ...
Selecting previously unselected package libopenjp2-7:amd64.
Preparing to unpack .../027-libopenjp2-7_2.5.0-2ubuntu0.4_amd64.deb ...
Unpacking libopenjp2-7:amd64 (2.5.0-2ubuntu0.4) ...
Selecting previously unselected package libpaper1:amd64.
Preparing to unpack .../028-libpaper1_1.1.29build1_amd64.deb ...
Unpacking libpaper1:amd64 (1.1.29build1) ...
Selecting previously unselected package libice6:amd64.
Preparing to unpack .../029-libice6_2%3a1.0.10-1build3_amd64.deb ...
Unpacking libice6:amd64 (2:1.0.10-1build3) ...
Selecting previously unselected package libsm6:amd64.
Preparing to unpack .../030-libsm6_2%3a1.2.3-1build3_amd64.deb ...
Unpacking libsm6:amd64 (2:1.2.3-1build3) ...
Selecting previously unselected package libxt6t64:amd64.
Preparing to unpack .../031-libxt6t64_1%3a1.2.1-1.2build1_amd64.deb ...
Unpacking libxt6t64:amd64 (1:1.2.1-1.2build1) ...
Selecting previously unselected package libgs10:amd64.
Preparing to unpack .../032-libgs10_10.02.1~dfsg1-0ubuntu7.8_amd64.deb ...
Unpacking libgs10:amd64 (10.02.1~dfsg1-0ubuntu7.8) ...
Selecting previously unselected package ghostscript.
Preparing to unpack .../033-ghostscript_10.02.1~dfsg1-0ubuntu7.8_amd64.deb ...
Unpacking ghostscript (10.02.1~dfsg1-0ubuntu7.8) ...
Selecting previously unselected package libaugeas0:amd64.
Preparing to unpack .../034-libaugeas0_1.14.1-1build2_amd64.deb ...
Unpacking libaugeas0:amd64 (1.14.1-1build2) ...
Selecting previously unselected package libfuse2t64:amd64.
Preparing to unpack .../035-libfuse2t64_2.9.9-8.1build1_amd64.deb ...
Unpacking libfuse2t64:amd64 (2.9.9-8.1build1) ...
Selecting previously unselected package libhivex0:amd64.
Preparing to unpack .../036-libhivex0_1.3.23-1build7_amd64.deb ...
Unpacking libhivex0:amd64 (1.3.23-1build7) ...
Selecting previously unselected package liblua5.3-0:amd64.
Preparing to unpack .../037-liblua5.3-0_5.3.6-2build2_amd64.deb ...
Unpacking liblua5.3-0:amd64 (5.3.6-2build2) ...
Selecting previously unselected package librpmio9t64.
Preparing to unpack .../038-librpmio9t64_4.18.2+dfsg-2.1build2_amd64.deb ...
Unpacking librpmio9t64 (4.18.2+dfsg-2.1build2) ...
Selecting previously unselected package librpm9t64.
Preparing to unpack .../039-librpm9t64_4.18.2+dfsg-2.1build2_amd64.deb ...
Unpacking librpm9t64 (4.18.2+dfsg-2.1build2) ...
Selecting previously unselected package libafflib0t64:amd64.
Preparing to unpack .../040-libafflib0t64_3.7.20-1.1ubuntu5_amd64.deb ...
Unpacking libafflib0t64:amd64 (3.7.20-1.1ubuntu5) ...
Selecting previously unselected package libewf2:amd64.
Preparing to unpack .../041-libewf2_20140814-1build3_amd64.deb ...
Unpacking libewf2:amd64 (20140814-1build3) ...
Selecting previously unselected package libvhdi1:amd64.
Preparing to unpack .../042-libvhdi1_20210425-1build5_amd64.deb ...
Unpacking libvhdi1:amd64 (20210425-1build5) ...
Selecting previously unselected package libbfio1:amd64.
Preparing to unpack .../043-libbfio1_20170123-6_amd64.deb ...
Unpacking libbfio1:amd64 (20170123-6) ...
Selecting previously unselected package libvmdk1:amd64.
Preparing to unpack .../044-libvmdk1_20200926-2build5_amd64.deb ...
Unpacking libvmdk1:amd64 (20200926-2build5) ...
Selecting previously unselected package libtsk19t64:amd64.
Preparing to unpack .../045-libtsk19t64_4.12.1+dfsg-1.1ubuntu2_amd64.deb ...
Unpacking libtsk19t64:amd64 (4.12.1+dfsg-1.1ubuntu2) ...
Selecting previously unselected package libyara10:amd64.
Preparing to unpack .../046-libyara10_4.5.0-1build2_amd64.deb ...
Unpacking libyara10:amd64 (4.5.0-1build2) ...
Selecting previously unselected package supermin.
Preparing to unpack .../047-supermin_5.2.2-4ubuntu4_amd64.deb ...
Unpacking supermin (5.2.2-4ubuntu4) ...
Selecting previously unselected package db-util.
Preparing to unpack .../048-db-util_1%3a5.3.21ubuntu2_all.deb ...
Unpacking db-util (1:5.3.21ubuntu2) ...
Selecting previously unselected package libencode-locale-perl.
Preparing to unpack .../049-libencode-locale-perl_1.05-3_all.deb ...
Unpacking libencode-locale-perl (1.05-3) ...
Selecting previously unselected package libtimedate-perl.
Preparing to unpack .../050-libtimedate-perl_2.3300-2_all.deb ...
Unpacking libtimedate-perl (2.3300-2) ...
Selecting previously unselected package libhttp-date-perl.
Preparing to unpack .../051-libhttp-date-perl_6.06-1_all.deb ...
Unpacking libhttp-date-perl (6.06-1) ...
Selecting previously unselected package libfile-listing-perl.
Preparing to unpack .../052-libfile-listing-perl_6.16-1_all.deb ...
Unpacking libfile-listing-perl (6.16-1) ...
Selecting previously unselected package libhtml-tagset-perl.
Preparing to unpack .../053-libhtml-tagset-perl_3.20-6_all.deb ...
Unpacking libhtml-tagset-perl (3.20-6) ...
Selecting previously unselected package liburi-perl.
Preparing to unpack .../054-liburi-perl_5.27-1_all.deb ...
Unpacking liburi-perl (5.27-1) ...
Selecting previously unselected package libhtml-parser-perl:amd64.
Preparing to unpack .../055-libhtml-parser-perl_3.81-1build3_amd64.deb ...
Unpacking libhtml-parser-perl:amd64 (3.81-1build3) ...
Selecting previously unselected package libhtml-tree-perl.
Preparing to unpack .../056-libhtml-tree-perl_5.07-3_all.deb ...
Unpacking libhtml-tree-perl (5.07-3) ...
Selecting previously unselected package libclone-perl:amd64.
Preparing to unpack .../057-libclone-perl_0.46-1build3_amd64.deb ...
Unpacking libclone-perl:amd64 (0.46-1build3) ...
Selecting previously unselected package libio-html-perl.
Preparing to unpack .../058-libio-html-perl_1.004-3_all.deb ...
Unpacking libio-html-perl (1.004-3) ...
Selecting previously unselected package liblwp-mediatypes-perl.
Preparing to unpack .../059-liblwp-mediatypes-perl_6.04-2_all.deb ...
Unpacking liblwp-mediatypes-perl (6.04-2) ...
Selecting previously unselected package libhttp-message-perl.
Preparing to unpack .../060-libhttp-message-perl_6.45-1ubuntu1_all.deb ...
Unpacking libhttp-message-perl (6.45-1ubuntu1) ...
Selecting previously unselected package libhttp-cookies-perl.
Preparing to unpack .../061-libhttp-cookies-perl_6.11-1_all.deb ...
Unpacking libhttp-cookies-perl (6.11-1) ...
Selecting previously unselected package libhttp-negotiate-perl.
Preparing to unpack .../062-libhttp-negotiate-perl_6.01-2_all.deb ...
Unpacking libhttp-negotiate-perl (6.01-2) ...
Selecting previously unselected package perl-openssl-defaults:amd64.
Preparing to unpack .../063-perl-openssl-defaults_7build3_amd64.deb ...
Unpacking perl-openssl-defaults:amd64 (7build3) ...
Selecting previously unselected package libnet-ssleay-perl:amd64.
Preparing to unpack .../064-libnet-ssleay-perl_1.94-1build4_amd64.deb ...
Unpacking libnet-ssleay-perl:amd64 (1.94-1build4) ...
Selecting previously unselected package libio-socket-ssl-perl.
Preparing to unpack .../065-libio-socket-ssl-perl_2.085-1_all.deb ...
Unpacking libio-socket-ssl-perl (2.085-1) ...
Selecting previously unselected package libnet-http-perl.
Preparing to unpack .../066-libnet-http-perl_6.23-1_all.deb ...
Unpacking libnet-http-perl (6.23-1) ...
Selecting previously unselected package liblwp-protocol-https-perl.
Preparing to unpack .../067-liblwp-protocol-https-perl_6.13-1_all.deb ...
Unpacking liblwp-protocol-https-perl (6.13-1) ...
Selecting previously unselected package libtry-tiny-perl.
Preparing to unpack .../068-libtry-tiny-perl_0.31-2_all.deb ...
Unpacking libtry-tiny-perl (0.31-2) ...
Selecting previously unselected package libwww-robotrules-perl.
Preparing to unpack .../069-libwww-robotrules-perl_6.02-1_all.deb ...
Unpacking libwww-robotrules-perl (6.02-1) ...
Selecting previously unselected package libwww-perl.
Preparing to unpack .../070-libwww-perl_6.76-1_all.deb ...
Unpacking libwww-perl (6.76-1) ...
Selecting previously unselected package icoutils.
Preparing to unpack .../071-icoutils_0.32.3-4build2_amd64.deb ...
Unpacking icoutils (0.32.3-4build2) ...
Selecting previously unselected package libnetpbm11t64:amd64.
Preparing to unpack .../072-libnetpbm11t64_2%3a11.05.02-1.1build1_amd64.deb ...
Unpacking libnetpbm11t64:amd64 (2:11.05.02-1.1build1) ...
Selecting previously unselected package netpbm.
Preparing to unpack .../073-netpbm_2%3a11.05.02-1.1build1_amd64.deb ...
Unpacking netpbm (2:11.05.02-1.1build1) ...
Selecting previously unselected package libldm-1.0-0t64:amd64.
Preparing to unpack .../074-libldm-1.0-0t64_0.2.5-1.1build2_amd64.deb ...
Unpacking libldm-1.0-0t64:amd64 (0.2.5-1.1build2) ...
Selecting previously unselected package ldmtool.
Preparing to unpack .../075-ldmtool_0.2.5-1.1build2_amd64.deb ...
Unpacking ldmtool (0.2.5-1.1build2) ...
Selecting previously unselected package lsscsi.
Preparing to unpack .../076-lsscsi_0.32-1build1_amd64.deb ...
Unpacking lsscsi (0.32-1build1) ...
Selecting previously unselected package lzop.
Preparing to unpack .../077-lzop_1.04-2build3_amd64.deb ...
Unpacking lzop (1.04-2build3) ...
Selecting previously unselected package mtools.
Preparing to unpack .../078-mtools_4.0.43-1build1_amd64.deb ...
Unpacking mtools (4.0.43-1build1) ...
Selecting previously unselected package scrub.
Preparing to unpack .../079-scrub_2.6.1-1build2_amd64.deb ...
Unpacking scrub (2.6.1-1build2) ...
Selecting previously unselected package libdate-manip-perl.
Preparing to unpack .../080-libdate-manip-perl_6.95-1_all.deb ...
Unpacking libdate-manip-perl (6.95-1) ...
Selecting previously unselected package sleuthkit.
Preparing to unpack .../081-sleuthkit_4.12.1+dfsg-1.1ubuntu2_amd64.deb ...
Unpacking sleuthkit (4.12.1+dfsg-1.1ubuntu2) ...
Selecting previously unselected package syslinux.
Preparing to unpack .../082-syslinux_3%3a6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3_amd64.deb ...
Unpacking syslinux (3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3) ...
Selecting previously unselected package libguestfs0t64:amd64.
Preparing to unpack .../083-libguestfs0t64_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking libguestfs0t64:amd64 (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package libconfig9:amd64.
Preparing to unpack .../084-libconfig9_1.5-0.4build2_amd64.deb ...
Unpacking libconfig9:amd64 (1.5-0.4build2) ...
Selecting previously unselected package guestfish.
Preparing to unpack .../085-guestfish_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking guestfish (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package libxml-parser-perl.
Preparing to unpack .../086-libxml-parser-perl_2.47-1build3_amd64.deb ...
Unpacking libxml-parser-perl (2.47-1build3) ...
Selecting previously unselected package libxml-xpath-perl.
Preparing to unpack .../087-libxml-xpath-perl_1.48-1_all.deb ...
Unpacking libxml-xpath-perl (1.48-1) ...
Selecting previously unselected package libwin-hivex-perl.
Preparing to unpack .../088-libwin-hivex-perl_1.3.23-1build7_amd64.deb ...
Unpacking libwin-hivex-perl (1.3.23-1build7) ...
Selecting previously unselected package libsys-virt-perl.
Preparing to unpack .../089-libsys-virt-perl_10.0.0-1build2_amd64.deb ...
Unpacking libsys-virt-perl (10.0.0-1build2) ...
Selecting previously unselected package libguestfs-perl.
Preparing to unpack .../090-libguestfs-perl_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking libguestfs-perl (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package libstring-shellquote-perl.
Preparing to unpack .../091-libstring-shellquote-perl_1.04-3_all.deb ...
Unpacking libstring-shellquote-perl (1.04-3) ...
Selecting previously unselected package guestfs-tools.
Preparing to unpack .../092-guestfs-tools_1.52.0-2ubuntu5_amd64.deb ...
Unpacking guestfs-tools (1.52.0-2ubuntu5) ...
Selecting previously unselected package guestmount.
Preparing to unpack .../093-guestmount_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking guestmount (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package libhfsp0t64.
Preparing to unpack .../094-libhfsp0t64_1.0.4-17.1build1_amd64.deb ...
Unpacking libhfsp0t64 (1.0.4-17.1build1) ...
Selecting previously unselected package hfsplus.
Preparing to unpack .../095-hfsplus_1.0.4-17.1build1_amd64.deb ...
Unpacking hfsplus (1.0.4-17.1build1) ...
Selecting previously unselected package libdata-dump-perl.
Preparing to unpack .../096-libdata-dump-perl_1.25-1_all.deb ...
Unpacking libdata-dump-perl (1.25-1) ...
Selecting previously unselected package libfont-afm-perl.
Preparing to unpack .../097-libfont-afm-perl_1.20-4_all.deb ...
Unpacking libfont-afm-perl (1.20-4) ...
Selecting previously unselected package libhtml-form-perl.
Preparing to unpack .../098-libhtml-form-perl_6.11-1_all.deb ...
Unpacking libhtml-form-perl (6.11-1) ...
Selecting previously unselected package libhtml-format-perl.
Preparing to unpack .../099-libhtml-format-perl_2.16-2_all.deb ...
Unpacking libhtml-format-perl (2.16-2) ...
Selecting previously unselected package libhttp-daemon-perl.
Preparing to unpack .../100-libhttp-daemon-perl_6.16-1_all.deb ...
Unpacking libhttp-daemon-perl (6.16-1) ...
Selecting previously unselected package libnet-smtp-ssl-perl.
Preparing to unpack .../101-libnet-smtp-ssl-perl_1.04-2_all.deb ...
Unpacking libnet-smtp-ssl-perl (1.04-2) ...
Selecting previously unselected package libmailtools-perl.
Preparing to unpack .../102-libmailtools-perl_2.21-2_all.deb ...
Unpacking libmailtools-perl (2.21-2) ...
Selecting previously unselected package libpaper-utils.
Preparing to unpack .../103-libpaper-utils_1.1.29build1_amd64.deb ...
Unpacking libpaper-utils (1.1.29build1) ...
Selecting previously unselected package reiserfsprogs.
Preparing to unpack .../104-reiserfsprogs_1%3a3.6.27-7.1build1_amd64.deb ...
Unpacking reiserfsprogs (1:3.6.27-7.1build1) ...
Selecting previously unselected package rpm-common.
Preparing to unpack .../105-rpm-common_4.18.2+dfsg-2.1build2_amd64.deb ...
Unpacking rpm-common (4.18.2+dfsg-2.1build2) ...
Selecting previously unselected package syslinux-common.
Preparing to unpack .../106-syslinux-common_3%3a6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3_all.deb ...
Unpacking syslinux-common (3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3) ...
Selecting previously unselected package libguestfs-tools.
Preparing to unpack .../107-libguestfs-tools_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking libguestfs-tools (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package virt-p2v.
Preparing to unpack .../108-virt-p2v_1.42.3-1_amd64.deb ...
Unpacking virt-p2v (1.42.3-1) ...
Selecting previously unselected package libauthen-sasl-perl.
Preparing to unpack .../109-libauthen-sasl-perl_2.1700-1_all.deb ...
Unpacking libauthen-sasl-perl (2.1700-1) ...
Selecting previously unselected package libguestfs-hfsplus:amd64.
Preparing to unpack .../110-libguestfs-hfsplus_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking libguestfs-hfsplus:amd64 (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package libguestfs-reiserfs:amd64.
Preparing to unpack .../111-libguestfs-reiserfs_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking libguestfs-reiserfs:amd64 (1:1.52.0-5ubuntu3) ...
Selecting previously unselected package libguestfs-xfs:amd64.
Preparing to unpack .../112-libguestfs-xfs_1%3a1.52.0-5ubuntu3_amd64.deb ...
Unpacking libguestfs-xfs:amd64 (1:1.52.0-5ubuntu3) ...
Setting up libconfig9:amd64 (1.5-0.4build2) ...
Setting up libpaper1:amd64 (1.1.29build1) ...

Creating config file /etc/papersize with new version
Setting up libice6:amd64 (2:1.0.10-1build3) ...
Setting up reiserfsprogs (1:3.6.27-7.1build1) ...
update-initramfs: deferring update (trigger activated)
Setting up fonts-noto-mono (20201225-2) ...
Setting up libfont-afm-perl (1.20-4) ...
Setting up exfatprogs (1.2.2-1build1) ...
Setting up mtools (4.0.43-1build1) ...
Setting up augeas-lenses (1.14.1-1build2) ...
Setting up attr (1:2.5.2-1build1.1) ...
Setting up libclone-perl:amd64 (0.46-1build3) ...
Setting up libvhdi1:amd64 (20210425-1build5) ...
Setting up f2fs-tools (1.16.0-1) ...
Setting up libhtml-tagset-perl (3.20-6) ...
Setting up libijs-0.35:amd64 (0.35-15.1build1) ...
Setting up libyara10:amd64 (4.5.0-1build2) ...
Setting up libauthen-sasl-perl (2.1700-1) ...
Setting up libgs-common (10.02.1~dfsg1-0ubuntu7.8) ...
Setting up liblwp-mediatypes-perl (6.04-2) ...
Setting up binutils-common:amd64 (2.42-4ubuntu2.8) ...
Setting up libtry-tiny-perl (0.31-2) ...
Setting up perl-openssl-defaults:amd64 (7build3) ...
Setting up libctf-nobfd0:amd64 (2.42-4ubuntu2.8) ...
Setting up syslinux-common (3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3) ...
Setting up libencode-locale-perl (1.05-3) ...
Setting up libpaper-utils (1.1.29build1) ...
Setting up bzip2 (1.0.8-5.1build0.1) ...
Setting up syslinux (3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3) ...
Setting up libstring-shellquote-perl (1.04-3) ...
Setting up libnetpbm11t64:amd64 (2:11.05.02-1.1build1) ...
Setting up libsframe1:amd64 (2.42-4ubuntu2.8) ...
Setting up poppler-data (0.4.12-1) ...
Setting up libafflib0t64:amd64 (3.7.20-1.1ubuntu5) ...
Setting up libfontenc1:amd64 (1:1.1.8-1build1) ...
Setting up libdata-dump-perl (1.25-1) ...
Setting up libjbig2dec0:amd64 (0.20-1build3) ...
Setting up libaugeas0:amd64 (1.14.1-1build2) ...
Setting up xfonts-encodings (1:1.0.5-0ubuntu2) ...
Setting up db5.3-util (5.3.28+dfsg2-7) ...
Setting up libidn12:amd64 (1.42-1build1) ...
Setting up libio-html-perl (1.004-3) ...
Setting up lsscsi (0.32-1build1) ...
Setting up netpbm (2:11.05.02-1.1build1) ...
Setting up scrub (2.6.1-1build2) ...
Setting up libtimedate-perl (2.3300-2) ...
Setting up extlinux (3:6.04~git20190206.bf6db5b4+dfsg1-3ubuntu3) ...
Setting up liblua5.3-0:amd64 (5.3.6-2build2) ...
Setting up lzop (1.04-2build3) ...
Setting up libopenjp2-7:amd64 (2.5.0-2ubuntu0.4) ...
Setting up libewf2:amd64 (20140814-1build3) ...
Setting up fonts-droid-fallback (1:6.0.1r16-1.1build1) ...
Setting up libbinutils:amd64 (2.42-4ubuntu2.8) ...
Setting up libhivex0:amd64 (1.3.23-1build7) ...
Setting up libfuse2t64:amd64 (2.9.9-8.1build1) ...
Setting up supermin (5.2.2-4ubuntu4) ...
Setting up libsm6:amd64 (2:1.2.3-1build3) ...
Setting up libhfsp0t64 (1.0.4-17.1build1) ...
Setting up libldm-1.0-0t64:amd64 (0.2.5-1.1build2) ...
Setting up liburi-perl (5.27-1) ...
Setting up libdate-manip-perl (6.95-1) ...
Setting up libsys-virt-perl (10.0.0-1build2) ...
Setting up libbfio1:amd64 (20170123-6) ...
Setting up libctf0:amd64 (2.42-4ubuntu2.8) ...
Setting up libnet-ssleay-perl:amd64 (1.94-1build4) ...
Setting up hfsplus (1.0.4-17.1build1) ...
Setting up libhttp-date-perl (6.06-1) ...
Setting up libfile-listing-perl (6.16-1) ...
Setting up db-util (1:5.3.21ubuntu2) ...
Setting up libnet-http-perl (6.23-1) ...
Setting up libwin-hivex-perl (1.3.23-1build7) ...
Setting up xfonts-utils (1:7.7+6build3) ...
Setting up ldmtool (0.2.5-1.1build2) ...
Setting up libvmdk1:amd64 (20200926-2build5) ...
Setting up libgprofng0:amd64 (2.42-4ubuntu2.8) ...
Setting up libxt6t64:amd64 (1:1.2.1-1.2build1) ...
Setting up librpmio9t64 (4.18.2+dfsg-2.1build2) ...
Setting up libwww-robotrules-perl (6.02-1) ...
Setting up libhtml-parser-perl:amd64 (3.81-1build3) ...
Setting up libtsk19t64:amd64 (4.12.1+dfsg-1.1ubuntu2) ...
Setting up libio-socket-ssl-perl (2.085-1) ...
Setting up libhttp-message-perl (6.45-1ubuntu1) ...
Setting up binutils-x86-64-linux-gnu (2.42-4ubuntu2.8) ...
Setting up libhtml-form-perl (6.11-1) ...
Setting up libhttp-negotiate-perl (6.01-2) ...
Setting up librpm9t64 (4.18.2+dfsg-2.1build2) ...
Setting up libhttp-cookies-perl (6.11-1) ...
Setting up libhtml-tree-perl (5.07-3) ...
Setting up libhtml-format-perl (2.16-2) ...
Setting up rpm-common (4.18.2+dfsg-2.1build2) ...
Setting up binutils (2.42-4ubuntu2.8) ...
Setting up fonts-urw-base35 (20200910-8) ...
Setting up libnet-smtp-ssl-perl (1.04-2) ...
Setting up libmailtools-perl (2.21-2) ...
Setting up sleuthkit (4.12.1+dfsg-1.1ubuntu2) ...
Setting up libhttp-daemon-perl (6.16-1) ...
Setting up libgs10-common (10.02.1~dfsg1-0ubuntu7.8) ...
Setting up libgs10:amd64 (10.02.1~dfsg1-0ubuntu7.8) ...
Setting up ghostscript (10.02.1~dfsg1-0ubuntu7.8) ...
Setting up liblwp-protocol-https-perl (6.13-1) ...
Setting up libwww-perl (6.76-1) ...
Setting up icoutils (0.32.3-4build2) ...
Setting up libxml-parser-perl (2.47-1build3) ...
Setting up libxml-xpath-perl (1.48-1) ...
Setting up libguestfs0t64:amd64 (1:1.52.0-5ubuntu3) ...
Setting up libguestfs-xfs:amd64 (1:1.52.0-5ubuntu3) ...
Setting up libguestfs-perl (1:1.52.0-5ubuntu3) ...
Setting up guestfs-tools (1.52.0-2ubuntu5) ...
Setting up libguestfs-hfsplus:amd64 (1:1.52.0-5ubuntu3) ...
Setting up guestfish (1:1.52.0-5ubuntu3) ...
Setting up libguestfs-reiserfs:amd64 (1:1.52.0-5ubuntu3) ...
Setting up guestmount (1:1.52.0-5ubuntu3) ...
Setting up libguestfs-tools (1:1.52.0-5ubuntu3) ...
Setting up virt-p2v (1.42.3-1) ...
Processing triggers for man-db (2.12.0-4build2) ...
Processing triggers for dbus (1.14.10-4ubuntu4.1) ...
Processing triggers for install-info (7.1-3build2) ...
Processing triggers for fontconfig (2.15.0-1.1ubuntu2) ...
Processing triggers for initramfs-tools (0.142ubuntu25.5) ...
update-initramfs: Generating /boot/initrd.img-6.8.0-100-generic
Processing triggers for libc-bin (2.39-0ubuntu8.7) ...
Scanning processes...                                                                                                                                                                                                                       
Scanning candidates...                                                                                                                                                                                                                      
Scanning linux images...                                                                                                                                                                                                                    

Pending kernel upgrade!
Running kernel version:
  6.8.0-62-generic
Diagnostics:
  The currently running kernel version is not the expected kernel version 6.8.0-100-generic.

Restarting the system to load the new kernel will not be handled automatically, so you should consider rebooting.

Restarting services...

Service restarts being deferred:
 /etc/needrestart/restart.d/dbus.service
 systemctl restart getty@tty1.service
 systemctl restart serial-getty@ttyS0.service
 systemctl restart systemd-logind.service
 systemctl restart unattended-upgrades.service

No containers need to be restarted.

User sessions running outdated binaries:
 ubuntu @ user manager service: systemd[2569]

No VM guests are running outdated hypervisor (qemu) binaries on this host.
ubuntu@gelani-lab-2:~/kvm/nat-vm$ 


ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo virsh destroy nat-vm1 2>/dev/null || true

ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo virsh undefine nat-vm1 2>/dev/null || true

ubuntu@gelani-lab-2:~/kvm/nat-vm$ sudo mkdir -p /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:~/kvm/nat-vm$ cd /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ls -lh
total 599M
-rw-r--r-- 1 root         root 193K Feb  8 04:36 nat-vm1.qcow2
-rw-r----- 1 libvirt-qemu kvm  366K Feb  8 04:32 seed.iso
-rw-r----- 1 libvirt-qemu kvm  598M Jan  8 13:20 ubuntu-24.04-server-cloudimg-amd64.img
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo mv ubuntu-24.04-server-cloudimg-amd64.img base-ubuntu24.img
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chmod 750 /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chmod 640 /var/lib/libvirt/images/nat-vm1/*
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chmod 444 /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo rm -f /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo qemu-img create -f qcow2 \
  -F qcow2 -b /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img \
  /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 20G
Formatting '/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 backing_file=/var/lib/libvirt/images/nat-vm1/base-ubuntu24.img backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 | egrep -i 'file format|virtual size|backing file|backing file format'
file format: qcow2
virtual size: 20 GiB (21474836480 bytes)
backing file: /var/lib/libvirt/images/nat-vm1/base-ubuntu24.img
backing file format: qcow2
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import
[    0.644672] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.649839] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.655737] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.659693] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.664626] ACPI: Added _OSI(Module Device)
[    0.666709] ACPI: Added _OSI(Processor Device)
[    0.668712] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.671732] ACPI: Added _OSI(Processor Aggregator Device)
[    0.678351] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.684462] ACPI: _OSC evaluation for CPUs failed, trying _PDC
[    0.688057] ACPI: Interpreter enabled
[    0.690745] ACPI: PM: (supports S0 S5)
[    0.692691] ACPI: Using IOAPIC for interrupt routing
[    0.694997] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.699743] PCI: Using E820 reservations for host bridge windows
[    0.702926] ACPI: Enabled 2 GPEs in block 00 to 3F
[    0.710513] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.713698] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
[    0.717853] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotplug LTR DPC]
[    0.720956] acpi PNP0A08:00: _OSC: OS now controls [SHPCHotplug PME AER PCIeCapability]
[    0.725589] PCI host bridge to bus 0000:00
[    0.727715] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.730699] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.733732] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.737740] pci_bus 0000:00: root bus resource [mem 0x80000000-0xafffffff window]
[    0.741734] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
[    0.744755] pci_bus 0000:00: root bus resource [mem 0x100000000-0x8ffffffff window]
[    0.748784] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.751867] pci 0000:00:00.0: [8086:29c0] type 00 class 0x060000 conventional PCI endpoint
[    0.756571] pci 0000:00:01.0: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.764435] pci 0000:00:01.0: BAR 0 [mem 0xfce00000-0xfce00fff]
[    0.766793] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.769833] pci 0000:00:01.0:   bridge window [mem 0xfcc00000-0xfcdfffff]
[    0.774189] pci 0000:00:01.0:   bridge window [mem 0xfea00000-0xfebfffff 64bit pref]
[    0.780497] pci 0000:00:01.1: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.786435] pci 0000:00:01.1: BAR 0 [mem 0xfce01000-0xfce01fff]
[    0.789769] pci 0000:00:01.1: PCI bridge to [bus 02]
[    0.791838] pci 0000:00:01.1:   bridge window [mem 0xfca00000-0xfcbfffff]
[    0.796345] pci 0000:00:01.1:   bridge window [mem 0xfe800000-0xfe9fffff 64bit pref]
[    0.803171] pci 0000:00:01.2: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.808435] pci 0000:00:01.2: BAR 0 [mem 0xfce02000-0xfce02fff]
[    0.811786] pci 0000:00:01.2: PCI bridge to [bus 03]
[    0.813835] pci 0000:00:01.2:   bridge window [mem 0xfc800000-0xfc9fffff]
[    0.817526] pci 0000:00:01.2:   bridge window [mem 0xfe600000-0xfe7fffff 64bit pref]
[    0.824818] pci 0000:00:01.3: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.830434] pci 0000:00:01.3: BAR 0 [mem 0xfce03000-0xfce03fff]
[    0.832790] pci 0000:00:01.3: PCI bridge to [bus 04]
[    0.835825] pci 0000:00:01.3:   bridge window [mem 0xfc600000-0xfc7fffff]
[    0.839513] pci 0000:00:01.3:   bridge window [mem 0xfe400000-0xfe5fffff 64bit pref]
[    0.846692] pci 0000:00:01.4: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.852433] pci 0000:00:01.4: BAR 0 [mem 0xfce04000-0xfce04fff]
[    0.854774] pci 0000:00:01.4: PCI bridge to [bus 05]
[    0.857831] pci 0000:00:01.4:   bridge window [mem 0xfc400000-0xfc5fffff]
[    0.861484] pci 0000:00:01.4:   bridge window [mem 0xfe200000-0xfe3fffff 64bit pref]
[    0.867499] pci 0000:00:01.5: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.873838] pci 0000:00:01.5: BAR 0 [mem 0xfce05000-0xfce05fff]
[    0.876772] pci 0000:00:01.5: PCI bridge to [bus 06]
[    0.879821] pci 0000:00:01.5:   bridge window [mem 0xfc200000-0xfc3fffff]
[    0.884406] pci 0000:00:01.5:   bridge window [mem 0xfe000000-0xfe1fffff 64bit pref]
[    0.891235] pci 0000:00:01.6: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.896434] pci 0000:00:01.6: BAR 0 [mem 0xfce06000-0xfce06fff]
[    0.898782] pci 0000:00:01.6: PCI bridge to [bus 07]
[    0.901846] pci 0000:00:01.6:   bridge window [mem 0xfc000000-0xfc1fffff]
[    0.905590] pci 0000:00:01.6:   bridge window [mem 0xfde00000-0xfdffffff 64bit pref]
[    0.912589] pci 0000:00:01.7: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.918435] pci 0000:00:01.7: BAR 0 [mem 0xfce07000-0xfce07fff]
[    0.921811] pci 0000:00:01.7: PCI bridge to [bus 08]
[    0.923825] pci 0000:00:01.7:   bridge window [mem 0xfbe00000-0xfbffffff]
[    0.928484] pci 0000:00:01.7:   bridge window [mem 0xfdc00000-0xfddfffff 64bit pref]
[    0.934472] pci 0000:00:02.0: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.940433] pci 0000:00:02.0: BAR 0 [mem 0xfce08000-0xfce08fff]
[    0.942769] pci 0000:00:02.0: PCI bridge to [bus 09]
[    0.944871] pci 0000:00:02.0:   bridge window [mem 0xfbc00000-0xfbdfffff]
[    0.949376] pci 0000:00:02.0:   bridge window [mem 0xfda00000-0xfdbfffff 64bit pref]
[    0.955515] pci 0000:00:02.1: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.961434] pci 0000:00:02.1: BAR 0 [mem 0xfce09000-0xfce09fff]
[    0.964771] pci 0000:00:02.1: PCI bridge to [bus 0a]
[    0.966819] pci 0000:00:02.1:   bridge window [mem 0xfba00000-0xfbbfffff]
[    0.971432] pci 0000:00:02.1:   bridge window [mem 0xfd800000-0xfd9fffff 64bit pref]
[    0.978503] pci 0000:00:02.2: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.984452] pci 0000:00:02.2: BAR 0 [mem 0xfce0a000-0xfce0afff]
[    0.987776] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    0.990863] pci 0000:00:02.2:   bridge window [mem 0xfb800000-0xfb9fffff]
[    0.994515] pci 0000:00:02.2:   bridge window [mem 0xfd600000-0xfd7fffff 64bit pref]
[    1.002303] pci 0000:00:02.3: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    1.007438] pci 0000:00:02.3: BAR 0 [mem 0xfce0b000-0xfce0bfff]
[    1.010805] pci 0000:00:02.3: PCI bridge to [bus 0c]
[    1.013830] pci 0000:00:02.3:   bridge window [mem 0xfb600000-0xfb7fffff]
[    1.017407] pci 0000:00:02.3:   bridge window [mem 0xfd400000-0xfd5fffff 64bit pref]
[    1.025523] pci 0000:00:02.4: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    1.030433] pci 0000:00:02.4: BAR 0 [mem 0xfce0c000-0xfce0cfff]
[    1.033796] pci 0000:00:02.4: PCI bridge to [bus 0d]
[    1.035836] pci 0000:00:02.4:   bridge window [mem 0xfb400000-0xfb5fffff]
[    1.040387] pci 0000:00:02.4:   bridge window [mem 0xfd200000-0xfd3fffff 64bit pref]
[    1.047498] pci 0000:00:02.5: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    1.052434] pci 0000:00:02.5: BAR 0 [mem 0xfce0d000-0xfce0dfff]
[    1.055789] pci 0000:00:02.5: PCI bridge to [bus 0e]
[    1.057819] pci 0000:00:02.5:   bridge window [mem 0xfb200000-0xfb3fffff]
[    1.062406] pci 0000:00:02.5:   bridge window [mem 0xfd000000-0xfd1fffff 64bit pref]
[    1.116718] pci 0000:00:1f.0: [8086:2918] type 00 class 0x060100 conventional PCI endpoint
[    1.122132] pci 0000:00:1f.0: quirk: [io  0x0600-0x067f] claimed by ICH6 ACPI/GPIO/TCO
[    1.126542] pci 0000:00:1f.2: [8086:2922] type 00 class 0x010601 conventional PCI endpoint
[    1.135539] pci 0000:00:1f.2: BAR 4 [io  0xc040-0xc05f]
[    1.137746] pci 0000:00:1f.2: BAR 5 [mem 0xfce0e000-0xfce0efff]
[    1.141899] pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500 conventional PCI endpoint
[    1.147578] pci 0000:00:1f.3: BAR 4 [io  0x0700-0x073f]
[    1.152062] acpiphp: Slot [0] registered
[    1.155254] pci 0000:01:00.0: [1af4:1041] type 00 class 0x020000 PCIe Endpoint
[    1.161462] pci 0000:01:00.0: BAR 1 [mem 0xfcc80000-0xfcc80fff]
[    1.165851] pci 0000:01:00.0: BAR 4 [mem 0xfea00000-0xfea03fff 64bit pref]
[    1.168727] pci 0000:01:00.0: ROM [mem 0xfcc00000-0xfcc7ffff pref]
[    1.176641] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.179982] acpiphp: Slot [0-2] registered
[    1.182173] pci 0000:02:00.0: [1b36:000d] type 00 class 0x0c0330 PCIe Endpoint
[    1.187274] pci 0000:02:00.0: BAR 0 [mem 0xfca00000-0xfca03fff 64bit]
[    1.193566] pci 0000:00:01.1: PCI bridge to [bus 02]
[    1.197984] acpiphp: Slot [0-3] registered
[    1.200225] pci 0000:03:00.0: [1af4:1043] type 00 class 0x078000 PCIe Endpoint
[    1.207462] pci 0000:03:00.0: BAR 1 [mem 0xfc800000-0xfc800fff]
[    1.209833] pci 0000:03:00.0: BAR 4 [mem 0xfe600000-0xfe603fff 64bit pref]
[    1.218694] pci 0000:00:01.2: PCI bridge to [bus 03]
[    1.223057] acpiphp: Slot [0-4] registered
[    1.225234] pci 0000:04:00.0: [1af4:1042] type 00 class 0x010000 PCIe Endpoint
[    1.230460] pci 0000:04:00.0: BAR 1 [mem 0xfc600000-0xfc600fff]
[    1.232811] pci 0000:04:00.0: BAR 4 [mem 0xfe400000-0xfe403fff 64bit pref]
[    1.240695] pci 0000:00:01.3: PCI bridge to [bus 04]
[    1.244999] acpiphp: Slot [0-5] registered
[    1.247198] pci 0000:05:00.0: [1af4:1045] type 00 class 0x00ff00 PCIe Endpoint
[    1.252517] pci 0000:05:00.0: BAR 4 [mem 0xfe200000-0xfe203fff 64bit pref]
[    1.260593] pci 0000:00:01.4: PCI bridge to [bus 05]
[    1.263980] acpiphp: Slot [0-6] registered
[    1.266231] pci 0000:06:00.0: [1af4:1044] type 00 class 0x00ff00 PCIe Endpoint
[    1.271460] pci 0000:06:00.0: BAR 1 [mem 0xfc200000-0xfc200fff]
[    1.273835] pci 0000:06:00.0: BAR 4 [mem 0xfe000000-0xfe003fff 64bit pref]
[    1.282648] pci 0000:00:01.5: PCI bridge to [bus 06]
[    1.285967] acpiphp: Slot [0-7] registered
[    1.290512] pci 0000:00:01.6: PCI bridge to [bus 07]
[    1.293968] acpiphp: Slot [0-8] registered
[    1.297489] pci 0000:00:01.7: PCI bridge to [bus 08]
[    1.300966] acpiphp: Slot [0-9] registered
[    1.304555] pci 0000:00:02.0: PCI bridge to [bus 09]
[    1.308964] acpiphp: Slot [0-10] registered
[    1.312495] pci 0000:00:02.1: PCI bridge to [bus 0a]
[    1.315990] acpiphp: Slot [0-11] registered
[    1.320470] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    1.323980] acpiphp: Slot [0-12] registered
[    1.327394] pci 0000:00:02.3: PCI bridge to [bus 0c]
[    1.331976] acpiphp: Slot [0-13] registered
[    1.335497] pci 0000:00:02.4: PCI bridge to [bus 0d]
[    1.340280] acpiphp: Slot [0-14] registered
[    1.343533] pci 0000:00:02.5: PCI bridge to [bus 0e]
[    1.361055] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
[    1.363938] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    1.369918] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    1.372930] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    1.375912] ACPI: PCI: Interrupt link LNKE configured for IRQ 10
[    1.378959] ACPI: PCI: Interrupt link LNKF configured for IRQ 10
[    1.381922] ACPI: PCI: Interrupt link LNKG configured for IRQ 11
[    1.384903] ACPI: PCI: Interrupt link LNKH configured for IRQ 11
[    1.387801] ACPI: PCI: Interrupt link GSIA configured for IRQ 16
[    1.390742] ACPI: PCI: Interrupt link GSIB configured for IRQ 17
[    1.392728] ACPI: PCI: Interrupt link GSIC configured for IRQ 18
[    1.395722] ACPI: PCI: Interrupt link GSID configured for IRQ 19
[    1.398711] ACPI: PCI: Interrupt link GSIE configured for IRQ 20
[    1.400719] ACPI: PCI: Interrupt link GSIF configured for IRQ 21
[    1.403714] ACPI: PCI: Interrupt link GSIG configured for IRQ 22
[    1.406710] ACPI: PCI: Interrupt link GSIH configured for IRQ 23
[    1.410424] iommu: Default domain type: Translated
[    1.412705] iommu: DMA domain TLB invalidation policy: lazy mode
[    1.415930] SCSI subsystem initialized
[    1.417746] ACPI: bus type USB registered
[    1.419711] usbcore: registered new interface driver usbfs
[    1.421715] usbcore: registered new interface driver hub
[    1.424781] usbcore: registered new device driver usb
[    1.427726] pps_core: LinuxPPS API ver. 1 registered
[    1.429691] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.433724] PTP clock support registered
[    1.436448] EDAC MC: Ver: 3.0.0
[    1.439776] NetLabel: Initializing
[    1.441692] NetLabel:  domain hash size = 128
[    1.443689] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    1.446743] NetLabel:  unlabeled traffic allowed by default
[    1.448815] mctp: management component transport protocol core
[    1.451841] NET: Registered PF_MCTP protocol family
[    1.454695] PCI: Using ACPI for IRQ routing
[    2.128242] vgaarb: loaded
[    2.129813] clocksource: Switched to clocksource kvm-clock
[    2.132927] VFS: Disk quotas dquot_6.6.0
[    2.137381] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    2.141447] AppArmor: AppArmor Filesystem Enabled
[    2.144002] pnp: PnP ACPI init
[    2.146273] system 00:04: [mem 0xb0000000-0xbfffffff window] has been reserved
[    2.151121] pnp: PnP ACPI: found 5 devices
[    2.160341] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    2.165525] NET: Registered PF_INET protocol family
[    2.168175] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    2.188646] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)
[    2.193701] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    2.198413] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    2.203180] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    2.207535] TCP: Hash tables configured (established 16384 bind 16384)
[    2.211613] MPTCP token hash table entries: 2048 (order: 3, 49152 bytes, linear)
[    2.216105] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    2.219922] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    2.224132] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    2.227831] NET: Registered PF_XDP protocol family
[    2.230854] pci 0000:00:01.0: bridge window [io  0x1000-0x0fff] to [bus 01] add_size 1000
[    2.236111] pci 0000:00:01.1: bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
[    2.241236] pci 0000:00:01.2: bridge window [io  0x1000-0x0fff] to [bus 03] add_size 1000
[    2.246024] pci 0000:00:01.3: bridge window [io  0x1000-0x0fff] to [bus 04] add_size 1000
[    2.251010] pci 0000:00:01.4: bridge window [io  0x1000-0x0fff] to [bus 05] add_size 1000
[    2.256164] pci 0000:00:01.5: bridge window [io  0x1000-0x0fff] to [bus 06] add_size 1000
[    2.261254] pci 0000:00:01.6: bridge window [io  0x1000-0x0fff] to [bus 07] add_size 1000
[    2.266244] pci 0000:00:01.7: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
[    2.271319] pci 0000:00:02.0: bridge window [io  0x1000-0x0fff] to [bus 09] add_size 1000
[    2.276453] pci 0000:00:02.1: bridge window [io  0x1000-0x0fff] to [bus 0a] add_size 1000
[    2.281202] pci 0000:00:02.2: bridge window [io  0x1000-0x0fff] to [bus 0b] add_size 1000
[    2.286321] pci 0000:00:02.3: bridge window [io  0x1000-0x0fff] to [bus 0c] add_size 1000
[    2.291474] pci 0000:00:02.4: bridge window [io  0x1000-0x0fff] to [bus 0d] add_size 1000
[    2.296599] pci 0000:00:02.5: bridge window [io  0x1000-0x0fff] to [bus 0e] add_size 1000
[    2.301312] pci 0000:00:01.0: bridge window [io  0x1000-0x1fff]: assigned
[    2.305234] pci 0000:00:01.1: bridge window [io  0x2000-0x2fff]: assigned
[    2.309628] pci 0000:00:01.2: bridge window [io  0x3000-0x3fff]: assigned
[    2.313955] pci 0000:00:01.3: bridge window [io  0x4000-0x4fff]: assigned
[    2.318288] pci 0000:00:01.4: bridge window [io  0x5000-0x5fff]: assigned
[    2.323804] pci 0000:00:01.5: bridge window [io  0x6000-0x6fff]: assigned
[    2.327612] pci 0000:00:01.6: bridge window [io  0x7000-0x7fff]: assigned
[    2.331957] pci 0000:00:01.7: bridge window [io  0x8000-0x8fff]: assigned
[    2.336310] pci 0000:00:02.0: bridge window [io  0x9000-0x9fff]: assigned
[    2.340670] pci 0000:00:02.1: bridge window [io  0xa000-0xafff]: assigned
[    2.345019] pci 0000:00:02.2: bridge window [io  0xb000-0xbfff]: assigned
[    2.349337] pci 0000:00:02.3: bridge window [io  0xd000-0xdfff]: assigned
[    2.353637] pci 0000:00:02.4: bridge window [io  0xe000-0xefff]: assigned
[    2.357452] pci 0000:00:02.5: bridge window [io  0xf000-0xffff]: assigned
[    2.361279] pci 0000:00:01.0: PCI bridge to [bus 01]
[    2.364646] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[    2.370101] pci 0000:00:01.0:   bridge window [mem 0xfcc00000-0xfcdfffff]
[    2.375597] pci 0000:00:01.0:   bridge window [mem 0xfea00000-0xfebfffff 64bit pref]
[    2.382646] pci 0000:00:01.1: PCI bridge to [bus 02]
[    2.385519] pci 0000:00:01.1:   bridge window [io  0x2000-0x2fff]
[    2.391129] pci 0000:00:01.1:   bridge window [mem 0xfca00000-0xfcbfffff]
[    2.396617] pci 0000:00:01.1:   bridge window [mem 0xfe800000-0xfe9fffff 64bit pref]
[    2.403539] pci 0000:00:01.2: PCI bridge to [bus 03]
[    2.406999] pci 0000:00:01.2:   bridge window [io  0x3000-0x3fff]
[    2.411993] pci 0000:00:01.2:   bridge window [mem 0xfc800000-0xfc9fffff]
[    2.417127] pci 0000:00:01.2:   bridge window [mem 0xfe600000-0xfe7fffff 64bit pref]
[    2.424270] pci 0000:00:01.3: PCI bridge to [bus 04]
[    2.427322] pci 0000:00:01.3:   bridge window [io  0x4000-0x4fff]
[    2.431819] pci 0000:00:01.3:   bridge window [mem 0xfc600000-0xfc7fffff]
[    2.436823] pci 0000:00:01.3:   bridge window [mem 0xfe400000-0xfe5fffff 64bit pref]
[    2.443813] pci 0000:00:01.4: PCI bridge to [bus 05]
[    2.447187] pci 0000:00:01.4:   bridge window [io  0x5000-0x5fff]
[    2.451786] pci 0000:00:01.4:   bridge window [mem 0xfc400000-0xfc5fffff]
[    2.456946] pci 0000:00:01.4:   bridge window [mem 0xfe200000-0xfe3fffff 64bit pref]
[    2.462385] pci 0000:00:01.5: PCI bridge to [bus 06]
[    2.465413] pci 0000:00:01.5:   bridge window [io  0x6000-0x6fff]
[    2.469761] pci 0000:00:01.5:   bridge window [mem 0xfc200000-0xfc3fffff]
[    2.474988] pci 0000:00:01.5:   bridge window [mem 0xfe000000-0xfe1fffff 64bit pref]
[    2.480441] pci 0000:00:01.6: PCI bridge to [bus 07]
[    2.483433] pci 0000:00:01.6:   bridge window [io  0x7000-0x7fff]
[    2.488062] pci 0000:00:01.6:   bridge window [mem 0xfc000000-0xfc1fffff]
[    2.493144] pci 0000:00:01.6:   bridge window [mem 0xfde00000-0xfdffffff 64bit pref]
[    2.499439] pci 0000:00:01.7: PCI bridge to [bus 08]
[    2.502696] pci 0000:00:01.7:   bridge window [io  0x8000-0x8fff]
[    2.507486] pci 0000:00:01.7:   bridge window [mem 0xfbe00000-0xfbffffff]
[    2.512429] pci 0000:00:01.7:   bridge window [mem 0xfdc00000-0xfddfffff 64bit pref]
[    2.519516] pci 0000:00:02.0: PCI bridge to [bus 09]
[    2.522930] pci 0000:00:02.0:   bridge window [io  0x9000-0x9fff]
[    2.527655] pci 0000:00:02.0:   bridge window [mem 0xfbc00000-0xfbdfffff]
[    2.532549] pci 0000:00:02.0:   bridge window [mem 0xfda00000-0xfdbfffff 64bit pref]
[    2.539323] pci 0000:00:02.1: PCI bridge to [bus 0a]
[    2.542768] pci 0000:00:02.1:   bridge window [io  0xa000-0xafff]
[    2.548926] pci 0000:00:02.1:   bridge window [mem 0xfba00000-0xfbbfffff]
[    2.553829] pci 0000:00:02.1:   bridge window [mem 0xfd800000-0xfd9fffff 64bit pref]
[    2.560887] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    2.564290] pci 0000:00:02.2:   bridge window [io  0xb000-0xbfff]
[    2.568784] pci 0000:00:02.2:   bridge window [mem 0xfb800000-0xfb9fffff]
[    2.573161] pci 0000:00:02.2:   bridge window [mem 0xfd600000-0xfd7fffff 64bit pref]
[    2.580168] pci 0000:00:02.3: PCI bridge to [bus 0c]
[    2.583573] pci 0000:00:02.3:   bridge window [io  0xd000-0xdfff]
[    2.588331] pci 0000:00:02.3:   bridge window [mem 0xfb600000-0xfb7fffff]
[    2.594147] pci 0000:00:02.3:   bridge window [mem 0xfd400000-0xfd5fffff 64bit pref]
[    2.599817] pci 0000:00:02.4: PCI bridge to [bus 0d]
[    2.602698] pci 0000:00:02.4:   bridge window [io  0xe000-0xefff]
[    2.607489] pci 0000:00:02.4:   bridge window [mem 0xfb400000-0xfb5fffff]
[    2.613383] pci 0000:00:02.4:   bridge window [mem 0xfd200000-0xfd3fffff 64bit pref]
[    2.619377] pci 0000:00:02.5: PCI bridge to [bus 0e]
[    2.622801] pci 0000:00:02.5:   bridge window [io  0xf000-0xffff]
[    2.627400] pci 0000:00:02.5:   bridge window [mem 0xfb200000-0xfb3fffff]
[    2.632889] pci 0000:00:02.5:   bridge window [mem 0xfd000000-0xfd1fffff 64bit pref]
[    2.638970] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    2.643123] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    2.647155] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    2.651161] pci_bus 0000:00: resource 7 [mem 0x80000000-0xafffffff window]
[    2.655123] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xfebfffff window]
[    2.659040] pci_bus 0000:00: resource 9 [mem 0x100000000-0x8ffffffff window]
[    2.662953] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    2.666648] pci_bus 0000:01: resource 1 [mem 0xfcc00000-0xfcdfffff]
[    2.670801] pci_bus 0000:01: resource 2 [mem 0xfea00000-0xfebfffff 64bit pref]
[    2.675471] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    2.679158] pci_bus 0000:02: resource 1 [mem 0xfca00000-0xfcbfffff]
[    2.684009] pci_bus 0000:02: resource 2 [mem 0xfe800000-0xfe9fffff 64bit pref]
[    2.688503] pci_bus 0000:03: resource 0 [io  0x3000-0x3fff]
[    2.692189] pci_bus 0000:03: resource 1 [mem 0xfc800000-0xfc9fffff]
[    2.696242] pci_bus 0000:03: resource 2 [mem 0xfe600000-0xfe7fffff 64bit pref]
[    2.700926] pci_bus 0000:04: resource 0 [io  0x4000-0x4fff]
[    2.704389] pci_bus 0000:04: resource 1 [mem 0xfc600000-0xfc7fffff]
[    2.708548] pci_bus 0000:04: resource 2 [mem 0xfe400000-0xfe5fffff 64bit pref]
[    2.713046] pci_bus 0000:05: resource 0 [io  0x5000-0x5fff]
[    2.716387] pci_bus 0000:05: resource 1 [mem 0xfc400000-0xfc5fffff]
[    2.720340] pci_bus 0000:05: resource 2 [mem 0xfe200000-0xfe3fffff 64bit pref]
[    2.724954] pci_bus 0000:06: resource 0 [io  0x6000-0x6fff]
[    2.728096] pci_bus 0000:06: resource 1 [mem 0xfc200000-0xfc3fffff]
[    2.731845] pci_bus 0000:06: resource 2 [mem 0xfe000000-0xfe1fffff 64bit pref]
[    2.736892] pci_bus 0000:07: resource 0 [io  0x7000-0x7fff]
[    2.740593] pci_bus 0000:07: resource 1 [mem 0xfc000000-0xfc1fffff]
[    2.744796] pci_bus 0000:07: resource 2 [mem 0xfde00000-0xfdffffff 64bit pref]
[    2.750240] pci_bus 0000:08: resource 0 [io  0x8000-0x8fff]
[    2.753497] pci_bus 0000:08: resource 1 [mem 0xfbe00000-0xfbffffff]
[    2.757120] pci_bus 0000:08: resource 2 [mem 0xfdc00000-0xfddfffff 64bit pref]
[    2.761283] pci_bus 0000:09: resource 0 [io  0x9000-0x9fff]
[    2.765976] pci_bus 0000:09: resource 1 [mem 0xfbc00000-0xfbdfffff]
[    2.770109] pci_bus 0000:09: resource 2 [mem 0xfda00000-0xfdbfffff 64bit pref]
[    2.774414] pci_bus 0000:0a: resource 0 [io  0xa000-0xafff]
[    2.778126] pci_bus 0000:0a: resource 1 [mem 0xfba00000-0xfbbfffff]
[    2.781920] pci_bus 0000:0a: resource 2 [mem 0xfd800000-0xfd9fffff 64bit pref]
[    2.786612] pci_bus 0000:0b: resource 0 [io  0xb000-0xbfff]
[    2.790323] pci_bus 0000:0b: resource 1 [mem 0xfb800000-0xfb9fffff]
[    2.794401] pci_bus 0000:0b: resource 2 [mem 0xfd600000-0xfd7fffff 64bit pref]
[    2.798956] pci_bus 0000:0c: resource 0 [io  0xd000-0xdfff]
[    2.802645] pci_bus 0000:0c: resource 1 [mem 0xfb600000-0xfb7fffff]
[    2.806440] pci_bus 0000:0c: resource 2 [mem 0xfd400000-0xfd5fffff 64bit pref]
[    2.811152] pci_bus 0000:0d: resource 0 [io  0xe000-0xefff]
[    2.814913] pci_bus 0000:0d: resource 1 [mem 0xfb400000-0xfb5fffff]
[    2.818936] pci_bus 0000:0d: resource 2 [mem 0xfd200000-0xfd3fffff 64bit pref]
[    2.823637] pci_bus 0000:0e: resource 0 [io  0xf000-0xffff]
[    2.827111] pci_bus 0000:0e: resource 1 [mem 0xfb200000-0xfb3fffff]
[    2.831213] pci_bus 0000:0e: resource 2 [mem 0xfd000000-0xfd1fffff 64bit pref]
[    2.837270] ACPI: \_SB_.GSIF: Enabled at IRQ 21
[    2.843372] PCI: CLS 0 bytes, default 64
[    2.846018] Trying to unpack rootfs image as initramfs...
[    2.849914] Initialise system trusted keyrings
[    2.852656] Key type blacklist registered
[    2.858459] workingset: timestamp_bits=36 max_order=19 bucket_order=0
[    2.866918] zbud: loaded
[    2.871025] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    2.879099] fuse: init (API version 7.39)
[    2.884781] integrity: Platform Keyring initialized
[    2.890145] integrity: Machine keyring initialized
[    2.911350] Key type asymmetric registered
[    2.914360] Asymmetric key parser 'x509' registered
[    2.917843] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
[    2.922891] io scheduler mq-deadline registered
[    2.930411] pcieport 0000:00:01.0: PME: Signaling with IRQ 24
[    2.935927] Freeing initrd memory: 29932K
[    2.939143] pcieport 0000:00:01.0: AER: enabled with IRQ 24
[    2.946506] pcieport 0000:00:01.1: PME: Signaling with IRQ 25
[    2.951243] pcieport 0000:00:01.1: AER: enabled with IRQ 25
[    2.959840] pcieport 0000:00:01.2: PME: Signaling with IRQ 26
[    2.964562] pcieport 0000:00:01.2: AER: enabled with IRQ 26
[    2.973348] pcieport 0000:00:01.3: PME: Signaling with IRQ 27
[    2.977995] pcieport 0000:00:01.3: AER: enabled with IRQ 27
[    2.986883] pcieport 0000:00:01.4: PME: Signaling with IRQ 28
[    2.991634] pcieport 0000:00:01.4: AER: enabled with IRQ 28
[    3.000607] pcieport 0000:00:01.5: PME: Signaling with IRQ 29
[    3.007047] pcieport 0000:00:01.5: AER: enabled with IRQ 29
[    3.015163] pcieport 0000:00:01.6: PME: Signaling with IRQ 30
[    3.019894] pcieport 0000:00:01.6: AER: enabled with IRQ 30
[    3.028392] pcieport 0000:00:01.7: PME: Signaling with IRQ 31
[    3.033244] pcieport 0000:00:01.7: AER: enabled with IRQ 31
[    3.040083] ACPI: \_SB_.GSIG: Enabled at IRQ 22
[    3.045289] pcieport 0000:00:02.0: PME: Signaling with IRQ 32
[    3.049384] pcieport 0000:00:02.0: AER: enabled with IRQ 32
[    3.057481] pcieport 0000:00:02.1: PME: Signaling with IRQ 33
[    3.062268] pcieport 0000:00:02.1: AER: enabled with IRQ 33
[    3.070104] pcieport 0000:00:02.2: PME: Signaling with IRQ 34
[    3.074282] pcieport 0000:00:02.2: AER: enabled with IRQ 34
[    3.082530] pcieport 0000:00:02.3: PME: Signaling with IRQ 35
[    3.086718] pcieport 0000:00:02.3: AER: enabled with IRQ 35
[    3.094215] pcieport 0000:00:02.4: PME: Signaling with IRQ 36
[    3.098953] pcieport 0000:00:02.4: AER: enabled with IRQ 36
[    3.107573] pcieport 0000:00:02.5: PME: Signaling with IRQ 37
[    3.112167] pcieport 0000:00:02.5: AER: enabled with IRQ 37
[    3.117831] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    3.122582] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    3.127850] ACPI: button: Power Button [PWRF]
[    3.154174] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    3.189490] 00:00: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    3.239626] Linux agpgart interface v0.103
[    3.245988] loop: module loaded
[    3.249009] virtio_blk virtio2: 2/0/0 default/read/poll queues
[    3.256322] virtio_blk virtio2: [vda] 41943040 512-byte logical blocks (21.5 GB/20.0 GiB)
[    3.266660] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    3.271877] GPT:7340031 != 41943039
[    3.274477] GPT:Alternate GPT header not at the end of the disk.
[    3.278542] GPT:7340031 != 41943039
[    3.281251] GPT: Use GNU Parted to correct GPT errors.
[    3.285007]  vda: vda1 vda14 vda15 vda16
[    3.288513] ACPI: bus type drm_connector registered
[    3.292456] tun: Universal TUN/TAP device driver, 1.6
[    3.300786] PPP generic driver version 2.4.2
[    3.304162] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    3.312336] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.315717] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.319564] mousedev: PS/2 mouse device common for all mice
[    3.323686] rtc_cmos 00:03: RTC can wake from S4
[    3.329297] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
[    3.335380] rtc_cmos 00:03: registered as rtc0
[    3.339460] rtc_cmos 00:03: setting system clock to 2026-02-08T04:40:04 UTC (1770525604)
[    3.345024] rtc_cmos 00:03: alarms up to one day, y3k, 242 bytes nvram
[    3.349309] i2c_dev: i2c /dev entries driver
[    3.352412] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    3.360142] device-mapper: uevent: version 1.0.3
[    3.363551] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
[    3.369251] amd_pstate: the _CPC object is not present in SBIOS or ACPI disabled
[    3.373952] ledtrig-cpu: registered to indicate activity on CPUs
[    3.377658] drop_monitor: Initializing network drop monitor service
[    3.381849] NET: Registered PF_INET6 protocol family
[    3.395503] Segment Routing with IPv6
[    3.398297] In-situ OAM (IOAM) with IPv6
[    3.401177] NET: Registered PF_PACKET protocol family
[    3.404911] Key type dns_resolver registered
[    3.408795] IPI shorthand broadcast: enabled
[    3.414479] registered taskstats version 1
[    3.417547] Loading compiled-in X.509 certificates
[    3.421334] Loaded X.509 cert 'Build time autogenerated kernel key: 7a5738967e2123858340ae7fbb0491d696dbfb58'
[    3.428034] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing 2025 Kmod: d541cef61dc7e793b7eb7e899970a2eef0b5dc8c'
[    3.435459] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
[    3.442253] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
[    3.448789] blacklist: Loading compiled-in revocation X.509 certificates
[    3.452927] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    3.459375] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
[    3.466950] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
[    3.473943] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
[    3.480046] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
[    3.486174] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
[    3.493037] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
[    3.499445] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
[    3.512643] Key type .fscrypt registered
[    3.515307] Key type fscrypt-provisioning registered
[    3.526718] cryptd: max_cpu_qlen set to 1000
[    3.536070] AVX2 version of gcm_enc/dec engaged.
[    3.540690] AES CTR mode by8 optimization enabled
[    3.563386] Key type encrypted registered
[    3.566025] AppArmor: AppArmor sha256 policy hashing enabled
[    3.569394] ima: No TPM chip found, activating TPM-bypass!
[    3.572997] Loading compiled-in module X.509 certificates
[    3.577210] Loaded X.509 cert 'Build time autogenerated kernel key: 7a5738967e2123858340ae7fbb0491d696dbfb58'
[    3.583148] ima: Allocated hash algorithm: sha256
[    3.586038] ima: No architecture policies found
[    3.589110] evm: Initialising EVM extended attributes:
[    3.592502] evm: security.selinux
[    3.594855] evm: security.SMACK64
[    3.597169] evm: security.SMACK64EXEC
[    3.599786] evm: security.SMACK64TRANSMUTE
[    3.602580] evm: security.SMACK64MMAP
[    3.605126] evm: security.apparmor
[    3.607484] evm: security.ima
[    3.609518] evm: security.capability
[    3.612072] evm: HMAC attrs: 0x1
[    3.614781] PM:   Magic number: 14:130:666
[    3.617473] platform QEMU0002:00: hash matches
[    3.620374] acpi QEMU0002:00: hash matches
[    3.630351] RAS: Correctable Errors collector initialized.
[    3.633887] Unstable clock detected, switching default tracing clock to "global"
[    3.633887] If you want to keep using the local clock, then add:
[    3.633887]   "trace_clock=local"
[    3.633887] on the kernel command line
[    3.645583] clk: Disabling unused clocks
[    3.650643] Freeing unused decrypted memory: 2028K
[    3.653638] Freeing unused kernel image (initmem) memory: 4912K
[    3.656175] Write protecting the kernel read-only data: 38912k
[    3.659575] Freeing unused kernel image (rodata/data gap) memory: 2000K
[    3.719774] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.722705] Run /init as init process
Loading, please wait...
Starting systemd-udevd version 255.4-1ubuntu8.12
[    3.868032] virtio_net virtio0 enp1s0: renamed from eth0
[    3.881587] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    3.884483] ACPI: \_SB_.GSIA: Enabled at IRQ 16
[    3.890426] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 1
[    3.894171] ahci 0000:00:1f.2: AHCI 0001.0000 32 slots 6 ports 1.5 Gbps 0x3f impl SATA mode
[    3.899310] ahci 0000:00:1f.2: flags: 64bit ncq only 
[    3.907848] xhci_hcd 0000:02:00.0: hcc params 0x00087001 hci version 0x100 quirks 0x0000000000000010
[    3.914648] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input4
[    3.920965] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input3
[    3.945347] scsi host0: ahci
[    3.959036] scsi host1: ahci
[    3.962663] scsi host2: ahci
[    3.969005] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    3.969028] scsi host3: ahci
[    3.973076] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 2
[    3.973722] scsi host4: ahci
[    3.977341] xhci_hcd 0000:02:00.0: Host supports USB 3.0 SuperSpeed
[    3.978115] scsi host5: ahci
[    3.982066] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[    3.982787] ata1: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e100 irq 48 lpm-pol 0
[    3.985790] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.989557] ata2: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e180 irq 48 lpm-pol 0
[    3.992447] usb usb1: Product: xHCI Host Controller
[    3.992450] usb usb1: Manufacturer: Linux 6.8.0-90-generic xhci-hcd
[    3.992453] usb usb1: SerialNumber: 0000:02:00.0
[    3.995909] ata3: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e200 irq 48 lpm-pol 0
[    3.998058] hub 1-0:1.0: USB hub found
[    4.000798] ata4: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e280 irq 48 lpm-pol 0
[    4.003947] hub 1-0:1.0: 15 ports detected
[    4.006589] ata5: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e300 irq 48 lpm-pol 0
[    4.010970] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.011351] ata6: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e380 irq 48 lpm-pol 0
[    4.012924] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.08
[    4.034939] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.038213] usb usb2: Product: xHCI Host Controller
[    4.040416] usb usb2: Manufacturer: Linux 6.8.0-90-generic xhci-hcd
[    4.043137] usb usb2: SerialNumber: 0000:02:00.0
[    4.045892] hub 2-0:1.0: USB hub found
[    4.048209] hub 2-0:1.0: 15 ports detected
[    4.328355] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    4.331923] ata2: SATA link down (SStatus 0 SControl 300)
[    4.335006] ata3: SATA link down (SStatus 0 SControl 300)
[    4.337359] ata1.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    4.342918] ata1.00: applying bridge limits
[    4.347319] ata6: SATA link down (SStatus 0 SControl 300)
[    4.350545] ata4: SATA link down (SStatus 0 SControl 300)
[    4.353155] ata1.00: configured for UDMA/100
[    4.356328] ata5: SATA link down (SStatus 0 SControl 300)
[    4.359353] scsi 0:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
[    4.382157] sr 0:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
[    4.384925] cdrom: Uniform CD-ROM driver Revision: 3.20
[    4.409207] sr 0:0:0:0: Attached scsi generic sg0 type 5
Begin: Loading essential drivers ... [    5.559763] raid6: avx512x4 gen() 46970 MB/s
[    5.578761] raid6: avx512x2 gen() 50119 MB/s
[    5.597760] raid6: avx512x1 gen() 46762 MB/s
[    5.615759] raid6: avx2x4   gen() 51379 MB/s
[    5.633758] raid6: avx2x2   gen() 53003 MB/s
[    5.651764] raid6: avx2x1   gen() 41813 MB/s
[    5.653551] raid6: using algorithm avx2x2 gen() 53003 MB/s
[    5.671760] raid6: .... xor() 33760 MB/s, rmw enabled
[    5.673770] raid6: using avx512x2 recovery algorithm
[    5.677534] xor: automatically using best checksumming function   avx       
[    5.681293] async_tx: api initialized (async)
done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... [    5.838436] Btrfs loaded, zoned=yes, fsverity=yes
Scanning for Btrfs filesystems
done.
Warning: fsck not present, so skipping root file system
[    5.900319] EXT4-fs (vda1): mounted filesystem 9a5b9fca-5fbb-45f3-a018-ec0be3e89f25 ro with ordered data mode. Quota mode: none.
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    6.081853] systemd[1]: Inserted module 'autofs4'
[    6.112417] systemd[1]: systemd 255.4-1ubuntu8.12 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    6.122696] systemd[1]: Detected virtualization kvm.
[    6.124976] systemd[1]: Detected architecture x86-64.

Welcome to Ubuntu 24.04.3 LTS!

[    6.131090] systemd[1]: Hostname set to <ubuntu>.
[    6.136859] systemd[1]: Initializing machine ID from VM UUID.
[    6.139397] systemd[1]: Installed transient /etc/machine-id file.
[    6.445316] systemd[1]: Queued start job for default target graphical.target.
[    6.465023] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[  OK  ] Created slice system-modprobe.slice - Slice /system/modprobe.
[    6.474064] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
[  OK  ] Created slice system-serial\x2dget…slice - Slice /system/serial-getty.
[    6.482448] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[  OK  ] Created slice system-systemd\x2dfs…slice - Slice /system/systemd-fsck.
[    6.490401] systemd[1]: Created slice user.slice - User and Session Slice.
[  OK  ] Created slice user.slice - User and Session Slice.
[    6.497428] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[  OK  ] Started systemd-ask-password-wall.…d Requests to Wall Directory Watch.
[    6.506148] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[  OK  ] Set up automount proc-sys-fs-binfm…ormats File System Automount Point.
[    6.516112] systemd[1]: Expecting device dev-disk-by\x2dlabel-BOOT.device - /dev/disk/by-label/BOOT...
         Expecting device dev-disk-by\x2dla…device - /dev/disk/by-label/BOOT...
[    6.523767] systemd[1]: Expecting device dev-disk-by\x2dlabel-UEFI.device - /dev/disk/by-label/UEFI...
         Expecting device dev-disk-by\x2dla…device - /dev/disk/by-label/UEFI...
[    6.532811] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
         Expecting device dev-ttyS0.device - /dev/ttyS0...
[    6.539105] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
[  OK  ] Reached target integritysetup.targ… Local Integrity Protected Volumes.
[    6.547703] systemd[1]: Reached target slices.target - Slice Units.
[  OK  ] Reached target slices.target - Slice Units.
[    6.554773] systemd[1]: Reached target snapd.mounts-pre.target - Mounting snaps.
[  OK  ] Reached target snapd.mounts-pre.target - Mounting snaps.
[    6.561968] systemd[1]: Reached target snapd.mounts.target - Mounted snaps.
[  OK  ] Reached target snapd.mounts.target - Mounted snaps.
[    6.569642] systemd[1]: Reached target swap.target - Swaps.
[  OK  ] Reached target swap.target - Swaps.
[    6.574948] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
[  OK  ] Reached target veritysetup.target - Local Verity Protected Volumes.
[    6.584558] systemd[1]: Listening on dm-event.socket - Device-mapper event daemon FIFOs.
[  OK  ] Listening on dm-event.socket - Device-mapper event daemon FIFOs.
[    6.592598] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
[  OK  ] Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
[    6.602013] systemd[1]: Listening on multipathd.socket - multipathd control socket.
[  OK  ] Listening on multipathd.socket - multipathd control socket.
[    6.608389] systemd[1]: Listening on syslog.socket - Syslog Socket.
[  OK  ] Listening on syslog.socket - Syslog Socket.
[    6.616034] systemd[1]: Listening on systemd-fsckd.socket - fsck to fsckd communication Socket.
[  OK  ] Listening on systemd-fsckd.socket …fsck to fsckd communication Socket.
[    6.626097] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[  OK  ] Listening on systemd-initctl.socke…- initctl Compatibility Named Pipe.
[    6.634454] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[  OK  ] Listening on systemd-journald-dev-…socket - Journal Socket (/dev/log).
[    6.641357] systemd[1]: Listening on systemd-journald.socket - Journal Socket.
[  OK  ] Listening on systemd-journald.socket - Journal Socket.
[    6.649271] systemd[1]: Listening on systemd-networkd.socket - Network Service Netlink Socket.
[  OK  ] Listening on systemd-networkd.socket - Network Service Netlink Socket.
[    6.658118] systemd[1]: systemd-pcrextend.socket - TPM2 PCR Extension (Varlink) was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.665456] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[  OK  ] Listening on systemd-udevd-control.socket - udev Control Socket.
[    6.671790] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[  OK  ] Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    6.687856] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
         Mounting dev-hugepages.mount - Huge Pages File System...
[    6.710867] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
         Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    6.720947] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
         Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    6.739848] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
         Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    6.750110] systemd[1]: Starting systemd-journald.service - Journal Service...
         Starting systemd-journald.service - Journal Service...
[    6.760872] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
         Starting keyboard-setup.service - Set the console keyboard layout...
[    6.772926] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
         Starting kmod-static-nodes.service…eate List of Static Device Nodes...
[    6.789443] systemd-journald[328]: Collecting audit messages is disabled.
[    6.794266] systemd[1]: Starting lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
         Starting lvm2-monitor.service - Mo…ing dmeventd or progress polling...
[    6.809947] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
         Starting modprobe@configfs.service - Load Kernel Module configfs...
[    6.842935] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel Module dm_mod...
         Starting modprobe@dm_mod.service - Load Kernel Module dm_mod...
[    6.865921] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
         Starting modprobe@drm.service - Load Kernel Module drm...
[    6.881904] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
         Starting modprobe@efi_pstore.servi… - Load Kernel Module efi_pstore...
[    6.892925] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
         Starting modprobe@fuse.service - Load Kernel Module fuse...
[    6.906204] systemd[1]: Starting modprobe@loop.service - Load Kernel Module loop...
         Starting modprobe@loop.service - Load Kernel Module loop...
[    6.913253] systemd[1]: netplan-ovs-cleanup.service - OpenVSwitch configuration for cleanup was skipped because of an unmet condition check (ConditionFileIsExecutable=/usr/bin/ovs-vsctl).
[    6.920482] systemd[1]: Starting systemd-fsck-root.service - File System Check on Root Device...
         Starting systemd-fsck-root.service…File System Check on Root Device...
[    6.930440] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
         Starting systemd-modules-load.service - Load Kernel Modules...
[    6.938235] systemd[1]: systemd-pcrmachine.service - TPM2 PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.943877] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Setup (Early) was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.960465] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
         Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    6.972920] systemd[1]: Started systemd-journald.service - Journal Service.
[  OK  ] Started systemd-journald.service - Journal Service.
[  OK  ] Mounted dev-hugepages.mount - Huge Pages File System.
[  OK  ] Mounted dev-mqueue.mount - POSIX Message Queue File System.
[  OK  ] Mounted sys-kernel-debug.mount - Kernel Debug File System.
[  OK  ] Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[  OK  ] Finished keyboard-setup.service - Set the console keyboard layout.
[  OK  ] Finished kmod-static-nodes.service…Create List of Static Device Nodes.
[  OK  ] Finished lvm2-monitor.service - Mo…using dmeventd or progress polling.
[  OK  ] Finished modprobe@configfs.service - Load Kernel Module configfs.
[  OK  ] Finished modprobe@dm_mod.service - Load Kernel Module dm_mod.
[  OK  ] Finished modprobe@drm.service - Load Kernel Module drm.
[  OK  ] Finished modprobe@efi_pstore.service - Load Kernel Module efi_pstore.
[  OK  ] Finished modprobe@fuse.service - Load Kernel Module fuse.
[  OK  ] Finished modprobe@loop.service - Load Kernel Module loop.
[  OK  ] Finished systemd-fsck-root.service - File System Check on Root Device.
[  OK  ] Finished systemd-modules-load.service - Load Kernel Modules.
         Mounting sys-fs-fuse-connections.mount - FUSE Control File System...
         Mounting sys-kernel-config.mount - Kernel Configuration File System...
[  OK  ] Started systemd-fsckd.service - Fi…stem Check Daemon to report status.
         Starting systemd-remount-fs.servic…unt Root and Kernel File Systems...
         Starting systemd-sysctl.service - Apply Kernel Variables...
         Starting systemd-tmpfiles-setup-de… Device Nodes in /dev gracefully...
[  OK  ] Mounted sys-fs-fuse-connections.mount - FUSE Control File System.
[  OK  ] Mounted sys-kernel-config.mount - Kernel Configuration File System.
[    7.134531] EXT4-fs (vda1): re-mounted 9a5b9fca-5fbb-45f3-a018-ec0be3e89f25 r/w. Quota mode: none.
[  OK  ] Finished systemd-remount-fs.servic…mount Root and Kernel File Systems.
         Starting multipathd.service - Devi…pper Multipath Device Controller...
         Starting systemd-journal-flush.ser…sh Journal to Persistent Storage...
         Starting systemd-random-seed.service - Load/Save OS Random Seed...
[  OK  ] Finished systemd-udev-trigger.service - Coldplug All udev Devices.
[  OK  ] Finished systemd-sysctl.service - Apply Kernel Variables.
[  OK  ] Finished systemd-tmpfiles-setup-de…ic Device Nodes in /dev gracefully.
         Starting systemd-sysusers.service - Create System Users...
[  OK  ] Finished systemd-random-seed.service - Load/Save OS Random Seed.
[  OK  ] Finished systemd-journal-flush.ser…lush Journal to Persistent Storage.
[  OK  ] Finished systemd-sysusers.service - Create System Users.
         Starting systemd-tmpfiles-setup-de…eate Static Device Nodes in /dev...
[  OK  ] Started multipathd.service - Devic…Mapper Multipath Device Controller.
[  OK  ] Finished systemd-tmpfiles-setup-de…Create Static Device Nodes in /dev.
[  OK  ] Reached target local-fs-pre.target…Preparation for Local File Systems.
         Starting systemd-udevd.service - R…ager for Device Events and Files...
[  OK  ] Started systemd-udevd.service - Ru…anager for Device Events and Files.
[  OK  ] Started systemd-ask-password-conso…equests to Console Directory Watch.
[  OK  ] Reached target cryptsetup.target - Local Encrypted Volumes.
[  OK  ] Found device dev-ttyS0.device - /dev/ttyS0.
[  OK  ] Found device dev-disk-by\x2dlabel-…I.device - /dev/disk/by-label/UEFI.
         Starting systemd-fsck@dev-disk-by\…Check on /dev/disk/by-label/UEFI...
[  OK  ] Finished systemd-fsck@dev-disk-by\…m Check on /dev/disk/by-label/UEFI.
[  OK  ] Found device dev-disk-by\x2dlabel-…T.device - /dev/disk/by-label/BOOT.
         Starting systemd-fsck@dev-disk-by\…Check on /dev/disk/by-label/BOOT...
[  OK  ] Finished systemd-fsck@dev-disk-by\…m Check on /dev/disk/by-label/BOOT.
         Mounting boot.mount - /boot...
[  OK  ] Mounted boot.mount - /boot.
         Mounting boot-efi.mount - /boot/efi...
[  OK  ] Mounted boot-efi.mount - /boot/efi.
[  OK  ] Reached target local-fs.target - Local File Systems.
[  OK  ] Listening on systemd-sysext.socket…tension Image Management (Varlink).
         Starting apparmor.service - Load AppArmor profiles...
         Starting console-setup.service - Set console font and keymap...
         Starting finalrd.service - Create …time dir for shutdown pivot root...
         Starting ldconfig.service - Rebuild Dynamic Linker Cache...
         Starting plymouth-read-write.servi…ymouth To Write Out Runtime Data...
         Starting systemd-binfmt.service - Set Up Additional Binary Formats...
         Starting systemd-tmpfiles-setup.se…e Volatile Files and Directories...
         Starting ufw.service - Uncomplicated firewall...
[  OK  ] Finished console-setup.service - Set console font and keymap.
[  OK  ] Finished finalrd.service - Create …untime dir for shutdown pivot root.
[  OK  ] Finished plymouth-read-write.servi…Plymouth To Write Out Runtime Data.
         Mounting proc-sys-fs-binfmt_misc.m…cutable File Formats File System...
[  OK  ] Finished ufw.service - Uncomplicated firewall.
[  OK  ] Finished systemd-tmpfiles-setup.se…ate Volatile Files and Directories.
         Starting systemd-journal-catalog-u…ervice - Rebuild Journal Catalog...
         Starting systemd-machine-id-commit…t a transient machine-id on disk...
         Starting systemd-resolved.service - Network Name Resolution...
         Starting systemd-timesyncd.service - Network Time Synchronization...
         Starting systemd-update-utmp.servi…ord System Boot/Shutdown in UTMP...
[  OK  ] Mounted proc-sys-fs-binfmt_misc.mo…xecutable File Formats File System.
[  OK  ] Listening on systemd-rfkill.socket…ll Switch Status /dev/rfkill Watch.
[  OK  ] Finished systemd-binfmt.service - Set Up Additional Binary Formats.
[  OK  ] Finished systemd-update-utmp.servi…ecord System Boot/Shutdown in UTMP.
[  OK  ] Finished systemd-journal-catalog-u….service - Rebuild Journal Catalog.
[  OK  ] Finished systemd-machine-id-commit…mit a transient machine-id on disk.
[  OK  ] Started systemd-timesyncd.service - Network Time Synchronization.
[  OK  ] Reached target time-set.target - System Time Set.
[  OK  ] Started systemd-resolved.service - Network Name Resolution.
[  OK  ] Reached target nss-lookup.target - Host and Network Name Lookups.
[  OK  ] Finished ldconfig.service - Rebuild Dynamic Linker Cache.
         Starting systemd-update-done.service - Update is Completed...
[  OK  ] Finished systemd-update-done.service - Update is Completed.
[  OK  ] Finished apparmor.service - Load AppArmor profiles.
         Starting snapd.apparmor.service - …iles managed internally by snapd...
         Starting cloud-init-local.service …-init: Local Stage (pre-network)...
[  OK  ] Finished snapd.apparmor.service - …ofiles managed internally by snapd.
[    8.896581] cloud-init[635]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'init-local' at Sun, 08 Feb 2026 04:40:10 +0000. Up 8.88 seconds.
[  OK  ] Finished cloud-init-local.service …ud-init: Local Stage (pre-network).
[  OK  ] Reached target network-pre.target - Preparation for Network.
         Starting systemd-networkd.service - Network Configuration...
[  OK  ] Started systemd-networkd.service - Network Configuration.
[  OK  ] Reached target network.target - Network.
         Starting systemd-networkd-wait-onl…ait for Network to be Configured...
[  OK  ] Finished systemd-networkd-wait-onl… Wait for Network to be Configured.
         Starting cloud-init.service - Cloud-init: Network Stage...
[   12.942634] cloud-init[702]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'init' at Sun, 08 Feb 2026 04:40:14 +0000. Up 12.92 seconds.
[   12.953247] cloud-init[702]: ci-info: ++++++++++++++++++++++++++++++++++++++Net device info++++++++++++++++++++++++++++++++++++++
[   12.957703] cloud-init[702]: ci-info: +--------+------+----------------------------+---------------+--------+-------------------+
[   12.962049] cloud-init[702]: ci-info: | Device |  Up  |          Address           |      Mask     | Scope  |     Hw-Address    |
[   12.966376] cloud-init[702]: ci-info: +--------+------+----------------------------+---------------+--------+-------------------+
[   12.971260] cloud-init[702]: ci-info: | enp1s0 | True |      192.168.122.105       | 255.255.255.0 | global | 52:54:00:41:38:53 |
[   12.975711] cloud-init[702]: ci-info: | enp1s0 | True | fe80::5054:ff:fe41:3853/64 |       .       |  link  | 52:54:00:41:38:53 |
[   12.980277] cloud-init[702]: ci-info: |   lo   | True |         127.0.0.1          |   255.0.0.0   |  host  |         .         |
[   12.985179] cloud-init[702]: ci-info: |   lo   | True |          ::1/128           |       .       |  host  |         .         |
[   12.989433] cloud-init[702]: ci-info: +--------+------+----------------------------+---------------+--------+-------------------+
[   12.993758] cloud-init[702]: ci-info: ++++++++++++++++++++++++++++++++Route IPv4 info++++++++++++++++++++++++++++++++
[   12.997792] cloud-init[702]: ci-info: +-------+---------------+---------------+-----------------+-----------+-------+
[   13.001872] cloud-init[702]: ci-info: | Route |  Destination  |    Gateway    |     Genmask     | Interface | Flags |
[   13.005401] cloud-init[702]: ci-info: +-------+---------------+---------------+-----------------+-----------+-------+
[   13.010538] cloud-init[702]: ci-info: |   0   |    0.0.0.0    | 192.168.122.1 |     0.0.0.0     |   enp1s0  |   UG  |
[   13.014783] cloud-init[702]: ci-info: |   1   | 192.168.122.0 |    0.0.0.0    |  255.255.255.0  |   enp1s0  |   U   |
[   13.018848] cloud-init[702]: ci-info: |   2   | 192.168.122.1 |    0.0.0.0    | 255.255.255.255 |   enp1s0  |   UH  |
[   13.023628] cloud-init[702]: ci-info: +-------+---------------+---------------+-----------------+-----------+-------+
[   13.028172] cloud-init[702]: ci-info: +++++++++++++++++++Route IPv6 info+++++++++++++++++++
[   13.031620] cloud-init[702]: ci-info: +-------+-------------+---------+-----------+-------+
[   13.035498] cloud-init[702]: ci-info: | Route | Destination | Gateway | Interface | Flags |
[   13.039302] cloud-init[702]: ci-info: +-------+-------------+---------+-----------+-------+
[   13.042552] cloud-init[702]: ci-info: |   0   |  fe80::/64  |    ::   |   enp1s0  |   U   |
[   13.045941] cloud-init[702]: ci-info: |   2   |    local    |    ::   |   enp1s0  |   U   |
[   13.048721] cloud-init[702]: ci-info: |   3   |  multicast  |    ::   |   enp1s0  |   U   |
[   13.052133] cloud-init[702]: ci-info: +-------+-------------+---------+-----------+-------+
[   14.223604] cloud-init[702]: Generating public/private rsa key pair.
[   14.227080] cloud-init[702]: Your identification has been saved in /etc/ssh/ssh_host_rsa_key
[   14.232496] cloud-init[702]: Your public key has been saved in /etc/ssh/ssh_host_rsa_key.pub
[   14.236478] cloud-init[702]: The key fingerprint is:
[   14.239488] cloud-init[702]: SHA256:IyMX34SwzyC2oIhflKUsNq/dsFQANhnXJIWAuQ6t5D4 root@ubuntu
[   14.244313] cloud-init[702]: The key's randomart image is:
[   14.246928] cloud-init[702]: +---[RSA 3072]----+
[   14.249300] cloud-init[702]: | o*=+==          |
[   14.251583] cloud-init[702]: |o..+.*.o .       |
[   14.253967] cloud-init[702]: | o= B = . .      |
[   14.256328] cloud-init[702]: |=+.B + * o       |
[   14.258429] cloud-init[702]: |O.  B + S .      |
[   14.260722] cloud-init[702]: |.+ = * o .       |
[   14.263051] cloud-init[702]: |. o o .          |
[  OK  ] Finished cloud-init.service - Cloud-init: Network Stage.
[   14.269139] cloud-init[702]: | E               |
[   14.271104] cloud-init[702]: |  .              |
[   14.273176] cloud-init[702]: +----[SHA256]-----+
[   14.275261] cloud-init[702]: Generating public/private ecdsa key pair.
[   14.278145] cloud-init[702]: Your identification has been saved in /etc/ssh/ssh_host_ecdsa_key
[   14.281912] cloud-init[702]: Your public key has been saved in /etc/ssh/ssh_host_ecdsa_key.pub
[   14.285529] cloud-init[702]: The key fingerprint is:
[   14.287583] cloud-init[702]: SHA256:nOyj7i+Oj629wYKEdsI1QbAXvySooIMQx67NO55S1mo root@ubuntu
[   14.290623] cloud-init[702]: The key's randomart image is:
[   14.292673] cloud-init[702]: +---[ECDSA 256]---+
[   14.294772] cloud-init[702]: |.o++             |
[   14.296839] cloud-init[702]: | o+ +            |
[   14.298966] cloud-init[702]: |o+ = o           |
[   14.301072] cloud-init[702]: |B.+ + .o .       |
[   14.302823] cloud-init[702]: |*B.o .  S        |
[   14.304576] cloud-init[702]: |ooB... .         |
[   14.306283] cloud-init[702]: | o.o. o o        |
[   14.308190] cloud-init[702]: |. E. *.o .       |
[   14.310064] cloud-init[702]: | +o.+*X+.        |
[   14.311869] cloud-init[702]: +----[SHA256]-----+
[   14.313601] cloud-init[702]: Generating public/private ed25519 key pair.
[   14.316517] cloud-init[702]: Your identification has been saved in /etc/ssh/ssh_host_ed25519_key
[   14.316598] cloud-init[702]: Your public key has been saved in /etc/ssh/ssh_host_ed25519_key.pub
[   14.317750] cloud-init[702]: The key fingerprint is:
[   14.321590] cloud-init[702]: SHA256:yE6/jmGc6BXqp590HJzpYO8FJ3x5ocAhTHfNKx6jW10 root@ubuntu
[   14.322111] cloud-init[702]: The key's randomart image is:
[   14.322449] cloud-init[702]: +--[ED25519 256]--+
[   14.323486] cloud-init[702]: |     oo o .o     |
[   14.324519] cloud-init[702]: |      .+ o  o    |
[   14.324968] cloud-init[702]: |        o   ..   |
[   14.326190] cloud-init[702]: |     . + ++o..E  |
[   14.329627] cloud-init[702]: |      B So==..   |
[   14.332993] cloud-init[702]: |     B O.*o..    |
[   14.333345] cloud-init[702]: |    o O *o.      |
[   14.333895] cloud-init[702]: |   o +.*.o       |
[   14.335101] cloud-init[702]: |    +++.+        |
[   14.335521] cloud-init[702]: +----[SHA256]-----+
[  OK  ] Reached target cloud-config.target - Cloud-config availability.
[  OK  ] Reached target network-online.target - Network is Online.
[  OK  ] Reached target sysinit.target - System Initialization.
[  OK  ] Started apt-daily.timer - Daily apt download activities.
[  OK  ] Started apt-daily-upgrade.timer - …y apt upgrade and clean activities.
[  OK  ] Started dpkg-db-backup.timer - Daily dpkg database backup timer.
[  OK  ] Started e2scrub_all.timer - Period…Metadata Check for All Filesystems.
[  OK  ] Started fstrim.timer - Discard unused filesystem blocks once a week.
[  OK  ] Started fwupd-refresh.timer - Refresh fwupd metadata regularly.
[  OK  ] Started logrotate.timer - Daily rotation of log files.
[  OK  ] Started man-db.timer - Daily man-db regeneration.
[  OK  ] Started motd-news.timer - Message of the Day.
[  OK  ] Started sysstat-collect.timer - Ru…y accounting tool every 10 minutes.
[  OK  ] Started sysstat-summary.timer - Ge… of yesterday's process accounting.
[  OK  ] Started systemd-tmpfiles-clean.tim…y Cleanup of Temporary Directories.
[  OK  ] Started update-notifier-download.t…hat failed at package install time.
[  OK  ] Started update-notifier-motd.timer… a new version of Ubuntu available.
[  OK  ] Reached target paths.target - Path Units.
[  OK  ] Reached target timers.target - Timer Units.
[  OK  ] Listening on cloud-init-hotplugd.s…t - cloud-init hotplug hook socket.
[  OK  ] Listening on dbus.socket - D-Bus System Message Bus Socket.
[  OK  ] Listening on iscsid.socket - Open-iSCSI iscsid Socket.
         Starting lxd-installer.socket - He…er to install lxd snap on demand...
         Starting snapd.socket - Socket activation for snappy daemon...
[  OK  ] Listening on ssh.socket - OpenBSD Secure Shell server socket.
[  OK  ] Listening on uuidd.socket - UUID daemon activation socket.
[  OK  ] Reached target remote-fs-pre.targe…reparation for Remote File Systems.
[  OK  ] Reached target remote-fs.target - Remote File Systems.
[  OK  ] Finished blk-availability.service - Availability of block devices.
[  OK  ] Listening on lxd-installer.socket …lper to install lxd snap on demand.
[  OK  ] Listening on snapd.socket - Socket activation for snappy daemon.
[  OK  ] Reached target sockets.target - Socket Units.
[  OK  ] Reached target basic.target - Basic System.
         Starting apport.service - automatic crash report generation...
         Starting cloud-config.service - Cloud-init: Config Stage...
[  OK  ] Started cron.service - Regular background program processing daemon.
         Starting dbus.service - D-Bus System Message Bus...
[  OK  ] Started dmesg.service - Save initial kernel messages after boot.
         Starting e2scrub_reap.service - Re…ne ext4 Metadata Check Snapshots...
         Starting grub-common.service - Record successful boot for GRUB...
         Starting polkit.service - Authorization Manager...
         Starting pollinate.service - Polli…e pseudo random number generator...
         Starting rsyslog.service - System Logging Service...
[  OK  ] Reached target getty-pre.target - Preparation for Logins.
         Starting snapd.seeded.service - Wait until snapd is fully seeded...
         Starting snapd.service - Snap Daemon...
         Starting sysstat.service - Resets System Activity Logs...
         Starting systemd-logind.service - User Login Management...
         Starting systemd-user-sessions.service - Permit User Sessions...
         Starting udisks2.service - Disk Manager...
[  OK  ] Started dbus.service - D-Bus System Message Bus.
[  OK  ] Started systemd-logind.service - User Login Management.
[  OK  ] Finished apport.service - automatic crash report generation.
[  OK  ] Finished e2scrub_reap.service - Re…line ext4 Metadata Check Snapshots.
[  OK  ] Finished sysstat.service - Resets System Activity Logs.
[  OK  ] Finished systemd-user-sessions.service - Permit User Sessions.
         Starting plymouth-quit-wait.servic…d until boot process finishes up...
         Starting plymouth-quit.service - Terminate Plymouth Boot Screen...
[   15.082654] cloud-init[865]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'modules:config' at Sun, 08 Feb 2026 04:40:16 +0000. Up 14.99 seconds.
[  OK  ] Started unattended-upgrades.service - Unattended Upgrades Shutdown.
[  OK  ] Finished grub-common.service - Record successful boot for GRUB.
[  OK  ] Finished plymouth-quit-wait.servic…old until boot process finishes up.
[  OK  ] Finished plymouth-quit.service - Terminate Plymouth Boot Screen.
[  OK  ] Started rsyslog.service - System Logging Service.
         Starting grub-initrd-fallback.service - GRUB failed boot detection...
[  OK  ] Started serial-getty@ttyS0.service - Serial Getty on ttyS0.
         Starting setvtrgb.service - Set console scheme...
         Starting systemd-hostnamed.service - Hostname Service...
[  OK  ] Finished setvtrgb.service - Set console scheme.
[  OK  ] Started polkit.service - Authorization Manager.
[  OK  ] Started udisks2.service - Disk Manager.
[  OK  ] Created slice system-getty.slice - Slice /system/getty.
         Starting ModemManager.service - Modem Manager...
[  OK  ] Started getty@tty1.service - Getty on tty1.
[  OK  ] Reached target getty.target - Login Prompts.
[  OK  ] Finished grub-initrd-fallback.service - GRUB failed boot detection.
[  OK  ] Started systemd-hostnamed.service - Hostname Service.
[  OK  ] Started ModemManager.service - Modem Manager.
[  OK  ] Finished cloud-config.service - Cloud-init: Config Stage.
[  OK  ] Started snapd.service - Snap Daemon.
         Starting systemd-timedated.service - Time & Date Service...
[  OK  ] Started systemd-timedated.service - Time & Date Service.
[  OK  ] Finished pollinate.service - Polli…the pseudo random number generator.
[  OK  ] Finished snapd.seeded.service - Wait until snapd is fully seeded.
[  OK  ] Reached target multi-user.target - Multi-User System.
[  OK  ] Reached target graphical.target - Graphical Interface.
         Starting cloud-final.service - Cloud-init: Final Stage...
         Starting systemd-update-utmp-runle…- Record Runlevel Change in UTMP...
[  OK  ] Finished systemd-update-utmp-runle…e - Record Runlevel Change in UTMP.
[   18.472453] cloud-init[1026]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'modules:final' at Sun, 08 Feb 2026 04:40:20 +0000. Up 18.44 seconds.
         Starting apt-news.service - Update APT News...
         Starting esm-cache.service - Update the local ESM caches...
[   19.102049] cloud-init[1026]: Hit:1 http://archive.ubuntu.com/ubuntu noble InRelease
[   19.234219] cloud-init[1026]: Get:2 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
[   19.311308] cloud-init[1026]: Get:3 http://archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
[  OK  ] Finished apt-news.service - Update APT News.
[   20.258235] cloud-init[1026]: Get:4 http://archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
[   20.583440] cloud-init[1026]: Get:5 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1431 kB]

Ubuntu 24.04.3 LTS ubuntu ttyS0

ubuntu login: [   20.639446] cloud-init[1026]: Get:6 http://archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
[   21.980837] cloud-init[1026]: Get:7 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [232 kB]
[   22.014091] cloud-init[1026]: Get:8 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.6 kB]
[   22.014204] cloud-init[1026]: Get:9 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [9888 B]
[   22.026052] cloud-init[1026]: Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [929 kB]
[   22.141080] cloud-init[1026]: Get:11 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [212 kB]
[   22.165971] cloud-init[1026]: Get:12 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.2 kB]
[   22.178968] cloud-init[1026]: Get:13 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [19.9 kB]
[   22.184393] cloud-init[1026]: Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2411 kB]
[   22.355716] cloud-init[1026]: Get:15 http://archive.ubuntu.com/ubuntu noble/universe Translation-en [5982 kB]
[   22.562897] cloud-init[1026]: Get:16 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [553 kB]
[   22.590169] cloud-init[1026]: Get:17 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]
[   22.607935] cloud-init[1026]: Get:18 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [536 B]
[   22.608107] cloud-init[1026]: Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]
[   22.631484] cloud-init[1026]: Get:20 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6492 B]
[   22.631609] cloud-init[1026]: Get:21 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
[   22.651798] cloud-init[1026]: Get:22 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
[   22.660705] cloud-init[1026]: Get:23 http://archive.ubuntu.com/ubuntu noble/universe amd64 Components [3871 kB]
[   22.858910] cloud-init[1026]: Get:24 http://archive.ubuntu.com/ubuntu noble/universe amd64 c-n-f Metadata [301 kB]
[   22.870950] cloud-init[1026]: Get:25 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages [269 kB]
[   22.880904] cloud-init[1026]: Get:26 http://archive.ubuntu.com/ubuntu noble/multiverse Translation-en [118 kB]
[   22.886912] cloud-init[1026]: Get:27 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 Components [35.0 kB]
[   22.892982] cloud-init[1026]: Get:28 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 c-n-f Metadata [8328 B]
[   22.897787] cloud-init[1026]: Get:29 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1739 kB]
[   23.021716] cloud-init[1026]: Get:30 http://archive.ubuntu.com/ubuntu noble-updates/main Translation-en [324 kB]
[   23.029512] cloud-init[1026]: Get:31 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [175 kB]
[   23.034873] cloud-init[1026]: Get:32 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 c-n-f Metadata [16.5 kB]
[   23.105986] cloud-init[1026]: Get:33 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1528 kB]
[   23.133447] cloud-init[1026]: Get:34 http://archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [313 kB]
[   23.141042] cloud-init[1026]: Get:35 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]
[   23.511550] cloud-init[1026]: Get:36 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 c-n-f Metadata [31.9 kB]
[   23.944178] cloud-init[1026]: Get:37 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [2582 kB]
[   25.677421] cloud-init[1026]: Get:38 http://archive.ubuntu.com/ubuntu noble-updates/restricted Translation-en [591 kB]
[   26.121650] cloud-init[1026]: Get:39 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
[   26.317926] cloud-init[1026]: Get:40 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 c-n-f Metadata [556 B]
[   26.497950] cloud-init[1026]: Get:41 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [32.1 kB]
[   26.688222] cloud-init[1026]: Get:42 http://archive.ubuntu.com/ubuntu noble-updates/multiverse Translation-en [6816 B]
[   26.878365] cloud-init[1026]: Get:43 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
[   27.057708] cloud-init[1026]: Get:44 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 c-n-f Metadata [496 B]
[   27.237182] cloud-init[1026]: Get:45 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 Packages [40.4 kB]
[   27.425083] cloud-init[1026]: Get:46 http://archive.ubuntu.com/ubuntu noble-backports/main Translation-en [9208 B]
[   27.609298] cloud-init[1026]: Get:47 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7312 B]
[   27.793977] cloud-init[1026]: Get:48 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 c-n-f Metadata [368 B]
[   27.973281] cloud-init[1026]: Get:49 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [29.5 kB]
[   28.161503] cloud-init[1026]: Get:50 http://archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [17.9 kB]
[   28.562291] cloud-init[1026]: Get:51 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [10.5 kB]
[   28.745670] cloud-init[1026]: Get:52 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 c-n-f Metadata [1444 B]
[   28.925795] cloud-init[1026]: Get:53 http://archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [216 B]
[   29.105052] cloud-init[1026]: Get:54 http://archive.ubuntu.com/ubuntu noble-backports/restricted amd64 c-n-f Metadata [116 B]
[   29.284324] cloud-init[1026]: Get:55 http://archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]
[   29.463272] cloud-init[1026]: Get:56 http://archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 c-n-f Metadata [116 B]
[   34.089403] cloud-init[1026]: Fetched 39.8 MB in 11s (3650 kB/s)
[   34.959223] cloud-init[1026]: Reading package lists...
[   35.163486] cloud-init[1026]: Reading package lists...
[   35.353694] cloud-init[1026]: Building dependency tree...
[   35.357685] cloud-init[1026]: Reading state information...
[   35.513226] cloud-init[1026]: The following additional packages will be installed:
[   35.516676] cloud-init[1026]:   liburing2
[   35.534808] cloud-init[1026]: The following NEW packages will be installed:
[   35.544247] cloud-init[1026]:   liburing2 qemu-guest-agent
[   35.912872] cloud-init[1026]: 0 upgraded, 2 newly installed, 0 to remove and 52 not upgraded.
[   35.917734] cloud-init[1026]: Need to get 411 kB of archives.
[   35.920379] cloud-init[1026]: After this operation, 1302 kB of additional disk space will be used.
[   35.923937] cloud-init[1026]: Get:1 http://archive.ubuntu.com/ubuntu noble/main amd64 liburing2 amd64 2.5-1build1 [21.1 kB]
[   36.289382] cloud-init[1026]: Get:2 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 qemu-guest-agent amd64 1:8.2.2+ds-0ubuntu1.12 [390 kB]
[   37.253862] cloud-init[1026]: Fetched 411 kB in 1s (282 kB/s)
[   37.279470] cloud-init[1026]: Selecting previously unselected package liburing2:amd64.
(Reading database ... 74813 files and directories currently installed.)
[   37.564455] cloud-init[1026]: Preparing to unpack .../liburing2_2.5-1build1_amd64.deb ...
[   37.570667] cloud-init[1026]: Unpacking liburing2:amd64 (2.5-1build1) ...
[   37.575344] cloud-init[1026]: Selecting previously unselected package qemu-guest-agent.
[   37.579104] cloud-init[1026]: Preparing to unpack .../qemu-guest-agent_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
[   37.583169] cloud-init[1026]: Unpacking qemu-guest-agent (1:8.2.2+ds-0ubuntu1.12) ...
[   37.596571] cloud-init[1026]: Setting up liburing2:amd64 (2.5-1build1) ...
[   37.599993] cloud-init[1026]: Setting up qemu-guest-agent (1:8.2.2+ds-0ubuntu1.12) ...
[   38.213362] cloud-init[1026]: qemu-guest-agent.service is a disabled or a static unit, not starting it.
[   38.218577] cloud-init[1026]: Processing triggers for libc-bin (2.39-0ubuntu8.6) ...
[   38.568373] cloud-init[1026]: Processing triggers for man-db (2.12.0-4build2) ...
[   40.173450] cloud-init[1026]: Running kernel seems to be up-to-date.
[   40.173608] cloud-init[1026]: No services need to be restarted.
[   40.174702] cloud-init[1026]: No containers need to be restarted.
[   40.176994] cloud-init[1026]: No user sessions are running outdated binaries.
[   40.177543] cloud-init[1026]: No VM guests are running outdated hypervisor (qemu) binaries on this host.
[   41.169548] cloud-init[1026]: Synchronizing state of qemu-guest-agent.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
[   41.176684] cloud-init[1026]: Executing: /usr/lib/systemd/systemd-sysv-install enable qemu-guest-agent
[   41.912667] cloud-init[1026]: The unit files have no installation config (WantedBy=, RequiredBy=, UpheldBy=,
[   41.917210] cloud-init[1026]: Also=, or Alias= settings in the [Install] section, and DefaultInstance= for
[   41.921620] cloud-init[1026]: template units). This means they are not meant to be enabled or disabled using systemctl.
[   41.926370] cloud-init[1026]:  
[   41.928105] cloud-init[1026]: Possible reasons for having these kinds of units are:
[   41.931633] cloud-init[1026]: • A unit may be statically enabled by being symlinked from another unit's
[   41.935932] cloud-init[1026]:   .wants/, .requires/, or .upholds/ directory.
[  OK  ] Started qemu-guest-agent.service - QEMU Guest Agent.
[   41.941372] cloud-init[1026]: • A unit's purpose may be to act as a helper for some other unit which has
[   41.945872] cloud-init[1026]:   a requirement dependency on it.
[   41.946851] cloud-init[1026]: • A unit may be started when needed via activation (socket, path, timer,
[   41.947955] cloud-init[1026]:   D-Bus, udev, scripted systemctl call, ...).
[   41.949952] cloud-init[1026]: • In case of template units, the unit is meant to be enabled with some
[   41.951608] cloud-init[1026]:   instance name specified.
ci-info: no authorized SSH keys fingerprints found for user ubuntu.
<14>Feb  8 04:40:43 cloud-init: #############################################################
<14>Feb  8 04:40:43 cloud-init: -----BEGIN SSH HOST KEY FINGERPRINTS-----
<14>Feb  8 04:40:43 cloud-init: 256 SHA256:nOyj7i+Oj629wYKEdsI1QbAXvySooIMQx67NO55S1mo root@ubuntu (ECDSA)
<14>Feb  8 04:40:43 cloud-init: 256 SHA256:yE6/jmGc6BXqp590HJzpYO8FJ3x5ocAhTHfNKx6jW10 root@ubuntu (ED25519)
<14>Feb  8 04:40:43 cloud-init: 3072 SHA256:IyMX34SwzyC2oIhflKUsNq/dsFQANhnXJIWAuQ6t5D4 root@ubuntu (RSA)
<14>Feb  8 04:40:43 cloud-init: -----END SSH HOST KEY FINGERPRINTS-----
<14>Feb  8 04:40:43 cloud-init: #############################################################
-----BEGIN SSH HOST KEY KEYS-----
ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAlXa9o1jWA+vVTUGOlm6sk4/RcM+2Mt0OT9nrydO1ZxZUv2NDjMDhLJ45Qohu5jZuLbwfQcMgd76myYXct7OdA= root@ubuntu
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILfn/SbAgNGqRWVjNVdxXnhU+kL39Z3arytkg5WnwGdm root@ubuntu
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgqgjdMzELFRqG3tzZGE80ckTtqOXvjn7Kf6GGpAAAH1TTcYkznnL6vaM0VirbPHhDZgRQnusY4kl628w4V2G+Lw1isCUJq7LhzuuvTDZET6fRBphpJnnmh4v6m4eJ6WETXOy/yK3OOtciXfOGfbgStcsix3vNbWu8fAqIsKug+ngk7lPudvhEOVR4c4xWVV6GzKeXknGOmLt23ZwZrCZl/o6CHPX/mL/78doRsnkT/XrmNCepYZKXqvkCWjA+zDT2zQnx8su2ZZGr8p2QS+FX+BORAyU4wKrS2xPCkE1nlKeAnBvXPzdSFBWBxB96GDW+v3W3KrxdBpbZbXybEuxred51CcOcCXV6rYjZsv/fs84WeDYYlbWoEY2tOAUf7I9zUtCi/nJNqktbt7aW3QYdhtl+LWe9vowk8OALwXNZ4627gP5FkgpAo2l2nn6Dh3IdY4tuJhTp2JeFlyeJrJo+NmCmNtNV25qvjPc3UkeyOyer3c4X5ByzPE00XTZDlz8= root@ubuntu
-----END SSH HOST KEY KEYS-----
[   42.066936] cloud-init[1026]: Cloud-init v. 25.2-0ubuntu1~24.04.1 finished at Sun, 08 Feb 2026 04:40:43 +0000. Datasource DataSourceNoCloud [seed=/dev/sr0].  Up 42.05 seconds
[  OK  ] Finished cloud-final.service - Cloud-init: Final Stage.
[  OK  ] Reached target cloud-init.target - Cloud-init target.

[    0.918435] pci 0000:00:01.7: BAR 0 [mem 0xfce07000-0xfce07fff]
[    0.921811] pci 0000:00:01.7: PCI bridge to [bus 08]
[    0.923825] pci 0000:00:01.7:   bridge window [mem 0xfbe00000-0xfbffffff]
[    0.928484] pci 0000:00:01.7:   bridge window [mem 0xfdc00000-0xfddfffff 64bit pref]
[    0.934472] pci 0000:00:02.0: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.940433] pci 0000:00:02.0: BAR 0 [mem 0xfce08000-0xfce08fff]
[    0.942769] pci 0000:00:02.0: PCI bridge to [bus 09]
[    0.944871] pci 0000:00:02.0:   bridge window [mem 0xfbc00000-0xfbdfffff]
[    0.949376] pci 0000:00:02.0:   bridge window [mem 0xfda00000-0xfdbfffff 64bit pref]
[    0.955515] pci 0000:00:02.1: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.961434] pci 0000:00:02.1: BAR 0 [mem 0xfce09000-0xfce09fff]
[    0.964771] pci 0000:00:02.1: PCI bridge to [bus 0a]
[    0.966819] pci 0000:00:02.1:   bridge window [mem 0xfba00000-0xfbbfffff]
[    0.971432] pci 0000:00:02.1:   bridge window [mem 0xfd800000-0xfd9fffff 64bit pref]
[    0.978503] pci 0000:00:02.2: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    0.984452] pci 0000:00:02.2: BAR 0 [mem 0xfce0a000-0xfce0afff]
[    0.987776] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    0.990863] pci 0000:00:02.2:   bridge window [mem 0xfb800000-0xfb9fffff]
[    0.994515] pci 0000:00:02.2:   bridge window [mem 0xfd600000-0xfd7fffff 64bit pref]
[    1.002303] pci 0000:00:02.3: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    1.007438] pci 0000:00:02.3: BAR 0 [mem 0xfce0b000-0xfce0bfff]
[    1.010805] pci 0000:00:02.3: PCI bridge to [bus 0c]
[    1.013830] pci 0000:00:02.3:   bridge window [mem 0xfb600000-0xfb7fffff]
[    1.017407] pci 0000:00:02.3:   bridge window [mem 0xfd400000-0xfd5fffff 64bit pref]
[    1.025523] pci 0000:00:02.4: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    1.030433] pci 0000:00:02.4: BAR 0 [mem 0xfce0c000-0xfce0cfff]
[    1.033796] pci 0000:00:02.4: PCI bridge to [bus 0d]
[    1.035836] pci 0000:00:02.4:   bridge window [mem 0xfb400000-0xfb5fffff]
[    1.040387] pci 0000:00:02.4:   bridge window [mem 0xfd200000-0xfd3fffff 64bit pref]
[    1.047498] pci 0000:00:02.5: [1b36:000c] type 01 class 0x060400 PCIe Root Port
[    1.052434] pci 0000:00:02.5: BAR 0 [mem 0xfce0d000-0xfce0dfff]
[    1.055789] pci 0000:00:02.5: PCI bridge to [bus 0e]
[    1.057819] pci 0000:00:02.5:   bridge window [mem 0xfb200000-0xfb3fffff]
[    1.062406] pci 0000:00:02.5:   bridge window [mem 0xfd000000-0xfd1fffff 64bit pref]
[    1.116718] pci 0000:00:1f.0: [8086:2918] type 00 class 0x060100 conventional PCI endpoint
[    1.122132] pci 0000:00:1f.0: quirk: [io  0x0600-0x067f] claimed by ICH6 ACPI/GPIO/TCO
[    1.126542] pci 0000:00:1f.2: [8086:2922] type 00 class 0x010601 conventional PCI endpoint
[    1.135539] pci 0000:00:1f.2: BAR 4 [io  0xc040-0xc05f]
[    1.137746] pci 0000:00:1f.2: BAR 5 [mem 0xfce0e000-0xfce0efff]
[    1.141899] pci 0000:00:1f.3: [8086:2930] type 00 class 0x0c0500 conventional PCI endpoint
[    1.147578] pci 0000:00:1f.3: BAR 4 [io  0x0700-0x073f]
[    1.152062] acpiphp: Slot [0] registered
[    1.155254] pci 0000:01:00.0: [1af4:1041] type 00 class 0x020000 PCIe Endpoint
[    1.161462] pci 0000:01:00.0: BAR 1 [mem 0xfcc80000-0xfcc80fff]
[    1.165851] pci 0000:01:00.0: BAR 4 [mem 0xfea00000-0xfea03fff 64bit pref]
[    1.168727] pci 0000:01:00.0: ROM [mem 0xfcc00000-0xfcc7ffff pref]
[    1.176641] pci 0000:00:01.0: PCI bridge to [bus 01]
[    1.179982] acpiphp: Slot [0-2] registered
[    1.182173] pci 0000:02:00.0: [1b36:000d] type 00 class 0x0c0330 PCIe Endpoint
[    1.187274] pci 0000:02:00.0: BAR 0 [mem 0xfca00000-0xfca03fff 64bit]
[    1.193566] pci 0000:00:01.1: PCI bridge to [bus 02]
[    1.197984] acpiphp: Slot [0-3] registered
[    1.200225] pci 0000:03:00.0: [1af4:1043] type 00 class 0x078000 PCIe Endpoint
[    1.207462] pci 0000:03:00.0: BAR 1 [mem 0xfc800000-0xfc800fff]
[    1.209833] pci 0000:03:00.0: BAR 4 [mem 0xfe600000-0xfe603fff 64bit pref]
[    1.218694] pci 0000:00:01.2: PCI bridge to [bus 03]
[    1.223057] acpiphp: Slot [0-4] registered
[    1.225234] pci 0000:04:00.0: [1af4:1042] type 00 class 0x010000 PCIe Endpoint
[    1.230460] pci 0000:04:00.0: BAR 1 [mem 0xfc600000-0xfc600fff]
[    1.232811] pci 0000:04:00.0: BAR 4 [mem 0xfe400000-0xfe403fff 64bit pref]
[    1.240695] pci 0000:00:01.3: PCI bridge to [bus 04]
[    1.244999] acpiphp: Slot [0-5] registered
[    1.247198] pci 0000:05:00.0: [1af4:1045] type 00 class 0x00ff00 PCIe Endpoint
[    1.252517] pci 0000:05:00.0: BAR 4 [mem 0xfe200000-0xfe203fff 64bit pref]
[    1.260593] pci 0000:00:01.4: PCI bridge to [bus 05]
[    1.263980] acpiphp: Slot [0-6] registered
[    1.266231] pci 0000:06:00.0: [1af4:1044] type 00 class 0x00ff00 PCIe Endpoint
[    1.271460] pci 0000:06:00.0: BAR 1 [mem 0xfc200000-0xfc200fff]
[    1.273835] pci 0000:06:00.0: BAR 4 [mem 0xfe000000-0xfe003fff 64bit pref]
[    1.282648] pci 0000:00:01.5: PCI bridge to [bus 06]
[    1.285967] acpiphp: Slot [0-7] registered
[    1.290512] pci 0000:00:01.6: PCI bridge to [bus 07]
[    1.293968] acpiphp: Slot [0-8] registered
[    1.297489] pci 0000:00:01.7: PCI bridge to [bus 08]
[    1.300966] acpiphp: Slot [0-9] registered
[    1.304555] pci 0000:00:02.0: PCI bridge to [bus 09]
[    1.308964] acpiphp: Slot [0-10] registered
[    1.312495] pci 0000:00:02.1: PCI bridge to [bus 0a]
[    1.315990] acpiphp: Slot [0-11] registered
[    1.320470] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    1.323980] acpiphp: Slot [0-12] registered
[    1.327394] pci 0000:00:02.3: PCI bridge to [bus 0c]
[    1.331976] acpiphp: Slot [0-13] registered
[    1.335497] pci 0000:00:02.4: PCI bridge to [bus 0d]
[    1.340280] acpiphp: Slot [0-14] registered
[    1.343533] pci 0000:00:02.5: PCI bridge to [bus 0e]
[    1.361055] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
[    1.363938] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    1.369918] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    1.372930] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    1.375912] ACPI: PCI: Interrupt link LNKE configured for IRQ 10
[    1.378959] ACPI: PCI: Interrupt link LNKF configured for IRQ 10
[    1.381922] ACPI: PCI: Interrupt link LNKG configured for IRQ 11
[    1.384903] ACPI: PCI: Interrupt link LNKH configured for IRQ 11
[    1.387801] ACPI: PCI: Interrupt link GSIA configured for IRQ 16
[    1.390742] ACPI: PCI: Interrupt link GSIB configured for IRQ 17
[    1.392728] ACPI: PCI: Interrupt link GSIC configured for IRQ 18
[    1.395722] ACPI: PCI: Interrupt link GSID configured for IRQ 19
[    1.398711] ACPI: PCI: Interrupt link GSIE configured for IRQ 20
[    1.400719] ACPI: PCI: Interrupt link GSIF configured for IRQ 21
[    1.403714] ACPI: PCI: Interrupt link GSIG configured for IRQ 22
[    1.406710] ACPI: PCI: Interrupt link GSIH configured for IRQ 23
[    1.410424] iommu: Default domain type: Translated
[    1.412705] iommu: DMA domain TLB invalidation policy: lazy mode
[    1.415930] SCSI subsystem initialized
[    1.417746] ACPI: bus type USB registered
[    1.419711] usbcore: registered new interface driver usbfs
[    1.421715] usbcore: registered new interface driver hub
[    1.424781] usbcore: registered new device driver usb
[    1.427726] pps_core: LinuxPPS API ver. 1 registered
[    1.429691] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    1.433724] PTP clock support registered
[    1.436448] EDAC MC: Ver: 3.0.0
[    1.439776] NetLabel: Initializing
[    1.441692] NetLabel:  domain hash size = 128
[    1.443689] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    1.446743] NetLabel:  unlabeled traffic allowed by default
[    1.448815] mctp: management component transport protocol core
[    1.451841] NET: Registered PF_MCTP protocol family
[    1.454695] PCI: Using ACPI for IRQ routing
[    2.128242] vgaarb: loaded
[    2.129813] clocksource: Switched to clocksource kvm-clock
[    2.132927] VFS: Disk quotas dquot_6.6.0
[    2.137381] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    2.141447] AppArmor: AppArmor Filesystem Enabled
[    2.144002] pnp: PnP ACPI init
[    2.146273] system 00:04: [mem 0xb0000000-0xbfffffff window] has been reserved
[    2.151121] pnp: PnP ACPI: found 5 devices
[    2.160341] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    2.165525] NET: Registered PF_INET protocol family
[    2.168175] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    2.188646] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)
[    2.193701] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    2.198413] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    2.203180] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    2.207535] TCP: Hash tables configured (established 16384 bind 16384)
[    2.211613] MPTCP token hash table entries: 2048 (order: 3, 49152 bytes, linear)
[    2.216105] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    2.219922] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
[    2.224132] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    2.227831] NET: Registered PF_XDP protocol family
[    2.230854] pci 0000:00:01.0: bridge window [io  0x1000-0x0fff] to [bus 01] add_size 1000
[    2.236111] pci 0000:00:01.1: bridge window [io  0x1000-0x0fff] to [bus 02] add_size 1000
[    2.241236] pci 0000:00:01.2: bridge window [io  0x1000-0x0fff] to [bus 03] add_size 1000
[    2.246024] pci 0000:00:01.3: bridge window [io  0x1000-0x0fff] to [bus 04] add_size 1000
[    2.251010] pci 0000:00:01.4: bridge window [io  0x1000-0x0fff] to [bus 05] add_size 1000
[    2.256164] pci 0000:00:01.5: bridge window [io  0x1000-0x0fff] to [bus 06] add_size 1000
[    2.261254] pci 0000:00:01.6: bridge window [io  0x1000-0x0fff] to [bus 07] add_size 1000
[    2.266244] pci 0000:00:01.7: bridge window [io  0x1000-0x0fff] to [bus 08] add_size 1000
[    2.271319] pci 0000:00:02.0: bridge window [io  0x1000-0x0fff] to [bus 09] add_size 1000
[    2.276453] pci 0000:00:02.1: bridge window [io  0x1000-0x0fff] to [bus 0a] add_size 1000
[    2.281202] pci 0000:00:02.2: bridge window [io  0x1000-0x0fff] to [bus 0b] add_size 1000
[    2.286321] pci 0000:00:02.3: bridge window [io  0x1000-0x0fff] to [bus 0c] add_size 1000
[    2.291474] pci 0000:00:02.4: bridge window [io  0x1000-0x0fff] to [bus 0d] add_size 1000
[    2.296599] pci 0000:00:02.5: bridge window [io  0x1000-0x0fff] to [bus 0e] add_size 1000
[    2.301312] pci 0000:00:01.0: bridge window [io  0x1000-0x1fff]: assigned
[    2.305234] pci 0000:00:01.1: bridge window [io  0x2000-0x2fff]: assigned
[    2.309628] pci 0000:00:01.2: bridge window [io  0x3000-0x3fff]: assigned
[    2.313955] pci 0000:00:01.3: bridge window [io  0x4000-0x4fff]: assigned
[    2.318288] pci 0000:00:01.4: bridge window [io  0x5000-0x5fff]: assigned
[    2.323804] pci 0000:00:01.5: bridge window [io  0x6000-0x6fff]: assigned
[    2.327612] pci 0000:00:01.6: bridge window [io  0x7000-0x7fff]: assigned
[    2.331957] pci 0000:00:01.7: bridge window [io  0x8000-0x8fff]: assigned
[    2.336310] pci 0000:00:02.0: bridge window [io  0x9000-0x9fff]: assigned
[    2.340670] pci 0000:00:02.1: bridge window [io  0xa000-0xafff]: assigned
[    2.345019] pci 0000:00:02.2: bridge window [io  0xb000-0xbfff]: assigned
[    2.349337] pci 0000:00:02.3: bridge window [io  0xd000-0xdfff]: assigned
[    2.353637] pci 0000:00:02.4: bridge window [io  0xe000-0xefff]: assigned
[    2.357452] pci 0000:00:02.5: bridge window [io  0xf000-0xffff]: assigned
[    2.361279] pci 0000:00:01.0: PCI bridge to [bus 01]
[    2.364646] pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
[    2.370101] pci 0000:00:01.0:   bridge window [mem 0xfcc00000-0xfcdfffff]
[    2.375597] pci 0000:00:01.0:   bridge window [mem 0xfea00000-0xfebfffff 64bit pref]
[    2.382646] pci 0000:00:01.1: PCI bridge to [bus 02]
[    2.385519] pci 0000:00:01.1:   bridge window [io  0x2000-0x2fff]
[    2.391129] pci 0000:00:01.1:   bridge window [mem 0xfca00000-0xfcbfffff]
[    2.396617] pci 0000:00:01.1:   bridge window [mem 0xfe800000-0xfe9fffff 64bit pref]
[    2.403539] pci 0000:00:01.2: PCI bridge to [bus 03]
[    2.406999] pci 0000:00:01.2:   bridge window [io  0x3000-0x3fff]
[    2.411993] pci 0000:00:01.2:   bridge window [mem 0xfc800000-0xfc9fffff]
[    2.417127] pci 0000:00:01.2:   bridge window [mem 0xfe600000-0xfe7fffff 64bit pref]
[    2.424270] pci 0000:00:01.3: PCI bridge to [bus 04]
[    2.427322] pci 0000:00:01.3:   bridge window [io  0x4000-0x4fff]
[    2.431819] pci 0000:00:01.3:   bridge window [mem 0xfc600000-0xfc7fffff]
[    2.436823] pci 0000:00:01.3:   bridge window [mem 0xfe400000-0xfe5fffff 64bit pref]
[    2.443813] pci 0000:00:01.4: PCI bridge to [bus 05]
[    2.447187] pci 0000:00:01.4:   bridge window [io  0x5000-0x5fff]
[    2.451786] pci 0000:00:01.4:   bridge window [mem 0xfc400000-0xfc5fffff]
[    2.456946] pci 0000:00:01.4:   bridge window [mem 0xfe200000-0xfe3fffff 64bit pref]
[    2.462385] pci 0000:00:01.5: PCI bridge to [bus 06]
[    2.465413] pci 0000:00:01.5:   bridge window [io  0x6000-0x6fff]
[    2.469761] pci 0000:00:01.5:   bridge window [mem 0xfc200000-0xfc3fffff]
[    2.474988] pci 0000:00:01.5:   bridge window [mem 0xfe000000-0xfe1fffff 64bit pref]
[    2.480441] pci 0000:00:01.6: PCI bridge to [bus 07]
[    2.483433] pci 0000:00:01.6:   bridge window [io  0x7000-0x7fff]
[    2.488062] pci 0000:00:01.6:   bridge window [mem 0xfc000000-0xfc1fffff]
[    2.493144] pci 0000:00:01.6:   bridge window [mem 0xfde00000-0xfdffffff 64bit pref]
[    2.499439] pci 0000:00:01.7: PCI bridge to [bus 08]
[    2.502696] pci 0000:00:01.7:   bridge window [io  0x8000-0x8fff]
[    2.507486] pci 0000:00:01.7:   bridge window [mem 0xfbe00000-0xfbffffff]
[    2.512429] pci 0000:00:01.7:   bridge window [mem 0xfdc00000-0xfddfffff 64bit pref]
[    2.519516] pci 0000:00:02.0: PCI bridge to [bus 09]
[    2.522930] pci 0000:00:02.0:   bridge window [io  0x9000-0x9fff]
[    2.527655] pci 0000:00:02.0:   bridge window [mem 0xfbc00000-0xfbdfffff]
[    2.532549] pci 0000:00:02.0:   bridge window [mem 0xfda00000-0xfdbfffff 64bit pref]
[    2.539323] pci 0000:00:02.1: PCI bridge to [bus 0a]
[    2.542768] pci 0000:00:02.1:   bridge window [io  0xa000-0xafff]
[    2.548926] pci 0000:00:02.1:   bridge window [mem 0xfba00000-0xfbbfffff]
[    2.553829] pci 0000:00:02.1:   bridge window [mem 0xfd800000-0xfd9fffff 64bit pref]
[    2.560887] pci 0000:00:02.2: PCI bridge to [bus 0b]
[    2.564290] pci 0000:00:02.2:   bridge window [io  0xb000-0xbfff]
[    2.568784] pci 0000:00:02.2:   bridge window [mem 0xfb800000-0xfb9fffff]
[    2.573161] pci 0000:00:02.2:   bridge window [mem 0xfd600000-0xfd7fffff 64bit pref]
[    2.580168] pci 0000:00:02.3: PCI bridge to [bus 0c]
[    2.583573] pci 0000:00:02.3:   bridge window [io  0xd000-0xdfff]
[    2.588331] pci 0000:00:02.3:   bridge window [mem 0xfb600000-0xfb7fffff]
[    2.594147] pci 0000:00:02.3:   bridge window [mem 0xfd400000-0xfd5fffff 64bit pref]
[    2.599817] pci 0000:00:02.4: PCI bridge to [bus 0d]
[    2.602698] pci 0000:00:02.4:   bridge window [io  0xe000-0xefff]
[    2.607489] pci 0000:00:02.4:   bridge window [mem 0xfb400000-0xfb5fffff]
[    2.613383] pci 0000:00:02.4:   bridge window [mem 0xfd200000-0xfd3fffff 64bit pref]
[    2.619377] pci 0000:00:02.5: PCI bridge to [bus 0e]
[    2.622801] pci 0000:00:02.5:   bridge window [io  0xf000-0xffff]
[    2.627400] pci 0000:00:02.5:   bridge window [mem 0xfb200000-0xfb3fffff]
[    2.632889] pci 0000:00:02.5:   bridge window [mem 0xfd000000-0xfd1fffff 64bit pref]
[    2.638970] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    2.643123] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    2.647155] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    2.651161] pci_bus 0000:00: resource 7 [mem 0x80000000-0xafffffff window]
[    2.655123] pci_bus 0000:00: resource 8 [mem 0xc0000000-0xfebfffff window]
[    2.659040] pci_bus 0000:00: resource 9 [mem 0x100000000-0x8ffffffff window]
[    2.662953] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    2.666648] pci_bus 0000:01: resource 1 [mem 0xfcc00000-0xfcdfffff]
[    2.670801] pci_bus 0000:01: resource 2 [mem 0xfea00000-0xfebfffff 64bit pref]
[    2.675471] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
[    2.679158] pci_bus 0000:02: resource 1 [mem 0xfca00000-0xfcbfffff]
[    2.684009] pci_bus 0000:02: resource 2 [mem 0xfe800000-0xfe9fffff 64bit pref]
[    2.688503] pci_bus 0000:03: resource 0 [io  0x3000-0x3fff]
[    2.692189] pci_bus 0000:03: resource 1 [mem 0xfc800000-0xfc9fffff]
[    2.696242] pci_bus 0000:03: resource 2 [mem 0xfe600000-0xfe7fffff 64bit pref]
[    2.700926] pci_bus 0000:04: resource 0 [io  0x4000-0x4fff]
[    2.704389] pci_bus 0000:04: resource 1 [mem 0xfc600000-0xfc7fffff]
[    2.708548] pci_bus 0000:04: resource 2 [mem 0xfe400000-0xfe5fffff 64bit pref]
[    2.713046] pci_bus 0000:05: resource 0 [io  0x5000-0x5fff]
[    2.716387] pci_bus 0000:05: resource 1 [mem 0xfc400000-0xfc5fffff]
[    2.720340] pci_bus 0000:05: resource 2 [mem 0xfe200000-0xfe3fffff 64bit pref]
[    2.724954] pci_bus 0000:06: resource 0 [io  0x6000-0x6fff]
[    2.728096] pci_bus 0000:06: resource 1 [mem 0xfc200000-0xfc3fffff]
[    2.731845] pci_bus 0000:06: resource 2 [mem 0xfe000000-0xfe1fffff 64bit pref]
[    2.736892] pci_bus 0000:07: resource 0 [io  0x7000-0x7fff]
[    2.740593] pci_bus 0000:07: resource 1 [mem 0xfc000000-0xfc1fffff]
[    2.744796] pci_bus 0000:07: resource 2 [mem 0xfde00000-0xfdffffff 64bit pref]
[    2.750240] pci_bus 0000:08: resource 0 [io  0x8000-0x8fff]
[    2.753497] pci_bus 0000:08: resource 1 [mem 0xfbe00000-0xfbffffff]
[    2.757120] pci_bus 0000:08: resource 2 [mem 0xfdc00000-0xfddfffff 64bit pref]
[    2.761283] pci_bus 0000:09: resource 0 [io  0x9000-0x9fff]
[    2.765976] pci_bus 0000:09: resource 1 [mem 0xfbc00000-0xfbdfffff]
[    2.770109] pci_bus 0000:09: resource 2 [mem 0xfda00000-0xfdbfffff 64bit pref]
[    2.774414] pci_bus 0000:0a: resource 0 [io  0xa000-0xafff]
[    2.778126] pci_bus 0000:0a: resource 1 [mem 0xfba00000-0xfbbfffff]
[    2.781920] pci_bus 0000:0a: resource 2 [mem 0xfd800000-0xfd9fffff 64bit pref]
[    2.786612] pci_bus 0000:0b: resource 0 [io  0xb000-0xbfff]
[    2.790323] pci_bus 0000:0b: resource 1 [mem 0xfb800000-0xfb9fffff]
[    2.794401] pci_bus 0000:0b: resource 2 [mem 0xfd600000-0xfd7fffff 64bit pref]
[    2.798956] pci_bus 0000:0c: resource 0 [io  0xd000-0xdfff]
[    2.802645] pci_bus 0000:0c: resource 1 [mem 0xfb600000-0xfb7fffff]
[    2.806440] pci_bus 0000:0c: resource 2 [mem 0xfd400000-0xfd5fffff 64bit pref]
[    2.811152] pci_bus 0000:0d: resource 0 [io  0xe000-0xefff]
[    2.814913] pci_bus 0000:0d: resource 1 [mem 0xfb400000-0xfb5fffff]
[    2.818936] pci_bus 0000:0d: resource 2 [mem 0xfd200000-0xfd3fffff 64bit pref]
[    2.823637] pci_bus 0000:0e: resource 0 [io  0xf000-0xffff]
[    2.827111] pci_bus 0000:0e: resource 1 [mem 0xfb200000-0xfb3fffff]
[    2.831213] pci_bus 0000:0e: resource 2 [mem 0xfd000000-0xfd1fffff 64bit pref]
[    2.837270] ACPI: \_SB_.GSIF: Enabled at IRQ 21
[    2.843372] PCI: CLS 0 bytes, default 64
[    2.846018] Trying to unpack rootfs image as initramfs...
[    2.849914] Initialise system trusted keyrings
[    2.852656] Key type blacklist registered
[    2.858459] workingset: timestamp_bits=36 max_order=19 bucket_order=0
[    2.866918] zbud: loaded
[    2.871025] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    2.879099] fuse: init (API version 7.39)
[    2.884781] integrity: Platform Keyring initialized
[    2.890145] integrity: Machine keyring initialized
[    2.911350] Key type asymmetric registered
[    2.914360] Asymmetric key parser 'x509' registered
[    2.917843] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 243)
[    2.922891] io scheduler mq-deadline registered
[    2.930411] pcieport 0000:00:01.0: PME: Signaling with IRQ 24
[    2.935927] Freeing initrd memory: 29932K
[    2.939143] pcieport 0000:00:01.0: AER: enabled with IRQ 24
[    2.946506] pcieport 0000:00:01.1: PME: Signaling with IRQ 25
[    2.951243] pcieport 0000:00:01.1: AER: enabled with IRQ 25
[    2.959840] pcieport 0000:00:01.2: PME: Signaling with IRQ 26
[    2.964562] pcieport 0000:00:01.2: AER: enabled with IRQ 26
[    2.973348] pcieport 0000:00:01.3: PME: Signaling with IRQ 27
[    2.977995] pcieport 0000:00:01.3: AER: enabled with IRQ 27
[    2.986883] pcieport 0000:00:01.4: PME: Signaling with IRQ 28
[    2.991634] pcieport 0000:00:01.4: AER: enabled with IRQ 28
[    3.000607] pcieport 0000:00:01.5: PME: Signaling with IRQ 29
[    3.007047] pcieport 0000:00:01.5: AER: enabled with IRQ 29
[    3.015163] pcieport 0000:00:01.6: PME: Signaling with IRQ 30
[    3.019894] pcieport 0000:00:01.6: AER: enabled with IRQ 30
[    3.028392] pcieport 0000:00:01.7: PME: Signaling with IRQ 31
[    3.033244] pcieport 0000:00:01.7: AER: enabled with IRQ 31
[    3.040083] ACPI: \_SB_.GSIG: Enabled at IRQ 22
[    3.045289] pcieport 0000:00:02.0: PME: Signaling with IRQ 32
[    3.049384] pcieport 0000:00:02.0: AER: enabled with IRQ 32
[    3.057481] pcieport 0000:00:02.1: PME: Signaling with IRQ 33
[    3.062268] pcieport 0000:00:02.1: AER: enabled with IRQ 33
[    3.070104] pcieport 0000:00:02.2: PME: Signaling with IRQ 34
[    3.074282] pcieport 0000:00:02.2: AER: enabled with IRQ 34
[    3.082530] pcieport 0000:00:02.3: PME: Signaling with IRQ 35
[    3.086718] pcieport 0000:00:02.3: AER: enabled with IRQ 35
[    3.094215] pcieport 0000:00:02.4: PME: Signaling with IRQ 36
[    3.098953] pcieport 0000:00:02.4: AER: enabled with IRQ 36
[    3.107573] pcieport 0000:00:02.5: PME: Signaling with IRQ 37
[    3.112167] pcieport 0000:00:02.5: AER: enabled with IRQ 37
[    3.117831] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    3.122582] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    3.127850] ACPI: button: Power Button [PWRF]
[    3.154174] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    3.189490] 00:00: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    3.239626] Linux agpgart interface v0.103
[    3.245988] loop: module loaded
[    3.249009] virtio_blk virtio2: 2/0/0 default/read/poll queues
[    3.256322] virtio_blk virtio2: [vda] 41943040 512-byte logical blocks (21.5 GB/20.0 GiB)
[    3.266660] GPT:Primary header thinks Alt. header is not at the end of the disk.
[    3.271877] GPT:7340031 != 41943039
[    3.274477] GPT:Alternate GPT header not at the end of the disk.
[    3.278542] GPT:7340031 != 41943039
[    3.281251] GPT: Use GNU Parted to correct GPT errors.
[    3.285007]  vda: vda1 vda14 vda15 vda16
[    3.288513] ACPI: bus type drm_connector registered
[    3.292456] tun: Universal TUN/TAP device driver, 1.6
[    3.300786] PPP generic driver version 2.4.2
[    3.304162] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    3.312336] serio: i8042 KBD port at 0x60,0x64 irq 1
[    3.315717] serio: i8042 AUX port at 0x60,0x64 irq 12
[    3.319564] mousedev: PS/2 mouse device common for all mice
[    3.323686] rtc_cmos 00:03: RTC can wake from S4
[    3.329297] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
[    3.335380] rtc_cmos 00:03: registered as rtc0
[    3.339460] rtc_cmos 00:03: setting system clock to 2026-02-08T04:40:04 UTC (1770525604)
[    3.345024] rtc_cmos 00:03: alarms up to one day, y3k, 242 bytes nvram
[    3.349309] i2c_dev: i2c /dev entries driver
[    3.352412] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    3.360142] device-mapper: uevent: version 1.0.3
[    3.363551] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@redhat.com
[    3.369251] amd_pstate: the _CPC object is not present in SBIOS or ACPI disabled
[    3.373952] ledtrig-cpu: registered to indicate activity on CPUs
[    3.377658] drop_monitor: Initializing network drop monitor service
[    3.381849] NET: Registered PF_INET6 protocol family
[    3.395503] Segment Routing with IPv6
[    3.398297] In-situ OAM (IOAM) with IPv6
[    3.401177] NET: Registered PF_PACKET protocol family
[    3.404911] Key type dns_resolver registered
[    3.408795] IPI shorthand broadcast: enabled
[    3.414479] registered taskstats version 1
[    3.417547] Loading compiled-in X.509 certificates
[    3.421334] Loaded X.509 cert 'Build time autogenerated kernel key: 7a5738967e2123858340ae7fbb0491d696dbfb58'
[    3.428034] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing 2025 Kmod: d541cef61dc7e793b7eb7e899970a2eef0b5dc8c'
[    3.435459] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969'
[    3.442253] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing: 88f752e560a1e0737e31163a466ad7b70a850c19'
[    3.448789] blacklist: Loading compiled-in revocation X.509 certificates
[    3.452927] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing: 61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    3.459375] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2017): 242ade75ac4a15e50d50c84b0d45ff3eae707a03'
[    3.466950] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (ESM 2018): 365188c1d374d6b07c3c8f240f8ef722433d6a8b'
[    3.473943] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2019): c0746fd6c5da3ae827864651ad66ae47fe24b3e8'
[    3.480046] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v1): a8d54bbb3825cfb94fa13c9f8a594a195c107b8d'
[    3.486174] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v2): 4cf046892d6fd3c9a5b03f98d845f90851dc6a8c'
[    3.493037] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (2021 v3): 100437bb6de6e469b581e61cd66bce3ef4ed53af'
[    3.499445] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing (Ubuntu Core 2019): c1d57b8f6b743f23ee41f4f7ee292f06eecadfb9'
[    3.512643] Key type .fscrypt registered
[    3.515307] Key type fscrypt-provisioning registered
[    3.526718] cryptd: max_cpu_qlen set to 1000
[    3.536070] AVX2 version of gcm_enc/dec engaged.
[    3.540690] AES CTR mode by8 optimization enabled
[    3.563386] Key type encrypted registered
[    3.566025] AppArmor: AppArmor sha256 policy hashing enabled
[    3.569394] ima: No TPM chip found, activating TPM-bypass!
[    3.572997] Loading compiled-in module X.509 certificates
[    3.577210] Loaded X.509 cert 'Build time autogenerated kernel key: 7a5738967e2123858340ae7fbb0491d696dbfb58'
[    3.583148] ima: Allocated hash algorithm: sha256
[    3.586038] ima: No architecture policies found
[    3.589110] evm: Initialising EVM extended attributes:
[    3.592502] evm: security.selinux
[    3.594855] evm: security.SMACK64
[    3.597169] evm: security.SMACK64EXEC
[    3.599786] evm: security.SMACK64TRANSMUTE
[    3.602580] evm: security.SMACK64MMAP
[    3.605126] evm: security.apparmor
[    3.607484] evm: security.ima
[    3.609518] evm: security.capability
[    3.612072] evm: HMAC attrs: 0x1
[    3.614781] PM:   Magic number: 14:130:666
[    3.617473] platform QEMU0002:00: hash matches
[    3.620374] acpi QEMU0002:00: hash matches
[    3.630351] RAS: Correctable Errors collector initialized.
[    3.633887] Unstable clock detected, switching default tracing clock to "global"
[    3.633887] If you want to keep using the local clock, then add:
[    3.633887]   "trace_clock=local"
[    3.633887] on the kernel command line
[    3.645583] clk: Disabling unused clocks
[    3.650643] Freeing unused decrypted memory: 2028K
[    3.653638] Freeing unused kernel image (initmem) memory: 4912K
[    3.656175] Write protecting the kernel read-only data: 38912k
[    3.659575] Freeing unused kernel image (rodata/data gap) memory: 2000K
[    3.719774] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.722705] Run /init as init process
Loading, please wait...
Starting systemd-udevd version 255.4-1ubuntu8.12
[    3.868032] virtio_net virtio0 enp1s0: renamed from eth0
[    3.881587] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    3.884483] ACPI: \_SB_.GSIA: Enabled at IRQ 16
[    3.890426] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 1
[    3.894171] ahci 0000:00:1f.2: AHCI 0001.0000 32 slots 6 ports 1.5 Gbps 0x3f impl SATA mode
[    3.899310] ahci 0000:00:1f.2: flags: 64bit ncq only 
[    3.907848] xhci_hcd 0000:02:00.0: hcc params 0x00087001 hci version 0x100 quirks 0x0000000000000010
[    3.914648] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input4
[    3.920965] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input3
[    3.945347] scsi host0: ahci
[    3.959036] scsi host1: ahci
[    3.962663] scsi host2: ahci
[    3.969005] xhci_hcd 0000:02:00.0: xHCI Host Controller
[    3.969028] scsi host3: ahci
[    3.973076] xhci_hcd 0000:02:00.0: new USB bus registered, assigned bus number 2
[    3.973722] scsi host4: ahci
[    3.977341] xhci_hcd 0000:02:00.0: Host supports USB 3.0 SuperSpeed
[    3.978115] scsi host5: ahci
[    3.982066] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.08
[    3.982787] ata1: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e100 irq 48 lpm-pol 0
[    3.985790] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.989557] ata2: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e180 irq 48 lpm-pol 0
[    3.992447] usb usb1: Product: xHCI Host Controller
[    3.992450] usb usb1: Manufacturer: Linux 6.8.0-90-generic xhci-hcd
[    3.992453] usb usb1: SerialNumber: 0000:02:00.0
[    3.995909] ata3: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e200 irq 48 lpm-pol 0
[    3.998058] hub 1-0:1.0: USB hub found
[    4.000798] ata4: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e280 irq 48 lpm-pol 0
[    4.003947] hub 1-0:1.0: 15 ports detected
[    4.006589] ata5: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e300 irq 48 lpm-pol 0
[    4.010970] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    4.011351] ata6: SATA max UDMA/133 abar m4096@0xfce0e000 port 0xfce0e380 irq 48 lpm-pol 0
[    4.012924] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.08
[    4.034939] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    4.038213] usb usb2: Product: xHCI Host Controller
[    4.040416] usb usb2: Manufacturer: Linux 6.8.0-90-generic xhci-hcd
[    4.043137] usb usb2: SerialNumber: 0000:02:00.0
[    4.045892] hub 2-0:1.0: USB hub found
[    4.048209] hub 2-0:1.0: 15 ports detected
[    4.328355] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    4.331923] ata2: SATA link down (SStatus 0 SControl 300)
[    4.335006] ata3: SATA link down (SStatus 0 SControl 300)
[    4.337359] ata1.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    4.342918] ata1.00: applying bridge limits
[    4.347319] ata6: SATA link down (SStatus 0 SControl 300)
[    4.350545] ata4: SATA link down (SStatus 0 SControl 300)
[    4.353155] ata1.00: configured for UDMA/100
[    4.356328] ata5: SATA link down (SStatus 0 SControl 300)
[    4.359353] scsi 0:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
[    4.382157] sr 0:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
[    4.384925] cdrom: Uniform CD-ROM driver Revision: 3.20
[    4.409207] sr 0:0:0:0: Attached scsi generic sg0 type 5
Begin: Loading essential drivers ... [    5.559763] raid6: avx512x4 gen() 46970 MB/s
[    5.578761] raid6: avx512x2 gen() 50119 MB/s
[    5.597760] raid6: avx512x1 gen() 46762 MB/s
[    5.615759] raid6: avx2x4   gen() 51379 MB/s
[    5.633758] raid6: avx2x2   gen() 53003 MB/s
[    5.651764] raid6: avx2x1   gen() 41813 MB/s
[    5.653551] raid6: using algorithm avx2x2 gen() 53003 MB/s
[    5.671760] raid6: .... xor() 33760 MB/s, rmw enabled
[    5.673770] raid6: using avx512x2 recovery algorithm
[    5.677534] xor: automatically using best checksumming function   avx       
[    5.681293] async_tx: api initialized (async)
done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... [    5.838436] Btrfs loaded, zoned=yes, fsverity=yes
Scanning for Btrfs filesystems
done.
Warning: fsck not present, so skipping root file system
[    5.900319] EXT4-fs (vda1): mounted filesystem 9a5b9fca-5fbb-45f3-a018-ec0be3e89f25 ro with ordered data mode. Quota mode: none.
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    6.081853] systemd[1]: Inserted module 'autofs4'
[    6.112417] systemd[1]: systemd 255.4-1ubuntu8.12 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFDISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    6.122696] systemd[1]: Detected virtualization kvm.
[    6.124976] systemd[1]: Detected architecture x86-64.

Welcome to Ubuntu 24.04.3 LTS!

[    6.131090] systemd[1]: Hostname set to <ubuntu>.
[    6.136859] systemd[1]: Initializing machine ID from VM UUID.
[    6.139397] systemd[1]: Installed transient /etc/machine-id file.
[    6.445316] systemd[1]: Queued start job for default target graphical.target.
[    6.465023] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[  OK  ] Created slice system-modprobe.slice - Slice /system/modprobe.
[    6.474064] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
[  OK  ] Created slice system-serial\x2dget…slice - Slice /system/serial-getty.
[    6.482448] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[  OK  ] Created slice system-systemd\x2dfs…slice - Slice /system/systemd-fsck.
[    6.490401] systemd[1]: Created slice user.slice - User and Session Slice.
[  OK  ] Created slice user.slice - User and Session Slice.
[    6.497428] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[  OK  ] Started systemd-ask-password-wall.…d Requests to Wall Directory Watch.
[    6.506148] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[  OK  ] Set up automount proc-sys-fs-binfm…ormats File System Automount Point.
[    6.516112] systemd[1]: Expecting device dev-disk-by\x2dlabel-BOOT.device - /dev/disk/by-label/BOOT...
         Expecting device dev-disk-by\x2dla…device - /dev/disk/by-label/BOOT...
[    6.523767] systemd[1]: Expecting device dev-disk-by\x2dlabel-UEFI.device - /dev/disk/by-label/UEFI...
         Expecting device dev-disk-by\x2dla…device - /dev/disk/by-label/UEFI...
[    6.532811] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
         Expecting device dev-ttyS0.device - /dev/ttyS0...
[    6.539105] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
[  OK  ] Reached target integritysetup.targ… Local Integrity Protected Volumes.
[    6.547703] systemd[1]: Reached target slices.target - Slice Units.
[  OK  ] Reached target slices.target - Slice Units.
[    6.554773] systemd[1]: Reached target snapd.mounts-pre.target - Mounting snaps.
[  OK  ] Reached target snapd.mounts-pre.target - Mounting snaps.
[    6.561968] systemd[1]: Reached target snapd.mounts.target - Mounted snaps.
[  OK  ] Reached target snapd.mounts.target - Mounted snaps.
[    6.569642] systemd[1]: Reached target swap.target - Swaps.
[  OK  ] Reached target swap.target - Swaps.
[    6.574948] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
[  OK  ] Reached target veritysetup.target - Local Verity Protected Volumes.
[    6.584558] systemd[1]: Listening on dm-event.socket - Device-mapper event daemon FIFOs.
[  OK  ] Listening on dm-event.socket - Device-mapper event daemon FIFOs.
[    6.592598] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
[  OK  ] Listening on lvm2-lvmpolld.socket - LVM2 poll daemon socket.
[    6.602013] systemd[1]: Listening on multipathd.socket - multipathd control socket.
[  OK  ] Listening on multipathd.socket - multipathd control socket.
[    6.608389] systemd[1]: Listening on syslog.socket - Syslog Socket.
[  OK  ] Listening on syslog.socket - Syslog Socket.
[    6.616034] systemd[1]: Listening on systemd-fsckd.socket - fsck to fsckd communication Socket.
[  OK  ] Listening on systemd-fsckd.socket …fsck to fsckd communication Socket.
[    6.626097] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[  OK  ] Listening on systemd-initctl.socke…- initctl Compatibility Named Pipe.
[    6.634454] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[  OK  ] Listening on systemd-journald-dev-…socket - Journal Socket (/dev/log).
[    6.641357] systemd[1]: Listening on systemd-journald.socket - Journal Socket.
[  OK  ] Listening on systemd-journald.socket - Journal Socket.
[    6.649271] systemd[1]: Listening on systemd-networkd.socket - Network Service Netlink Socket.
[  OK  ] Listening on systemd-networkd.socket - Network Service Netlink Socket.
[    6.658118] systemd[1]: systemd-pcrextend.socket - TPM2 PCR Extension (Varlink) was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.665456] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[  OK  ] Listening on systemd-udevd-control.socket - udev Control Socket.
[    6.671790] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[  OK  ] Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    6.687856] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
         Mounting dev-hugepages.mount - Huge Pages File System...
[    6.710867] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
         Mounting dev-mqueue.mount - POSIX Message Queue File System...
[    6.720947] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
         Mounting sys-kernel-debug.mount - Kernel Debug File System...
[    6.739848] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
         Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[    6.750110] systemd[1]: Starting systemd-journald.service - Journal Service...
         Starting systemd-journald.service - Journal Service...
[    6.760872] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
         Starting keyboard-setup.service - Set the console keyboard layout...
[    6.772926] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
         Starting kmod-static-nodes.service…eate List of Static Device Nodes...
[    6.789443] systemd-journald[328]: Collecting audit messages is disabled.
[    6.794266] systemd[1]: Starting lvm2-monitor.service - Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
         Starting lvm2-monitor.service - Mo…ing dmeventd or progress polling...
[    6.809947] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
         Starting modprobe@configfs.service - Load Kernel Module configfs...
[    6.842935] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel Module dm_mod...
         Starting modprobe@dm_mod.service - Load Kernel Module dm_mod...
[    6.865921] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
         Starting modprobe@drm.service - Load Kernel Module drm...
[    6.881904] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
         Starting modprobe@efi_pstore.servi… - Load Kernel Module efi_pstore...
[    6.892925] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
         Starting modprobe@fuse.service - Load Kernel Module fuse...
[    6.906204] systemd[1]: Starting modprobe@loop.service - Load Kernel Module loop...
         Starting modprobe@loop.service - Load Kernel Module loop...
[    6.913253] systemd[1]: netplan-ovs-cleanup.service - OpenVSwitch configuration for cleanup was skipped because of an unmet condition check (ConditionFileIsExecutable=/usr/bin/ovs-vsctl).
[    6.920482] systemd[1]: Starting systemd-fsck-root.service - File System Check on Root Device...
         Starting systemd-fsck-root.service…File System Check on Root Device...
[    6.930440] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
         Starting systemd-modules-load.service - Load Kernel Modules...
[    6.938235] systemd[1]: systemd-pcrmachine.service - TPM2 PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.943877] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Setup (Early) was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[    6.960465] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
         Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[    6.972920] systemd[1]: Started systemd-journald.service - Journal Service.
[  OK  ] Started systemd-journald.service - Journal Service.
[  OK  ] Mounted dev-hugepages.mount - Huge Pages File System.
[  OK  ] Mounted dev-mqueue.mount - POSIX Message Queue File System.
[  OK  ] Mounted sys-kernel-debug.mount - Kernel Debug File System.
[  OK  ] Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[  OK  ] Finished keyboard-setup.service - Set the console keyboard layout.
[  OK  ] Finished kmod-static-nodes.service…Create List of Static Device Nodes.
[  OK  ] Finished lvm2-monitor.service - Mo…using dmeventd or progress polling.
[  OK  ] Finished modprobe@configfs.service - Load Kernel Module configfs.
[  OK  ] Finished modprobe@dm_mod.service - Load Kernel Module dm_mod.
[  OK  ] Finished modprobe@drm.service - Load Kernel Module drm.
[  OK  ] Finished modprobe@efi_pstore.service - Load Kernel Module efi_pstore.
[  OK  ] Finished modprobe@fuse.service - Load Kernel Module fuse.
[  OK  ] Finished modprobe@loop.service - Load Kernel Module loop.
[  OK  ] Finished systemd-fsck-root.service - File System Check on Root Device.
[  OK  ] Finished systemd-modules-load.service - Load Kernel Modules.
         Mounting sys-fs-fuse-connections.mount - FUSE Control File System...
         Mounting sys-kernel-config.mount - Kernel Configuration File System...
[  OK  ] Started systemd-fsckd.service - Fi…stem Check Daemon to report status.
         Starting systemd-remount-fs.servic…unt Root and Kernel File Systems...
         Starting systemd-sysctl.service - Apply Kernel Variables...
         Starting systemd-tmpfiles-setup-de… Device Nodes in /dev gracefully...
[  OK  ] Mounted sys-fs-fuse-connections.mount - FUSE Control File System.
[  OK  ] Mounted sys-kernel-config.mount - Kernel Configuration File System.
[    7.134531] EXT4-fs (vda1): re-mounted 9a5b9fca-5fbb-45f3-a018-ec0be3e89f25 r/w. Quota mode: none.
[  OK  ] Finished systemd-remount-fs.servic…mount Root and Kernel File Systems.
         Starting multipathd.service - Devi…pper Multipath Device Controller...
         Starting systemd-journal-flush.ser…sh Journal to Persistent Storage...
         Starting systemd-random-seed.service - Load/Save OS Random Seed...
[  OK  ] Finished systemd-udev-trigger.service - Coldplug All udev Devices.
[  OK  ] Finished systemd-sysctl.service - Apply Kernel Variables.
[  OK  ] Finished systemd-tmpfiles-setup-de…ic Device Nodes in /dev gracefully.
         Starting systemd-sysusers.service - Create System Users...
[  OK  ] Finished systemd-random-seed.service - Load/Save OS Random Seed.
[  OK  ] Finished systemd-journal-flush.ser…lush Journal to Persistent Storage.
[  OK  ] Finished systemd-sysusers.service - Create System Users.
         Starting systemd-tmpfiles-setup-de…eate Static Device Nodes in /dev...
[  OK  ] Started multipathd.service - Devic…Mapper Multipath Device Controller.
[  OK  ] Finished systemd-tmpfiles-setup-de…Create Static Device Nodes in /dev.
[  OK  ] Reached target local-fs-pre.target…Preparation for Local File Systems.
         Starting systemd-udevd.service - R…ager for Device Events and Files...
[  OK  ] Started systemd-udevd.service - Ru…anager for Device Events and Files.
[  OK  ] Started systemd-ask-password-conso…equests to Console Directory Watch.
[  OK  ] Reached target cryptsetup.target - Local Encrypted Volumes.
[  OK  ] Found device dev-ttyS0.device - /dev/ttyS0.
[  OK  ] Found device dev-disk-by\x2dlabel-…I.device - /dev/disk/by-label/UEFI.
         Starting systemd-fsck@dev-disk-by\…Check on /dev/disk/by-label/UEFI...
[  OK  ] Finished systemd-fsck@dev-disk-by\…m Check on /dev/disk/by-label/UEFI.
[  OK  ] Found device dev-disk-by\x2dlabel-…T.device - /dev/disk/by-label/BOOT.
         Starting systemd-fsck@dev-disk-by\…Check on /dev/disk/by-label/BOOT...
[  OK  ] Finished systemd-fsck@dev-disk-by\…m Check on /dev/disk/by-label/BOOT.
         Mounting boot.mount - /boot...
[  OK  ] Mounted boot.mount - /boot.
         Mounting boot-efi.mount - /boot/efi...
[  OK  ] Mounted boot-efi.mount - /boot/efi.
[  OK  ] Reached target local-fs.target - Local File Systems.
[  OK  ] Listening on systemd-sysext.socket…tension Image Management (Varlink).
         Starting apparmor.service - Load AppArmor profiles...
         Starting console-setup.service - Set console font and keymap...
         Starting finalrd.service - Create …time dir for shutdown pivot root...
         Starting ldconfig.service - Rebuild Dynamic Linker Cache...
         Starting plymouth-read-write.servi…ymouth To Write Out Runtime Data...
         Starting systemd-binfmt.service - Set Up Additional Binary Formats...
         Starting systemd-tmpfiles-setup.se…e Volatile Files and Directories...
         Starting ufw.service - Uncomplicated firewall...
[  OK  ] Finished console-setup.service - Set console font and keymap.
[  OK  ] Finished finalrd.service - Create …untime dir for shutdown pivot root.
[  OK  ] Finished plymouth-read-write.servi…Plymouth To Write Out Runtime Data.
         Mounting proc-sys-fs-binfmt_misc.m…cutable File Formats File System...
[  OK  ] Finished ufw.service - Uncomplicated firewall.
[  OK  ] Finished systemd-tmpfiles-setup.se…ate Volatile Files and Directories.
         Starting systemd-journal-catalog-u…ervice - Rebuild Journal Catalog...
         Starting systemd-machine-id-commit…t a transient machine-id on disk...
         Starting systemd-resolved.service - Network Name Resolution...
         Starting systemd-timesyncd.service - Network Time Synchronization...
         Starting systemd-update-utmp.servi…ord System Boot/Shutdown in UTMP...
[  OK  ] Mounted proc-sys-fs-binfmt_misc.mo…xecutable File Formats File System.
[  OK  ] Listening on systemd-rfkill.socket…ll Switch Status /dev/rfkill Watch.
[  OK  ] Finished systemd-binfmt.service - Set Up Additional Binary Formats.
[  OK  ] Finished systemd-update-utmp.servi…ecord System Boot/Shutdown in UTMP.
[  OK  ] Finished systemd-journal-catalog-u….service - Rebuild Journal Catalog.
[  OK  ] Finished systemd-machine-id-commit…mit a transient machine-id on disk.
[  OK  ] Started systemd-timesyncd.service - Network Time Synchronization.
[  OK  ] Reached target time-set.target - System Time Set.
[  OK  ] Started systemd-resolved.service - Network Name Resolution.
[  OK  ] Reached target nss-lookup.target - Host and Network Name Lookups.
[  OK  ] Finished ldconfig.service - Rebuild Dynamic Linker Cache.
         Starting systemd-update-done.service - Update is Completed...
[  OK  ] Finished systemd-update-done.service - Update is Completed.
[  OK  ] Finished apparmor.service - Load AppArmor profiles.
         Starting snapd.apparmor.service - …iles managed internally by snapd...
         Starting cloud-init-local.service …-init: Local Stage (pre-network)...
[  OK  ] Finished snapd.apparmor.service - …ofiles managed internally by snapd.
[    8.896581] cloud-init[635]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'init-local' at Sun, 08 Feb 2026 04:40:10 +0000. Up 8.88 seconds.
[  OK  ] Finished cloud-init-local.service …ud-init: Local Stage (pre-network).
[  OK  ] Reached target network-pre.target - Preparation for Network.
         Starting systemd-networkd.service - Network Configuration...
[  OK  ] Started systemd-networkd.service - Network Configuration.
[  OK  ] Reached target network.target - Network.
         Starting systemd-networkd-wait-onl…ait for Network to be Configured...
[  OK  ] Finished systemd-networkd-wait-onl… Wait for Network to be Configured.
         Starting cloud-init.service - Cloud-init: Network Stage...
[   12.942634] cloud-init[702]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'init' at Sun, 08 Feb 2026 04:40:14 +0000. Up 12.92 seconds.
[   12.953247] cloud-init[702]: ci-info: ++++++++++++++++++++++++++++++++++++++Net device info++++++++++++++++++++++++++++++++++++++
[   12.957703] cloud-init[702]: ci-info: +--------+------+----------------------------+---------------+--------+-------------------+
[   12.962049] cloud-init[702]: ci-info: | Device |  Up  |          Address           |      Mask     | Scope  |     Hw-Address    |
[   12.966376] cloud-init[702]: ci-info: +--------+------+----------------------------+---------------+--------+-------------------+
[   12.971260] cloud-init[702]: ci-info: | enp1s0 | True |      192.168.122.105       | 255.255.255.0 | global | 52:54:00:41:38:53 |
[   12.975711] cloud-init[702]: ci-info: | enp1s0 | True | fe80::5054:ff:fe41:3853/64 |       .       |  link  | 52:54:00:41:38:53 |
[   12.980277] cloud-init[702]: ci-info: |   lo   | True |         127.0.0.1          |   255.0.0.0   |  host  |         .         |
[   12.985179] cloud-init[702]: ci-info: |   lo   | True |          ::1/128           |       .       |  host  |         .         |
[   12.989433] cloud-init[702]: ci-info: +--------+------+----------------------------+---------------+--------+-------------------+
[   12.993758] cloud-init[702]: ci-info: ++++++++++++++++++++++++++++++++Route IPv4 info++++++++++++++++++++++++++++++++
[   12.997792] cloud-init[702]: ci-info: +-------+---------------+---------------+-----------------+-----------+-------+
[   13.001872] cloud-init[702]: ci-info: | Route |  Destination  |    Gateway    |     Genmask     | Interface | Flags |
[   13.005401] cloud-init[702]: ci-info: +-------+---------------+---------------+-----------------+-----------+-------+
[   13.010538] cloud-init[702]: ci-info: |   0   |    0.0.0.0    | 192.168.122.1 |     0.0.0.0     |   enp1s0  |   UG  |
[   13.014783] cloud-init[702]: ci-info: |   1   | 192.168.122.0 |    0.0.0.0    |  255.255.255.0  |   enp1s0  |   U   |
[   13.018848] cloud-init[702]: ci-info: |   2   | 192.168.122.1 |    0.0.0.0    | 255.255.255.255 |   enp1s0  |   UH  |
[   13.023628] cloud-init[702]: ci-info: +-------+---------------+---------------+-----------------+-----------+-------+
[   13.028172] cloud-init[702]: ci-info: +++++++++++++++++++Route IPv6 info+++++++++++++++++++
[   13.031620] cloud-init[702]: ci-info: +-------+-------------+---------+-----------+-------+
[   13.035498] cloud-init[702]: ci-info: | Route | Destination | Gateway | Interface | Flags |
[   13.039302] cloud-init[702]: ci-info: +-------+-------------+---------+-----------+-------+
[   13.042552] cloud-init[702]: ci-info: |   0   |  fe80::/64  |    ::   |   enp1s0  |   U   |
[   13.045941] cloud-init[702]: ci-info: |   2   |    local    |    ::   |   enp1s0  |   U   |
[   13.048721] cloud-init[702]: ci-info: |   3   |  multicast  |    ::   |   enp1s0  |   U   |
[   13.052133] cloud-init[702]: ci-info: +-------+-------------+---------+-----------+-------+
[   14.223604] cloud-init[702]: Generating public/private rsa key pair.
[   14.227080] cloud-init[702]: Your identification has been saved in /etc/ssh/ssh_host_rsa_key
[   14.232496] cloud-init[702]: Your public key has been saved in /etc/ssh/ssh_host_rsa_key.pub
[   14.236478] cloud-init[702]: The key fingerprint is:
[   14.239488] cloud-init[702]: SHA256:IyMX34SwzyC2oIhflKUsNq/dsFQANhnXJIWAuQ6t5D4 root@ubuntu
[   14.244313] cloud-init[702]: The key's randomart image is:
[   14.246928] cloud-init[702]: +---[RSA 3072]----+
[   14.249300] cloud-init[702]: | o*=+==          |
[   14.251583] cloud-init[702]: |o..+.*.o .       |
[   14.253967] cloud-init[702]: | o= B = . .      |
[   14.256328] cloud-init[702]: |=+.B + * o       |
[   14.258429] cloud-init[702]: |O.  B + S .      |
[   14.260722] cloud-init[702]: |.+ = * o .       |
[   14.263051] cloud-init[702]: |. o o .          |
[  OK  ] Finished cloud-init.service - Cloud-init: Network Stage.
[   14.269139] cloud-init[702]: | E               |
[   14.271104] cloud-init[702]: |  .              |
[   14.273176] cloud-init[702]: +----[SHA256]-----+
[   14.275261] cloud-init[702]: Generating public/private ecdsa key pair.
[   14.278145] cloud-init[702]: Your identification has been saved in /etc/ssh/ssh_host_ecdsa_key
[   14.281912] cloud-init[702]: Your public key has been saved in /etc/ssh/ssh_host_ecdsa_key.pub
[   14.285529] cloud-init[702]: The key fingerprint is:
[   14.287583] cloud-init[702]: SHA256:nOyj7i+Oj629wYKEdsI1QbAXvySooIMQx67NO55S1mo root@ubuntu
[   14.290623] cloud-init[702]: The key's randomart image is:
[   14.292673] cloud-init[702]: +---[ECDSA 256]---+
[   14.294772] cloud-init[702]: |.o++             |
[   14.296839] cloud-init[702]: | o+ +            |
[   14.298966] cloud-init[702]: |o+ = o           |
[   14.301072] cloud-init[702]: |B.+ + .o .       |
[   14.302823] cloud-init[702]: |*B.o .  S        |
[   14.304576] cloud-init[702]: |ooB... .         |
[   14.306283] cloud-init[702]: | o.o. o o        |
[   14.308190] cloud-init[702]: |. E. *.o .       |
[   14.310064] cloud-init[702]: | +o.+*X+.        |
[   14.311869] cloud-init[702]: +----[SHA256]-----+
[   14.313601] cloud-init[702]: Generating public/private ed25519 key pair.
[   14.316517] cloud-init[702]: Your identification has been saved in /etc/ssh/ssh_host_ed25519_key
[   14.316598] cloud-init[702]: Your public key has been saved in /etc/ssh/ssh_host_ed25519_key.pub
[   14.317750] cloud-init[702]: The key fingerprint is:
[   14.321590] cloud-init[702]: SHA256:yE6/jmGc6BXqp590HJzpYO8FJ3x5ocAhTHfNKx6jW10 root@ubuntu
[   14.322111] cloud-init[702]: The key's randomart image is:
[   14.322449] cloud-init[702]: +--[ED25519 256]--+
[   14.323486] cloud-init[702]: |     oo o .o     |
[   14.324519] cloud-init[702]: |      .+ o  o    |
[   14.324968] cloud-init[702]: |        o   ..   |
[   14.326190] cloud-init[702]: |     . + ++o..E  |
[   14.329627] cloud-init[702]: |      B So==..   |
[   14.332993] cloud-init[702]: |     B O.*o..    |
[   14.333345] cloud-init[702]: |    o O *o.      |
[   14.333895] cloud-init[702]: |   o +.*.o       |
[   14.335101] cloud-init[702]: |    +++.+        |
[   14.335521] cloud-init[702]: +----[SHA256]-----+
[  OK  ] Reached target cloud-config.target - Cloud-config availability.
[  OK  ] Reached target network-online.target - Network is Online.
[  OK  ] Reached target sysinit.target - System Initialization.
[  OK  ] Started apt-daily.timer - Daily apt download activities.
[  OK  ] Started apt-daily-upgrade.timer - …y apt upgrade and clean activities.
[  OK  ] Started dpkg-db-backup.timer - Daily dpkg database backup timer.
[  OK  ] Started e2scrub_all.timer - Period…Metadata Check for All Filesystems.
[  OK  ] Started fstrim.timer - Discard unused filesystem blocks once a week.
[  OK  ] Started fwupd-refresh.timer - Refresh fwupd metadata regularly.
[  OK  ] Started logrotate.timer - Daily rotation of log files.
[  OK  ] Started man-db.timer - Daily man-db regeneration.
[  OK  ] Started motd-news.timer - Message of the Day.
[  OK  ] Started sysstat-collect.timer - Ru…y accounting tool every 10 minutes.
[  OK  ] Started sysstat-summary.timer - Ge… of yesterday's process accounting.
[  OK  ] Started systemd-tmpfiles-clean.tim…y Cleanup of Temporary Directories.
[  OK  ] Started update-notifier-download.t…hat failed at package install time.
[  OK  ] Started update-notifier-motd.timer… a new version of Ubuntu available.
[  OK  ] Reached target paths.target - Path Units.
[  OK  ] Reached target timers.target - Timer Units.
[  OK  ] Listening on cloud-init-hotplugd.s…t - cloud-init hotplug hook socket.
[  OK  ] Listening on dbus.socket - D-Bus System Message Bus Socket.
[  OK  ] Listening on iscsid.socket - Open-iSCSI iscsid Socket.
         Starting lxd-installer.socket - He…er to install lxd snap on demand...
         Starting snapd.socket - Socket activation for snappy daemon...
[  OK  ] Listening on ssh.socket - OpenBSD Secure Shell server socket.
[  OK  ] Listening on uuidd.socket - UUID daemon activation socket.
[  OK  ] Reached target remote-fs-pre.targe…reparation for Remote File Systems.
[  OK  ] Reached target remote-fs.target - Remote File Systems.
[  OK  ] Finished blk-availability.service - Availability of block devices.
[  OK  ] Listening on lxd-installer.socket …lper to install lxd snap on demand.
[  OK  ] Listening on snapd.socket - Socket activation for snappy daemon.
[  OK  ] Reached target sockets.target - Socket Units.
[  OK  ] Reached target basic.target - Basic System.
         Starting apport.service - automatic crash report generation...
         Starting cloud-config.service - Cloud-init: Config Stage...
[  OK  ] Started cron.service - Regular background program processing daemon.
         Starting dbus.service - D-Bus System Message Bus...
[  OK  ] Started dmesg.service - Save initial kernel messages after boot.
         Starting e2scrub_reap.service - Re…ne ext4 Metadata Check Snapshots...
         Starting grub-common.service - Record successful boot for GRUB...
         Starting polkit.service - Authorization Manager...
         Starting pollinate.service - Polli…e pseudo random number generator...
         Starting rsyslog.service - System Logging Service...
[  OK  ] Reached target getty-pre.target - Preparation for Logins.
         Starting snapd.seeded.service - Wait until snapd is fully seeded...
         Starting snapd.service - Snap Daemon...
         Starting sysstat.service - Resets System Activity Logs...
         Starting systemd-logind.service - User Login Management...
         Starting systemd-user-sessions.service - Permit User Sessions...
         Starting udisks2.service - Disk Manager...
[  OK  ] Started dbus.service - D-Bus System Message Bus.
[  OK  ] Started systemd-logind.service - User Login Management.
[  OK  ] Finished apport.service - automatic crash report generation.
[  OK  ] Finished e2scrub_reap.service - Re…line ext4 Metadata Check Snapshots.
[  OK  ] Finished sysstat.service - Resets System Activity Logs.
[  OK  ] Finished systemd-user-sessions.service - Permit User Sessions.
         Starting plymouth-quit-wait.servic…d until boot process finishes up...
         Starting plymouth-quit.service - Terminate Plymouth Boot Screen...
[   15.082654] cloud-init[865]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'modules:config' at Sun, 08 Feb 2026 04:40:16 +0000. Up 14.99 seconds.
[  OK  ] Started unattended-upgrades.service - Unattended Upgrades Shutdown.
[  OK  ] Finished grub-common.service - Record successful boot for GRUB.
[  OK  ] Finished plymouth-quit-wait.servic…old until boot process finishes up.
[  OK  ] Finished plymouth-quit.service - Terminate Plymouth Boot Screen.
[  OK  ] Started rsyslog.service - System Logging Service.
         Starting grub-initrd-fallback.service - GRUB failed boot detection...
[  OK  ] Started serial-getty@ttyS0.service - Serial Getty on ttyS0.
         Starting setvtrgb.service - Set console scheme...
         Starting systemd-hostnamed.service - Hostname Service...
[  OK  ] Finished setvtrgb.service - Set console scheme.
[  OK  ] Started polkit.service - Authorization Manager.
[  OK  ] Started udisks2.service - Disk Manager.
[  OK  ] Created slice system-getty.slice - Slice /system/getty.
         Starting ModemManager.service - Modem Manager...
[  OK  ] Started getty@tty1.service - Getty on tty1.
[  OK  ] Reached target getty.target - Login Prompts.
[  OK  ] Finished grub-initrd-fallback.service - GRUB failed boot detection.
[  OK  ] Started systemd-hostnamed.service - Hostname Service.
[  OK  ] Started ModemManager.service - Modem Manager.
[  OK  ] Finished cloud-config.service - Cloud-init: Config Stage.
[  OK  ] Started snapd.service - Snap Daemon.
         Starting systemd-timedated.service - Time & Date Service...
[  OK  ] Started systemd-timedated.service - Time & Date Service.
[  OK  ] Finished pollinate.service - Polli…the pseudo random number generator.
[  OK  ] Finished snapd.seeded.service - Wait until snapd is fully seeded.
[  OK  ] Reached target multi-user.target - Multi-User System.
[  OK  ] Reached target graphical.target - Graphical Interface.
         Starting cloud-final.service - Cloud-init: Final Stage...
         Starting systemd-update-utmp-runle…- Record Runlevel Change in UTMP...
[  OK  ] Finished systemd-update-utmp-runle…e - Record Runlevel Change in UTMP.
[   18.472453] cloud-init[1026]: Cloud-init v. 25.2-0ubuntu1~24.04.1 running 'modules:final' at Sun, 08 Feb 2026 04:40:20 +0000. Up 18.44 seconds.
         Starting apt-news.service - Update APT News...
         Starting esm-cache.service - Update the local ESM caches...
[   19.102049] cloud-init[1026]: Hit:1 http://archive.ubuntu.com/ubuntu noble InRelease
[   19.234219] cloud-init[1026]: Get:2 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
[   19.311308] cloud-init[1026]: Get:3 http://archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
[  OK  ] Finished apt-news.service - Update APT News.
[   20.258235] cloud-init[1026]: Get:4 http://archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
[   20.583440] cloud-init[1026]: Get:5 http://security.ubuntu.com/ubuntu noble-security/main amd64 Packages [1431 kB]

Ubuntu 24.04.3 LTS ubuntu ttyS0

ubuntu login: [   20.639446] cloud-init[1026]: Get:6 http://archive.ubuntu.com/ubuntu noble/universe amd64 Packages [15.0 MB]
[   21.980837] cloud-init[1026]: Get:7 http://security.ubuntu.com/ubuntu noble-security/main Translation-en [232 kB]
[   22.014091] cloud-init[1026]: Get:8 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.6 kB]
[   22.014204] cloud-init[1026]: Get:9 http://security.ubuntu.com/ubuntu noble-security/main amd64 c-n-f Metadata [9888 B]
[   22.026052] cloud-init[1026]: Get:10 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Packages [929 kB]
[   22.141080] cloud-init[1026]: Get:11 http://security.ubuntu.com/ubuntu noble-security/universe Translation-en [212 kB]
[   22.165971] cloud-init[1026]: Get:12 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [74.2 kB]
[   22.178968] cloud-init[1026]: Get:13 http://security.ubuntu.com/ubuntu noble-security/universe amd64 c-n-f Metadata [19.9 kB]
[   22.184393] cloud-init[1026]: Get:14 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Packages [2411 kB]
[   22.355716] cloud-init[1026]: Get:15 http://archive.ubuntu.com/ubuntu noble/universe Translation-en [5982 kB]
[   22.562897] cloud-init[1026]: Get:16 http://security.ubuntu.com/ubuntu noble-security/restricted Translation-en [553 kB]
[   22.590169] cloud-init[1026]: Get:17 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]
[   22.607935] cloud-init[1026]: Get:18 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 c-n-f Metadata [536 B]
[   22.608107] cloud-init[1026]: Get:19 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Packages [28.8 kB]
[   22.631484] cloud-init[1026]: Get:20 http://security.ubuntu.com/ubuntu noble-security/multiverse Translation-en [6492 B]
[   22.631609] cloud-init[1026]: Get:21 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
[   22.651798] cloud-init[1026]: Get:22 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 c-n-f Metadata [396 B]
[   22.660705] cloud-init[1026]: Get:23 http://archive.ubuntu.com/ubuntu noble/universe amd64 Components [3871 kB]
[   22.858910] cloud-init[1026]: Get:24 http://archive.ubuntu.com/ubuntu noble/universe amd64 c-n-f Metadata [301 kB]
[   22.870950] cloud-init[1026]: Get:25 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 Packages [269 kB]
[   22.880904] cloud-init[1026]: Get:26 http://archive.ubuntu.com/ubuntu noble/multiverse Translation-en [118 kB]
[   22.886912] cloud-init[1026]: Get:27 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 Components [35.0 kB]
[   22.892982] cloud-init[1026]: Get:28 http://archive.ubuntu.com/ubuntu noble/multiverse amd64 c-n-f Metadata [8328 B]
[   22.897787] cloud-init[1026]: Get:29 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1739 kB]
[   23.021716] cloud-init[1026]: Get:30 http://archive.ubuntu.com/ubuntu noble-updates/main Translation-en [324 kB]
[   23.029512] cloud-init[1026]: Get:31 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [175 kB]
[   23.034873] cloud-init[1026]: Get:32 http://archive.ubuntu.com/ubuntu noble-updates/main amd64 c-n-f Metadata [16.5 kB]
[   23.105986] cloud-init[1026]: Get:33 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1528 kB]
[   23.133447] cloud-init[1026]: Get:34 http://archive.ubuntu.com/ubuntu noble-updates/universe Translation-en [313 kB]
[   23.141042] cloud-init[1026]: Get:35 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [386 kB]
[   23.511550] cloud-init[1026]: Get:36 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 c-n-f Metadata [31.9 kB]
[   23.944178] cloud-init[1026]: Get:37 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Packages [2582 kB]
[   25.677421] cloud-init[1026]: Get:38 http://archive.ubuntu.com/ubuntu noble-updates/restricted Translation-en [591 kB]
[   26.121650] cloud-init[1026]: Get:39 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
[   26.317926] cloud-init[1026]: Get:40 http://archive.ubuntu.com/ubuntu noble-updates/restricted amd64 c-n-f Metadata [556 B]
[   26.497950] cloud-init[1026]: Get:41 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Packages [32.1 kB]
[   26.688222] cloud-init[1026]: Get:42 http://archive.ubuntu.com/ubuntu noble-updates/multiverse Translation-en [6816 B]
[   26.878365] cloud-init[1026]: Get:43 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
[   27.057708] cloud-init[1026]: Get:44 http://archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 c-n-f Metadata [496 B]
[   27.237182] cloud-init[1026]: Get:45 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 Packages [40.4 kB]
[   27.425083] cloud-init[1026]: Get:46 http://archive.ubuntu.com/ubuntu noble-backports/main Translation-en [9208 B]
[   27.609298] cloud-init[1026]: Get:47 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7312 B]
[   27.793977] cloud-init[1026]: Get:48 http://archive.ubuntu.com/ubuntu noble-backports/main amd64 c-n-f Metadata [368 B]
[   27.973281] cloud-init[1026]: Get:49 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 Packages [29.5 kB]
[   28.161503] cloud-init[1026]: Get:50 http://archive.ubuntu.com/ubuntu noble-backports/universe Translation-en [17.9 kB]
[   28.562291] cloud-init[1026]: Get:51 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [10.5 kB]
[   28.745670] cloud-init[1026]: Get:52 http://archive.ubuntu.com/ubuntu noble-backports/universe amd64 c-n-f Metadata [1444 B]
[   28.925795] cloud-init[1026]: Get:53 http://archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [216 B]
[   29.105052] cloud-init[1026]: Get:54 http://archive.ubuntu.com/ubuntu noble-backports/restricted amd64 c-n-f Metadata [116 B]
[   29.284324] cloud-init[1026]: Get:55 http://archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]
[   29.463272] cloud-init[1026]: Get:56 http://archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 c-n-f Metadata [116 B]
[   34.089403] cloud-init[1026]: Fetched 39.8 MB in 11s (3650 kB/s)
[   34.959223] cloud-init[1026]: Reading package lists...
[   35.163486] cloud-init[1026]: Reading package lists...
[   35.353694] cloud-init[1026]: Building dependency tree...
[   35.357685] cloud-init[1026]: Reading state information...
[   35.513226] cloud-init[1026]: The following additional packages will be installed:
[   35.516676] cloud-init[1026]:   liburing2
[   35.534808] cloud-init[1026]: The following NEW packages will be installed:
[   35.544247] cloud-init[1026]:   liburing2 qemu-guest-agent
[   35.912872] cloud-init[1026]: 0 upgraded, 2 newly installed, 0 to remove and 52 not upgraded.
[   35.917734] cloud-init[1026]: Need to get 411 kB of archives.
[   35.920379] cloud-init[1026]: After this operation, 1302 kB of additional disk space will be used.
[   35.923937] cloud-init[1026]: Get:1 http://archive.ubuntu.com/ubuntu noble/main amd64 liburing2 amd64 2.5-1build1 [21.1 kB]
[   36.289382] cloud-init[1026]: Get:2 http://archive.ubuntu.com/ubuntu noble-updates/universe amd64 qemu-guest-agent amd64 1:8.2.2+ds-0ubuntu1.12 [390 kB]
[   37.253862] cloud-init[1026]: Fetched 411 kB in 1s (282 kB/s)
[   37.279470] cloud-init[1026]: Selecting previously unselected package liburing2:amd64.
(Reading database ... 74813 files and directories currently installed.)
[   37.564455] cloud-init[1026]: Preparing to unpack .../liburing2_2.5-1build1_amd64.deb ...
[   37.570667] cloud-init[1026]: Unpacking liburing2:amd64 (2.5-1build1) ...
[   37.575344] cloud-init[1026]: Selecting previously unselected package qemu-guest-agent.
[   37.579104] cloud-init[1026]: Preparing to unpack .../qemu-guest-agent_1%3a8.2.2+ds-0ubuntu1.12_amd64.deb ...
[   37.583169] cloud-init[1026]: Unpacking qemu-guest-agent (1:8.2.2+ds-0ubuntu1.12) ...
[   37.596571] cloud-init[1026]: Setting up liburing2:amd64 (2.5-1build1) ...
[   37.599993] cloud-init[1026]: Setting up qemu-guest-agent (1:8.2.2+ds-0ubuntu1.12) ...
[   38.213362] cloud-init[1026]: qemu-guest-agent.service is a disabled or a static unit, not starting it.
[   38.218577] cloud-init[1026]: Processing triggers for libc-bin (2.39-0ubuntu8.6) ...
[   38.568373] cloud-init[1026]: Processing triggers for man-db (2.12.0-4build2) ...
[   40.173450] cloud-init[1026]: Running kernel seems to be up-to-date.
[   40.173608] cloud-init[1026]: No services need to be restarted.
[   40.174702] cloud-init[1026]: No containers need to be restarted.
[   40.176994] cloud-init[1026]: No user sessions are running outdated binaries.
[   40.177543] cloud-init[1026]: No VM guests are running outdated hypervisor (qemu) binaries on this host.
[   41.169548] cloud-init[1026]: Synchronizing state of qemu-guest-agent.service with SysV service script with /usr/lib/systemd/systemd-sysv-install.
[   41.176684] cloud-init[1026]: Executing: /usr/lib/systemd/systemd-sysv-install enable qemu-guest-agent
[   41.912667] cloud-init[1026]: The unit files have no installation config (WantedBy=, RequiredBy=, UpheldBy=,
[   41.917210] cloud-init[1026]: Also=, or Alias= settings in the [Install] section, and DefaultInstance= for
[   41.921620] cloud-init[1026]: template units). This means they are not meant to be enabled or disabled using systemctl.
[   41.926370] cloud-init[1026]:  
[   41.928105] cloud-init[1026]: Possible reasons for having these kinds of units are:
[   41.931633] cloud-init[1026]: • A unit may be statically enabled by being symlinked from another unit's
[   41.935932] cloud-init[1026]:   .wants/, .requires/, or .upholds/ directory.
[  OK  ] Started qemu-guest-agent.service - QEMU Guest Agent.
[   41.941372] cloud-init[1026]: • A unit's purpose may be to act as a helper for some other unit which has
[   41.945872] cloud-init[1026]:   a requirement dependency on it.
[   41.946851] cloud-init[1026]: • A unit may be started when needed via activation (socket, path, timer,
[   41.947955] cloud-init[1026]:   D-Bus, udev, scripted systemctl call, ...).
[   41.949952] cloud-init[1026]: • In case of template units, the unit is meant to be enabled with some
[   41.951608] cloud-init[1026]:   instance name specified.
ci-info: no authorized SSH keys fingerprints found for user ubuntu.
<14>Feb  8 04:40:43 cloud-init: #############################################################
<14>Feb  8 04:40:43 cloud-init: -----BEGIN SSH HOST KEY FINGERPRINTS-----
<14>Feb  8 04:40:43 cloud-init: 256 SHA256:nOyj7i+Oj629wYKEdsI1QbAXvySooIMQx67NO55S1mo root@ubuntu (ECDSA)
<14>Feb  8 04:40:43 cloud-init: 256 SHA256:yE6/jmGc6BXqp590HJzpYO8FJ3x5ocAhTHfNKx6jW10 root@ubuntu (ED25519)
<14>Feb  8 04:40:43 cloud-init: 3072 SHA256:IyMX34SwzyC2oIhflKUsNq/dsFQANhnXJIWAuQ6t5D4 root@ubuntu (RSA)
<14>Feb  8 04:40:43 cloud-init: -----END SSH HOST KEY FINGERPRINTS-----
<14>Feb  8 04:40:43 cloud-init: #############################################################
-----BEGIN SSH HOST KEY KEYS-----
ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBAlXa9o1jWA+vVTUGOlm6sk4/RcM+2Mt0OT9nrydO1ZxZUv2NDjMDhLJ45Qohu5jZuLbwfQcMgd76myYXct7OdA= root@ubuntu
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILfn/SbAgNGqRWVjNVdxXnhU+kL39Z3arytkg5WnwGdm root@ubuntu
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgqgjdMzELFRqG3tzZGE80ckTtqOXvjn7Kf6GGpAAAH1TTcYkznnL6vaM0VirbPHhDZgRQnusY4kl628w4V2G+Lw1isCUJq7LhzuuvTDZET6fRBphpJnnmh4v6m4eJ6WETXOy/yK3OOtciXfOGfbgStcsix3vNbWu8fAqIsKug+ngk7lPudvhEOVR4c4xWVV6GzKeXknGOmLt23ZwZrCZl/o6CHPX/mL/78doRsnkT/XrmNCepYZKXqvkCWjA+zDT2zQnx8su2ZZGr8p2QS+FX+BORAyU4wKrS2xPCkE1nlKeAnBvXPzdSFBWBxB96GDW+v3W3KrxdBpbZbXybEuxred51CcOcCXV6rYjZsv/fs84WeDYYlbWoEY2tOAUf7I9zUtCi/nJNqktbt7aW3QYdhtl+LWe9vowk8OALwXNZ4627gP5FkgpAo2l2nn6Dh3IdY4tuJhTp2JeFlyeJrJo+NmCmNtNV25qvjPc3UkeyOyer3c4X5ByzPE00XTZDlz8= root@ubuntu
-----END SSH HOST KEY KEYS-----
[   42.066936] cloud-init[1026]: Cloud-init v. 25.2-0ubuntu1~24.04.1 finished at Sun, 08 Feb 2026 04:40:43 +0000. Datasource DataSourceNoCloud [seed=/dev/sr0].  Up 42.05 seconds
[  OK  ] Finished cloud-final.service - Cloud-init: Final Stage.
[  OK  ] Reached target cloud-init.target - Cloud-init target.

Domain creation completed.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domifaddr nat-vm1
 Name       MAC address          Protocol     Address
-------------------------------------------------------------------------------
 vnet0      52:54:00:41:38:53    ipv4         192.168.122.105/24

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
The authenticity of host '192.168.122.105 (192.168.122.105)' can't be established.
ED25519 key fingerprint is SHA256:yE6/jmGc6BXqp590HJzpYO8FJ3x5ocAhTHfNKx6jW10.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.122.105' (ED25519) to the list of known hosts.
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 
ubuntu@192.168.122.105: Permission denied (publickey,password).
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ls
base-ubuntu24.img  nat-vm1.qcow2  seed.iso
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo cat /var/lib/cloud/instance/user-data.txt
#cloud-config

chpasswd:
  list: |
    ubuntu:12345678
  expire: False

ssh_pwauth: Trueubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virt-customize \
  -a /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2 \
  --password ubuntu:password:Pico@1234
[   0.0] Examining the guest ...
virt-customize: error: libguestfs error: guestfs_launch failed.
This usually means the libguestfs appliance failed to start or crashed.
Do:
  export LIBGUESTFS_DEBUG=1 LIBGUESTFS_TRACE=1
and run the command again.  For further information, read:
  http://libguestfs.org/guestfs-faq.1.html#debugging-libguestfs
You can also run 'libguestfs-test-tool' and post the *complete* output
into a bug report or message to the libguestfs mailing list.

If reporting bugs, run virt-customize with debugging enabled and include 
the complete output:

  virt-customize -v -x [...]
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 
Permission denied, please try again.
ubuntu@192.168.122.105's password: 

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
---

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1 2>/dev/null || true
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh undefine nat-vm1 --nvram 2>/dev/null || true
Domain 'nat-vm1' has been undefined

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh list --all
 Id   Name   State
--------------------

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo rm -rf /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ls /var/lib/libvirt/images/
ls: cannot open directory '/var/lib/libvirt/images/': Permission denied
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ls /var/lib/libvirt/images/
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ rm -rf ~/kvm/nat-vm
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a | grep virbr0
3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo mkdir -p /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ cd /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo wget -O ubuntu24-base.img \
https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-02-08 04:53:10--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::17, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 626836992 (598M) [application/octet-stream]
Saving to: ‘ubuntu24-base.img’

ubuntu24-base.img                                          100%[========================================================================================================================================>] 597.80M  20.0MB/s    in 34s     

2026-02-08 04:53:46 (17.5 MB/s) - ‘ubuntu24-base.img’ saved [626836992/626836992]

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chown libvirt-qemu:kvm ubuntu24-base.img
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chmod 644 ubuntu24-base.img
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo qemu-img create -f qcow2 nat-vm1.qcow2 20G
Formatting 'nat-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 lazy_refcounts=off refcount_bits=16
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virt-resize --expand /dev/sda1 ubuntu24-base.img nat-vm1.qcow2
[   0.0] Examining ubuntu24-base.img
**********

Summary of changes:

virt-resize: /dev/sda14: This partition will be left alone.

virt-resize: /dev/sda15: This partition will be left alone.

virt-resize: /dev/sda16: This partition will be left alone.

virt-resize: /dev/sda1: This partition will be resized from 2.5G to 19.0G.  
The filesystem ext4 on /dev/sda1 will be expanded using the ‘resize2fs’ 
method.

**********
[   4.2] Setting up initial partition table on nat-vm1.qcow2
[  18.8] Copying /dev/sda14
[  18.8] Copying /dev/sda15
[  18.9] Copying /dev/sda16
[  20.1] Copying /dev/sda1
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ --:--
[  31.0] Expanding /dev/sda1 (now /dev/sda4) using the ‘resize2fs’ method

virt-resize: Resize operation completed with no errors.  Before deleting 
the old disk, carefully check that the resized disk boots and works 
correctly.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo apt install -y libguestfs-tools
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
libguestfs-tools is already the newest version (1:1.52.0-5ubuntu3).
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo nano /var/lib/libvirt/images/nat-vm1/user-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo cat /var/lib/libvirt/images/nat-vm1/user-data.yaml
#cloud-config

chpasswd:
  list: |
    ubuntu:12345678
  expire: False

ssh_pwauth: True
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo cloud-localds seed.iso user-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo chown libvirt-qemu:kvm seed.iso
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
Creating domain...                                                                                                                                                                                                   |    0 B  00:00:00     
Running text console command: virsh --connect qemu:///system console nat-vm1
Connected to domain 'nat-vm1'
Escape character is ^] (Ctrl + ])

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/nat-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
Creating domain...                                                                                                                                                                                                   |    0 B  00:00:00     
Running text console command: virsh --connect qemu:///system console nat-vm1
Connected to domain 'nat-vm1'
Escape character is ^] (Ctrl + ])

Domain creation completed.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh list --all
 Id   Name      State
-------------------------
 1    nat-vm1   running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
ssh: connect to host 192.168.122.105 port 22: No route to host
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2068ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh list --all
 Id   Name      State
-------------------------
 1    nat-vm1   running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domiflist nat-vm1
 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:d3:1e:fe

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domifaddr nat-vm1
 Name       MAC address          Protocol     Address
-------------------------------------------------------------------------------

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a show virbr0
ip link show virbr0
3: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
3: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip route | grep 192.168.122
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-list --all
sudo virsh net-info default
sudo virsh net-dumpxml default | egrep -i 'bridge|ip address|dhcp' -n
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes

Name:           default
UUID:           2e3b2a5c-7683-4799-a024-ae5bea4ce32d
Active:         yes
Persistent:     yes
Autostart:      yes
Bridge:         virbr0

9:  <bridge name='virbr0' stp='on' delay='0'/>
11:  <ip address='192.168.122.1' netmask='255.255.255.0'>
12:    <dhcp>
14:    </dhcp>
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ufw status verbose || true
sudo nft list ruleset | sed -n '1,200p'
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo nft flush ruleset
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2041ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping -c 3 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
2 packets transmitted, 0 received, 100% packet loss, time 1026ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ufw status
Status: inactive
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh list --all
sudo virsh domiflist nat-vm1
ip a show virbr0
ip route | grep 192.168.122 || true
sudo ufw status verbose || true
sudo virsh net-info default
 Id   Name      State
-------------------------
 1    nat-vm1   running

 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:d3:1e:fe

3: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1 
Status: inactive
Name:           default
UUID:           2e3b2a5c-7683-4799-a024-ae5bea4ce32d
Active:         yes
Persistent:     yes
Autostart:      yes
Bridge:         virbr0

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-destroy default
Network default destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-start default
error: Failed to start network default
error: internal error: Failed to apply firewall rules /usr/sbin/iptables -w --table filter --insert LIBVIRT_INP --in-interface virbr0 --protocol tcp --destination-port 67 --jump ACCEPT: iptables: No chain/target/match by that name.


ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo apt update
sudo apt install -y nftables iptables
Hit:1 http://security.ubuntu.com/ubuntu noble-security InRelease
Hit:2 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble InRelease
Hit:3 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-updates InRelease
Hit:4 http://kkr-prd01-az1.clouds.archive.ubuntu.com/ubuntu noble-backports InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
nftables is already the newest version (1.0.9-1build1).
nftables set to manually installed.
iptables is already the newest version (1.8.10-3ubuntu2).
iptables set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl enable --now nftables
Created symlink /etc/systemd/system/sysinit.target.wants/nftables.service → /usr/lib/systemd/system/nftables.service.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl restart nftables
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -F
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -t nat -F
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -t mangle -F
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -X
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -t nat -X
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^[[200~sudo iptables -t mangle -X~
sudo: command not found
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -t mangle -X~
iptables: No chain/target/match by that name.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ V
V: command not found
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl restart libvirtd
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl status libvirtd --no-pager
● libvirtd.service - libvirt legacy monolithic daemon
     Loaded: loaded (/usr/lib/systemd/system/libvirtd.service; enabled; preset: enabled)
     Active: active (running) since Sun 2026-02-08 05:07:32 UTC; 4s ago
TriggeredBy: ● libvirtd-admin.socket
             ● libvirtd-ro.socket
             ● libvirtd.socket
       Docs: man:libvirtd(8)
             https://libvirt.org/
   Main PID: 29513 (libvirtd)
      Tasks: 21 (limit: 32768)
     Memory: 9.3M (peak: 11.0M)
        CPU: 178ms
     CGroup: /system.slice/libvirtd.service
             └─29513 /usr/sbin/libvirtd --timeout 120

Feb 08 05:07:32 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 05:07:32 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 05:07:32 gelani-lab-2 libvirtd[29513]: libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.11 (Ubuntu)
Feb 08 05:07:32 gelani-lab-2 libvirtd[29513]: hostname: gelani-lab-2
Feb 08 05:07:32 gelani-lab-2 libvirtd[29513]: network port not found: Network port with UUID bd1ad7d8-24bd-4548-84df-93b9592149cf does not exist
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-start default
Network default started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-autostart default
Network default marked as autostarted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh reboot nat-vm1
Domain 'nat-vm1' is being rebooted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domiflist nat-vm1
 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:d3:1e:fe

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping -c 3 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
From 192.168.122.1 icmp_seq=1 Destination Host Unreachable
From 192.168.122.1 icmp_seq=2 Destination Host Unreachable
From 192.168.122.1 icmp_seq=3 Destination Host Unreachable

--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, +3 errors, 100% packet loss, time 2068ms
pipe 3
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo iptables -V
sudo update-alternatives --display iptables
iptables v1.8.10 (nf_tables)
iptables - auto mode
  link best version is /usr/sbin/iptables-nft
  link currently points to /usr/sbin/iptables-nft
  link iptables is /usr/sbin/iptables
  slave iptables-restore is /usr/sbin/iptables-restore
  slave iptables-save is /usr/sbin/iptables-save
/usr/sbin/iptables-legacy - priority 10
  slave iptables-restore: /usr/sbin/iptables-legacy-restore
  slave iptables-save: /usr/sbin/iptables-legacy-save
/usr/sbin/iptables-nft - priority 20
  slave iptables-restore: /usr/sbin/iptables-nft-restore
  slave iptables-save: /usr/sbin/iptables-nft-save
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ls
nat-vm1.qcow2  seed.iso  ubuntu24-base.img  user-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ virnish list
virnish: command not found
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ virsh list
 Id   Name      State
-------------------------
 1    nat-vm1   running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo rm -f /var/lib/libvirt/dnsmasq/default.leases \
           /var/lib/libvirt/dnsmasq/default.status 2>/dev/null || true
sudo systemctl restart libvirtd
sudo virsh net-destroy default 2>/dev/null || true
sudo virsh net-start default
Network default destroyed

Network default started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh reboot nat-vm1
Domain 'nat-vm1' is being rebooted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domiflist nat-vm1
 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:d3:1e:fe

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping -c 3 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
From 192.168.122.1 icmp_seq=1 Destination Host Unreachable
From 192.168.122.1 icmp_seq=2 Destination Host Unreachable
From 192.168.122.1 icmp_seq=3 Destination Host Unreachable

--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, +3 errors, 100% packet loss, time 2053ms
pipe 3
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ iptables -V
iptables v1.8.10 (nf_tables)
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ readlink -f $(which iptables)
/usr/sbin/xtables-nft-multi
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo update-alternatives --display iptables | sed -n '1,120p'
iptables - auto mode
  link best version is /usr/sbin/iptables-nft
  link currently points to /usr/sbin/iptables-nft
  link iptables is /usr/sbin/iptables
  slave iptables-restore is /usr/sbin/iptables-restore
  slave iptables-save is /usr/sbin/iptables-save
/usr/sbin/iptables-legacy - priority 10
  slave iptables-restore: /usr/sbin/iptables-legacy-restore
  slave iptables-save: /usr/sbin/iptables-legacy-save
/usr/sbin/iptables-nft - priority 20
  slave iptables-restore: /usr/sbin/iptables-nft-restore
  slave iptables-save: /usr/sbin/iptables-nft-save
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo journalctl -u libvirtd -n 120 --no-pager
Feb 08 04:24:17 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:24:17 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:24:17 gelani-lab-2 dnsmasq[21634]: started, version 2.90 cachesize 150
Feb 08 04:24:17 gelani-lab-2 dnsmasq[21634]: compile time options: IPv6 GNU-getopt DBus no-UBus i18n IDN2 DHCP DHCPv6 no-Lua TFTP conntrack ipset nftset auth cryptohash DNSSEC loop-detect inotify dumpfile
Feb 08 04:24:17 gelani-lab-2 dnsmasq-dhcp[21634]: DHCP, IP range 192.168.122.2 -- 192.168.122.254, lease time 1h
Feb 08 04:24:17 gelani-lab-2 dnsmasq-dhcp[21634]: DHCP, sockets bound exclusively to interface virbr0
Feb 08 04:24:17 gelani-lab-2 dnsmasq[21634]: reading /etc/resolv.conf
Feb 08 04:24:17 gelani-lab-2 dnsmasq[21634]: using nameserver 127.0.0.53#53
Feb 08 04:24:17 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:24:17 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:24:17 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 04:26:17 gelani-lab-2 systemd[1]: libvirtd.service: Deactivated successfully.
Feb 08 04:26:17 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21634 (dnsmasq) remains running after unit stopped.
Feb 08 04:26:17 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21635 (dnsmasq) remains running after unit stopped.
Feb 08 04:27:35 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21634 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:27:35 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:27:35 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21635 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:27:35 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:27:35 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:27:35 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:27:36 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:27:36 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:27:36 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 04:30:40 gelani-lab-2 systemd[1]: libvirtd.service: Deactivated successfully.
Feb 08 04:30:40 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21634 (dnsmasq) remains running after unit stopped.
Feb 08 04:30:40 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21635 (dnsmasq) remains running after unit stopped.
Feb 08 04:32:56 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21634 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:32:56 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:32:56 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21635 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:32:56 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:32:56 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:32:56 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:32:57 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:32:57 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:32:57 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 04:32:59 gelani-lab-2 libvirtd[22235]: libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.11 (Ubuntu)
Feb 08 04:32:59 gelani-lab-2 libvirtd[22235]: hostname: gelani-lab-2
Feb 08 04:32:59 gelani-lab-2 libvirtd[22235]: Cannot access storage file '/home/ubuntu/kvm/nat-vm/nat-vm1.qcow2' (as uid:64055, gid:993): Permission denied
Feb 08 04:34:31 gelani-lab-2 libvirtd[22235]: ignoring missing file '/var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img'
Feb 08 04:34:31 gelani-lab-2 libvirtd[22235]: ignoring missing file '/var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img'
Feb 08 04:34:31 gelani-lab-2 libvirtd[22235]: Cannot access backing file '/var/lib/libvirt/images/nat-vm1/ubuntu-24.04-server-cloudimg-amd64.img' of storage file '/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2' (as uid:64055, gid:993): No such file or directory
Feb 08 04:36:31 gelani-lab-2 systemd[1]: libvirtd.service: Deactivated successfully.
Feb 08 04:36:31 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21634 (dnsmasq) remains running after unit stopped.
Feb 08 04:36:31 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21635 (dnsmasq) remains running after unit stopped.
Feb 08 04:36:31 gelani-lab-2 systemd[1]: libvirtd.service: Consumed 1.465s CPU time, 46.2M memory peak, 0B memory swap peak.
Feb 08 04:38:20 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21634 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:38:20 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:38:20 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21635 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:38:20 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:38:20 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:38:20 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:38:20 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:38:20 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:38:20 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 04:40:14 gelani-lab-2 dnsmasq-dhcp[21634]: DHCPDISCOVER(virbr0) 52:54:00:41:38:53
Feb 08 04:40:14 gelani-lab-2 dnsmasq-dhcp[21634]: DHCPOFFER(virbr0) 192.168.122.105 52:54:00:41:38:53
Feb 08 04:40:14 gelani-lab-2 dnsmasq-dhcp[21634]: DHCPREQUEST(virbr0) 192.168.122.105 52:54:00:41:38:53
Feb 08 04:40:14 gelani-lab-2 dnsmasq-dhcp[21634]: DHCPACK(virbr0) 192.168.122.105 52:54:00:41:38:53 ubuntu
Feb 08 04:54:26 gelani-lab-2 systemd[1]: libvirtd.service: Deactivated successfully.
Feb 08 04:54:26 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21634 (dnsmasq) remains running after unit stopped.
Feb 08 04:54:26 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 21635 (dnsmasq) remains running after unit stopped.
Feb 08 04:54:26 gelani-lab-2 systemd[1]: libvirtd.service: Consumed 2.913s CPU time, 46.2M memory peak, 0B memory swap peak.
Feb 08 04:58:34 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21634 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:58:34 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:58:34 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 21635 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 04:58:34 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 04:58:34 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 04:58:34 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 04:58:35 gelani-lab-2 dnsmasq[21634]: read /etc/hosts - 8 names
Feb 08 04:58:35 gelani-lab-2 dnsmasq[21634]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 04:58:35 gelani-lab-2 dnsmasq-dhcp[21634]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 05:05:45 gelani-lab-2 dnsmasq[21634]: exiting on receipt of SIGTERM
Feb 08 05:05:51 gelani-lab-2 libvirtd[28756]: libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.11 (Ubuntu)
Feb 08 05:05:51 gelani-lab-2 libvirtd[28756]: hostname: gelani-lab-2
Feb 08 05:05:51 gelani-lab-2 libvirtd[28756]: internal error: Failed to apply firewall rules /usr/sbin/iptables -w --table filter --insert LIBVIRT_INP --in-interface virbr0 --protocol tcp --destination-port 67 --jump ACCEPT: iptables: No chain/target/match by that name.
Feb 08 05:07:32 gelani-lab-2 systemd[1]: Stopping libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 05:07:32 gelani-lab-2 systemd[1]: libvirtd.service: Deactivated successfully.
Feb 08 05:07:32 gelani-lab-2 systemd[1]: Stopped libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 05:07:32 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 05:07:32 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 05:07:32 gelani-lab-2 libvirtd[29513]: libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.11 (Ubuntu)
Feb 08 05:07:32 gelani-lab-2 libvirtd[29513]: hostname: gelani-lab-2
Feb 08 05:07:32 gelani-lab-2 libvirtd[29513]: network port not found: Network port with UUID bd1ad7d8-24bd-4548-84df-93b9592149cf does not exist
Feb 08 05:07:43 gelani-lab-2 dnsmasq[29620]: started, version 2.90 cachesize 150
Feb 08 05:07:43 gelani-lab-2 dnsmasq[29620]: compile time options: IPv6 GNU-getopt DBus no-UBus i18n IDN2 DHCP DHCPv6 no-Lua TFTP conntrack ipset nftset auth cryptohash DNSSEC loop-detect inotify dumpfile
Feb 08 05:07:43 gelani-lab-2 dnsmasq-dhcp[29620]: DHCP, IP range 192.168.122.2 -- 192.168.122.254, lease time 1h
Feb 08 05:07:43 gelani-lab-2 dnsmasq-dhcp[29620]: DHCP, sockets bound exclusively to interface virbr0
Feb 08 05:07:43 gelani-lab-2 dnsmasq[29620]: reading /etc/resolv.conf
Feb 08 05:07:43 gelani-lab-2 dnsmasq[29620]: using nameserver 127.0.0.53#53
Feb 08 05:07:43 gelani-lab-2 dnsmasq[29620]: read /etc/hosts - 8 names
Feb 08 05:07:43 gelani-lab-2 dnsmasq[29620]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 05:07:43 gelani-lab-2 dnsmasq-dhcp[29620]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 05:10:53 gelani-lab-2 systemd[1]: Stopping libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: Deactivated successfully.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 29620 (dnsmasq) remains running after unit stopped.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: Unit process 29621 (dnsmasq) remains running after unit stopped.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: Stopped libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 29620 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: Found left-over process 29621 (dnsmasq) in control group while starting unit. Ignoring.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: libvirtd.service: This usually indicates unclean termination of a previous run, or service implementation deficiencies.
Feb 08 05:10:53 gelani-lab-2 systemd[1]: Starting libvirtd.service - libvirt legacy monolithic daemon...
Feb 08 05:10:53 gelani-lab-2 systemd[1]: Started libvirtd.service - libvirt legacy monolithic daemon.
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29620]: read /etc/hosts - 8 names
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29620]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 05:10:53 gelani-lab-2 dnsmasq-dhcp[29620]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 08 05:10:53 gelani-lab-2 libvirtd[29719]: libvirt version: 10.0.0, package: 10.0.0-2ubuntu8.11 (Ubuntu)
Feb 08 05:10:53 gelani-lab-2 libvirtd[29719]: hostname: gelani-lab-2
Feb 08 05:10:53 gelani-lab-2 libvirtd[29719]: network port not found: Network port with UUID bd1ad7d8-24bd-4548-84df-93b9592149cf does not exist
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29620]: exiting on receipt of SIGTERM
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29864]: started, version 2.90 cachesize 150
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29864]: compile time options: IPv6 GNU-getopt DBus no-UBus i18n IDN2 DHCP DHCPv6 no-Lua TFTP conntrack ipset nftset auth cryptohash DNSSEC loop-detect inotify dumpfile
Feb 08 05:10:53 gelani-lab-2 dnsmasq-dhcp[29864]: DHCP, IP range 192.168.122.2 -- 192.168.122.254, lease time 1h
Feb 08 05:10:53 gelani-lab-2 dnsmasq-dhcp[29864]: DHCP, sockets bound exclusively to interface virbr0
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29864]: reading /etc/resolv.conf
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29864]: using nameserver 127.0.0.53#53
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29864]: read /etc/hosts - 8 names
Feb 08 05:10:53 gelani-lab-2 dnsmasq[29864]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 names
Feb 08 05:10:53 gelani-lab-2 dnsmasq-dhcp[29864]: read /var/lib/libvirt/dnsmasq/default.hostsfile
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-start default
error: Failed to start network default
error: Requested operation is not valid: network is already active

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh console nat-vm1
Connected to domain 'nat-vm1'
Escape character is ^] (Ctrl + ])

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh console nat-vm1
Connected to domain 'nat-vm1'
Escape character is ^] (Ctrl + ])

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domstate nat-vm1
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dominfo nat-vm1 | egrep -i 'State|CPU|Memory|Autostart'
State:          running
CPU(s):         2
CPU time:       964.4s
Max memory:     2097152 KiB
Used memory:    2097152 KiB
Autostart:      disable
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ps -ef | grep -E 'qemu.*nat-vm1' | grep -v grep
libvirt+   28861       1 99 04:58 ?        00:16:09 /usr/bin/qemu-system-x86_64 -name guest=nat-vm1,debug-threads=on -S -object {"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-nat-vm1/master-key.aes"} -machine pc-q35-noble,usb=off,dump-guest-core=off,memory-backend=pc.ram,hpet=off,acpi=on -accel kvm -cpu host,migratable=on -m size=2097152k -object {"qom-type":"memory-backend-ram","id":"pc.ram","size":2147483648} -overcommit mem-lock=off -smp 2,sockets=2,cores=1,threads=1 -uuid ad759f64-b4f2-4c7a-9306-4638c2166682 -display none -no-user-config -nodefaults -chardev socket,id=charmonitor,fd=32,server=on,wait=off -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-shutdown -global ICH9-LPC.disable_s3=1 -global ICH9-LPC.disable_s4=1 -boot strict=on -device {"driver":"pcie-root-port","port":8,"chassis":1,"id":"pci.1","bus":"pcie.0","multifunction":true,"addr":"0x1"} -device {"driver":"pcie-root-port","port":9,"chassis":2,"id":"pci.2","bus":"pcie.0","addr":"0x1.0x1"} -device {"driver":"pcie-root-port","port":10,"chassis":3,"id":"pci.3","bus":"pcie.0","addr":"0x1.0x2"} -device {"driver":"pcie-root-port","port":11,"chassis":4,"id":"pci.4","bus":"pcie.0","addr":"0x1.0x3"} -device {"driver":"pcie-root-port","port":12,"chassis":5,"id":"pci.5","bus":"pcie.0","addr":"0x1.0x4"} -device {"driver":"pcie-root-port","port":13,"chassis":6,"id":"pci.6","bus":"pcie.0","addr":"0x1.0x5"} -device {"driver":"pcie-root-port","port":14,"chassis":7,"id":"pci.7","bus":"pcie.0","addr":"0x1.0x6"} -device {"driver":"pcie-root-port","port":15,"chassis":8,"id":"pci.8","bus":"pcie.0","addr":"0x1.0x7"} -device {"driver":"pcie-root-port","port":16,"chassis":9,"id":"pci.9","bus":"pcie.0","multifunction":true,"addr":"0x2"} -device {"driver":"pcie-root-port","port":17,"chassis":10,"id":"pci.10","bus":"pcie.0","addr":"0x2.0x1"} -device {"driver":"pcie-root-port","port":18,"chassis":11,"id":"pci.11","bus":"pcie.0","addr":"0x2.0x2"} -device {"driver":"pcie-root-port","port":19,"chassis":12,"id":"pci.12","bus":"pcie.0","addr":"0x2.0x3"} -device {"driver":"pcie-root-port","port":20,"chassis":13,"id":"pci.13","bus":"pcie.0","addr":"0x2.0x4"} -device {"driver":"pcie-root-port","port":21,"chassis":14,"id":"pci.14","bus":"pcie.0","addr":"0x2.0x5"} -device {"driver":"qemu-xhci","p2":15,"p3":15,"id":"usb","bus":"pci.2","addr":"0x0"} -device {"driver":"virtio-serial-pci","id":"virtio-serial0","bus":"pci.3","addr":"0x0"} -blockdev {"driver":"file","filename":"/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-2-format","read-only":false,"driver":"qcow2","file":"libvirt-2-storage","backing":null} -device {"driver":"virtio-blk-pci","bus":"pci.4","addr":"0x0","drive":"libvirt-2-format","id":"virtio-disk0","bootindex":1} -blockdev {"driver":"file","filename":"/var/lib/libvirt/images/nat-vm1/seed.iso","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-1-format","read-only":true,"driver":"raw","file":"libvirt-1-storage"} -device {"driver":"ide-cd","bus":"ide.0","drive":"libvirt-1-format","id":"sata0-0-0"} -netdev {"type":"tap","fd":"33","vhost":true,"vhostfd":"36","id":"hostnet0"} -device {"driver":"virtio-net-pci","netdev":"hostnet0","id":"net0","mac":"52:54:00:d3:1e:fe","bus":"pci.1","addr":"0x0"} -chardev pty,id=charserial0 -device {"driver":"isa-serial","chardev":"charserial0","id":"serial0","index":0} -chardev socket,id=charchannel0,fd=30,server=on,wait=off -device {"driver":"virtserialport","bus":"virtio-serial0.0","nr":1,"chardev":"charchannel0","id":"channel0","name":"org.qemu.guest_agent.0"} -audiodev {"id":"audio1","driver":"none"} -global ICH9-LPC.noreboot=off -watchdog-action reset -device {"driver":"virtio-balloon-pci","id":"balloon0","bus":"pci.5","addr":"0x0"} -object {"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"} -device {"driver":"virtio-rng-pci","rng":"objrng0","id":"rng0","bus":"pci.6","addr":"0x0"} -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dumpxml nat-vm1 | egrep -n 'console|serial|graphics|video|channel|target port'
150:    <controller type='virtio-serial' index='0'>
151:      <alias name='virtio-serial0'/>
162:    <serial type='pty'>
164:      <target type='isa-serial' port='0'>
165:        <model name='isa-serial'/>
167:      <alias name='serial0'/>
168:    </serial>
169:    <console type='pty' tty='/dev/pts/2'>
171:      <target type='serial' port='0'/>
172:      <alias name='serial0'/>
173:    </console>
174:    <channel type='unix'>
175:      <source mode='bind' path='/run/libvirt/qemu/channel/1-nat-vm1/org.qemu.guest_agent.0'/>
177:      <alias name='channel0'/>
178:      <address type='virtio-serial' controller='0' bus='0' port='1'/>
179:    </channel>
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo apt install -y virt-viewer
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
virt-viewer is already the newest version (11.0-3build2).
virt-viewer set to manually installed.
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virt-viewer --connect qemu:///system nat-vm1

(virt-viewer:30016): Gtk-WARNING **: 05:15:12.407: cannot open display: 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh edit nat-vm1

Select an editor.  To change later, run 'select-editor'.
  1. /bin/nano        <---- easiest
  2. /usr/bin/vim.basic
  3. /usr/bin/vim.tiny
  4. /bin/ed

Choose 1-4 [1]: 1
Domain 'nat-vm1' XML configuration not changed.

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh list --all
 Id   Name      State
-------------------------
 1    nat-vm1   running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domstate nat-vm1
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ps -ef | grep -E 'qemu.*nat-vm1' | grep -v grep
libvirt+   28861       1 99 04:58 ?        00:19:27 /usr/bin/qemu-system-x86_64 -name guest=nat-vm1,debug-threads=on -S -object {"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/libvirt/qemu/domain-1-nat-vm1/master-key.aes"} -machine pc-q35-noble,usb=off,dump-guest-core=off,memory-backend=pc.ram,hpet=off,acpi=on -accel kvm -cpu host,migratable=on -m size=2097152k -object {"qom-type":"memory-backend-ram","id":"pc.ram","size":2147483648} -overcommit mem-lock=off -smp 2,sockets=2,cores=1,threads=1 -uuid ad759f64-b4f2-4c7a-9306-4638c2166682 -display none -no-user-config -nodefaults -chardev socket,id=charmonitor,fd=32,server=on,wait=off -mon chardev=charmonitor,id=monitor,mode=control -rtc base=utc,driftfix=slew -global kvm-pit.lost_tick_policy=delay -no-shutdown -global ICH9-LPC.disable_s3=1 -global ICH9-LPC.disable_s4=1 -boot strict=on -device {"driver":"pcie-root-port","port":8,"chassis":1,"id":"pci.1","bus":"pcie.0","multifunction":true,"addr":"0x1"} -device {"driver":"pcie-root-port","port":9,"chassis":2,"id":"pci.2","bus":"pcie.0","addr":"0x1.0x1"} -device {"driver":"pcie-root-port","port":10,"chassis":3,"id":"pci.3","bus":"pcie.0","addr":"0x1.0x2"} -device {"driver":"pcie-root-port","port":11,"chassis":4,"id":"pci.4","bus":"pcie.0","addr":"0x1.0x3"} -device {"driver":"pcie-root-port","port":12,"chassis":5,"id":"pci.5","bus":"pcie.0","addr":"0x1.0x4"} -device {"driver":"pcie-root-port","port":13,"chassis":6,"id":"pci.6","bus":"pcie.0","addr":"0x1.0x5"} -device {"driver":"pcie-root-port","port":14,"chassis":7,"id":"pci.7","bus":"pcie.0","addr":"0x1.0x6"} -device {"driver":"pcie-root-port","port":15,"chassis":8,"id":"pci.8","bus":"pcie.0","addr":"0x1.0x7"} -device {"driver":"pcie-root-port","port":16,"chassis":9,"id":"pci.9","bus":"pcie.0","multifunction":true,"addr":"0x2"} -device {"driver":"pcie-root-port","port":17,"chassis":10,"id":"pci.10","bus":"pcie.0","addr":"0x2.0x1"} -device {"driver":"pcie-root-port","port":18,"chassis":11,"id":"pci.11","bus":"pcie.0","addr":"0x2.0x2"} -device {"driver":"pcie-root-port","port":19,"chassis":12,"id":"pci.12","bus":"pcie.0","addr":"0x2.0x3"} -device {"driver":"pcie-root-port","port":20,"chassis":13,"id":"pci.13","bus":"pcie.0","addr":"0x2.0x4"} -device {"driver":"pcie-root-port","port":21,"chassis":14,"id":"pci.14","bus":"pcie.0","addr":"0x2.0x5"} -device {"driver":"qemu-xhci","p2":15,"p3":15,"id":"usb","bus":"pci.2","addr":"0x0"} -device {"driver":"virtio-serial-pci","id":"virtio-serial0","bus":"pci.3","addr":"0x0"} -blockdev {"driver":"file","filename":"/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2","node-name":"libvirt-2-storage","auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-2-format","read-only":false,"driver":"qcow2","file":"libvirt-2-storage","backing":null} -device {"driver":"virtio-blk-pci","bus":"pci.4","addr":"0x0","drive":"libvirt-2-format","id":"virtio-disk0","bootindex":1} -blockdev {"driver":"file","filename":"/var/lib/libvirt/images/nat-vm1/seed.iso","node-name":"libvirt-1-storage","auto-read-only":true,"discard":"unmap"} -blockdev {"node-name":"libvirt-1-format","read-only":true,"driver":"raw","file":"libvirt-1-storage"} -device {"driver":"ide-cd","bus":"ide.0","drive":"libvirt-1-format","id":"sata0-0-0"} -netdev {"type":"tap","fd":"33","vhost":true,"vhostfd":"36","id":"hostnet0"} -device {"driver":"virtio-net-pci","netdev":"hostnet0","id":"net0","mac":"52:54:00:d3:1e:fe","bus":"pci.1","addr":"0x0"} -chardev pty,id=charserial0 -device {"driver":"isa-serial","chardev":"charserial0","id":"serial0","index":0} -chardev socket,id=charchannel0,fd=30,server=on,wait=off -device {"driver":"virtserialport","bus":"virtio-serial0.0","nr":1,"chardev":"charchannel0","id":"channel0","name":"org.qemu.guest_agent.0"} -audiodev {"id":"audio1","driver":"none"} -global ICH9-LPC.noreboot=off -watchdog-action reset -device {"driver":"virtio-balloon-pci","id":"balloon0","bus":"pci.5","addr":"0x0"} -object {"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"} -device {"driver":"virtio-rng-pci","rng":"objrng0","id":"rng0","bus":"pci.6","addr":"0x0"} -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
qemu-img: Could not open '/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2': Failed to get shared "write" lock
Is another process using the image [/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2]?
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo qemu-img info /var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2
qemu-img: Could not open '/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2': Failed to get shared "write" lock
Is another process using the image [/var/lib/libvirt/images/nat-vm1/nat-vm1.qcow2]?
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ls -lh /var/lib/libvirt/images/nat-vm1/
total 2.4G
-rw-r--r-- 1 libvirt-qemu kvm  1.8G Feb  8 04:55 nat-vm1.qcow2
-rw-r--r-- 1 libvirt-qemu kvm  366K Feb  8 04:57 seed.iso
-rw-r--r-- 1 libvirt-qemu kvm  598M Jan  8 13:20 ubuntu24-base.img
-rw-r--r-- 1 root         root   89 Feb  8 04:56 user-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domiflist nat-vm1
 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:d3:1e:fe

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip link show vnet0
5: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:54:00:d3:1e:fe brd ff:ff:ff:ff:ff:ff
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep vnet0 || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-list --all
 Name      State    Autostart   Persistent
--------------------------------------------
 default   active   yes         yes

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a show virbr0
8: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dumpxml nat-vm1 | grep -E 'console|serial|graphics'
    <controller type='virtio-serial' index='0'>
      <alias name='virtio-serial0'/>
    <serial type='pty'>
      <target type='isa-serial' port='0'>
        <model name='isa-serial'/>
      <alias name='serial0'/>
    </serial>
    <console type='pty' tty='/dev/pts/2'>
      <target type='serial' port='0'/>
      <alias name='serial0'/>
    </console>
      <address type='virtio-serial' controller='0' bus='0' port='1'/>
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-destroy default
Network default destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl restart libvirtd
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-start default
Network default started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a show virbr0
9: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh start nat-vm1
Domain 'nat-vm1' started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip link show vnet0
10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master virbr0 state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:54:00:d3:1e:fe brd ff:ff:ff:ff:ff:ff
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep -n vnet0 || true
1:10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh reboot nat-vm1
Domain 'nat-vm1' is being rebooted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh reboot nat-vm1
Domain 'nat-vm1' is being rebooted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
From 192.168.122.1 icmp_seq=1 Destination Host Unreachable
From 192.168.122.1 icmp_seq=2 Destination Host Unreachable
From 192.168.122.1 icmp_seq=3 Destination Host Unreachable
From 192.168.122.1 icmp_seq=4 Destination Host Unreachable
From 192.168.122.1 icmp_seq=5 Destination Host Unreachable
From 192.168.122.1 icmp_seq=6 Destination Host Unreachable
From 192.168.122.1 icmp_seq=7 Destination Host Unreachable
From 192.168.122.1 icmp_seq=8 Destination Host Unreachable
From 192.168.122.1 icmp_seq=9 Destination Host Unreachable
^C
--- 192.168.122.105 ping statistics ---
11 packets transmitted, 0 received, +9 errors, 100% packet loss, time 10225ms
pipe 4
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
ssh: connect to host 192.168.122.105 port 22: No route to host
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set vnet0 master virbr0
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set virbr0 up
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set vnet0 up
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep -n vnet0 || true
1:10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep -n vnet0 || true
1:10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domstate nat-vm1
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
sudo virsh net-destroy default
sudo systemctl restart libvirtd
sudo virsh net-start default
ip a show virbr0
Domain 'nat-vm1' destroyed

Network default destroyed

Network default started

11: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh start nat-vm1
bridge link | grep -n vnet0 || true
sudo virsh domstate nat-vm1
Domain 'nat-vm1' started

1:12: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state listening priority 32 cost 2 
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.158.122.105
PING 192.158.122.105 (192.158.122.105) 56(84) bytes of data.
^C
--- 192.158.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2037ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2024ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo pkill -f "dnsmasq.*libvirt" || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo pkill -f "/usr/sbin/dnsmasq.*virbr0" || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo rm -f /var/lib/libvirt/dnsmasq/default.leases \
            /var/lib/libvirt/dnsmasq/default.status \
            /var/lib/libvirt/dnsmasq/default.pid 2>/dev/null || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl restart libvirtd
sudo virsh net-destroy default 2>/dev/null || true
sudo virsh net-start default
sudo virsh net-autostart default
Network default destroyed

Network default started

Network default marked as autostarted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set virbr0 up
ip a show virbr0
13: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh start nat-vm1
Domain 'nat-vm1' started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 -vv 'port 67 or port 68'
tcpdump: listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domstate nat-vm1
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2053ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:5f:8a:1d brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.95.113/24 metric 100 brd 192.168.95.255 scope global dynamic ens3
       valid_lft 38426sec preferred_lft 38426sec
    inet6 fe80::f816:3eff:fe5f:8a1d/64 scope link 
       valid_lft forever preferred_lft forever
13: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
14: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master virbr0 state UNKNOWN group default qlen 1000
    link/ether fe:54:00:d3:1e:fe brd ff:ff:ff:ff:ff:ff
    inet6 fe80::fc54:ff:fed3:1efe/64 scope link 
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh resume nat-vm1
error: Failed to resume domain 'nat-vm1'
error: Requested operation is not valid: domain is already running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 port 67 or port 68 -c 5
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dumpxml nat-vm1 | egrep -n 'start|paused|qemu:commandline|qemu:arg' -n
27:  <on_reboot>restart</on_reboot>
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dumpxml nat-vm1 > /tmp/nat-vm1.xml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo nano /tmp/nat-vm1.xml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-destroy default
Network default destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl restart libvirtd
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-start default
Network default started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a show virbr0
9: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh start nat-vm1
Domain 'nat-vm1' started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip link show vnet0
10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master virbr0 state UNKNOWN mode DEFAULT group default qlen 1000
    link/ether fe:54:00:d3:1e:fe brd ff:ff:ff:ff:ff:ff
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep -n vnet0 || true
1:10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 port 67 or port 68 -c 10
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh reboot nat-vm1
Domain 'nat-vm1' is being rebooted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh reboot nat-vm1
Domain 'nat-vm1' is being rebooted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
From 192.168.122.1 icmp_seq=1 Destination Host Unreachable
From 192.168.122.1 icmp_seq=2 Destination Host Unreachable
From 192.168.122.1 icmp_seq=3 Destination Host Unreachable
From 192.168.122.1 icmp_seq=4 Destination Host Unreachable
From 192.168.122.1 icmp_seq=5 Destination Host Unreachable
From 192.168.122.1 icmp_seq=6 Destination Host Unreachable
From 192.168.122.1 icmp_seq=7 Destination Host Unreachable
From 192.168.122.1 icmp_seq=8 Destination Host Unreachable
From 192.168.122.1 icmp_seq=9 Destination Host Unreachable
^C
--- 192.168.122.105 ping statistics ---
11 packets transmitted, 0 received, +9 errors, 100% packet loss, time 10225ms
pipe 4
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
ssh: connect to host 192.168.122.105 port 22: No route to host
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set vnet0 master virbr0
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set virbr0 up
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set vnet0 up
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep -n vnet0 || true
1:10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ bridge link | grep -n vnet0 || true
1:10: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state forwarding priority 32 cost 2 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domstate nat-vm1
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
sudo virsh net-destroy default
sudo systemctl restart libvirtd
sudo virsh net-start default
ip a show virbr0
Domain 'nat-vm1' destroyed

Network default destroyed

Network default started

11: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh start nat-vm1
bridge link | grep -n vnet0 || true
sudo virsh domstate nat-vm1
Domain 'nat-vm1' started

1:12: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 master virbr0 state listening priority 32 cost 2 
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.158.122.105
PING 192.158.122.105 (192.158.122.105) 56(84) bytes of data.
^C
--- 192.158.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2037ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2024ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo pkill -f "dnsmasq.*libvirt" || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo pkill -f "/usr/sbin/dnsmasq.*virbr0" || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo rm -f /var/lib/libvirt/dnsmasq/default.leases \
            /var/lib/libvirt/dnsmasq/default.status \
            /var/lib/libvirt/dnsmasq/default.pid 2>/dev/null || true
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo systemctl restart libvirtd
sudo virsh net-destroy default 2>/dev/null || true
sudo virsh net-start default
sudo virsh net-autostart default
Network default destroyed

Network default started

Network default marked as autostarted

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo ip link set virbr0 up
ip a show virbr0
13: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh start nat-vm1
Domain 'nat-vm1' started

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 -vv 'port 67 or port 68'
tcpdump: listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh domstate nat-vm1
running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ping 192.168.122.105
PING 192.168.122.105 (192.168.122.105) 56(84) bytes of data.
^C
--- 192.168.122.105 ping statistics ---
3 packets transmitted, 0 received, 100% packet loss, time 2053ms

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8942 qdisc fq_codel state UP group default qlen 1000
    link/ether fa:16:3e:5f:8a:1d brd ff:ff:ff:ff:ff:ff
    altname enp0s3
    inet 192.168.95.113/24 metric 100 brd 192.168.95.255 scope global dynamic ens3
       valid_lft 38426sec preferred_lft 38426sec
    inet6 fe80::f816:3eff:fe5f:8a1d/64 scope link 
       valid_lft forever preferred_lft forever
13: virbr0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 52:54:00:24:c4:59 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
       valid_lft forever preferred_lft forever
14: vnet0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue master virbr0 state UNKNOWN group default qlen 1000
    link/ether fe:54:00:d3:1e:fe brd ff:ff:ff:ff:ff:ff
    inet6 fe80::fc54:ff:fed3:1efe/64 scope link 
       valid_lft forever preferred_lft forever
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh resume nat-vm1
error: Failed to resume domain 'nat-vm1'
error: Requested operation is not valid: domain is already running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 05:40:14   52:54:00:41:38:53   ipv4       192.168.122.105/24   ubuntu     ff:56:50:4d:98:00:02:00:00:ab:11:a1:e0:a1:e0:4e:7a:01:41

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo tcpdump -ni virbr0 port 67 or port 68 -c 5
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ssh ubuntu@192.168.122.105
^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh destroy nat-vm1
Domain 'nat-vm1' destroyed

ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dumpxml nat-vm1 | egrep -n 'start|paused|qemu:commandline|qemu:arg' -n
27:  <on_reboot>restart</on_reboot>
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo virsh dumpxml nat-vm1 > /tmp/nat-vm1.xml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ sudo nano /tmp/nat-vm1.xml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ 
---
---
---
---
---
---
ubuntu@gelani-lab-2:/var/lib/libvirt/images/nat-vm1$ cd ~
ubuntu@gelani-lab-2:~$ sudo virsh destroy nat-vm1 2>/dev/null || true

ubuntu@gelani-lab-2:~$ sudo virsh undefine nat-vm1 --nvram 2>/dev/null || true
Domain 'nat-vm1' has been undefined

ubuntu@gelani-lab-2:~$ sudo rm -rf /var/lib/libvirt/images/nat-vm1
ubuntu@gelani-lab-2:~$ sudo virsh net-destroy default 2>/dev/null || true
Network default destroyed

ubuntu@gelani-lab-2:~$ sudo virsh net-undefine default 2>/dev/null || true
Network default has been undefined

ubuntu@gelani-lab-2:~$ sudo virsh net-define /usr/share/libvirt/networks/default.xml
Network default defined from /usr/share/libvirt/networks/default.xml

ubuntu@gelani-lab-2:~$ sudo virsh net-start default
Network default started

ubuntu@gelani-lab-2:~$ sudo virsh net-autostart default
Network default marked as autostarted

ubuntu@gelani-lab-2:~$ sudo systemctl restart libvirtd
ubuntu@gelani-lab-2:~$ sudo mkdir -p /var/lib/libvirt/images/_base
ubuntu@gelani-lab-2:~$ sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/_base
ubuntu@gelani-lab-2:~$ sudo chmod 755 /var/lib/libvirt/images/_base
ubuntu@gelani-lab-2:~$ sudo wget -O /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 \
https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
--2026-02-08 05:37:27--  https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img
Resolving cloud-images.ubuntu.com (cloud-images.ubuntu.com)... 185.125.190.40, 185.125.190.37, 2620:2d:4000:1::1a, ...
Connecting to cloud-images.ubuntu.com (cloud-images.ubuntu.com)|185.125.190.40|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 626836992 (598M) [application/octet-stream]
Saving to: ‘/var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2’

/var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow 100%[========================================================================================================================================>] 597.80M  22.2MB/s    in 31s     

2026-02-08 05:37:59 (19.4 MB/s) - ‘/var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2’ saved [626836992/626836992]

ubuntu@gelani-lab-2:~$ sudo chown libvirt-qemu:kvm /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
ubuntu@gelani-lab-2:~$ sudo chmod 444 /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
ubuntu@gelani-lab-2:~$ sudo mkdir -p /var/lib/libvirt/images/vms/nat-vm1
ubuntu@gelani-lab-2:~$ sudo chown -R libvirt-qemu:kvm /var/lib/libvirt/images/vms/nat-vm1
ubuntu@gelani-lab-2:~$ sudo chmod 750 /var/lib/libvirt/images/vms/nat-vm1
ubuntu@gelani-lab-2:~$ cd /var/lib/libvirt/images/vms/nat-vm1
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo qemu-img create -f qcow2 \
  -F qcow2 -b /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 \
  nat-vm1.qcow2 20G
Formatting 'nat-vm1.qcow2', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=21474836480 backing_file=/var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2 backing_fmt=qcow2 lazy_refcounts=off refcount_bits=16
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo qemu-img info nat-vm1.qcow2 | egrep -i 'file format|virtual size|backing file|backing file format'
file format: qcow2
virtual size: 20 GiB (21474836480 bytes)
backing file: /var/lib/libvirt/images/_base/ubuntu-24.04-noble-base.qcow2
backing file format: qcow2
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ cat | sudo tee user-data.yaml > /dev/null <<'EOF'
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

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ cat | sudo tee meta-data.yaml > /dev/null <<'EOF'
instance-id: nat-vm1
local-hostname: nat-vm1
EOF

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ 
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo cloud-localds -v seed.iso user-data.yaml meta-data.yaml
wrote seed.iso with filesystem=iso9660 and diskformat=raw
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo chown libvirt-qemu:kvm seed.iso user-data.yaml meta-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo chmod 640 seed.iso user-data.yaml meta-data.yaml
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo virt-install \
  --name nat-vm1 \
  --memory 2048 \
  --vcpus 2 \
  --disk path=/var/lib/libvirt/images/vms/nat-vm1/nat-vm1.qcow2,format=qcow2,bus=virtio \
  --disk path=/var/lib/libvirt/images/vms/nat-vm1/seed.iso,device=cdrom \
  --os-variant ubuntu24.04 \
  --network network=default,model=virtio \
  --graphics none \
  --console pty,target_type=serial \
  --import \
  --noautoconsole
WARNING  Requested memory 2048 MiB is less than the recommended 3072 MiB for OS ubuntu24.04

Starting install...
Creating domain...                                                                                                                                                                                                   |    0 B  00:00:00     
Domain creation completed.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time   MAC address   Protocol   IP address   Hostname   Client ID or DUID
-----------------------------------------------------------------------------------

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo virsh domiflist nat-vm1
 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:5a:23:45

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo virsh domiflist nat-vm1
 Interface   Type      Source    Model    MAC
-------------------------------------------------------------
 vnet0       network   default   virtio   52:54:00:5a:23:45

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo tcpdump -ni virbr0 -c 10 'port 67 or port 68'
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on virbr0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
^C
0 packets captured
0 packets received by filter
0 packets dropped by kernel
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ virsh
Welcome to virsh, the virtualization interactive terminal.

Type:  'help' for help with commands
       'quit' to quit

virsh # ^C
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ virsh list
 Id   Name      State
-------------------------
 1    nat-vm1   running

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ sudo virsh net-dhcp-leases default
 Expiry Time           MAC address         Protocol   IP address           Hostname   Client ID or DUID
------------------------------------------------------------------------------------------------------------------------------------------------
 2026-02-08 06:41:23   52:54:00:5a:23:45   ipv4       192.168.122.160/24   nat-vm1    ff:56:50:4d:98:00:02:00:00:ab:11:67:09:6d:ac:6b:2d:c5:00

ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ ssh ubuntu@192.168.122.160
The authenticity of host '192.168.122.160 (192.168.122.160)' can't be established.
ED25519 key fingerprint is SHA256:/dHPjTfmgPnuIhHiop0zhK8gZ1kqt9ufn2hdm7asDiA.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.122.160' (ED25519) to the list of known hosts.
ubuntu@192.168.122.160's password: 
Welcome to Ubuntu 24.04.3 LTS (GNU/Linux 6.8.0-90-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Sun Feb  8 05:43:10 UTC 2026

  System load:  0.15               Processes:               141
  Usage of /:   10.2% of 18.33GB   Users logged in:         0
  Memory usage: 11%                IPv4 address for enp1s0: 192.168.122.160
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

58 updates can be applied immediately.
38 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status



The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@nat-vm1:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 52:54:00:5a:23:45 brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.160/24 metric 100 brd 192.168.122.255 scope global dynamic enp1s0
       valid_lft 3480sec preferred_lft 3480sec
    inet6 fe80::5054:ff:fe5a:2345/64 scope link 
       valid_lft forever preferred_lft forever
ubuntu@nat-vm1:~$ hostnamectl
 Static hostname: nat-vm1
       Icon name: computer-vm
         Chassis: vm 🖴
      Machine ID: 825f92d3cfbd46639e63fa0a01aedeef
         Boot ID: cf4391bff6e242668d673d207787f73c
  Virtualization: kvm
Operating System: Ubuntu 24.04.3 LTS                
          Kernel: Linux 6.8.0-90-generic
    Architecture: x86-64
 Hardware Vendor: QEMU
  Hardware Model: Ubuntu 24.04 PC _Q35 + ICH9, 2009_
Firmware Version: 1.16.3-debian-1.16.3-2
   Firmware Date: Tue 2014-04-01
    Firmware Age: 11y 10month 1w 2d                 
ubuntu@nat-vm1:~$ ping google.com
PING google.com (142.250.192.206) 56(84) bytes of data.
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=1 ttl=115 time=50.2 ms
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=2 ttl=115 time=49.8 ms
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=3 ttl=115 time=47.6 ms
64 bytes from del11s12-in-f14.1e100.net (142.250.192.206): icmp_seq=4 ttl=115 time=47.6 ms
^C
--- google.com ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3006ms
rtt min/avg/max/mdev = 47.569/48.787/50.186/1.199 ms
ubuntu@nat-vm1:~$ 
ubuntu@nat-vm1:~$ exit
logout
Connection to 192.168.122.160 closed.
ubuntu@gelani-lab-2:/var/lib/libvirt/images/vms/nat-vm1$ 


 ```

