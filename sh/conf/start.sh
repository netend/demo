#!/bin/bash
/usr/bin/rslsync  --config /opt/sync.conf  >/dev/null 2>&1
sudo aria2c --conf-path=/etc/aria2/aria2.conf -D&
#echo "aria2"
#echo 
BaiduPCS-Go  >/dev/null &
#echo "BaiduPCS-Go"
nohup sudo  netdata >/dev/null  2>&1
#echo "netdata"


de=`lsof -i :8112|grep -v "PID" | awk '{print $2}'`

if [ "$de" != "" ];
then
   echo ""
else
   deluged  >/dev/null  2>&1

   deluge-web  >/dev/null  2>&1

fi

service apache2 restart >/dev/null 2>&1
#echo "apache2"

service smbd restart >/dev/null 2>&1
#echo "smbd"

service webmin restart >/dev/null 2>&1
#echo "webmin"

service plexmediaserver restart >/dev/null 2>&1
