# There are two approaches to confine user in system:
1. Use confined bash.
2. Use hat for sshd or login daemon.

If confined user escalate his privileges - root inherit all constrains, so it can reduce some of attacks.


## Use confined bash
1. We want confine user stuff.
2. Copy bash to other dir, for example `/opt/bash`.
3. Change shell path on `/opt/bash` in `/etc/passwd` for user stuff.
4. Create AppArmor profile for `/opt/bash` in `/etc/apparmor.d/`.
5. Switch profile to enforce mode: aa-enforce `/etc/apparmor.d/opt.bash`.
6. Reload profile: `apparmor_parser -r /etc/apparmor.d/opt.bash`.
7. Login as user stuff in console.


## Use hat for sshd
1. We want to confine user test.
2. Add entry `session  required  pam_apparmor.so order=user,group,default`  in `/etc/pam.d/sshd` file.
3. Create hat `^test { ... }` for user test in `/etc/apparmor.d/usr.sbin.sshd` profile.
4. Switch profile to enforce mode: `aa-enforce /etc/apparmor.d/usr.sbin.sshd`.
5. Reload profile: `apparmor_parser -r /etc/apparmor.d/usr.sbin.sshd`.
6. Login as user test in sshd: `ssh test@<host> -p <port>`.

