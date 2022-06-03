EXAMPLE_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
HACK_DIR := ${EXAMPLE_DIR}/../../hack

include ${EXAMPLE_DIR}/_docker-slim.env
export


.PHONY:
default: fat-build slim-build slim-run slim-validate

.PHONY:
test-e2e:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-web
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-web-from-dockerfile


include ${HACK_DIR}/rules-docker-classic.mk
