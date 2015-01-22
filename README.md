## 介绍
使用Docker部署Shadowsocks Python版本，针对谷歌学术禁止VPS的IP访问的问题，使用IPV6访问谷歌学术。

## IPV6访问谷歌学术原理
在Docker容器和宿主机上的/etc/hosts上添加：

  2607:f8b0:4007:805::100f scholar.google.cn
  2607:f8b0:4007:805::100f scholar.google.com
  2607:f8b0:4007:805::100f scholar.google.com.hk
  2607:f8b0:4007:805::100f scholar.l.google.com

保证VPS有IPV6地址并且docker0网卡的IPV6地址在IPV6地址的子网段上。设置Docker容器的IPV6地址与VPS的docker0网卡的IPV6地址在同一个网段
，并设置IPV6GW网关为VPS的docker0网卡IPV6地址。设置方法参考：[docker-and-ipv6](https://inspirationlabs.com/blog/docker-and-ipv6)

## 使用方法

  git clone git@github.com:WhiteWorld/docker-shadowsocks-python.git
  cd docker-shadowsocks-python
  mkdir conf
  vim conf/shadowsocks.json
  # image_name 为镜像名称
  sudo docker build -t <image_name> .
  # 设置Docker容器的IPV6ADDR为VPS的docker0的IPV6同网段的地址，IPV6GW为VPS上docker0网卡的IPV6地址，-p 指定端口映射，可以添加多组
  sudo docker run --privileged -e IPV6ADDR=2001:470:c:574::8888:20/112 -e IPV6GW=2001:470:c:574::8888:1 \
  --restart=on-failure:5 -d -p <port1>:<port1> -p <port2>:<port2> --name <container_name> \
  -v $PWD/conf:/etc/shadowsocks <image_name>

## 注意
如果VPS不支持IPV6，可以使用[Hurricane Electric](https://tunnelbroker.net/)提供的隧道技术申请一个IPV6地址。具体参考：[一个解决 Google Scholar block DigitalOcean SFO IP 的方法](https://www.v2ex.com/t/163133)和[IPv6 with a Hurricane Electric tunnel](http://lowendbox.com/blog/ipv6-with-a-hurricane-electric-tunnel/)
