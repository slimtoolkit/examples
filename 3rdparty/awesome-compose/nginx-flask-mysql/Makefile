EXAMPLE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
HACK_DIR ?= ${EXAMPLE_DIR}/../../../hack

include ${EXAMPLE_DIR}/_docker-slim.env
export


.PHONY:
default: fat-build slim-build-pull-compose slim-run slim-validate

.PHONY:
test-e2e:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-compose


include ${EXAMPLE_DIR}/../../../hack/rules-docker-compose.mk
