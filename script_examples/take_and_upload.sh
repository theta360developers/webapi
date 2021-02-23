#!/usr/bin/bash
# tested on WSL2 theta is in the same folder as this script
# in actual use, we expect people to run the bash script
# on a Raspberry Pi with ./theta and not ./theta

# disable offDelay
./theta offDelay --off

# disable sleepDelay
./theta sleepDelay --off

# you may want to have commands in here to delete existing pictures
# and free up camera space. It's not here in the example for safety

# turn off self timer
./theta exposureDelay --seconds=0

# turn off shutter volume "beep"
./theta shutterVolume --off

# confirm settings
./theta getOptions

sleep 1s

# set exposureCompensation to -2.0
./theta exposureCompensation --value=-2.0

sleep 1s

# take picture and download to local computer
# it will be in the same directory as theta
./theta takeAndDownload

sleep 1s

# set exposureCompensatio to 2.0
./theta exposureCompensation --value=2.0

./theta takeAndDownload

echo start timelapse photography loop test
# example of loop to take 2 pictures for timelapse
# increase the number 2 below to 300 to take 300 pictures
# example {1..300}
for counter in {1..5}
do
    ./theta takeAndDownload
    echo that was picture $counter
    ((counter++))
    # if you want to have the timelapse space 30s apart
    echo waiting 10 seconds for the next shot
    sleep 10s
    # if you want to take a shot every 5 minutes
    # sleep 5m
done
echo timelapse done

# grab all the thumbnails and write to local storage
./theta download --thumb=all
echo thumbnail download test completed
echo *** Will Start Upload to Digital Ocean Hosting ***
scp -r *.JPG craig@45.55.31.80:/home/craig/robot/
echo completed upload
echo go to http://45.55.31.80/robot/ to view images

