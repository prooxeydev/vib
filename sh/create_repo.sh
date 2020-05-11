#/bin/bash

# <name (vibuser, viborganisation)> <reponame>

mkdir /vib/$1
mkdir /vib/$1/$2
cd /vib/$1/$2
git init