## NOTES

This is a (slightly modified) copy of the official [fastapi docs example](https://fastapi.tiangolo.com/deployment/docker/) showing how `slim` can optimize the container image (making it 24 times smaller) using the example `as-is` without any advanced Docker tricks.

When you are done you'll have a couple of images like this:

```
REPOSITORY                                              TAG                 IMAGE ID            CREATED             SIZE
dslimexamples/server-python-fastapi-official.slim       latest              89b2ea48aead        21 seconds ago      41.5MB
dslimexamples/server-python-fastapi-official            latest              b6cba3eb549b        3 minutes ago       1.02GB
```

Use `make` (`make build_and_slim`) or the helper scripts directly (see the `.command` version for Mac OS if you like clicking :-)).

The `_slim.env` file declares the environment variables required by the `docker-slim` helper scripts (in `_slim`). The helper scripts in `_slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_slim/README.md`](_slim/README.md) for more details.
