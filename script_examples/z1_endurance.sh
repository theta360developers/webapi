#!/usr/bin/bash
# tested on WSL2 theta.exe is in the same folder as this script
# endurance test for Z1 with firmware 1.60.1
# prior to test
# * pictures deleted with ./theta.exe deleteAll
# * camera settings were reset with ./theta.exe reset 
# IMPORTANT: The two commands above will delete all your media and settings


# disable offDelay
./theta.exe offDelay --off

# disable sleepDelay
./theta.exe sleepDelay --off

# you may want to have commands in here to delete existing pictures
# and free up camera space. It's not here in the example for safety

# turn off self timer
./theta.exe exposureDelay --seconds=0

# turn off shutter volume "beep"
./theta.exe shutterVolume --low

# confirm settings
./theta.exe getOptions

# set exposureCompensation to -2.0
./theta.exe exposureCompensation --value=-2.0

# take test picture and download to local computer
# it will be in the same directory as theta.exe
./theta.exe takeAndDownload

# set exposureCompensatio to 2.0
./theta.exe exposureCompensation --value=2.0

# take picture and download second test image
./theta.exe takeAndDownload

# set exposureCompensatio to 0
./theta.exe exposureCompensation --value=0.0

# take picture and download second test image
./theta.exe takeAndDownload

# from this point onward, the images are left on camera
# you will need to download the images for inspection

echo start endurance loop test
# example of loop to take  pictures for timelapse or testing
# increase the number below to 300 to take 300 pictures
# example {1..300}
for counter in {1..100}
do
    ./theta.exe takeAndReady
    echo that was picture $counter
    ((counter++))
    # waiting 1 second just in case camera is overheading
    echo waiting 1 seconds for the next shot
    sleep 1s

done
echo finished endurance test

# grab all the thumbnails and write to local storage
./theta.exe download --thumb=all
echo thumbnail download test completed
echo thumbnails are in local storage for inspection