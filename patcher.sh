#/bin/sh

cd /var/mt
rm -f /var/mt/mts.sh
wget https://raw.githubusercontent.com/joda17/mts-installer/master/mts.sh
chmod +x /var/mt/mts.sh
sh /var/mt/mts.sh > /var/mt/minetest/run.log
