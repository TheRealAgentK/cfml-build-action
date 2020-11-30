#!/bin/sh -l
time=$(date)
echo "::set-output name=time::$time"
ls -al
cd /github/workspace
ls -al
which box
echo "box version: $(box version)"
echo "$1"
/opt/box/box cfcompile $1 > cfcompile.txt

