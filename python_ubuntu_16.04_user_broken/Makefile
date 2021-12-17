default: build_fat

build_fat:
	'$(CURDIR)/_docker-slim/build_fat.sh'

slim:
	'$(CURDIR)/_docker-slim/slim.sh'

slim_dockerized:
	'$(CURDIR)/_docker-slim/slim_dockerized.sh'

run_fat:
	'$(CURDIR)/_docker-slim/run_fat.sh'

run_slim:
	'$(CURDIR)/_docker-slim/run_slim.sh'

test:
	'$(CURDIR)/_docker-slim/test.sh'

stop:
	'$(CURDIR)/_docker-slim/stop.sh'

cleanup:
	'$(CURDIR)/_docker-slim/cleanup.sh'

run_debug_sidecar:
	'$(CURDIR)/_docker-slim/run_debug_sidecar.sh'

exec_shell:
	'$(CURDIR)/_docker-slim/exec_shell.sh'

build_and_slim:
	'$(CURDIR)/_docker-slim/build_and_slim.sh'

.PHONY: default build_fat slim slim_dockerized run_fat run_slim test stop cleanup run_debug_sidecar exec_shell build_and_slim
