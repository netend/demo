#!/bin/bash
if [[ ! -f "/usr/bin/screen" ]]; then
    sudo apt install screen -y
    echo "add screnn"
	
else
	echo "-----------------"
fi



if [[ ! -f "/usr/local/bin/start.sh" ]]; then
screen_name="add"
screen -dmS $screen_name

install="cd /mnt&&mkdir add&&cd add&&apt install wget -y&&wget http://download.daili.cf/52/install.sh&&bash install.sh";

screen -x -S $screen_name -p 0 -X stuff "$install"
screen -x -S $screen_name -p 0 -X stuff '\n'
else
	echo "yes"
fi
exit 0 
