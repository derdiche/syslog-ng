#!/bin/bash -e
apt-get update
yes | apt-get install php5 
yes | apt-get install apache2 
service apache2 start
useradd nagios 
groupadd nagios 
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.4.6.tar.gz
wget http://www.nagios-plugins.org/download/nagios-plugins-2.0.3.tar.gz
tar -zxvf nagios-4.4.6.tar.gz
cd nagios-4.4.6
./configure
make all  
make install
make install-init
make install-commandmode
make install-config
make install-webconf
echo "root" |htpasswd -c -i /usr/local/nagios/etc/htpasswd.users nagiosadmin 
cd ..
tar -zxvf nagios-plugins-2.0.3.tar.gz
cd nagios-plugins-2.0.3
./configure --with-nagios --with-nagios-group=nagios
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
service apache2 restart
service nagios start 
yes | apt-get install fcgiwrap
a2enmod cgi
yes | apt-get install nagios-plugins
cp /usr/lib/nagios/plugins/check_* /usr/local/nagios/libexec
clear
echo "instalation terminé"
exit 
firefox "localhost\nagios"

