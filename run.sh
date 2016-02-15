#!/bin/bash
if [[ -z "$RUN_CMD_TAG" ]]; then
        RUN_CMD_LOG="$APP_VIRTUAL_HOST"
fi

if [[ -z "$RUN_CMD_SLEEP" ]]; then
	RUN_CMD_SLEEP="1"
fi

if ! [[ -z "$RUN_CMD" ]]; then
        logger -d -n 172.17.42.1 -u /dev/null "Running ${RUN_CMD} and logging to logger with the tag ${RUN_CMD_TAG}"
        stdbuf -oL ${RUN_CMD} | /usr/bin/logger -d -n 172.17.42.1 -u /dev/null -t "${APP_VIRTUAL_HOST}:[${RUN_CMD_TAG}]"
elif ! [[ -z "$RUN_CMD_LONG" ]]; then
        logger -d -n 172.17.42.1 -u /dev/null "Running ${RUN_CMD_LONG} and logging to logger with the tag ${RUN_CMD_TAG}"
                while true; do
                        stdbuf -oL ${RUN_CMD_LONG} | /usr/bin/logger -d -n 172.17.42.1 -u /dev/null -t "${APP_VIRTUAL_HOST}:[${RUN_CMD_TAG}]"
                        sleep ${RUN_CMD_SLEEP}
                done
else
        /usr/bin/logger -d -n 172.17.42.1 -u /dev/null "No RUN_CMD or RUN_CMD_LONG found.  Exit..."
fi
