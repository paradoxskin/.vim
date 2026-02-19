#!/bin/bash

SCRIPT_PATH="${BASH_SOURCE[0]}"
DIR_SCRIPT_PATH=$(dirname $SCRIPT_PATH)

if [ -f "${DIR_SCRIPT_PATH}/genbody.sh" ]; then

(
echo '<!DOCTYPE html>'
echo '<html>'
echo '<head><meta charset="utf-8"><title>preview</title></head>'
echo '<body>'
bash ${DIR_SCRIPT_PATH}/genbody.sh $1
echo '<link rel="stylesheet" href="style.css">'
echo '</body>'
echo '</html>'
) > $2

fi
