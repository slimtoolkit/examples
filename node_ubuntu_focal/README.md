# Node application on Ubuntu Linux

Commands:

```sh
make                             # run example (semi-automatic)

make fat-build                   # build the "fat" version of the image
make fat-run-interactive         # run the CLI app using the "fat" image

make slim-build                  # turn the "fat" image into a "slim" one
make slim-run-interactive        # run the CLI app using the "slim" image

make slim-build-from-dockerfile  # build the "slim" version of the image using the "fat" Dockerfile

make test-e2e                    # run the acceptance test suite
make clean                       # remove all artifacts created by this example
```

See also:

- `_docker-slim.env` - example params (image name, container name, `docker-slim` flags, etc.)
- `_macos/` - additional `.command` wrappers to make the main actions clickable on macOS.
