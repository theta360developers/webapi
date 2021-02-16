---
title:  "Get My Settings"
tags: theta-tester
date:   2021-02-16
categories: tester
cover: /images/2021_02/my_setting.png
author: Craig Oda
license: false
---

My Settings will survive reboot.

On the Z1, you must press the lower Fn button twice to go into My Settings.  If there are
no settings saved in My Settings, then the camera will not go into My Settings.

On the SC2 and SC2B, the camera will boot into My Settings automatically when the camera is
turned on or when it establishes Wi-Fi connecton.  If the Wi-Fi connection goes down and
you bring it back up, the SC2 will load My Settings.

With API call, `camera._getMySetting` will load all the settings stored in My Settings
on the V, Z1, SC2, and SC2B. For the S and SC,
the options must be passed as an array.

## Z1 testing

```shell
> dart .\bin\main.dart getMySetting
{
  "name": "camera._getMySetting",
  "results": {
    "options": {
      "aperture": 0,
      "_autoBracket": {
        "_bracketNumber": 2,
        "_bracketParameters": [
          {
            "aperture": 2.1,
            "_colorTemperature": 5000,
            "exposureCompensation": 0.0,
            "exposureProgram": 1,
            "iso": 400,
            "shutterSpeed": 0.004,
            "whiteBalance": "auto"
          },
          {
            "aperture": 2.1,
            "_colorTemperature": 5000,
            "exposureCompensation": 0.0,
            "exposureProgram": 1,
            "iso": 400,
            "shutterSpeed": 0.004,
            "whiteBalance": "auto"
          }
        ]
      },
      "captureInterval": 6,
      "captureNumber": 0,
      "_colorTemperature": 5000,
      "_compositeShootingOutputInterval": 600,
      "_compositeShootingTime": 86400,
      "exposureCompensation": 0.0,
      "exposureDelay": 0,
      "exposureProgram": 2,
      "fileFormat": {
        "height": 3360,
        "type": "jpeg",
        "width": 6720
      },
      "_filter": "hdr",
      "iso": 0,
      "isoAutoHighLimit": 6400,
      "_shootingMethod": "normal",
      "shutterSpeed": 0,
      "whiteBalance": "auto"
    }
  },
  "state": "done"
}
PS C:\Users\craig\Documents\Development\ricoh\webapi>
```

### Z1 test - Setting _filter to off

```shell
> dart .\bin\main.dart setMySetting --name=_filter --value=off
```

#### result

```shell
      "_filter": "off",
      "iso": 0,
      "isoAutoHighLimit": 6400,
      "_shootingMethod": "normal",
      "shutterSpeed": 0,
      "whiteBalance": "auto"
```

## SC2

### Set a value in My Setting

```shell
> dart .\bin\main.dart setMySetting --name=_filter --value=off
option received is off of type String
it looks like the setting was set correctly.  I hope...
{name: camera._setMySetting, state: done}
use getMySetting to verify.
```

### Verify

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

### change filter on SC2

```shell
> dart .\bin\main.dart setMySetting --name=_filter --value=hdr
option received is hdr of type String
it looks like the setting was set correctly.  I hope...
{name: camera._setMySetting, state: done}
use getMySetting to verify.
```

### verify change

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
    "_filter": "hdr",
    "state": "done"
  }
}
```
