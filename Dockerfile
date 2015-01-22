# shadowsocks
#
# VERSION 0.0.1

FROM ubuntu:14.04
MAINTAINER Whiteworld <ljq258@gmail.com>

RUN apt-get update && \
    apt-get install -y python-pip python-m2crypto
RUN pip install shadowsocks

ADD run.sh /
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]
