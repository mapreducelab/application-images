FROM centos:centos7.5.1804

ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1

RUN yum -y install java-1.8.0-openjdk which

WORKDIR /opt

# Get Spark without Hadoop.
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-hadoop2.7.tgz | \
    tar -zx && \
    ln -s spark-${SPARK_VER}-bin-hadoop2.7 spark

# Get Alluxio client library.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.7-bin.tar.gz | \
    tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.7 alluxio && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars/alluxio-${ALLUXIO_VER}-client.jar

ADD log4j.properties /opt/spark/conf/log4j.properties
ADD start-worker start-master /
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
ADD hive-site.xml $SPARK_HOME/conf

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV SPARK_HOME /opt/spark

ENV PATH $PATH:/opt/spark/bin