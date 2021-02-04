---
title:  "WebAPI THETA Tester"
tags: theta-tester
date:   2021-02-03
categories: tester
cover: /images/2021_02/theta_tester_screenshot.png
author: Craig Oda
license: false
---

## Immediate Use

```shell
./theta --help
```

Will respond with:

```shell
RICOH WebAPI Tester

Usage: ./theta <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  autoBracket            apply test 3 image auto bracket settings
  deleteAll              DANGER: Delete all image and video files from camera
  downloadFile           Download newest file and save to local computer
  exposureCompensation   set exposure compensation with --value=2.0
  exposureDelay          set self timer delay in seconds
  exposureProgram        set exposure program 1 (manual), 2 (auto), 3 (aperture Z1 only), 4 (shutter), 9 (iso)
  getMetadata            Get image metadata from camera by passing URL of the file
  getOptions             get camera options
  getTimeShift           get Time Shift settings. SC2B, V, Z1 only
  hdr                    Enable, save, delete, disable, and show hdr settings
  info                   Camera info: model, serialNumber, apiLevel...
  listFiles              list all image and video files on camera
  listUrls               print and return URLs as an array of strings
  offDisable             Disable power off
  preset                 SC2 only. Preset shooting modes. face, night, lens-by-lens
  reset                  Reset camera settings. Camera will turn off. Need to reconnect
  resetMySetting         Reset mySettings (saved settings) to factory default
  setLanguage            Z1, V only. Set language with --lang=en-US
  setModeImage           Set camera to image mode
  setShutter             set shutter speed
  sleepDisable           Disable camera auto-sleep.
  startCapture           Start capture. Must specifiy capture mode
  state                  Camera state: batteryLevel, storageUri...
  status                 Show camera status. Requires id value returned from takePicture
  takeAndDownload        Take picture. Show elapsed time. Download to local disk.
  takeAndReady           Take picture. Show elapsed time. Show file URI when ready for download
  takePicture            take picture, similar to pressing shutter button
  thumbGet               Print image thumbnail byte data to screen. Pass URL of the file
  thumbWriteAll          Download and save all thumbnails to local storage.

Run "./theta help <command>" for more information about a command.
```

Some commands have additional help.

```shell
> theta info --help
Camera info: model, serialNumber, apiLevel...

Usage: ./theta info [arguments]
-h, --help        Print this usage information.
    --model       return camera model such as RICOH THETA SC2
    --firmware    Internal camera OS firmware version. Example: 1.60.1

Run "./theta help" to see global options.
```

A successful command will look like this:

```shell
> theta info
{
  "manufacturer": "RICOH",
  "model": "RICOH THETA SC2",
  "serialNumber": "20001005",
  "firmwareVersion": "01.51",
  "supportUrl": "https://theta360.com/en/support/",
  "gps": false,
  "gyro": true,
  "endpoints": {
    "httpPort": 80,
    "httpUpdatesPort": 80
  },
  "apiLevel": [
    2
  ],
  "api": [
    "/osc/info",
    "/osc/state",
    "/osc/checkForUpdates",
    "/osc/commands/execute",
    "/osc/commands/status"
  ],
  "uptime": 50,
  "_wlanMacAddress": "58:38:79:2b:ad:c5",
  "_bluetoothMacAddress": "6c:21:a2:47:d9:05"
}
```

## Getting Binaries

1. Go to [theta360.guide/special/sc2/](https://theta360.guide/special/sc2/)
1. Fill in an email address into the input box
1. Scroll down to _Tools and Code_
1. click on _Command Line WebAPI Tester_

## Installation, Usage and Setting Path

See this [YouTube video introducing the tool](https://youtu.be/yf--PIDahN8)

## Troubleshooting

### ping camera

The camera is always at 192.168.1.1

Check your Wi-Fi connection with:

```shell
> ping 192.168.1.1

Pinging 192.168.1.1 with 32 bytes of data:
Reply from 192.168.1.1: bytes=32 time=7ms TTL=64
Reply from 192.168.1.1: bytes=32 time=2ms TTL=64
```

### Test With curl

On Windows 10.

```shell
> curl -UseBasicParsing 192.168.1.1/osc/info

StatusCode        : 200
StatusDescription : OK
Content           : {"manufacturer":"RICOH","model":"RICOH THETA SC2","serialNumber":"20001005","firmwareVersion":"01.5
                    1","supportUrl":"https://theta360.com/en/support/","gps":false,"gyro":true,"endpoints":{"httpPort":
                    80...
```

### Test with browser

For GET commands such as _info_, you can put the URL endpoint in a browser and
test the connection. Paste this endpoint in the address bar of your browser.

`http://192.168.1.1/osc/info`

