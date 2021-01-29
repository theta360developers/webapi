---
title:  "Upgrade SC2 Firmware and 4 Ways to Check Version"
tags: version
date:   2021-01-28 
categories: version
cover: /images/2021_01/sc2.png
author: Craig Oda
license: false
---

After running into a major hard disk problem with my Windows 10 machine,
I finally got Windows 10 up and running again with a new SSD.

I decided to download the desktop app from the RICOH site and check the
firmware version in my SC2.

I first plugged it into the USB 3.0 port of my Windows 10 computer using
a USB cable I bought from Amazon.  It should work with a USB 2.0 port as well.

![sc2](/webapi/images/2021_01/sc2.png)

The desktop software is available from [https://support.theta360.com/en/download/](https://support.theta360.com/en/download/).  There are many apps.  Get the _Basic app_.  It's now up to 79.5MB.  The software is the same for Z1, V, SC2.  There are different links on the page, but the software is the same.

![desktop app download](/webapi/images/2021_01/desktop_download.png)

After download and installation, select File -> Firmware Update. 

![update menu](/webapi/images/2021_01/update_menu.png)

![update to 1.51](/webapi/images/2021_01/update_to_1.51.png)

The desktop software will download the firmware to the desktop computer and then transfer it to the
THETA with the USB cable. 

![download firmware](/webapi/images/2021_01/download_firmware.png)

After the transfer is complete, disconnect the THETA from the USB cable.  Turn it off.  Turn it back on.

The camera and video icon on the display panel will flash.  After several minutes the firmware
upgrade completes.

![process after download](/webapi/images/2021_01/upgrade_instructions_after_transfer.png)

## Confirm Firmware Version with Desktop Software

![Confirm firmware desktop](/webapi/images/2021_01/confirm_firmware.png)

## Confirm Firmware with API

### Connect Windows Computer to THETA

To connect to the camera with Wi-Fi from my Windows computer, I have both Ethernet and Wi-Fi on my 
computer.  My Ethernet router is not at 192.168.1.1.  The THETA needs to be at 192.168.1.1.

__IMPORTANT: Make sure you connect with the Wi-Fi security key and not with the pin.__

![Windows Security Key](/webapi/images/2021_01/connect_with_security_key.png)

![key input](/webapi/images/2021_01/key_input.png)

The password is the 8 digit number of the THETA.  The number in my case is 20001005.

Do not put THETAYP or .OSC in the password.

### Check Firmware with Browser

You can check the firmware with http://192.168.1.1/osc/info in a web browser.
`/osc/info` is one of the few command that is a HTTP GET command.

![firmware version](/webapi/images/2021_01/firmware_version.png)

### Check Firmware with `curl`

You can also get the firmware with curl.

![curl info](/webapi/images/2021_01/curl_info.png)

```bash
$ curl http://192.168.1.1/osc/info
{"manufacturer":"RICOH","model":"RICOH THETA SC2","serialNumber":"20001005","firmwareVersion":"01.51","supportUrl":"https://theta360.com/en/support/","gps":false,"gyro":true,"endpoints":{"httpPort":80,"httpUpdatesPort":80},"apiLevel":[2],"api":["/osc/info","/osc/state","/osc/checkForUpdates","/osc/commands/execute","/osc/commands/status"],"uptime":1395,"_wlanMacAddress":"58:38:79:2b:ad:c5","_bluetoothMacAddress":"6c:21:a2:47:d9:05"}
```

### Check Firmware with Dart

```dart
import 'dart:io';
import 'dart:convert';
import 'package:apitest/pretty_print.dart';

void getInfo() async {
  String url = 'http://192.168.1.1/osc/info';

  var request = await HttpClient().getUrl(Uri.parse(url));
  // sends the request
  var response = await request.close(); 

  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    prettyPrint(contents.toString());
  }
}
```
Running the command from the test script in the [repository of this site](https://github.com/theta360developers/webapi).

```
C:>dart bin\main.dart info
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
  "uptime": 1890,
  "_wlanMacAddress": "58:38:79:2b:ad:c5",
  "_bluetoothMacAddress": "6c:21:a2:47:d9:05"
}
```