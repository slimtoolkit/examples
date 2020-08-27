## Helper Scripts for DockerSlim Examples

This is a set of generic helper scripts to execute common container and `docker-slim`-related operations. The `mac` directory contains an additional set of `command` wrappers to make these helpers clickable on Mac OS X.

These helper scripts rely on a set of environment variables defined in the `_docker-slim.env` file (located in the parent directory).

### Basic Operations

* `build_fat.sh` - Builds a (fat/regular) Docker image for the project (Mac OS wrapper: `mac/build_fat.command`).
* `slim.sh` - Generates a slim/minified Docker image from an existing (fat/regular) Docker image created by `build_fat.sh` or manually (Mac OS wrapper: `mac/slim.command`).
* `slim_edit.sh` - Just like `slim.sh`, but with extra metadata editing flags
* `build_and_slim.sh` - This script shows how `docker-slim` can generate the fat and slim images based on your project's Dockerfile eliminating an extra `docker buld` step (Mac OS wrapper: `mac/build_and_slim.command`).
* `run_fat.sh` - Starts a container from the fat Docker image exposing the default port (1300) to the host environment (Mac OS wrapper: `mac/run_fat.command`).
* `run_slim.sh` - Starts a container from the slim Docker image exposing the default port (1300) to the host environment (Mac OS wrapper: `mac/run_slim.command`).
* `test.sh` - Sends an HTTP call to the exposed container port. Works the same for the fat and slim container instances (Mac OS wrapper: `mac/test.command`).

### Additional Operations

* `run_debug_sidecar.sh` - Starts a debugging sidecar container for your slim container instance. This debugging container is useful if there's no shell in your minified Docker image. (Mac OS wrapper: `mac/run_debug_sidecar.command`).
* `slim_with_shell_and_exe.sh` - This script shows how you can explicitly include/keep the shell (and an extra executable, `uname`) in your minified Docker image. (Mac OS wrapper: `mac/slim_with_shell_and_exe.command`).
* `exec_shell.sh` - Opens an interactive shell in the currently running fat or slim container (Mac OS wrapper: `mac/exec_shell.command`).
* `slim_dockerized.sh` - Shows how to run the `docker-slim` `build` command using the official `docker-slim` container image (Mac OS wrapper: `mac/slim_dockerized.command`).
* `slim_report_artifacts.sh` - Shows how to generate an additional container/build report and how to copy the build command metadata artifacts to the project's directory (Mac OS wrapper: `mac/slim_report_artifacts.command`).
* `slim_dbg.sh` - Shows how to enable debugging and how to get the temporary container's logs when running the `docker-slim` `build` commands (Mac OS wrapper: `mac/slim_dbg.command`).















