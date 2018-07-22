FROM apache/zeppelin:0.8.0

ENV HADOOP_VER 2.7.6
ENV SPARK_VER 2.3.1

WORKDIR /opt
# Get Hadoop.
RUN curl http://apache.claz.org/hadoop/common/hadoop-${HADOOP_VER}/hadoop-${HADOOP_VER}.tar.gz | tar -zx && \
    ln -s hadoop-${HADOOP_VER} hadoop

# Get Spark without Hadoop.
RUN curl http://apache.claz.org/spark/spark-${SPARK_VER}/spark-${SPARK_VER}-bin-without-hadoop.tgz | tar -zx && \
    ln -s spark-${SPARK_VER}-bin-without-hadoop spark

# Get spark cassandra connector
RUN curl http://central.maven.org/maven2/com/datastax/spark/spark-cassandra-connector_2.11/2.3.1/spark-cassandra-connector_2.11-2.3.1.jar -o spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars/spark-cassandra-connector_2.11-2.3.1.jar && \
    cp spark-cassandra-connector_2.11-2.3.1.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/spark-cassandra-connector_2.11-2.3.1.jar

# Get OJDBS
RUN curl https://art-hq.intranet.qualys.com/artifactory/dev-common/ojdbc8-full.tar | tar -x && \
    cp OJDBC8-Full/ojdbc8.jar /opt/spark-${SPARK_VER}-bin-without-hadoop/jars/ojdbc8.jar && \
    cp OJDBC8-Full/ojdbc8.jar /opt/hadoop-${HADOOP_VER}/share/hadoop/common/ojdbc8.jar

ENV HADOOP_HOME /opt/hadoop
ENV SPARK_HOME /opt/spark
ENV SPARK_DIST_CLASSPATH "$HADOOP_HOME/etc/hadoop/*:$HADOOP_HOME/share/hadoop/common/lib/*:$HADOOP_HOME/share/hadoop/common/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/hdfs/lib/*:$HADOOP_HOME/share/hadoop/hdfs/*:$HADOOP_HOME/share/hadoop/yarn/lib/*:$HADOOP_HOME/share/hadoop/yarn/*:$HADOOP_HOME/share/hadoop/mapreduce/lib/*:$HADOOP_HOME/share/hadoop/mapreduce/*:$HADOOP_HOME/share/hadoop/tools/lib/*"

ENV PATH $PATH:/opt/spark/bin

WORKDIR ${Z_HOME}