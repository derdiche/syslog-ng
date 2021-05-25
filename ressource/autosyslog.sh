#!/bin/bash
ipclient2="192.168.1.12"
ipclient="192.168.1.11"
ipserveur="192.168.1.10"
confadd='destination d_logger {udp(\"'$ipserveur'\" port(514)); };\nlog { source(s_src); destination(d_logger); };'
ssh $ipclient2 "apt-get install syslog-ng"
ssh $ipclient2 "sed -i -e 's/#CONSOLE_LOG_LEVEL=1/CONSOLE_LOG_LEVEL=1/' /etc/default/syslog-ng"
ssh $ipclient2 "/etc/init.d/syslog-ng restart"
ssh $ipclient2 "update-rc.d -f rsyslog remove"
ssh $ipclient2 "dpkg -P rsyslog" 
ssh $ipclient2 "[ `sed -n \"/$ipserveur/p\" /etc/syslog-ng/syslog-ng.conf` == "" ] && echo -e \"$confadd\">>/etc/syslog-ng/syslog-ng.conf"
ssh $ipclient2 "/usr/sbin/syslog-ng -d"






