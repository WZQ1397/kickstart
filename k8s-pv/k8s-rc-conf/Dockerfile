FROM centos
MAINTAINER zach.wang
LABEL name="CentOS Base Image"
LABEL vendor="CentOS"
LABEL license=GPLv2
# Volumes for systemd
# VOLUME ["/run", "/tmp"]
ENV TZ "Asia/Shanghai"
ENV TERM xterm
ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo
RUN yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel && \
    yum install -y --enablerepo=epel pwgen python-pip nfs-utils telnet && \
    yum clean all
RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf
RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor
EXPOSE 22
# Environment for systemd
# ENV container=docker
# For systemd usage this changes to /usr/sbin/init
# Keeping it as /bin/bash for compatability with previous
CMD ["/usr/bin/supervisord"]
