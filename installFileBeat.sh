#!/bin/sh

echo Install the beats package and a text editor called VIM

echo "IGNORE_OSVERSION=yes" >> /usr/local/etc/pkg.conf
pkg add http://pkg.freebsd.org/FreeBSD:11:amd64/latest/All/beats-6.8.6.txz
pkg add http://pkg.freebsd.org/FreeBSD:11:amd64/latest/All/vim-tiny-8.2.0076.txz


echo Download FileBeat Files

cd /tmp

fetch https://github.com/BLKingLLC/filesToDownload/raw/master/pfsenseFileBeat.tar.gz

tar -xvf pfsenseFileBeat.tar.gz

rm pfsenseFileBeat.tar.gz

tar -xvf pfsenseFileBeat/filebeat.tar.gz

chown -R root:wheel pfsenseFileBeat/

echo Add Modules

mv ./filebeat-6.8.6-linux-x86_64/modules.d /var/db/beats/filebeat/

mv ./filebeat-6.8.6-linux-x86_64/module /var/db/beats/filebeat/

rm -rf filebeat-6.8.6-linux-x86_64

echo Create a log file directory

mkdir /var/log/filebeat

echo Create a certs directory and download the certs

mkdir /usr/local/etc/certs

mv ./pfsenseFileBeat/certs/ca.crt /usr/local/etc/certs/ca.crt

mv ./pfsenseFileBeat/certs/pfsense.localdomain.crt /usr/local/etc/certs/pfsense.localdomain.crt

mv ./pfsenseFileBeat/certs/pfsense.localdomain.key /usr/local/etc/certs/pfsense.localdomain.key

echo Replace the default config file

mv ./pfsenseFileBeat/filebeat.yml /usr/local/etc/filebeat.yml

chown root:wheel /usr/local/etc/filebeat.yml

echo Enable the Logstash Module

/usr/local/sbin/filebeat -c /usr/local/etc/filebeat.yml modules enable logstash

echo Configure pfSense to start Filebeat on Startup

cp /usr/local/etc/rc.d/filebeat /usr/local/etc/rc.d/filebeat.sh

echo "filebeat_enable=yes" >> /etc/rc.conf.local

echo "filebeat_conf=/usr/local/etc/filebeat.yml" >> /etc/rc.conf.local

echo Start the Filebeat Service

/usr/local/etc/rc.d/filebeat.sh start

