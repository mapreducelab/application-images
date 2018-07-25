FROM centos:centos7.5.1804

ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1
ENV HIVE_VER 2.3.3

RUN yum -y install java-1.8.0-openjdk which

WORKDIR /opt

# Get Spark with Hadoop.
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-hadoop2.7.tgz | tar -zx && \
    ln -s spark-${SPARK_VER}-bin-hadoop2.7 spark

# Get Alluxio client library.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.7-bin.tar.gz | tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.7 alluxio && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars/alluxio-${ALLUXIO_VER}-client.jar

# Get spark cassandra connector
RUN curl http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.3.1/spark-cassandra-connector_2.11-2.3.1.jar -o spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars/spark-cassandra-connector_2.11-2.3.1.jar

# Get OJDBS
RUN curl https://art-hq.intranet.qualys.com/artifactory/dev-common/ojdbc8-full.tar | tar -x && \
    cp OJDBC8-Full/ojdbc8.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars/ojdbc8.jar

# Get Hive.
RUN curl http://apache.claz.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz | tar -zx && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-metadata-storage-0.9.2.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-9.4.1208.jre7.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars && \
    rm -rf apache-hive-${HIVE_VER}-bin

ENV SPARK_HOME /opt/spark

ADD log4j.properties /opt/spark/conf/log4j.properties
ADD start-worker start-master /
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
ADD hive-site.xml $SPARK_HOME/conf

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk

ENV PATH $PATH:/opt/spark/bin
