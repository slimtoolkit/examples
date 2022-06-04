# Node.js Express Web Service using standard `node` image

Commands:

```sh
make                             # run example (semi-automatic)

make fat-build                   # build the "fat" version of the image
make fat-run                     # run the web service using the "fat" image
make fat-validate                # send a request to the running web service
make fat-stop                    # stop the running web service

make slim-build                  # turn the "fat" image into a "slim" one
make slim-run                    # run the web service using the "slim" image
make slim-validate               # send a request to the running web service
make slim-stop                   # stop the running web service

make slim-build-from-dockerfile  # build the "slim" version of the image using the "fat" Dockerfile

make debug-sidecar               # run a debug sidecar container with an interactive shell

make test-e2e                    # run the acceptance test suite
make clean                       # remove all artifacts created by this example
```

See also:

- `_docker-slim.env` - example params (image name, container name, `docker-slim` flags, etc.)
- `_macos/` - additional `.command` wrappers to make the main actions clickable on macOS.
