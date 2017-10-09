# Image with Linux Oracle instant client. 

FROM centos
MAINTAINER Miki Monguilod <mmonguilod@oneboxtm.com>

ADD . /tmp/
ENV ORACLE_VERSION 11.2

RUN yum install -y libaio.x86_64 glibc.x86_64
RUN yum -y localinstall /tmp/oracle* --nogpgcheck
RUN mkdir /usr/lib/oracle/${ORACLE_VERSION}/client64/network/admin -p
COPY ./tnsnames.ora /usr/lib/oracle/${ORACLE_VERSION}/client64/network/admin/tnsnames.ora

ENV ORACLE_HOME=/usr/lib/oracle/${ORACLE_VERSION}/client64
ENV PATH=$PATH:$ORACLE_HOME/bin
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
ENV TNS_ADMIN=$ORACLE_HOME/network/admin

ENTRYPOINT /bin/bash
