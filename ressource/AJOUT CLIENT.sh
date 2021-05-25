#!/bin/bash
cd /usr/local/nagios/etc/objects/
cp localhost.cfg client.cfg
chmod 777 client.cfg
sed -i "33,46d" client.cfg
sed -i "s/localhost/client/" client.cfg
sed -i "s/127.0.0.1/192.168.0.19/" client.cfg
cd ..
echo -e "\ncfg_file=/usr/local/nagios/etc/objects/client.cfg">> nagios.cfg
service nagios restart