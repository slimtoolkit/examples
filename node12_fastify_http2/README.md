## NOTES

This is a more advanced example that shows how to use the swagger/openapi API spec based application probing (`--http-probe-apispec` flag) and http crawling for the built-in Swagger UI (`--http-probe-cmd` flag).

This node.js application is built using `fastify` (for the API) and `fastify-swagger` (to generate a swagger/openapi spec and to expose a built-in Swagger UI).

Use `make` (see `Makefile` for the available targets) or the helper scripts directly (see the `.command` version for Mac OS if you like clicking :-)). The optimized image will be around 17 times smaller than the original container image. When you are done you'll have a couple of images like this:

```
REPOSITORY                                              TAG                 IMAGE ID            CREATED             SIZE
dslimexamples/server-node12-fastify-swagger-standard.slim     latest              231f858fa2b6        21 seconds ago      54.4MB
dslimexamples/server-node12-fastify-swagger-standard          latest              44d183c56b55        3 minutes ago       936MB
```

The `_docker-slim.env` file declares the environment variables required by the `docker-slim` helper scripts (in `_docker-slim`). The helper scripts in `_docker-slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_docker-slim/README.md`](_docker-slim/README.md) for more details.
