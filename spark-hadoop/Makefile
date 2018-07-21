all: spark
spark: build-spark push-spark clean-spark
.PHONY: build-spark push-spark clean-spark

SPARK_TAG = 0.1.6

# Spark with Hadoop and Hive 1.2.1
build-spark:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop:$(SPARK_TAG)

push-spark:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop:$(SPARK_TAG)

clean-spark:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop:$(SPARK_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark-hadoop || :
