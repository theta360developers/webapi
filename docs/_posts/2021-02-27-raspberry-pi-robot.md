---
title:  "Raspberry Pi Robot with 360 Images"
tags: robot bash raspberry-pi
date:   2021-02-27
categories: tester
cover: /images/2021_02/theta_robot.png
header:
  theme: dark
  background: 'linear-gradient(135deg, rgb(34, 139, 87), rgb(139, 34, 139))'
article_header:
  type: overlay
  theme: dark
  background_color: '#203028'
  background_image:
    gradient: 'linear-gradient(135deg, rgba(34, 139, 87 , .4), rgba(139, 34, 139, .4))'
    src: /images/2021_02/theta_robot.png
author: Craig Oda
license: false
---

I recently used our [THETA robot](https://youtu.be/DNqKH-3lJ4U) to test remote interval shooting
and automated cloud upload with RICOH THETA SC2, V, and Z1 cameras.

I used a Raspberry Pi 4 as both the controller for the camera and
to communicate with the THETA camera.  The RPi4 has an additional
USB Wi-Fi adapter to communicate with both the THETA using
the WebAPI and the Internet.

Although many [robots use the THETA USB API](https://youtu.be/cN6OU5Mm9Ts) to control the camera, setting up the software needed to use the USB API can be
daunting.  

For this project, I used the WebAPI as this is the most widely used
API for automotive dealers, real estate, and construction.  Although
my educational robot will not be used in any of these markets, the test results
can help solve software development problems in those markets.

There are four videos that show my solution to different problems.

## [RICOH THETA and Raspberry Pi Control](https://youtu.be/BUDufGkav-M)

How to use simple bash scripts on the Raspberry Pi to automate setting
camera parameters and take thousands 
of shots with custom delays between shots. 
Explains process to modify example scripts with the pre-built
Raspberry Pi binaries.  The Raspberry Pi automatically checks
the camera and downloads the images from the camera to the RPi.

## [RICOH THETA Raspberry Pi Monitoring Robot with Protective Case](https://youtu.be/LpnvC83WgOg)

Uses a clear protective case for the RICOH THETA to protect the camera
from rain and mud when the robot is in the field.  

Runs a web server on the Raspberry Pi to allow laptops to grab
the images from the THETA while the robot is monitoring a site with
sequence shots.

## [Build 360 Image Remote Monitoring Robot with RICOH THETA, Raspberry Pi  and Cloud Storage](https://youtu.be/tmcQiEmiMoM)

Robot automatically copies THETA images onto an Apache web server in the cloud.
This example uses Digital Ocean's $5/month account for cloud storage.

## [Add Mobile Data Upload to Remote 360 Image Monitoring  Robot Using  RICOH THETA and Raspberry Pi](https://youtu.be/WcfWFCzOLsI)

Robot uses onboard mobile data from an Android phone to upload
images to the cloud using LTE data.  Robot can now monitor an area
that does not have a Wi-Fi hotspot but has mobile data coverage.

## Lessons Learned

### Untethered Battery Power Management

The onboard power source of the robot is too weak to effectively run
the RPi4 with all the accessories I jammed onto the Robot.
The Raspberry Pi Dramble blog has
more [test results](https://www.pidramble.com/wiki/benchmarks/power-consumption)
on RPi power consumption.

As I normally test the Raspberry Pi when it is plugged into a wall outlet,
the move to battery power was a bit of a culture shock for me.  I need
to be more careful to the power consumption of accessories such
as a Wi-Fi adapter plugged into the Raspberry Pi when it is untethered.

### Mobile Network Workarounds

Moving from the Wi-Fi router in my office to a mobile hotspot using
LTE was also more tricky than I assumed.  On the surface, it is the
same, but as I'm using a Pixel 2 as a hotspot and not an actual
mobile router, I needed to type `ip neigh` from the Pixel to find
the IP address of the Raspberry Pi.  I then used a laptop to
ssh into the Raspberry Pi and set up the scripts I used to control
the camera.  

### network routing on the Raspberry Pi

When the Raspberry Pi booted with two Wi-Fi interfaces,
it set up two default gateways which conflicted with each other.
I needed to manually delete the default route to the THETA and
just route traffic from the 192.168.1.0 subnet on the Raspberry Pi
to the THETA.

