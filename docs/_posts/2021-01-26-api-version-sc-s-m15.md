---
title:  "RICOH THETA WebAPI Versions"
tags: version
date:   2021-01-26 5:22:40 -0800
categories: version
cover: /images/camera/theta.png
license: false
---

There are three versions of the WebAPI.

1. API v1 - PTP over TCP/IP
2. API v2 - OSC protocol with sessionID
3. API v2.1 - OSC protocol without sessionID. Images can be downloaded by URI.

The specific THETA model support is documented on the [THETA API Introduction](https://api.ricoh/docs/theta-api-introduction/) on the RICOH Developer Connection site.

![api versions](/webapi/images/2021_01/api_versions.png)

The V, SC2, SC2 for Business, and Z1 use the v2.1 API specification exclusively.  

The S used both 1.0 and 2.0 as a "hybrid" configuration.

The SC can use either 2.0 and 2.1, the version has to be specified in the code.

v2.1 is easier to
use as it does not require specifying a session ID.  Images on the camera can be downloaded with a simple
GET call to the URI of the image.  You can get the URI of the images from listImages.