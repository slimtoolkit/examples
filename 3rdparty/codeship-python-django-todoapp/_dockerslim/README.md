# DockerSlim Extras

Optionall build the application container image first (with `build_compose.command`).

Run the original docker-compose project as-is (with `up.command`).

Run the test helper script (`test.command`) to see that the app is working.

Stop the original docker-compose project and start only the dependencies (with `up_deps_only.command`).

Now you can run DockerSlim using the provided helper script (`slim.command`) or you can do it manually.

Once DockerSlim is done confirm that the minified image is good. You can do that by starting a new minified standalone application container (with `run_app_only_slim.command`) while the other dependencies are still running or you can start a new docker-compose project (with `up_slim.command`).


## Helpers

* `build_compose.command` - to build application container image using docker-compose
* `up.command` - to execute the original project `as-is` with docker-compose
* `down.command` - to shutdown the original docker-compose project execution
* `up_deps_only.command` - to run everything in the original project except for the container you want to minify
* `slim.command` - executes DockerSlim to minify the target image (run it only after the rest of the containers are started with `up_deps_only.command`)
* `run_app_only_slim.command` - to execute the minified app container image (while other dependencies are already running)
* `up_slim.command` - to execute the minified project with docker-compose
* `down_slim.command` - to shutdown the minified docker-compose project execution
* `test.command` - basic curl test to see if the project is working

## Notes

* The original repo: https://github.com/codeship-library/python-django-todoapp
* Removed the Codeship-specific parts
* Minor enhancements to make it work

