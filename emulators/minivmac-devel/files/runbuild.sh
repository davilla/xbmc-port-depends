#!/bin/bash
# $Id: runbuild.sh 51490 2009-05-26 17:28:10Z ryandesign@macports.org $

DIR="$1"
OPTIONS_FILE="$2"

"$DIR/Build.app/Contents/MacOS/Build" &
PID=$!
sleep 1
open -a "$DIR/Build.app" "$OPTIONS_FILE"
wait $PID
