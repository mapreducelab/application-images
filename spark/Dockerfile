FROM centos:centos7.5.1804

ENV HADOOP_VER 2.6.5
ENV SPARK_VER 2.3.1

RUN yum -y install java-1.8.0-openjdk

# Get Hadoop from US Apache mirror and extract just the native libs.
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz | \
    tar -zx hadoop-${HADOOP_VER}/lib/native && \
    ln -s hadoop-${HADOOP_VER} hadoop

# Get Spark from US Apache mirror.
RUN mkdir -p /opt && \
    cd /opt && \
    curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-hadoop2.6.tgz | \
    tar -zx && \
    ln -s spark-${SPARK_VER}-bin-hadoop2.6 spark

ADD log4j.properties /opt/spark/conf/log4j.properties
ADD start-common.sh start-worker start-master /
ADD core-site.xml /opt/spark/conf/core-site.xml
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf

ENV PATH $PATH:/opt/spark/bin
