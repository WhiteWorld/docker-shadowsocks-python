#!/bin/bash

if [ ! -z "$IPV6ADDR" ]; then
	echo  $IPV6ADDR
	ip -6 addr add "$IPV6ADDR" dev eth0
fi

sleep 2

if [ ! -z "$IPV6GW" ]; then
	echo $IPV6GW
	ip -6 route add  default via "$IPV6GW" dev eth0
fi

cat /etc/hosts|grep scholar > /dev/null
if [ $? -ne 0 ];then
	echo '2607:f8b0:4007:805::100f scholar.google.cn' >> /etc/hosts
	echo '2607:f8b0:4007:805::100f scholar.google.com' >> /etc/hosts
	echo '2607:f8b0:4007:805::100f scholar.google.com.hk' >> /etc/hosts
	echo '2607:f8b0:4007:805::100f scholar.l.google.com' >> /etc/hosts
fi


ping6 -c 4 scholar.google.cn

sleep 2

/usr/local/bin/ssserver -c /etc/shadowsocks/shadowsocks.json
