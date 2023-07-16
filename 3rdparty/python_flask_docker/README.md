## NOTES

This is a (slightly modified) copy of the official [Docker Python example](https://docs.docker.com/language/python/build-images/) showing how `slim` can optimize the container image (making it more than `5 times smaller`) using the example `as-is` without any advanced Docker tricks. The original image uses an already small slim(-buster) python base image as a starting point.

When you are done you'll have a couple of images like this:

```
REPOSITORY                                              TAG                 IMAGE ID            CREATED             SIZE
dslimexamples/server-python-flask-docker.slim       latest              ce9310bdf48b        21 seconds ago      24.2MB
dslimexamples/server-python-flask-docker            latest              e7765b45fb09        3 minutes ago       130MB
```

Use `make` (`make build_and_slim`) or the helper scripts directly (see the `.command` version for Mac OS if you like clicking :-)).

The `_slim.env` file declares the environment variables required by the `slim` helper scripts (in `_slim`). The helper scripts in `_slim` allow you to do everything you need with the app container (create/run/minify/etc). See [`_slim/README.md`](_slim/README.md) for more details.
