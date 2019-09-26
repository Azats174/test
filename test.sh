#!/bin/bash

if ! [ -d test ]; then
mkdir test
fi
mktemp  test/test.XXXXX
logger -s "greate random file"
find test -type f   -cmin +1  -delete -exec logger -s "remove  old files" \;
