#!/bin/bash

cat /etc/hosts|grep scholar > /dev/null
if [ $? -ne 0 ];then
	echo '2607:f8b0:4007:805::100f scholar.google.cn' >> /etc/hosts
	echo '2607:f8b0:4007:805::100f scholar.google.com' >> /etc/hosts
	echo '2607:f8b0:4007:805::100f scholar.google.com.hk' >> /etc/hosts
	echo '2607:f8b0:4007:805::100f scholar.l.google.com' >> /etc/hosts
fi

ifconfig

ping6 -c 4 scholar.google.cn

sleep 2

/usr/local/bin/ssserver -c /etc/shadowsocks/shadowsocks.json
