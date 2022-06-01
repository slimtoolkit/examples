EXAMPLE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include ${EXAMPLE_DIR}/_docker-slim.env
export


.PHONY:
default: fat-build slim-build slim-run-interactive

.PHONY:
test-e2e:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-cli
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-cli-from-dockerfile


include ${EXAMPLE_DIR}/../hack/rules-docker-classic.mk
