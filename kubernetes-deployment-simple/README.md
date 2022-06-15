# Kubernetes Workload Slimming Example

NOTE: It's an early PoC.

High level idea is to run a Kubernetes workload (e.g., a deployment) with the
DockerSlim sensor injected, then send the tracked files back from the cluster 
to the host system and build a slim version of the image.

## Prerequisite

The example requires `kind` to be present on the system, and the "fat" version
of the image loaded into the test cluster.

```sh
# Create a test Kubernetes cluster:
make kind-create-cluster

# Build a 'fat' version of the image:
make fat-build

# Load the 'fat' image into the cluster:
make fat-load
```

## Scenario 1: Slimming Workload From Manifests

In this scenario, DockerSlim takes application manifest(s) it's been pointed too,
applies them, and tries to slim that workload.

```sh
# Run "fat" workload and build a "slim" version of the image:
make slim-build-from-manifest

# Load the "slim" image into the cluster:
make slim-load

# Run a Kubernetes workload using the "slim" image:
make slim-run
make slim-test

# Clean up
make clean
```

## Scenario 2: Slimming Running Workload

In this scenario, DockerSlim looks up an existing workload in the cluster and
tries to build the "slim" version of the image by (patching and) tracing the 
"fat" workload:

```sh
# Run a Kubernetes workload using the "fat" image:
make fat-run
make fat-test

# Build a "slim" version of the image:
make slim-build-from-running-fat

# Stop the "fat" workload:
make fat-stop

# Load the "slim" image into the cluster:
make slim-load

# Run a Kubernetes workload using the "slim" image:
make slim-run
make slim-test

# Clean up
make clean
```

## Clean up

Depending on what you need to remove:

```sh
make stop           # stop current workload
make delete-images  # delete "fat" and "slim" images
make delete-cluster # delete test Kubernetes cluster
make clean          # stop workload(s), delete images, cluster, etc.
```
