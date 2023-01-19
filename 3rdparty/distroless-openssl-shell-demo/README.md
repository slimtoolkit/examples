# Distroless OpenSSL Shell Demo

This demo is based on the [`Exploiting Distroless Images`](https://www.form3.tech/engineering/content/exploiting-distroless-images) blog post by Form3, which shows how the OpenSSL package and its CLI available in the distroless container images can be misused by attackers.

This example shows how a small distroless-based app container image (`22.1MB`) gets 10 times smaller (`2.14MB`) eliminating the OpenSSL cli/shell and many other things the application in the container image doesn't need.

```
% docker images
REPOSITORY                                                                TAG                         IMAGE ID       CREATED        SIZE
distroless-demo.slim                                                      latest                      fdc65bb7ccaa   2 hours ago    2.14MB
distroless-demo                                                           latest                      e8da1c581bbc   2 hours ago    22.1MB
```

```
 % docker exec -it demo /bin/sh

OCI runtime exec failed: exec failed: unable to start container process: exec: "/bin/sh": stat /bin/sh: no such file or directory: unknown
```

```
% docker exec -it demo /usr/bin/openssl

OpenSSL> help
Standard commands
asn1parse         ca                ciphers           cms
crl               crl2pkcs7         dgst              dhparam
dsa               dsaparam          ec                ecparam
enc               engine            errstr            gendsa
genpkey           genrsa            help              list
```

When you try executing the `openssl` cli you will get a failure:

```
% docker exec -it demoslim /usr/bin/openssl

OCI runtime exec failed: exec failed: unable to start container process: exec: "/usr/bin/openssl": stat /usr/bin/openssl: no such file or directory: unknown
```

You can use the [`Slim SaaS`](https://portal.slim.dev/home/xray/dockerhub%3A%2F%2Fdockerhub.public%2Fdslimexamples%2Fdistroless-openssl-shell-demo.slim%3Alatest%40sha256%3A74fe1e5fb5cd714a65ffd77d54cdf8283c7065ba41516df841fe167591dc8da9#explorer) to see what's in the minified container image (note how this Go app has quite a few dependencies).

You can also see the [`diff`](https://portal.slim.dev/home/diff/dockerhub%3A%2F%2Fdockerhub.public%2Fdslimexamples%2Fdistroless-openssl-shell-demo.slim%3Alatest#file-system) between the original distroless image and its minified version.

## Helper Scripts

* `build.sh` - build the container image
* `run.sh` - run the original distroless container
* `exec.sh` - try to execute the shell in the distroless container (should fail because the distroless container doesn't have a shell)
* `opensshshell.sh` - try to execute the openssl shell in the distroless container (should work; read the blog post about the fun things attackers can do with it)
* `slim.sh` - minify the distroless container image you created
* `run_slim.sh` - run the optimized version of the distroless
container
* `exec_slim.sh` - try to execute the shell in the minified distroless container (should fail)
* `opensshshell_slim.sh` - try to execute the openssl shell in the minified distroless container (should fail; there's no openssl shell in the image because Slim removed it)

## References

* Blog post: https://www.form3.tech/engineering/content/exploiting-distroless-images

