all: zeppelin
zeppelin: build-zeppelin push-zeppelin
.PHONY: zeppelin build-zeppelin push-zeppelin clean-zeppelin

ZEPPELIN_TAG = 0.1.12

build-zeppelin:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

push-zeppelin:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

clean-zeppelin:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin || :
