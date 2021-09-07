#!/usr/bin/bash

# test condition: camera was reset before test
# camera model: RICOH THETA Z1 with firmware 1.80.1
# date tested: April 20, 2021

# camera is reset ./theta.exe reset
# all files deleted ./theta.exe deleteAll
./theta.exe takeAndDownload
./theta.exe takeAndDownload
./theta.exe takeAndDownload

# set individual options one at a time

# set first option
./theta.exe setOption --name=dateTimeZone --value="2020:05:18 01:04:29+08:00"

# HTTP session is automatically closed
# next option is set with no delay

# optional set second option
# ./theta.exe setOption --name=exposureDelay --value=0

./theta.exe takeAndDownload
./theta.exe takeAndDownload
./theta.exe takeAndDownload


