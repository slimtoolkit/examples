## NOTES

`Carbon` is an awesome react.js/next.js app to generate code images. This example shows how to create a simple Docker image for the app and how to shrink it by more than 22 times without doing anything with your Dockerfile.

When you are done you'll have a couple of images like this:

```
dslimexamples/carbon.now.sh.slim                   latest              97697a455012        About a minute ago   93.3MB
dslimexamples/carbon.now.sh                        latest              28af7e48e8e7        3 minutes ago        2.06GB
```

If you want to do it the hard way to learn more about Docker and the complexities you need to deal with take a look at these two blog posts:

* https://lengrand.fr/reducing-dockers-image-size-while-creating-an-offline-version-of-carbon-now-sh/
* https://lengrand.fr/reducing-our-docker-image-size-further/

Also compare the Dockerfile in this example to the final Dockerfile in the blog posts. Which one looks nicer ;-)

## Helper Scripts

* `clone_repo.sh` - run it to download the code
* `build_fat.sh` - build the Docker image
* `slim.sh` - minify the Docker image you just created
* `run_slim.sh` - run the optimized version of the container
* `run_slim_seccomp.sh` - run the optimized version of the container and apply the auto-generated `seccomp` profile
* `run_fat.sh` - run the original version of the container
* `run_fat_seccomp.sh` - run the original version of the container and apply the auto-generated `seccomp` profile
* `open_browser.sh` - open your browser (http://localhost:3000)

## References

* Code: https://github.com/carbon-app/carbon
* Main site: https://carbon.now.sh

