#!/bin/bash


de=$(ps -ef |grep deluge-we |grep -v "grep" |wc -l)
sync=$(ps -ef |grep rslsync |grep -v "grep" |wc -l)
aria=$(ps -ef |grep aria2c |grep -v "grep" |wc -l)
baidu=$(ps -ef |grep BaiduPCS-Go |grep -v "grep" |wc -l)
netsa=$(ps -ef |grep netdata |grep -v "grep" |wc -l)
apache=$(ps -ef |grep apache2 |grep -v "grep" |wc -l)
smb=$(ps -ef |grep  smbd |grep -v "grep" |wc -l)
webssh=$(ps -ef |grep perl |grep -v "grep" |wc -l)
plex=$(ps -ef |grep Plex |grep -v "grep" |wc -l)

if [ $de -eq 0 ]; then
   deluged  >/dev/null  2>&1
   deluge-web  >/dev/null  2>&1
   echo "deluge-web"
   
else
        echo is RUN
fi
#############################
if [ $sync -eq 0 ]; then
     rslsync  --config /opt/sync.conf  >/dev/null 2>&1
     echo "rslsync"
else
        echo is RUN
fi
#################################
if [ $aria -eq 0 ]; then
       sudo aria2c --conf-path=/etc/aria2/aria2.conf -D&
       echo "aria2"
else
        echo is RUN
fi
################################
if [ $baidu -eq 0 ]; then
        BaiduPCS-Go  >/dev/null &
        echo "BaiduPCS-Go"
else
        echo is RUN
fi
#####################################
if [ $netsa -eq 0 ]; then
        nohup sudo  netdata >/dev/null  2>&1
        echo "netdata"
else
        echo is RUN
fi
###############################
service apache2 restart >/dev/null 2>&1
echo "apache2"

service smbd restart >/dev/null 2>&1
echo "smb"

service webmin restart >/dev/null 2>&1
echo "webmin"

service plexmediaserver restart >/dev/null 2>&1
echo "PLEX"

exit 0
