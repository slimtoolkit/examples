HACK_DIR ?= ${EXAMPLE_DIR}/../hack

include ${HACK_DIR}/common.mk

COMPOSE_FILE_FAT ?= ${EXAMPLE_DIR}/docker-compose.yaml
COMPOSE_FILE_SLIM ?= ${EXAMPLE_DIR}/docker-compose.slim.yaml


.PHONY:
fat-build: EXPECTED_IMAGE_NAME=dslimexamples/${IMAGE_NAME}
fat-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_FAT_${ARCH}}
fat-build:
	@echo "${GREEN}Building Fat Image${RESET}"
	docker compose -f ${COMPOSE_FILE_FAT} build
	$(print_validate_image_size)

.PHONY:
fat-run:
	@echo "${GREEN}Running Fat Compose File${RESET}"
	docker compose -f ${COMPOSE_FILE_FAT} up --detach --wait

.PHONY:
fat-validate:
	$(query-running-service)

.PHONY:
fat-stop:
	@echo "${GREEN}Stopping Fat Compose${RESET}"
	docker compose -f ${COMPOSE_FILE_FAT} stop

.PHONY:
dep-run:
	@echo "${GREEN}Running Dependencies Only${RESET}"
	docker compose -f ${COMPOSE_FILE_FAT} up --detach --wait ${COMPOSE_DEPENDENCY_SVC}

.PHONY:
slim-build: EXPECTED_IMAGE_NAME=dslimexamples/${IMAGE_NAME}.slim
slim-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_SLIM_${ARCH}}
slim-build:
	@echo "${GREEN}Building Slim Image${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} build ${DSLIM_EXTRA_BUILD_FLAGS} dslimexamples/${IMAGE_NAME}
	$(print_validate_image_size)

.PHONY:
slim-build-compose: EXPECTED_IMAGE_NAME=dslimexamples/${IMAGE_NAME}.slim
slim-build-compose: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_SLIM_${ARCH}}
slim-build-compose:
	@echo "${GREEN}Building Slim Image From Compose File${RESET}"
	docker-slim ${DSLIM_EXTRA_FLAGS} build ${DSLIM_EXTRA_BUILD_FLAGS} --target-compose-svc ${COMPOSE_TARGET_SVC} --compose-file ${COMPOSE_FILE_FAT}
	$(print_validate_image_size)

.PHONY:
slim-run:
	@echo "${GREEN}Running Slim Compose File${RESET}"
	docker compose -f ${COMPOSE_FILE_SLIM} up --detach --wait

.PHONY:
slim-validate:
	$(query-running-service)

.PHONY:
slim-stop:
	@echo "${GREEN}Stopping Slim Compose${RESET}"
	docker compose -f ${COMPOSE_FILE_SLIM} stop

.PHONY:
test-slim-build: _TEST_MSG = Slimming Image With Compose Dependencies
test-slim-build: fat-build fat-run fat-validate fat-stop dep-run slim-build slim-run slim-validate slim-stop clean

.PHONY:
test-slim-build-compose: _TEST_MSG = Slimming Image Using Compose File
test-slim-build-compose: fat-build fat-run fat-validate fat-stop slim-build-compose slim-run slim-validate slim-stop clean

.PHONY:
clean:
	@echo "${GREEN}Cleaning things up${RESET}"
	docker compose -f ${COMPOSE_FILE_FAT} down --rmi all
	docker compose -f ${COMPOSE_FILE_SLIM} down --rmi all
