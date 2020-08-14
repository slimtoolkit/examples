## NOTES

This is a more advanced example that shows how to use the swagger/openapi API spec based application probing (`--http-probe-apispec` flag) and http crawling for the built-in Swagger UI (`--http-probe-cmd` flag).

This node service application is built using `fastify` (for the API) and `fastify-swagger` (to generate a swagger/openapi spec and to expose a built-in Swagger UI).

The `_docker-slim.env` file declares the environment variables required by the `docker-slim` helper scripts (in `_docker-slim`). The helper scripts in `_docker-slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_docker-slim/README.md`](_docker-slim/README.md) for more details.
