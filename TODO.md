# TODO

- Replace usage of the DLSIM_\* env vars in `_docker-slim.env` files with `DSLIM_EXTRA_FLAGS` and `DSLIM_BUILD_EXTRA_FLAGS` to make the used flags visible in the `make` output.
- Add examples illustrating `fat|slim-run-seccomp` and `fat|slim-run-apparmor` targets (and free `http_probe_swagger_http2` example from this logic since it's off-topic there)
- Add examples illustrating `slim-build-with-shell-and-exe` target (and free `http_probe_swagger_http2` example from this logic since it's off-topic there)
- Add example illustrating usage of the `--rta-source-ptrace=false` mode
- Add Nuxt/Next Node.js examples illustrating the usage of --include-app-n\*xt-\* flags
- Add Node.js app example illustrating the usage of --include-node-package flag
- Check env vars and volumes in the _image editing_ example(s). Same way it's done in the `image-assert-label.sh` script.
- Convert the remaining examples to the new format (mostly 3rdparty)
