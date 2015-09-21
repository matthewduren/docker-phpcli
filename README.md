# docker-phpcli
This is a simple container which has php5-cli and some other common php5 prerequisites available to it.

When started, the container will run the contents of run.sh.

The container is intended to be run with RUN_CMD and RUN_CMD_LOG environment variables, 
which could be another script, or (if marked as always restart) a simple shell or php command.
