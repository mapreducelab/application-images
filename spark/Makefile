all: spark zeppelin
spark: build-spark push-spark clean-spark
spark-hadoop: build-spark-hadoop push-spark-hadoop clean-spark-hadoop
zeppelin: build-zeppelin push-zeppelin
.PHONY: push build-spark push-spark clean-spark push-zeppelin zeppelin build-zeppelin build-spark-hadoop push-spark-hadoop clean-spark-hadoop

SPARK_TAG = 0.1.0
SPARK_HADOOP_TAG = 0.1.1
ZEPPELIN_TAG = 0.1.0

# Spark without Hadoop
build-spark:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark -f Dockerfile.spark .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(SPARK_TAG)

push-spark:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(SPARK_TAG)

clean-spark:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(SPARK_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark || :

# Spark with Hadoop and Hive 1.2.1
build-spark-hadoop:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop -f Dockerfile.spark-hadoop .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop:$(SPARK_HADOOP_TAG)

push-spark-hadoop:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop:$(SPARK_HADOOP_TAG)

clean-spark-hadoop:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop:$(SPARK_HADOOP_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop || :

# Zeppelin
build-zeppelin:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin -f Dockerfile.zeppelin .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

push-zeppelin:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

clean-zeppelin:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin || :
