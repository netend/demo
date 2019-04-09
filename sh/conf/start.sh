#!/bin/bash
de=`lsof -i :8112|grep -v "PID" | awk '{print $2}'`
sync=`lsof -i :7788|grep -v "PID" | awk '{print $2}'`
aria=`lsof -i :6800|grep -v "PID" | awk '{print $2}'`
baidu=`lsof -i :5299|grep -v "PID" | awk '{print $2}'`
netdata=`lsof -i :19999|grep -v "PID" | awk '{print $2}'`


if [ "$sync" != "" ];
then
   echo ""
else
/usr/bin/rslsync  --config /opt/sync.conf  >/dev/null 2>&1
fi
###########################
if [ "$aria" != "" ];
then
   echo ""
else

sudo aria2c --conf-path=/etc/aria2/aria2.conf -D&
fi
##########################
if [ "$baidu" != "" ];
then
   echo ""
else
BaiduPCS-Go  >/dev/null &
fi
################################
if [ "$netdata" != "" ];
then
   echo ""
else
nohup sudo  netdata >/dev/null  2>&1
fi
#######################

#####################

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
