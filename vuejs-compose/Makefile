EXAMPLE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include ${EXAMPLE_DIR}/_docker-slim.env
export


.PHONY:
default: fat-build slim-build-compose slim-run slim-validate

.PHONY:
test-e2e:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-compose


include ${EXAMPLE_DIR}/../hack/rules-docker-compose.mk
