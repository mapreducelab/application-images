FROM apache/zeppelin:0.8.0

ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1

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

ENV SPARK_HOME /opt/spark

ADD log4j.properties /opt/spark/conf/log4j.properties
ADD hive-site.xml $SPARK_HOME/conf

ENV PATH $PATH:/opt/spark/bin

WORKDIR ${Z_HOME}