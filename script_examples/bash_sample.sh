#!/usr/bin/bash
# tested on WSL2 theta.exe is in the same folder as this script
# in actual use, we expect people to run the bash script
# on a Raspberry Pi with ./theta and not ./theta.exe

# disable offDelay
./theta.exe offDelay --off

# disable sleepDelay
./theta.exe sleepDelay --off

# you may want to have commands in here to delete existing pictures
# and free up camera space. It's not here in the example for safety

# turn off self timer
./theta.exe exposureDelay --seconds=0

# turn off shutter volume "beep"
./theta.exe shutterVolume --off

# confirm settings
./theta.exe getOptions

# set exposureCompensation to -2.0
./theta.exe exposureCompensation --value=-2.0

# take picture and download to local computer
# it will be in the same directory as theta.exe
./theta.exe takeAndDownload

# set exposureCompensatio to 2.0
./theta.exe exposureCompensation --value=2.0

# take picture and leave on camera
./theta.exe takeAndReady

# example of loop to take 5 pictures for timelapse
for counter in {1..5}
do
    ./theta.exe takeAndReady
    echo that was picture $counter
    ((counter++))
    # if you want to have the timelapse space 30s apart
    echo waiting 30 seconds for the next shot
    sleep 30s
    # if you want to take a shot every 5 minutes
    # sleep 5m
done
echo timelapse done

# grab all the thumbnails and write to local storage
./theta.exe thumbWrite --all

