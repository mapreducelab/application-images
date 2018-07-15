FROM centos:centos7.5.1804

ENV HADOOP_VER 2.7.6
ENV HIVE_VER 2.3.3
ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1

# "which" is used by Hive to find hadoop.
RUN yum -y install java-1.8.0-openjdk which

WORKDIR /opt
# Get Hadoop.
RUN curl http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz | \
    tar -zx && \
    ln -s hadoop-${HADOOP_VER} hadoop

# Get Hive.
RUN curl http://apache.claz.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz | \
    tar -zx && \
    ln -s apache-hive-${HIVE_VER}-bin hive

# Get Spark without Hadoop.
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-without-hadoop.tgz | \
    tar -zx && \
    ln -s spark-${SPARK_VER}-bin-without-hadoop spark && \
    cp spark-${SPARK_VER}-bin-without-hadoop/jars/* /opt/hive/lib/

# Get Alluxio client library.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.7-bin.tar.gz | \
    tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.7 alluxio && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars/alluxio-${ALLUXIO_VER}-client.jar && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/apache-hive-${HIVE_VER}-bin/lib/alluxio-${ALLUXIO_VER}-client.jar && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/alluxio-${ALLUXIO_VER}-client.jar


ADD log4j.properties /opt/spark/conf/log4j.properties
ADD start-common.sh start-worker start-master /
ADD core-site.xml /opt/spark/conf/core-site.xml
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV HADOOP_HOME /opt/hadoop
ENV SPARK_HOME /opt/spark
ENV HIVE_HOME /opt/hive
ENV SPARK_DIST_CLASSPATH "$HADOOP_HOME/etc/hadoop/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/tools/lib/*"

ADD hive-site.xml $SPARK_HOME/conf
ADD hive-site.xml $HIVE_HOME/conf

ENV PATH $PATH:/opt/spark/bin:/opt/hive/bin
