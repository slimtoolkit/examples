## NOTES

This is a (slightly modified) copy of the [websocket node.js example](https://github.com/heroku-examples/node-websockets). It shows how to use the `--http-probe-cmd` flag for websocket probing.

Use `make` (`make build_and_slim`) or the helper scripts directly (see the `.command` version for Mac OS if you like clicking :-)).

The `_docker-slim.env` file declares the environment variables required by the `docker-slim` helper scripts (in `_docker-slim`). The helper scripts in `_docker-slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_docker-slim/README.md`](_docker-slim/README.md) for more details.
