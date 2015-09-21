#!/bin/bash
touch $RUN_CMD_LOG >> /dev/null 2>&1
if ! [[ -e "$RUN_CMD_LOG" ]]; then
        RUN_CMD_LOG="/dev/null"
fi

echo "Running ${RUN_CMD} and logging to ${RUN_CMD_LOG}"

${RUN_CMD} >> ${RUN_CMD_LOG}