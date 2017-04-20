FROM debian:jessie
MAINTAINER Mxl

RUN apt-get update && \
    apt-get install -y wget && \
    wget https://github.com/ginuerzh/gost/releases/download/v2.4-dev/gost_2.4-dev20170303_linux_amd64.tar.gz && \
    tar -xzf gost_2.4-dev20170303_linux_amd64.tar.gz && \
    mv gost_2.4-dev20170303_linux_amd64/gost /root/ && \
    apt-get remove -y --auto-remove wget  && \ 
    rm -rf gost_2.4-dev20170303_linux_amd64.tar.gz && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

ENTRYPOINT ["/root/gost"]
