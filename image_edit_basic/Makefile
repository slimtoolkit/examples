EXAMPLE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

include ${EXAMPLE_DIR}/_docker-slim.env
export


.PHONY:
default: fat-build slim-build slim-run slim-validate

.PHONY:
test-e2e:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-slim-build-web
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) test-image-edit

# TODO: test env vars and volumes
.PHONY:
test-image-edit:
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) fat-build
	IMAGE=dslimexamples/${IMAGE_NAME} LABEL=test_keep VALUE=keep ${HACK_DIR}/assert-image-label.sh
	IMAGE=dslimexamples/${IMAGE_NAME} LABEL=test_remove VALUE=remove ${HACK_DIR}/assert-image-label.sh
	IMAGE=dslimexamples/${IMAGE_NAME} LABEL=test_add VALUE= ${HACK_DIR}/assert-image-label.sh
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) slim-build
	IMAGE=dslimexamples/${IMAGE_NAME}.slim LABEL=test_keep VALUE=keep ${HACK_DIR}/assert-image-label.sh
	IMAGE=dslimexamples/${IMAGE_NAME}.slim LABEL=test_remove VALUE= ${HACK_DIR}/assert-image-label.sh
	IMAGE=dslimexamples/${IMAGE_NAME}.slim LABEL=test_add VALUE=add ${HACK_DIR}/assert-image-label.sh
	${MAKE} -f $(realpath $(firstword $(MAKEFILE_LIST))) clean


include ${EXAMPLE_DIR}/../hack/rules-docker-classic.mk
