#!/usr/bin/bash
# example settings for development

# we don't want camera to turn off during development
# disable offDelay
./theta.exe offDelay --off
echo auto power off disabled

# disable sleepDelay
./theta.exe sleepDelay --off
echo auto sleep disabled

# turn on shutter to make sure picture was taken
./theta.exe shutterVolume --medium
echo shutter volume set to medium

# turn off hdr as it will be 2 seconds faster to take each picture
./theta.exe hdr --no-enable
echo hdr and all filters turned off

# set mode to image
./theta.exe setModeImage
echo set to still image mode

# show battery level
./theta.exe state --battery

# show firmware
./theta.exe info --firmware
