HACK_DIR=${EXAMPLE_DIR}/../hack

include ${HACK_DIR}/common.mk

DSLIM_EXTRA_BUILD_FLAGS ?=
DOCKER_RUN_MODE ?= --detach


.PHONY:
fat-build: EXPECTED_IMAGE_NAME=dslimexamples/${IMAGE_NAME}
fat-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_FAT_${ARCH}}
fat-build:
	@echo "${GREEN}Building Fat Image${RESET}"
	docker build -t dslimexamples/${IMAGE_NAME} ${EXAMPLE_DIR}
	$(print_validate_image_size)

.PHONY:
fat-push:
	@echo "${GREEN}Pushing Fat Image${RESET}"
	docker push dslimexamples/${IMAGE_NAME}

.PHONY:
fat-run:
	@echo "${GREEN}Running Fat Image${RESET}"
	docker run --rm ${DOCKER_RUN_MODE} --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} dslimexamples/${IMAGE_NAME}

.PHONY:
fat-run-interactive:
	@echo "${GREEN}Running Fat Image (interactive)${RESET}"
	docker run --rm -it --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} dslimexamples/${IMAGE_NAME}

.PHONY:
fat-run-interactive-shell:
	@echo "${GREEN}Running Fat Image (interactive shell)${RESET}"
	docker run --rm -it --security-opt seccomp=unconfined --publish ${API_PORT}:${API_PORT} --entrypoint ${SHELL_NAME} dslimexamples/${IMAGE_NAME}

.PHONY:
fat-validate:
	$(query-running-service)

.PHONY:
fat-stop:
	$(stop-container)

.PHONY:
slim-build: EXPECTED_IMAGE_NAME=dslimexamples/${IMAGE_NAME}.slim
slim-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_SLIM_${ARCH}}
slim-build:
	@echo "${GREEN}Building Slim Image${RESET}"
	docker-slim build ${DSLIM_EXTRA_BUILD_FLAGS} dslimexamples/${IMAGE_NAME}
	$(print_validate_image_size)

.PHONY:
slim-build-debug:
	@echo "${GREEN}Building Slim Image (debug mode)${RESET}"
	docker-slim --debug build ${DSLIM_EXTRA_BUILD_FLAGS} --show-clogs dslimexamples/${IMAGE_NAME}

.PHONY:
slim-build-dockerized:
	@echo "${GREEN}Building Slim Image (dockerized)${RESET}"
	docker run -it --rm --volume /var/run/docker.sock:/var/run/docker.sock dslim/docker-slim build ${DSLIM_EXTRA_BUILD_FLAGS} dslimexamples/${IMAGE_NAME}

.PHONY:
slim-build-from-dockerfile:
	@echo "${GREEN}Building Slim Image Using Fat Dockerfile${RESET}"
	docker-slim build ${DSLIM_EXTRA_BUILD_FLAGS} --dockerfile Dockerfile --tag-fat dslimexamples/${IMAGE_NAME} ${EXAMPLE_DIR}

.PHONY:
slim-build-with-shell-and-exe:
	@echo "${GREEN}Building Slim Image with Extra Shell and Exe${RESET}"
	docker-slim build ${DSLIM_EXTRA_BUILD_FLAGS} --include-shell --include-exe uname dslimexamples/${IMAGE_NAME}

.PHONY:
slim-build-artifacts:
	@echo "${GREEN}Building Slim Image and Saving Artifacts${RESET}"
	docker-slim --report ${IMAGE_NAME}.slim.report.json build ${DSLIM_EXTRA_BUILD_FLAGS} --copy-meta-artifacts ${EXAMPLE_DIR} dslimexamples/${IMAGE_NAME}

.PHONY:
slim-push:
	@echo "${GREEN}Pushing Slim Image${RESET}"
	docker push dslimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-run:
	@echo "${GREEN}Running Slim Image${RESET}"
	docker run --rm ${DOCKER_RUN_MODE} --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} dslimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-run-interactive:
	@echo "${GREEN}Running Slim Image (interactive)${RESET}"
	docker run --rm -it --publish ${API_PORT}:${API_PORT} --name ${CONTAINER_NAME} dslimexamples/${IMAGE_NAME}.slim

.PHONY:
slim-validate:
	$(query-running-service)

.PHONY:
slim-stop:
	$(stop-container)

.PHONY:
exec-shell:
	docker exec -it ${CONTAINER_NAME} ${SHELL_NAME}

.PHONY:
debug-sidecar:
	docker run --rm -it --pid=container:${CONTAINER_NAME} --net=container:${CONTAINER_NAME} --cap-add sys_admin alpine sh

.PHONY:
test-slim-build-web: fat-build fat-run fat-validate fat-stop slim-build slim-run slim-validate slim-stop clean

.PHONY:
test-slim-build-web-from-dockerfile: slim-build-from-dockerfile slim-run slim-validate slim-stop clean

.PHONY:
test-slim-build-cli: DOCKER_RUN_MODE=-i
test-slim-build-cli: fat-build fat-run slim-build slim-run clean

.PHONY:
test-slim-build-cli-from-dockerfile: DOCKER_RUN_MODE=-i
test-slim-build-cli-from-dockerfile: slim-build-from-dockerfile slim-run clean

.PHONY:
clean:
	@echo "${GREEN}Cleaning things up...${RESET}"
	docker rmi dslimexamples/${IMAGE_NAME} || true
	docker rmi dslimexamples/${IMAGE_NAME}.slim || true

define stop-container
	@echo "${GREEN}Stopping Container ${CONTAINER_NAME}${RESET}"
	docker stop ${CONTAINER_NAME} || true
endef
