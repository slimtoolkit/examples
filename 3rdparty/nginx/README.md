## NOTES

Default `nginx` container image.

## Helper Scripts

* `slim.sh` - minifies `nginx` and copies the command artifacts to the current directory (including the seccomp profile)
* `run_slim.sh` - run the minified version of the image
* `run_slim_seccomp.sh` - run the minified version of the image with the auto-generated seccomp profile
* `run_fat.sh` - run the original version of the image
* `run_fat_seccomp.sh` - run the original version of the image with the auto-generated seccomp profile
* `test.sh` - executes a curl GET to the default endpoint
