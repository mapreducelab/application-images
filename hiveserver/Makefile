all: hiveserver
hiveserver: build-hiveserver push-hiveserver clean-hiveserver
.PHONY: build-hiveserver push-hiveserver clean-hiveserver

HIVESERVER_TAG = 0.1.23

build-hiveserver:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver:$(HIVESERVER_TAG)

push-hiveserver:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver:$(HIVESERVER_TAG)

clean-hiveserver:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver:$(HIVESERVER_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/hiveserver || :
