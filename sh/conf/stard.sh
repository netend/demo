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
        echo BT正在运行
fi
#############################
if [ $sync -eq 0 ]; then
     rslsync  --config /opt/sync.conf  >/dev/null 2>&1
     echo "rslsync"
else
        echo sync正在运行
fi
#################################
if [ $aria -eq 0 ]; then
       sudo aria2c --conf-path=/etc/aria2/aria2.conf -D&
       echo "aria2"
else
        echo aria2正在运行
fi
################################
if [ $baidu -eq 0 ]; then
        BaiduPCS-Go  >/dev/null &
        echo "BaiduPCS-Go"
else
        echo BaiduPCS正在运行
fi
#####################################
if [ $netsa -eq 0 ]; then
        nohup sudo  netdata >/dev/null  2>&1
        echo "netdata"
else
        echo "资源检测正在运行"
fi
###############################

if [ $apache -eq 0 ]; then
   service apache2 restart >/dev/null 2>&1
   echo "apache2"
   
else
    echo "阿帕奇正在运行"
fi
#############################################

  if [ $smb -eq 0 ]; then
    service smbd restart >/dev/null 2>&1
    echo "smb"
   
else
    echo "局域网共享正在运行"
fi  
#########################################

  if [ $webssh -eq 0 ]; then
     service webmin restart >/dev/null 2>&1
     echo "webmin"
else
    echo "WEBssh正在运行"
fi 
###################################
 if [ $plex -eq 0 ]; then
   service plexmediaserver restart >/dev/null 2>&1

   echo "PLEX"
   
else
    echo "PLEX正在运行"
fi 
exit 0
