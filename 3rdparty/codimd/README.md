## NOTES

[`CodiMD`](https://github.com/hackmdio/codimd) is a realtime collaborative markdown notes app.

Still WIP (works, but the generated image is not fully optimized).

To have a smaller fully working image use the `slim_interactive.sh` to optimize the image. When `docker-slim` creates a temporary container you'll need to interact with the application by opening your web browser using the custom port it allocates (look for this console message: `YOU CAN USE THESE PORTS TO INTERACT WITH THE CONTAINER`).

## Helper Scripts

* `clone_repo.sh` - run it to download the code
* `build_fat.sh` - build the Docker image
* `up_deps_only.sh` - run the database dependency (start first before you run `slim.sh` or `run_slim.sh`/`run_fat.sh`)
* `slim.sh` - minify the Docker image you just created (fully scripted)
* `slim_crawl.sh` - minify the Docker image you just created (fully scripted and with HTTP crawling enabled)
* `slim_interactive.sh` - minifies the images, but also requires you to interact with the temporary container it creates
* `run_slim.sh` - run the optimized version of the container
* `run_fat.sh` - run the original version of the container
* `open_browser.sh` - open your browser (http://localhost:3000)


