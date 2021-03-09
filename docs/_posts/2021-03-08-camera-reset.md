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

In addition to individual options, there are video and image modes that are stored separately.

## Identifying Image Options To Reset on SC2 to Clear My Settings

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

## Identifying Saved Settings for Video My Settings

Unfortunately, I can't get the saved settings for video as of March 8, 2021.  I can
save the video settings and the settings work.  However, I can't display saved settings.

I've identified these settings for video:

* exposureCompensation,
* whiteBalance,
* _colorTemperature


## Reset MySettings on SC2

Version 0.1.3-alpha of the theta webapi tester will reset MySettings
on the SC2.  The individual reset commands are only needed on the SC2
and SC2B models.  The Z1 and the V do not need these special commands.


### Video and Image Modes

My Settings are saved for video and image modes separately.

#### Video Example

```dart
var data = {
  'name': 'camera._setMySetting',
  'parameters': {
    'options': {
      optionName: parsedValue,
    },
    'mode': 'video'
  }
};
```

### Image Example

```dart
var data = {
  'name': 'camera._setMySetting',
  'parameters': {
    'options': {
      optionName: parsedValue,
    },
    'mode': 'image'
  }
};
```

### Showing Video Settings Stored in My Settings

As shown in the example at the top of the article, getMySettings will work to show image settings.
However, when I attempt to get the __video__ settings stored in My Settings, the SC2 locks up and becomes
unresponsive.  This appears to be a bug.  I have not confirmed it with RICOH.

Setting the videos parameters in MySettings appears to work.  The workaround is to
save the video settings into my settings and manually test the settings by inspecting
the video files.

#### Test with EV Set to 2.0 (Bright)

Video.

```dart
  var response =
      await (CameraOption.setMySettingVideo('exposureCompensation', 2.0));
  print(response);
option received is 2.0 of type double
{name: camera._setMySetting, state: done}
```

To trigger my settings, I turned the Wi-Fi off by pressing the Wi-Fi button
and then connected to Wi-Fi again.

Expectation: Video will be bright.

Result: Success.  Video looks bright, as expected.

![ev for video set to 2.0](/webapi/images/2021_03/video_ev_2_0.png)

#### Test with ev set to -2.0 (Dark)

```dart
  var response =
      await (CameraOption.setMySettingVideo('exposureCompensation', -2.0));
  print(response);
}
```

Turn off Wi-Fi and reconnect to trigger saved, 'My Settings'.

Result: Success.  Video looks dark as expected.

![ev for video set to -2.0](/webapi/images/2021_03/video_ev_minus_2_0.png)


### Code Example to Reset Video and Image Settings in My Settings

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
      print('setting image exposureCompensation to 0.0 (all auto)');
      await CameraOption.setMySetting('exposureCompensation', 0.0);
      print('setting image whiteBalance to auto');
      await CameraOption.setMySetting('whiteBalance', 'auto');
      print('setting iso to 0 (auto iso)');
      await CameraOption.setMySetting('iso', 0);
      print('setting shutterSpeed to 0 (auto shutter speed)');
      await CameraOption.setMySetting('shutterSpeed', 0);
      print('setting image _colorTemperature to 5000');
      await CameraOption.setMySetting('_colorTemperature', 5000);
      // video settings
      print('preparing to reset video settings');
      print('setting video exposureCompensation to 0.0');
      await CameraOption.setMySettingVideo('exposureCompensation', 0.0);
      print('setting video whiteBalance to auto');
      await CameraOption.setMySettingVideo('whiteBalance', 'auto');
      print('setting video _colorTemperature to 5000');
      await CameraOption.setMySettingVideo('_colorTemperature', '5000');
    }

    await Ambulance.reset();
    exit(0);
  }
```


## My Settings for Video Files

![setting my settings](/webapi/images/2021_03/mysettings_test.png)

### Setting to -2.0 (dark)

```shell
> dart .\bin\main.dart setMySetting --video --name=exposureCompensation 
--value=-2.0
```

Result: worked.  See result above.

### Setting to 2.0 (light)

```shell
> dart .\bin\main.dart setMySetting --video --name=exposureCompensation 
--value=2.0
```

result: worked.  See result above.
