HACK_DIR ?= ${EXAMPLE_DIR}/../hack

include ${HACK_DIR}/common.mk


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
slim-build: EXPECTED_IMAGE_NAME=dslimexamples/${IMAGE_NAME}.slim
slim-build: EXPECTED_IMAGE_SIZE=${EXPECTED_IMAGE_SIZE_SLIM_${ARCH}}
slim-build:
	@echo "${GREEN}Building Slim Image${RESET}"
	docker-slim build --target-compose-svc web --compose-file ${COMPOSE_FILE_FAT} --show-clogs
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
test-slim-build: fat-build fat-run fat-validate fat-stop slim-build slim-run slim-validate slim-stop clean

.PHONY:
clean:
	@echo "${GREEN}Cleaning things up${RESET}"
	docker compose -f ${COMPOSE_FILE_FAT} down --rmi all
	docker compose -f ${COMPOSE_FILE_SLIM} down --rmi all
