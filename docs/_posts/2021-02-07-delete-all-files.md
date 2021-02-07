---
title:  "Delete all files from RICOH THETA with camera.delete"
tags: theta-tester
date:   2021-02-07
categories: tester
cover: /images/2021_02/camera_delete.png
author: Craig Oda
license: false
---

A [new YouTube video](https://youtu.be/b6GNRNkouDI) explains how to
delete all the files from the SC2 with a single API command.  The video
also explains an older bug in the SC2 firmware that prevented this feature
from working properly prior to the summer of 2020.

This will delete all the files in the camera.

```dart
String _baseUrl = 'http://192.168.1.1/osc/commands/execute';
...
    var data = {
      'name': 'camera.delete',
      'parameters': {
        'fileUrls': ['all']
      }
```

Official THETA Web API
v2.1 [documentation for camera.delete](https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.delete/).

Other relevant commands include:

* reset - reset all current settings (not including my settings)
* resetMySetting - resets the settings saved in the camera
* sleepDisable - disable auto-sleep so your camera doesn't sleep in the middle of testing
* offDisable - so your camera does not automatically turn off during testing

When doing testing, you can power the camera indefinitely with the USB cable.

Any problems or questions with the WebAPI, post questions in the
[theta360.guide forum](https://community.theta360.guide/c/theta-api-usage/5).


