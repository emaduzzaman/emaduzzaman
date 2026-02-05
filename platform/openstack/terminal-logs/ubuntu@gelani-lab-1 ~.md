```
root@KAZI-EMADUZZAMAN:~# ssh ubuntu@192.168.95.93
The authenticity of host '192.168.95.93 (192.168.95.93)' can't be established.
ED25519 key fingerprint is SHA256:c2OeWOBIkW9ZNBh4MRPe1uS9dpW9Va3GvNEwOTFAea0.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '192.168.95.93' (ED25519) to the list of known hosts.
ubuntu@192.168.95.93's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Jan 19 10:58:13 UTC 2026

  System load:  0.16              Processes:             224
  Usage of /:   3.1% of 48.27GB   Users logged in:       0
  Memory usage: 0%                IPv4 address for ens3: 192.168.95.93
  Swap usage:   0%

Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update


The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.

To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@gelani-lab-1:~$ sudo bash
root@gelani-lab-1:/home/ubuntu# passwd ubuntu
New password:
Retype new password:
Sorry, passwords do not match.
passwd: Authentication token manipulation error
passwd: password unchanged
root@gelani-lab-1:/home/ubuntu# passwd ubuntu
New password:
Retype new password:
passwd: password updated successfully
root@gelani-lab-1:/home/ubuntu# exit
exit
ubuntu@gelani-lab-1:~$ exit
logout
Connection to 192.168.95.93 closed.
root@KAZI-EMADUZZAMAN-2700:~# ssh ubuntu@192.168.95.93
ubuntu@192.168.95.93's password:
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 5.15.0-143-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

 System information as of Mon Jan 19 10:58:13 UTC 2026

  System load:  0.16              Processes:             224
  Usage of /:   3.1% of 48.27GB   Users logged in:       0
  Memory usage: 0%                IPv4 address for ens3: 192.168.95.93
  Swap usage:   0%


Expanded Security Maintenance for Applications is not enabled.

0 updates can be applied immediately.

Enable ESM Apps to receive additional future security updates.
See https://ubuntu.com/esm or run: sudo pro status


The list of available updates is more than a week old.
To check for new updates run: sudo apt update
New release '24.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.


Last login: Mon Jan 19 10:58:13 2026 from 192.168.95.86
ubuntu@gelani-lab-1:~$

```