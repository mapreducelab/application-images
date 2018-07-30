FROM apache/zeppelin:0.8.0

ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1
ENV HIVE_VER 2.3.3

WORKDIR /opt

# For development
RUN apt-get -y install vim

# Get Spark with Hadoop.
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-hadoop2.7.tgz | tar -zx && \
    ln -s spark-${SPARK_VER}-bin-hadoop2.7 spark

# Get Alluxio client library.
RUN curl http://downloads.alluxio.org/downloads/files/${ALLUXIO_VER}/alluxio-${ALLUXIO_VER}-hadoop-2.7-bin.tar.gz | tar -zx && \
    ln -s alluxio-${ALLUXIO_VER}-hadoop-2.7 alluxio && \
    cp alluxio-${ALLUXIO_VER}-hadoop-2.7/client/alluxio-${ALLUXIO_VER}-client.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars

# Get spark cassandra connector
RUN curl http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.3.1/spark-cassandra-connector_2.11-2.3.1.jar -o spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars && \
    cp spark-cassandra-connector_2.11-2.3.1.jar ${Z_HOME}/lib

# Get OJDBS
RUN curl https://art-hq.intranet.qualys.com/artifactory/dev-common/ojdbc8-full.tar | tar -x && \
    cp OJDBC8-Full/ojdbc8.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars && \
    cp OJDBC8-Full/ojdbc8.jar ${Z_HOME}/lib


# Get Hive.
RUN curl http://apache.claz.org/hive/hive-${HIVE_VER}/apache-hive-${HIVE_VER}-bin.tar.gz | tar -zx && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-metadata-storage-0.9.2.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-9.4.1208.jre7.jar /opt/spark-${SPARK_VER}-bin-hadoop2.7/jars && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-metadata-storage-0.9.2.jar ${Z_HOME}/lib && \
    cp apache-hive-${HIVE_VER}-bin/lib/postgresql-9.4.1208.jre7.jar ${Z_HOME}/lib && \
    rm -rf apache-hive-${HIVE_VER}-bin

# Get HIVE JDBC from Amazon
RUN curl -o hive_jdbc.zip http://awssupportdatasvcs.com/bootstrap-actions/Simba/AmazonHiveJDBC-1.0.9.1060.zip && \
    unzip -a hive_jdbc.zip -d hive_jdbc && \
    unzip -a hive_jdbc/AmazonHiveJDBC41-1.0.9.1060.zip -d hive_jdbc41 && \
    cp -r hive_jdbc41/* ${Z_HOME}/lib

# Get hive-jdbc 3.0.0
RUN curl -o ${Z_HOME}/lib/hive-jdbc-3.0.0.jar http://central.maven.org/maven2/org/apache/hive/hive-jdbc/3.0.0/hive-jdbc-3.0.0.jar && \
    curl -o ${Z_HOME}/lib/hive-metastore-3.0.0.jar http://central.maven.org/maven2/org/apache/hive/hive-metastore/3.0.0/hive-metastore-3.0.0.jar && \
    curl -o ${Z_HOME}/lib/hive-service-3.0.0.jar http://central.maven.org/maven2/org/apache/hive/hive-service/3.0.0/hive-service-3.0.0.jar && \
    curl -o ${Z_HOME}/lib/hive-service-rpc-3.0.0.jar http://central.maven.org/maven2/org/apache/hive/hive-service-rpc/3.0.0/hive-service-rpc-3.0.0.jar && \
    curl -o ${Z_HOME}/lib/commons-cli-1.4.jar http://central.maven.org/maven2/commons-cli/commons-cli/1.4/commons-cli-1.4.jar

# Get config
COPY zeppelin-site.xml ${Z_HOME}/conf
COPY interpreter-list ${Z_HOME}/conf
COPY interpreter.json ${Z_HOME}/conf

ENV SPARK_HOME /opt/spark

ADD log4j.properties /opt/spark/conf/log4j.properties
ADD hive-site.xml $SPARK_HOME/conf

ENV PATH $PATH:/opt/spark/bin

WORKDIR ${Z_HOME}
