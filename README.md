## 介绍

使用 Docker 部署 Shadowsocks Python 版本，针对谷歌学术禁止 VPS 的 IP 访问的问题，使用 IPV6 访问谷歌学术。

## IPV6 访问谷歌学术原理

首先保证 Docker 支持 IPV6 ,需要版本 1.5 及以上，其次宿主机要支持IPV6,然后参考[官方文档](https://docs.docker.com/articles/networking/)设置好 IPV6 网络

然后在Docker容器和宿主机上的/etc/hosts上添加：

    2607:f8b0:4007:805::100f scholar.google.cn
    2607:f8b0:4007:805::100f scholar.google.com
    2607:f8b0:4007:805::100f scholar.google.com.hk
    2607:f8b0:4007:805::100f scholar.l.google.com


## 使用方法
    
    # clone 代码
    git clone git@github.com:WhiteWorld/docker-shadowsocks-python.git
    cd docker-shadowsocks-python
    mkdir conf
    # 创建配置文件
    vim conf/shadowsocks.json
    # build docke 镜像
    docker build -t <image_name> .
    # 运行 docker 容器
    sudo docker run  -d -p <port1>:<port1> -p <port2>:<port2> --name <container_name> \
    -v $PWD/conf:/etc/shadowsocks <image_name>

