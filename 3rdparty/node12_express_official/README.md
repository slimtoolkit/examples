## NOTES

This is a (slightly modified) copy of the official [node.js/express.js example](https://nodejs.org/en/docs/guides/nodejs-docker-webapp) showing how `docker-slim` can optimize the container image (making it 17 times smaller) using the example `as-is` without any advanced Docker tricks.

When you are done you'll have a couple of images like this:

```
REPOSITORY                                              TAG                 IMAGE ID            CREATED             SIZE
dslimexamples/server-node12-express-official.slim       latest              8bad385d288a        21 seconds ago      52.1MB
dslimexamples/server-node12-express-official            latest              b81781417db0        3 minutes ago       919MB
```

Use `make` (`make build_and_slim`) or the helper scripts directly (see the `.command` version for Mac OS if you like clicking :-)).

The `_docker-slim.env` file declares the environment variables required by the `docker-slim` helper scripts (in `_docker-slim`). The helper scripts in `_docker-slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_docker-slim/README.md`](_docker-slim/README.md) for more details.
