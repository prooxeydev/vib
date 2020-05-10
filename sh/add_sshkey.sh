#/bin/bash

#ouser vuser key_name ssh_key 

mkdir /home/$1/sshkeys/$2
echo $4 > /home/$1/sshkeys/$2/$3.pub
chown $1 /home/$1/sshkeys/$2/$3.pub

cat /home/$1/sshkeys/$2/$3.pub >> /home/$1/.ssh/authorized_keys
chown $1 /home/$1/.ssh/authorized_keys

echo "success"