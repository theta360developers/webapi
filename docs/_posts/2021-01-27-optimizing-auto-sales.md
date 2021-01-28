---
title: Optimizing Auto Sales Workflow with RICOH THETA Cameras
tags: automotive
date:   2021-01-27 
article_header:
  type: cover
  image:
    src: /images/industry/automotive/car_lineup.png
cover: /images/industry/automotive/car_lineup_thumb.png
license: false
---

## Automobile Sales Rely on 360 Cameras

Used cars and salvage cars are increasingly sold in high volume by using a combination of DSLR or mobile phone cameras for the exterior of the vehicle and a 360° camera for the inside of the vehicle.

Many commercial software packages exist that streamline the 360° photography workflow for automotive sales. Some automobile vendors with existing software infrastructure choose to integrate the photography workflow into their existing process by accessing the camera API.

## How to Evaluate a 360 Camera 

This article explains the following:

* Accessibility of camera API and availability of examples and support,
* Quality of interior car shots when there is light streaming in from the automobile windows and a portion of the  vehicle is in the shade,
* Speed of workflow and delay between shots.

![RICOH THETA Camera Lineup](/webapi/images/camera/theta.png)

To make the examples more relevant to actual real-world assessments, we focus on the RICOH THETA cameras, which are popular and affordable. 

* [THETA SC2](https://us.ricoh-imaging.com/product/theta-sc2/) - $299.95
* [THETA SC2 Business Edition](https://us.ricoh-imaging.com/product/theta-sc2-b2b/) - $329.95
* [THETA Z1](https://us.ricoh-imaging.com/product/theta-z1/) - $999.95

If you are considering buying a RICOH THETA camera for evaluation in your software development project, please contact Jesse Casman for a discount code. jcasman@oppkey.com

## API, Examples, and Support

There are four APIs for RICOH THETA cameras:

* [Wi-Fi API](https://api.ricoh/docs/theta-web-api-v2.1/)
* [USB API](https://api.ricoh/docs/theta-usb-api/)
* [Bluetooth API](https://api.ricoh/docs/theta-ble-api/)
* [Plug-in API](https://api.ricoh/docs/theta-plugin/)

We recommend you focus your evaluation on the Wi-Fi API, also called WebAPI, and test it on a mobile phone platform you standardize on in your business. For testing, we use Google Pixel phones.  Even the Pixel 1 generally works fine.   

Here are some tips and gotchas based on our work with thousands of developers:

* Android phones cannot connect to mobile data and Wi-Fi at the same time.  You must disable mobile data to get reliable Wi-Fi, especially on Samsung phones. On Pixel phones, we don’t need to disable mobile data, but we can’t use mobile data and Wi-Fi at the same time.  In your tests, disable bluetooth and battery saver.  
* The THETA Z1 and V can function as a hotspot (Access Point or AP mode) or as a client (Client Mode or CL mode). Although it’s possible to use client mode, most deployments connect to the THETA in AP mode.  The THETA IP address is always 192.168.1.1 and cannot be changed.  If you are testing client mode, you must use digest authentication.  Please contact us for detailed examples or read the forum [discussion](https://community.theta360.guide/t/tip-developing-theta-client-mode-applications/2450/5?u=craig).
* The Bluetooth connection is generally too slow for image transfer.
* The Z1 can transfer images at 5GHz, which is faster.  The SC2 is limited to 2.4GHz.
* In addition to the official documentation, there are extensive [examples from the community](https://theta360.guide/special/sc2/).

Your business is not limited to the online community of thousands of developers, as RICOH also contracts with Oppkey to assist business developers with direct support and communication.
