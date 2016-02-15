#!/bin/bash

function SetEnvironmentVariable {
        if [ -z "$2" ]; then
                echo "Environment variable '$1' not set."
                return
        fi

        # Check whether variable already exists
        if grep -q $1 /root/.profile; then
                # Reset variable
                echo "Resetting variable $1"
                sanitized="$(echo $2 | sed 's/\//\\\//g')"
                sed -i "s/$1=.*/$1=$sanitized/g" /root/.profile
        else
                # Add variable
                echo "Adding variable ${1}"
                echo "export $1=$2" >> /root/.profile
        fi
}

IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
for _var in $(env | awk -F = '{print $1}'); do
        key=$_var
        val=${!_var}

        SetEnvironmentVariable $key $val
done

crontab /path/to/cronfile

cron -f