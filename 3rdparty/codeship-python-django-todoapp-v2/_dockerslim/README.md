# DockerSlim Extras

The v2 version of the example doesn't have an explicit ENTRYPOINT instruction in the project's Dockerfile and the command information is provided inline (in the docker-compose and DockerSlim configs).

Build the application container image first (with `build_compose.command`).

Start the dependencies (with `up_deps_only.command`).

Run the Django migrations to create the tables (with `db_create.command`).

Run DockerSlim using the provided helper script (`slim.command`) or manually.

Once DockerSlim is done confirm that the minified image is good. You can do that by starting a new minified standalone application container (with `run_app_only_slim.command`) while the other dependencies are still running or you can start a new docker-compose project (with `up_slim.command`).

You can use the provided test helper script (`test.command`) to see that the app is working.

## Helpers

* `build_compose.command` - to build application container image using docker-compose
* `up.command` - to execute the original project `as-is` with docker-compose
* `down.command` - to shutdown the original docker-compose project execution
* `up_deps_only.command` - to run everything in the original project except for the container you want to minify
* `db_create.command` - to create the database tables in PostgreSQL
* `slim.command` - executes DockerSlim to minify the target image (run it only after the rest of the containers are started with `up_deps_only.command`)
* `run_app_only_slim.command` - to execute the minified app container image (while other dependencies are already running)
* `up_slim.command` - to execute the minified project with docker-compose
* `down_slim.command` - to shutdown the minified docker-compose project execution
* `test.command` - basic curl test to see if the project is working

## Notes

* The original repo: https://github.com/codeship-library/python-django-todoapp
* Removed the Codeship-specific parts
* Made a few enhancements to make it work

