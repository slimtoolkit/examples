# Service with a Redis Data Store - an Example of Minifying Images with Dependencies

## Overview

DockerSlim relies on dynamic analysis to minify Docker images. Most real world services require additional dependencies to function properly. This is a simplified example where a service has a dependency on Redis. The provided Docker Compose file (`docker-compose.yaml`) starts the service along with its dependency.

The example shows how DockerSlim can connect to the default network created by Docker Compose when it's minifying the target service image. You need to make sure the dependencies are up and running before you try to minify the target service. This can be done by telling Docker Compose to start specific components declared in the Docker Compose file similar to how it's done in the `make dep-run` helper command.

Make sure to pass the appropriate network name to DockerSlim if your Docker Compose file defines a custom network you (using the `--network` parameter).

Commands:

```sh
make                             # run example (semi-automatic)

make fat-build                   # build the "fat" version of the image
make fat-run                     # run the compose file using the "fat" image
make fat-validate                # send a request to the running web service
make fat-stop                    # stop the running web service

make dep-run                     # run all but the target service from the docker-compose file
                                 # (prerequisite for the `make slim-build` command)

make slim-build                  # turn the "fat" image into a "slim" one using docker-compose file
make slim-run                    # run the compose file using the "slim" image
make slim-validate               # send a request to the running web service
make slim-stop                   # stop the running web service

make test-e2e                    # run the acceptance test suite
make clean                       # remove all artifacts created by this example
```

See also:

- `_docker-slim.env` - example params (image name, network name, `docker-slim` flags, etc.)
- `_macos/` - additional `.command` wrappers to make the main actions clickable on macOS.
