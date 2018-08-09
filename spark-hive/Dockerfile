FROM centos:centos7.5.1804

ENV ALLUXIO_VER 1.7.1
ENV SPARK_VER 2.3.1
ENV HIVE_VER 3.1.0

RUN yum -y install epel-release && \
    yum install -y R git java-1.8.0-openjdk-devel which wget && \
    wget http://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.rpm && \
    yum -y install scala-2.11.12.rpm

ENV JAVA_HOME /usr/lib/jvm/jre-1.8.0-openjdk
ENV R_HOME /usr/lib64/R

WORKDIR /opt

# Get Spark SOURCE with Hadoop and Hive.
RUN git clone https://github.com/apache/spark.git \
    /opt/spark/dev/make-distribution.sh --name custom-spark --pip --r --tgz -Psparkr -Phadoop-2.7 -Dhadoop.version=2.7.3 -Phive-2.3 -Pkubernetes -DskipTests clean

