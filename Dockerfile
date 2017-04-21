FROM debian:jessie
MAINTAINER mixool0204@gmail.com

RUN apt-get update \
    && wget https://github.com/ginuerzh/gost/releases/download/v2.4-dev/gost_2.4-dev20170303_linux_amd64.tar.gz \
    && tar -xzf gost_2.4-dev20170303_linux_amd64.tar.gz \
    && mv gost_2.4-dev20170303_linux_amd64/gost /root/ \
    && rm -rf gost_2.4-dev20170303_linux_amd64.tar.gz \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

ENTRYPOINT ["/root/gost"]
