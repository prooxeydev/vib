#/bin/bash

mkdir /home/$1/.ssh
mkdir /home/$1/sshkeys
touch /home/$1/.ssh/authorized-keys

chown $1 /home/$1/.ssh -R
chown $1 /home/$1/sshkeys -R
chgrp $1 /home/$1/.ssh -R
chgrp $1 /home/$1/sshkeys -R

chmod 644 /home/$1/.ssh -R
chmod 644 /home/$1/sshkeys -R

echo 'success'