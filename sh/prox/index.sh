#!/bin/bash
wifiip=$(ip addr |grep inet |grep -v inet6 |grep wlan0|awk '{print $2}' |awk -F "/" '{print $1}')
 if [ ! -d "/var/www/html/ip" ];then  >/dev/null
        mkdir /var/www/html/ip
else
echo ""
fi
 if [ ! -f "/var/www/html/ip/1.jpg" ];then  >/dev/null
        cp /var/www/html/1.jpg /var/www/html/ip/1.jpg
else
echo ""
fi
grep "$wifiip" /var/www/html/index.html >/dev/null

if [ $? -eq 0 ]; then
	echo "yes--no"
else
    > /var/www/html/index.html
 cat <<EOF >>  /var/www/html/index.html
       
	<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<title>导航</title> 
<style>
.center {
    text-align: center;
    border: 3px solid green;
}
</style>
</head>
<body>
<h2>地址导航2.6</h2>
<!--于2019/4/7创建
一键脚本-->
<div class="center">		
<h1><p>
        <a href="http://$wifiip:32400/web">PLEX在线家庭影院</a> </p>
        <a href="http://$wifiip:19999">性能实时监测 </a></p>	
	    <a href="http://$wifiip:8112">BT下载 </p>	
		<a href="http://$wifiip/AriaNG">AriaNG </p>
        <a href="http://$wifiip:5299">百度云下载 </p>
<!---->
        <a href="http://$wifiip:7788">文件同步 </p>	
        <a href="http://$wifiip:4200">终端</p>	
	
	    <a href="http://$wifiip/markdown-notepad">文档编辑</a></p>
        <a href="http://$wifiip/KodExplorer">可道云 </a> </p> 
		<a href="http://$wifiip/download">下载服务器 </a></p>	
		<h4><p style="text-align:left"><a href="https://www.52pojie.cn/thread-941955-1-1.html">.</a>
<!---->
<!---->
		
</h1>
</div>
<body background="1.jpg">
</body>
</html> 
EOF

	echo "--------html------done-----------"
fi
