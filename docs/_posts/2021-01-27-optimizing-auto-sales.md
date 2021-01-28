---
title: Optimizing Auto Sales Workflow with RICOH THETA Cameras
tags: automotive
date:   2021-01-27 
# article_header:
#   type: cover
#   image:
#     src: /images/industry/automotive/car_lineup.png
cover: /images/industry/automotive/car_lineup_thumb.png
header:
  theme: dark
  background: 'linear-gradient(135deg, rgb(34, 139, 87), rgb(139, 34, 139))'
article_header:
  type: overlay
  theme: dark
  background_color: '#203028'
  background_image:
    gradient: 'linear-gradient(135deg, rgba(34, 139, 87 , .4), rgba(139, 34, 139, .4))'
    src: /images/industry/automotive/car_lineup.png
license: false
author: Jesse Casman
---

Used cars and salvage cars are increasingly sold in high volume by using 360° cameras for the inside of the vehicle with DSLR or mobile phone cameras used for the exterior of the vehicle.  Many commercial software packages exist that streamline the 360° photography workflow for automotive sales. 


# Evaluation 

Some automobile vendors with existing software infrastructure choose to integrate the photography workflow into their existing process by accessing the camera API.

This article explains the following:

* Accessibility of camera API and availability of examples and support,
* Quality of interior car shots when there is light streaming in from the automobile windows and a portion of the  vehicle is in the shade,
* Speed of workflow and delay between shots.

![RICOH THETA Camera Lineup](/webapi/images/camera/theta.png)

# Selecting Cameras

To make the examples more relevant to actual real-world assessments, we focus on the RICOH THETA cameras, which are popular and affordable. 

* [THETA SC2](https://us.ricoh-imaging.com/product/theta-sc2/) - $299.95
* [THETA SC2 Business Edition](https://us.ricoh-imaging.com/product/theta-sc2-b2b/) - $329.95
* [THETA Z1](https://us.ricoh-imaging.com/product/theta-z1/) - $999.95

# Discount Pricing

If you are considering buying a RICOH THETA camera for evaluation in your software development project, please contact Jesse Casman for a discount code. jcasman@oppkey.com

# API and Support

There are four APIs for RICOH THETA cameras:

* [Wi-Fi API](https://api.ricoh/docs/theta-web-api-v2.1/)
* [USB API](https://api.ricoh/docs/theta-usb-api/)
* [Bluetooth API](https://api.ricoh/docs/theta-ble-api/)
* [Plug-in API](https://api.ricoh/docs/theta-plugin/)

We recommend you focus your evaluation on the Wi-Fi API, also called WebAPI, and test it on a mobile phone platform you standardize on in your business. For testing, we use Google Pixel phones.  Even the Pixel 1 generally works fine.   

# Top Dev Tips

Here are some tips and gotchas based on our work with thousands of developers:

* Android phones cannot connect to mobile data and Wi-Fi at the same time.  You must disable mobile data to get reliable Wi-Fi, especially on Samsung phones. On Pixel phones, we don’t need to disable mobile data, but we can’t use mobile data and Wi-Fi at the same time.  In your tests, disable bluetooth and battery saver.  
* The THETA Z1 and V can function as a hotspot (Access Point or AP mode) or as a client (Client Mode or CL mode). Although it’s possible to use client mode, most deployments connect to the THETA in AP mode.  The THETA IP address is always 192.168.1.1 and cannot be changed.  If you are testing client mode, you must use digest authentication.  Please contact us for detailed examples or read the forum [discussion](https://community.theta360.guide/t/tip-developing-theta-client-mode-applications/2450/5?u=craig).
* The Bluetooth connection is generally too slow for image transfer.
* The Z1 can transfer images at 5GHz, which is faster.  The SC2 is limited to 2.4GHz.
* In addition to the official documentation, there are extensive [examples from the community](https://theta360.guide/special/sc2/).

# Support Options

Your business is not limited to the online community of thousands of developers, as RICOH also contracts with Oppkey to assist business developers with direct support and communication.

# Quality of Shots

These are different angles of the same picture taken with the THETA SC2 for Business.

![Car interior 1](/webapi/images/industry/automotive/interior_1.png)

Using HDR mode can help the camera handle bright light coming in through the automobile windows.

![Car interior 2](/webapi/images/industry/automotive/interior_2.png)

The SC2B has room mode by default, which is a form of HDR.  This feature involves automatically taking multiple shots at different exposures and combining the photos inside the camera.  The output from the camera is a standard JPEG image in equirectangular format.  You can see the actual image [here](https://theta360.com/s/sqOiVRxVv8wiSnYCo1abx23iC).

The SC2 can take HDR shots as well.  However, you need to set the HDR filter in your mobile app and save the settings inside the camera.  Detailed examples are available.  There is no way to tell if the SC2 is in HDR mode from the camera body, but your mobile app can access the information through an API call.

You can easily do this assessment yourself using the RICOH THETA mobile app available on the [download page](https://support.theta360.com/en/download/). 

The Z1 has both higher resolution images and better HDR.  The Z1 also has RAW image mode. If image quality is important, you should choose the Z1 as it will take some of the best 360° images for any camera.  If budget is important, the SC2 takes excellent pictures at a reasonable cost. 

# Workflow Optimization

Compared to a mobile phone, a 360° camera will reduce the number of shots by a factor of 4.  Instead of taking 4 shots, you only need to take a single shot.

If you take multiple 360° inside the vehicle, the processing time between shots may be a factor.  HDR shots take longer to process.  Even without HDR, the camera needs to stitch the images from the two lenses internally.  The SC2 has a smaller image and slower processor.  The Z1 has a bigger image and faster processor.  In our tests, the SC2 takes around 8 seconds to be ready for another shot.  Using a stopwatch, we measured the Z1 taking 4 seconds between shots.

Most businesses use Wi-Fi to transfer the images from the THETA to a mobile device.  The SC2 is limited to 2.4GHz, which is slower than the 5GHz that the Z1 is capable of.  

If you’re trying to get your staff in and out of the cars as fast as possible, the Z1 is faster than the SC2 and will output higher resolution images.

However, the SC2 and the SC2B are very popular among used car vendors.  You can optimize the workflow by setting up steps for your staff and providing training about where to place the camera in the vehicle and when to take it out.  

You can also prototype your workflow with the official RICOH THETA mobile app and assess which features you need to integrate into your own app. 

# Summary

Choosing a camera for used car sales involves assessing the total cost of the project.  These costs involve: 1) Software development costs.  There are no licensing fees for software from the camera vendors. This assessment is primarily development and integration time; 2) Image quality that meets your business needs; 3) Ongoing staff costs.  Calculate how long it takes staff to move the cars into and out of the preparation area.

In addition to these factors, the camera cost also varies from a low of $299 for the SC2 to a high of $999 for the Z1.

To assess development costs, you can review the available documentation and code examples. For image quality and workflow assessments, you can use the official mobile app.  If you have any questions, please contact me. 

# Talk to an Expert

We talk to businesses and developers using 360 cameras all day, every day.  We've collected
best practices over the past 5 years of focusing on helping industries use the RICOH THETA to
expand their businesses.

For a free video meeting consultation that will help you in your evaluation, contact Jesse Casman, jcasman@oppkey.com.

![jesse](/webapi/images/oppkey/jesse.png)



# Related Articles

Please refer the 
[automotive section](http://localhost:4000/webapi/archive.html?tag=automotive) of this site for more articles related
to developing automotive industry apps.