all: spark
spark: build-spark push-spark clean-spark
.PHONY: push build-spark push-spark clean-spark

SPARK_TAG = 0.1.18

build-spark:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(SPARK_TAG)

push-spark:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(SPARK_TAG)

clean-spark:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(SPARK_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark || :
