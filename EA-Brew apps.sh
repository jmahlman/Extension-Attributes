#!/bin/bash
###########################################
set -euo pipefail
IFS=$'\n\t'

## Variables #################
loggedInUser=$(stat -f %Su /dev/console)
brewArray=()

## Work Area ####################

if [[ -d /Users/"${loggedInUser}"/brew ]]; then
    while read -r brewApp; do
        name=$(basename "$brewApp")
            brewArray+=("${name}")
    done < <(ls /Users/"${loggedInUser}"/brew/Cellar/)
    echo "<result>$(printf '%s\n' "${brewArray[@]}")</result>"
else
    echo "<result>Not Installed</result>"
fi

exit 0