#/bin/bash

if [ $(id -u) -eq 0 ]; then
	adduser --quiet --disabled-password --shell /bin/bash --home /home/$1 --gecos "User" $1

	echo "$1:$2" | chpasswd

	mkdir /vib
	chown git /vib
	chgrp git /vib

	echo "success"
else
	echo "Only root may add a user to the system"
	exit 2
fi