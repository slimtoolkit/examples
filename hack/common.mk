ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

ARCH ?= $(shell uname -m)

# Common example parameters - overridden by _docker-slim.env files.
API_PROTO ?= HTTP  # Case-sensetive. Supported protos: HTTP, HTTP2, FastCGI
API_HOST ?= 127.0.0.1
API_PORT ?= 1300
API_PATH ?= /
SHELL_NAME ?= bash
EXE_NAME ?= uname
DSLIM_EXTRA_FLAGS ?=
DSLIM_BUILD_EXTRA_FLAGS ?=

# Private parameters
ifeq (${API_PROTO},HTTP2)
_CURL_PROTO = https
_CURL_EXTRA_FLAGS = --http2 --insecure
else
_CURL_PROTO = http
endif

ifeq (${API_PROTO},FastCGI)

# FastCGI probe
define query-running-service
# TODO: The `docker-slim probe` command is actually NOOP at the moment.
@docker-slim probe ${API_HOST}:${API_PORT}/${API_PATH}
endef

else

# HTTP probe
define query-running-service
@echo "${GREEN}Validating Container ${CONTAINER_NAME}${RESET}"
@for i in 1 2 3 ; do \
    echo "Attempt $$i"; \
    if curl -vvv --fail --connect-timeout 10 --max-time 10 --retry 10 --retry-delay 1 --retry-connrefused ${_CURL_EXTRA_FLAGS} ${_CURL_PROTO}://${API_HOST}:${API_PORT}${API_PATH}; then \
        echo "${GREEN}Passed!${RESET}"; \
        break; \
    fi; \
    if [ "$$i" = "3" ]; then \
        echo "${RED}Failed!${RESET}"; \
        exit 1; \
    fi; \
    echo "Zzz..."; \
    sleep 5; \
done
endef

endif

define assert_image_size
@echo "${GREEN}Checking Image ${EXPECTED_IMAGE_NAME}..."
@${HACK_DIR}/assert-image-size.sh
@printf "${RESET}"
endef


.PHONY:
_say-test:
	@echo "${PURPLE}TEST: ${_TEST_MSG}${RESET}"
