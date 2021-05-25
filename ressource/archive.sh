#!/bin/bash -e
#rm -fr "/var/log/client/"`date '+%C%y/%m/%d' -d "-2 days"`
#tar czvf "/var/log/client/"`date '+%C%y/%m/%d' -d "-2 days"`"/messages.tar.gz messages"

#gzip "/var/log/client/"`date '+%C%y/%m/%d' -d "-2 days"`"/messages"
tar -zcvf "/var/log/client/"`date '+%C%y/%m/%d' -d "-3 days"`"/syslog.tar.gz" .
tar -zcvf "/var/log/client/"`date '+%C%y/%m/%d' -d "-3 days"`"/messages.tar.gz" .
chmod 777 "/var/log/client/"`date '+%C%y/%m/%d' -d "-3 days"`"/syslog.tar.gz"
chmod 777 "/var/log/client/"`date '+%C%y/%m/%d' -d "-3 days"`"/messages.tar.gz"
mkdir -p "/home/archives/"`date '+%d/%m/%C%y' -d "-3 days"`"/syslog/"
echo "/home/archives/"`date '+%d/%m/%C%y' -d "-3 days"`"/syslog/tmp"
mkdir -p "/home/archives/"`date '+%d/%m/%C%y' -d "-3 days"`"/messages/"
#"/home/archives/"`date '+%d/%m/%C%y' -d "-2 days"`"/messages"
scp "/var/log/client/"`date '+%C%y/%m/%d' -d "-3 days"`"/syslog.tar.gz" "/home/archives/"`date '+%d/%m/%C%y' -d "-3 days"`"/syslog/"
scp "/var/log/client/"`date '+%C%y/%m/%d' -d "-3 days"`"/messages.tar.gz" "/home/archives/"`date '+%d/%m/%C%y' -d "-3 days"`"/messages/"
