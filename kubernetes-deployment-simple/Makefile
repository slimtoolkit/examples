EXAMPLE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include ${EXAMPLE_DIR}/_docker-slim.env
export


.PHONY:
kind-create-cluster:
	kind create cluster --name ${CLUSTER}

.PHONY:
kind-delete-cluster:
	kind delete cluster --name ${CLUSTER}

.PHONY:
fat-build:
	docker build -t dslimexamples/${IMAGE_NAME} ${EXAMPLE_DIR}/app

.PHONY:
fat-load:
	kind load docker-image --name ${CLUSTER} dslimexamples/${IMAGE_NAME}

.PHONY:
fat-run: export IMAGE=dslimexamples/${IMAGE_NAME}
fat-run: manifest
	kubectl apply -f ${EXAMPLE_DIR}/manifest.yaml

.PHONY:
fat-test: test

.PHONY:
fat-stop: stop

.PHONY:
slim-build-from-running-fat:
	docker-slim build \
		--tag dslimexamples/${IMAGE_NAME}.slim \
		--kube-config ${HOME}/.kube/config \
		--target-kube-workload deployment/${APP_NAME}
#		--http-probe=false \
#		--continue-after exec \
#		--exec 'curl localhost:${API_PORT}'

.PHONY:
slim-build-from-manifest: export IMAGE=dslimexamples/${IMAGE_NAME}
slim-build-from-manifest: manifest
	docker-slim build \
		--tag dslimexamples/${IMAGE_NAME}.slim \
		--kube-config ${HOME}/.kube/config \
		--target-kube-workload deployment/${APP_NAME} \
		--kube-manifests ${EXAMPLE_DIR}/manifest.yaml
#		--http-probe=false \
#		--continue-after exec \
#		--exec 'curl localhost:${API_PORT}'

.PHONY:
slim-load:
	kind load docker-image --name ${CLUSTER} dslimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-run: export IMAGE=dslimexamples/${IMAGE_NAME}.slim
slim-run: manifest
	kubectl apply -f ${EXAMPLE_DIR}/manifest.yaml

.PHONY:
slim-test: test

.PHONY:
slim-stop: stop

.PHONY:
show-app-pods:
	kubectl get pod -l app=${APP_NAME} -o yaml

.PHONY:
test:
	set -m; \
	kubectl port-forward `kubectl get pod -l app=${APP_NAME} -o name` ${API_PORT}:${API_PORT} & \
	curl -vvv --fail --connect-timeout 10 --max-time 10 --retry 10 --retry-delay 1 --retry-connrefused http://127.0.0.1:${API_PORT}${API_PATH}; \
	kill %1 \

.PHONY:
stop:
	kubectl delete -f ${EXAMPLE_DIR}/manifest.yaml

.PHONY:
manifest:
	cat ${EXAMPLE_DIR}/app/kubernetes/* | envsubst > ${EXAMPLE_DIR}/manifest.yaml

.PHONY:
delete-images:
	docker rmi dslimexamples/${IMAGE_NAME} || true
	docker rmi dslimexamples/${IMAGE_NAME}.slim || true

.PHONY:
clean: stop delete-images kind-delete-cluster
