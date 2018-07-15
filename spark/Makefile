all: spark zeppelin
spark: build-spark push-spark clean-spark
.PHONY: push build-spark push-spark clean-spark push-zeppelin zeppelin zeppelin-build

# To bump the Spark version, bump the spark_ver in Dockerfile, bump
# this tag and reset to v1. You should also double check the native
# Hadoop libs at that point (we grab the 2.6.1 libs, which are
# appropriate for 1.5.2-with-2.6). Note that you'll need to re-test
# Zeppelin (and it may not have caught up to newest Spark).
TAG = 2.3.1_v7

# To bump the Zeppelin version, bump the version in
# zeppelin/Dockerfile and bump this tag and reset to v1.
ZEPPELIN_TAG = v0.5.6_v1

build-spark:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark .
	docker tag art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG)

push-spark:
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG)

clean-spark:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark || :

# This target is useful when needing to use an unreleased version of Zeppelin
zeppelin-build:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin-build zeppelin-build
	docker tag -f art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin-build art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin-build:$(ZEPPELIN_TAG)

zeppelin:
	docker build -t art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin zeppelin
	docker tag -f art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

push-zeppelin: zeppelin
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin
	docker push art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG)

clean:
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark:$(TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/spark || :

	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin:$(ZEPPELIN_TAG) || :
	docker rmi art-hq.intranet.qualys.com:5001/k8s.gcr.io/zeppelin || :
