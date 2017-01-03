#!/bin/bash

# generate UTF8 locale
locale-gen en_US.UTF-8

# install vim and net tools such as ifconfig
apt-get install -y vim net-tools

# set root and postgres passwds to x
printf x\\nx\\n | passwd
printf x\\nx\\n | passwd postgres

# supply ServerName of dbs to Apache
echo 'ServerName dbs' >>/etc/apache2/apache2.conf

