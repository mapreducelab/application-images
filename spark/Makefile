all: spark zeppelin
spark: build-spark push-spark clean-spark
zeppelin: build-zeppelin push-zeppelin
.PHONY: push build-spark push-spark clean-spark push-zeppelin zeppelin build-zeppelin

TAG = 2.3.1_v7
ZEPPELIN_TAG = 0.8.0_v2

build-spark:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG)

push-spark:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG)

clean-spark:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark || :

build-zeppelin:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin -f Dockerfile.zeppelin .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

push-zeppelin:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

clean-zeppelin:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin || :
