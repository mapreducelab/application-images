FROM centos:centos7.5.1804

ENV HADOOP_VER 2.9.1
ENV HIVE_VER 3.1.0
ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1

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
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-without-hadoop.tgz | tar -zx && \
    ln -s spark-${SPARK_VER}-bin-without-hadoop spark && \
    cp spark-${SPARK_VER}-bin-without-hadoop/jars/* /opt/hive/lib/

# Get Alluxio client library.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.7-bin.tar.gz | \
    tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.7 alluxio && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars/alluxio-${ALLUXIO_VER}-client.jar && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/apache-hive-${HIVE_VER}-bin/lib/alluxio-${ALLUXIO_VER}-client.jar && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/alluxio-${ALLUXIO_VER}-client.jar

# Get spark cassandra connector
RUN curl http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.3.1/spark-cassandra-connector_2.11-2.3.1.jar -o spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars/spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/spark-cassandra-connector_2.11-2.3.1.jar

# Get OJDBS
RUN curl https://art-hq.intranet.qualys.com/artifactory/dev-common/ojdbc8-full.tar | tar -x && \
    cp OJDBC8-Full/ojdbc8.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars/ojdbc8.jar && \
    cp OJDBC8-Full/ojdbc8.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/ojdbc8.jar

# Get Tez
RUN curl -o apache-hive-${HIVE_VER}-bin/lib/tez-api-0.9.1.jar http://central.maven.org/maven2/org/apache/tez/tez-api/0.9.1/tez-api-0.9.1.jar && \
    curl -o apache-hive-${HIVE_VER}-bin/lib/tez-dag-0.9.1.jar http://central.maven.org/maven2/org/apache/tez/tez-dag/0.9.1/tez-dag-0.9.1.jar

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV HIVE_HOME /opt/hive
ENV SPARK_HOME /opt/spark
ENV HADOOP_HOME /opt/hadoop
ENV PATH $PATH:/opt/hive/bin:/opt/spark/bin
ENV SPARK_DIST_CLASSPATH "$HADOOP_HOME/etc/hadoop/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/tools/lib/*"

COPY hive-site.xml $HIVE_HOME/conf
COPY hive-site.xml $SPARK_HOME/conf

CMD ["hiveserver2"]
