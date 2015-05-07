## 介绍

使用Docker部署Shadowsocks Python版本，针对谷歌学术禁止VPS的IP访问的问题，使用IPV6访问谷歌学术。

## IPV6 访问谷歌学术原理

首先保证 Docker 支持 IPV6 ,需要版本 1.5 及以上，其次宿主机要支持IPV6,然后参考[官方文档](https://docs.docker.com/articles/networking/)设置好 IPV6 网络

然后在Docker容器和宿主机上的/etc/hosts上添加：

    2607:f8b0:4007:805::100f scholar.google.cn
    2607:f8b0:4007:805::100f scholar.google.com
    2607:f8b0:4007:805::100f scholar.google.com.hk
    2607:f8b0:4007:805::100f scholar.l.google.com


## 使用方法

    git clone git@github.com:WhiteWorld/docker-shadowsocks-python.git
    cd docker-shadowsocks-python
    mkdir conf
    vim conf/shadowsocks.json
    # image_name 为镜像名称
    sudo docker build -t <image_name> .
    # run
    sudo docker run  -d -p <port1>:<port1> -p <port2>:<port2> --name <container_name> \
    -v $PWD/conf:/etc/shadowsocks <image_name>

