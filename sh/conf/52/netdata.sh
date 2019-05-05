#!/bin/bash

sudo rm -rf /usr/sbin/netdata
sudo rm -rf /opt/netdata
bash <(curl -Ss https://my-netdata.io/kickstart.sh) all --non-interactive

echo "----------------"
exit 0
