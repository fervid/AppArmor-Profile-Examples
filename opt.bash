# Last Modified: Tue Mar  6 23:52:55 2018
#include <tunables/global>

/opt/bash {
  #include <abstractions/base>
  #include <abstractions/bash>

  capability setuid,
  capability setgid,
  capability sys_resource,
  capability audit_write,  

  ptrace (readby),
  ptrace peer=@{profile_name},
  ptrace peer=unconfined,

  network netlink raw, 


  /opt/bash          ix,
  /bin/lesspipe      rix,
  /usr/bin/lesspipe  rix,
  /bin/ps            ix,
  /usr/bin/groups    ix,
  /usr/bin/id        ix,
  /usr/bin/mesg      ix,
  /usr/bin/basename  ix,
  /usr/bin/dirname   ix,
  /usr/share/bash-completion/bash_completion  rix,


  /etc/group         r,
  /etc/shadow        r,
  /etc/passwd        r,
  /etc/sudoers       r,
  /etc/sudoers.d/    r,
  /etc/sudoers.d/*   r,
  /etc/sudoers.d/**  r,
  /etc/init.d/       r, 
  /etc/host.conf     r, 
  /etc/nsswitch.conf r, 
  /etc/hosts         r,
  /etc/login.defs    r, 
  /etc/securetty     r, 
  /etc/environment   r,
  /etc/resolv.conf   r,
  /etc/pam.d/sudo    r, 
  /etc/pam.d/other   r, 
  /etc/pam.d/common-auth      r,
  /etc/pam.d/common-account   r,
  /etc/pam.d/common-auth      r,
  /etc/pam.d/common-password  r,
  /etc/pam.d/common-session   r,
  /etc/default/locale         r,
  /etc/security/pam_env.conf     r, 
  /etc/security/capability.conf  r, 
  /etc/pam.d/common-session-noninteractive   r,

  /dev/       r,
  /dev/tty*   rw, 
  /dev/pts/*  rw,


  /usr/lib/sudo/sudoers.so          mr,      
  /{usr/,}lib{,32,64}/**            mr, 
  /lib/x86_64-linux-gnu/security/*  mr, 

  
  /run/sudo/    r, 
  /run/sudo/*   rw, 
  /run/sudo/**  rwk, 
  /run/utmp     rk,
  /run/systemd/resolve/stub-resolv.conf  r, 

  /proc/         r,
  /proc/*/status r, 
  /proc/*/stat   r, 
  /proc/uptime   r,  
  /proc/sys/kernel/osrelease  r,
  /proc/sys/kernel/pid_max    r,

  /usr/bin/sudo  rix,
}
