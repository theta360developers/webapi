#!/usr/bin/bash
# set individual options one at a time

# set first option
./theta.exe setOption --name=dateTimeZone --value="2020:05:18 01:04:29+08:00"

# HTTP session is automatically closed
# next option is set with no delay

# set second option
./theta.exe setOption --name=exposureDelay --value=0
