FROM centos:centos7.5.1804

ENV HADOOP_VER 2.7.6
ENV HIVE_VER 2.3.3
ENV ALLUXIO_VER 1.7.1

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

# Get Alluxio client library.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.7-bin.tar.gz | \
    tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.7 alluxio && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/apache-hive-${HIVE_VER}-bin/lib/alluxio-${ALLUXIO_VER}-client.jar && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/alluxio-${ALLUXIO_VER}-client.jar

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV HIVE_HOME /opt/hive
ENV HADOOP_HOME /opt/hadoop
ENV PATH $PATH:/opt/hive/bin

COPY hive-site.xml $HIVE_HOME/conf

CMD ["hiveserver2"]
