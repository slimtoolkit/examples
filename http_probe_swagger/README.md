# Node.js Web Service with an OpenAPI/Swagger spec

This is a more advanced example that shows how to use the swagger/openapi API spec based application probing (`--http-probe-apispec` flag) and http crawling for the built-in Swagger UI (`--http-probe-cmd` flag).

This Node.js application is built using `fastify` (for the API) and `fastify-swagger` (to generate a swagger/openapi spec and to expose a built-in Swagger UI).

The optimized image will be around 17 times smaller than the original container image. When you are done you'll have a couple of images like this:

```sh
REPOSITORY                                              TAG                 IMAGE ID            CREATED             SIZE
dslimexamples/server-node-fastify-swagger-standard.slim     latest              231f858fa2b6        21 seconds ago      54.4MB
dslimexamples/server-node-fastify-swagger-standard          latest              44d183c56b55        3 minutes ago       936MB
```

Commands:

```sh
make                                # run example (semi-automatic)

make fat-build                      # build the "fat" version of the image
make fat-run                        # run the web service using the "fat" image
make fat-validate                   # send a request to the running web service
make fat-stop                       # stop the running web service

make slim-build                     # turn the "fat" image into a "slim" one
make slim-run                       # run the web service using the "slim" image
make slim-validate                  # send a request to the running web service
make slim-stop                      # stop the running web service

make slim-build-from-dockerfile     # build the "slim" version of the image using the "fat" Dockerfile

make debug-sidecar                  # run a debug sidecar container with an interactive shell

make test-e2e                       # run the acceptance test suite
make clean                          # remove all artifacts created by this example
```

See also:

- `_docker-slim.env` - example params (image name, container name, `docker-slim` flags, etc.)
- `_macos/` - additional `.command` wrappers to make the main actions clickable on macOS.
