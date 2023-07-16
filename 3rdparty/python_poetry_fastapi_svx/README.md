## NOTES

This is a (slightly modified) copy of the https://github.com/svx/poetry-fastapi-docker project (Python, Poetry package manager and FastAPI). The project already has a manually optimized container image that's pretty small (171MB) relative to what you'd get with a simple Dockerfile. This example shows how `slim` can optimize the container image even further (making it more than `4 times smaller`).

When you are done you'll have a couple of images like this:

```
REPOSITORY                                              TAG                 IMAGE ID            CREATED             SIZE
dslimexamples/server-python-poetry-fastapi-svx.slim       latest              b9b8927d53c3        21 seconds ago      39.9MB
dslimexamples/server-python-poetry-fastapi-svx            latest              3c645607fa96        3 minutes ago       171MB
```

Use `make` (`make build_and_slim`) or the helper scripts directly (see the `.command` version for Mac OS if you like clicking :-)).

The `_slim.env` file declares the environment variables required by the `slim` helper scripts (in `_slim`). The helper scripts in `_slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_slim/README.md`](_slim/README.md) for more details.
