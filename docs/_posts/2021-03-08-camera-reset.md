---
title:  "SC2 Camera Reset"
tags: theta-tester
date:   2021-03-08
categories: tester
cover: https://cdn.pixabay.com/photo/2012/04/24/13/45/plug-40128_960_720.png
author: Craig Oda
license: false
---

Extensive testing by my colleague Jesse Casman on 
[camera.reset](https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.reset/)
shows that the camera.reset API command does not work with the SC2.

To reset the SC2, we must set each option to the original options one by one.

## Identifying Options To Reset on SC2

```json
> dart .\bin\main.dart getMySetting       
{
  "name": "camera._getMySetting",
  "options": {
    "exposureProgram": 2,
    "iso": 0,
    "shutterSpeed": 0,
    "exposureCompensation": 0,
    "whiteBalance": "auto",
    "_colorTemperature": 5000,
    "_filter": "off",
    "state": "done"
  }
}
```

Pay attention to which values are strings and which numbers.

## Reset MySettings on SC2

Version 0.1.3-alpha of the theta webapi tester will reset MySettings
on the SC2.  The individual reset commands are only needed on the SC2
and SC2B models.  The Z1 and the V do not need these special commands.

In the example below, `Ambulance.reset` simply calls `camera.reset`.
The name `Ambulance` was chosen as a warning to help people accidentally wiping
out their settings.

```dart
void run() async {
    //ignore: omit_local_variable_types
    String model = await Camera.model;

    if (model.contains('SC2')) {
      print(
      'You are using a RICOH THETA SC2. We will perform addition reset commands');
      print('setting exposureProgram to 2 (auto)');
      await CameraOption.setMySetting('exposureProgram', 2);
      print('setting _filter to off (no hdr or other filters)');
      await CameraOption.setMySetting('_filter', 'off');
      print('setting exposureCompensation to 0.0 (all auto)');
      await CameraOption.setMySetting('exposureCompensation', 0.0);
      print('setting whiteBalance to auto');
      await CameraOption.setMySetting('whiteBalance', 'auto');
      print('setting iso to 0 (auto iso)');
      await CameraOption.setMySetting('iso', 0);
      print('setting shutterSpeed to 0 (auto shutter speed)');
      await CameraOption.setMySetting('shutterSpeed', 0);
      print('setting _colorTemperature to 5000');
      await CameraOption.setMySetting('_colorTemperature', 5000);
    }

    await Ambulance.reset();
    exit(0);
  }
```

## Video and Image Modes
