#!/bin/sh -l
time=$(date)
echo "::set-output name=time::$time"
ls -al
cd /github/workspace
ls -al
