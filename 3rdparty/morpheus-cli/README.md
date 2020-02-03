## NOTES

WIP...

Need a good set of cli commands to run when minifying and testing the container image. The current `slim` operation tries to invoke the cli with `remote add demo https://demo.morpheusdata.com -N` (might not be the best command to try).

Executing multiple cli commands is possible by mounting (`--mount` `docker-slim` build parameter) a local shell script (with those commands) and setting the entrypoint (`--entrypoint` `docker-slim` build parameter) to that shell script...
