# RICOH THETA API HTTP Community Tests

Last updated February 2, 2021.

IMPORTANT: Some of the code examples are now in `/packages/theta/lib/src/`

Welcome to our repository of RICOH THETA WebAPI tests based on contributions of
from the [theta360.guide independent community](https://www2.theta360.guide/).  This is
not an official RICOH document.  For official information, please
contact RICOH.  You should confirm these community tips with your
own tests prior to deployment in a business setting.  As these are
unofficial tips, the official RICOH THETA API may change unexpectedly
and these techniques could stop working.

Updates to the community document are posted to the web at
[https://theta360developers.github.io/webapi/](https://theta360developers.github.io/webapi/)

Official API reference information from RICOH:

* [RICOH Developer Connection THETA Web API v2.1](https://api.ricoh/docs/theta-web-api-v2.1/)
* [THETA API 2.1 Android SDK on RICOH Official GitHub Repository](https://github.com/ricohapi/theta-api2.1-android-sdk)
* [THETA API 2.1 iOS SDK on RICOH Official GitHub Repository](https://github.com/ricohapi/theta-api2.1-ios-sdk)

## Overview

The RICOH THETA WebAPI is based on the [Google Open Spherical Camera API](https://developers.google.com/streetview/open-spherical-camera/reference). Developers build mobile apps that communicate with the RICOH THETA camera using Wi-Fi and a HTTP protocol using GET and POST commands.

Our community examples test the HTTP request and response behavior of the RICOH THETA using Dart. You can also use
[curl](https://curl.se/) from the command line or a HTTP API tester such as [Postman](https://www.postman.com/).

Our examples are designed so that you can easily read the JSON request without any knowledge of Dart.
The contents of the HTTP request will be identical in any programming language.  
In the example below, Dart code is used to get the state of the
RICOH THETA camera.  The response is in JSON.

```dart
void postState() async {
  var response = await http.post('http://192.168.1.1/osc/state');
  prettyPrint(response.body);
}
```

### Reading the Example Code

In the example below, the relevant pieces of information to focus on are:

* HTTP endpoint: `http://192.168.1.1/osc/commands/execute`
* data payload: `{'name': 'camera.takePicture'}`
* HTTP header: `{"Content-Type": "application/json;charset=utf-8"}`
* HTTP request method: POST

```dart
Future<http.Response> takePicture () async {
  var url ='http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.takePicture'
  };
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );
  print("The HTTP response code is: ${response.statusCode}");
  print("The HTTP response from camera.takePicture is:");
  prettyPrint("${response.body}");
  return response;
}
```

By using the Dart examples as a reference, you can build your own tests with languages such
as Swift or Kotlin.

Dart is new and we understand that most people are not using Dart to build their mobile and desktop apps.
These two tips will help you to use the Dart examples with another language.

1. Although Dart looks like JavaScript, it does not store information as JavaScript objects.
The requests from Dart are contructed in a Dart map, which looks very similar to JSON. Just
be aware that the examples use `jsonEncode` and `jsonDecode` to convert between JSON and Dart maps.

2. Similar to other languages, Dart uses the concepts `async`/`await` and futures for asynchronous programming.
If these concepts are new, you can largely ignore them for curl, Python, bash, and Postman tests.  Focus on the http endpoint and JSON payload.

## Status

Camera models tests:

* SC2 with firmware 1.51
* Z1 with firmware 1.60.1

The SC2 API has many differences from the API used with the V and Z1.  To test the
SC2 API, we used the the official RICOH online [API documentation](https://api.ricoh/docs/theta-web-api-v2.1/) as a starting point and supplemented our own tests with trial and
error.  When necessary, we used a protocol packet analyzer with the
official RICOH mobile app connected to an SC2 to find the parameters needed for our tests.

Differences we discovered through testing include:

* delete all API broken with SC2 firmware 1.31 and earlier and SC2B firmware 6.01.  Fixed with SC2 firmware 1.42 (and higher) and SC2B 6.12 (and higher).  The delete all commanded worked on the Z1 and V on all firmware versions we tested. TODO: The camera appears to be busy for 10 seconds when deleting 100 pictures. Suggest testing this and
see when the camera is ready to take a picture again.
* thumbnail display with standard API broken on SC2 and SC2B.  Different workarounds available.  TODO: Retest behavior with SC2 firmware 1.51.
* camera presets - TODO: test [lens-by-lens preset](https://support.theta360.com/uk/manual/sc2/content/shooting-preset/shooting_preset_01.html) in car or room with bright sun hitting one lens, but not the other. Test with and without HDR.
* reset settings behavior is different on SC2 and SC2B.
* use of state and status to see when the camera is ready for the next command after you take a picture
* metadata injection into image file not working on SC2. TODO: retest and document SC2 differences versus Z1.
* the iOS and Android SDKs on the RICOH GitHub repo have problems with the getLivePreview motionJPEG response on SC2 and SC2B.
* [_language](https://api.ricoh/docs/theta-web-api-v2.1/options/_language/) option does not appear to work
on SC2 and SC2B. Not clear what it does on Z1 and V.  Took out of current version of test tool.  Script
is still in repository under options. set_language.dart.

### Additional Test Plans

* if the [exposureProgram](https://api.ricoh/docs/theta-web-api-v2.1/options/exposure_program/), is
set to 2, the normal, default setting.  Do settings like shutterSpeed, iso, aperture have any effect?
Image a car vendor is taking a vehicle in the shade and we provide advice on iso.  Does the iso
actually take effect?  Is the exposureCompensation, the only setting that normally takes effect?
* test [startCapture](https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.start_capture/) behavior of SC2 when compared to Z1.  In particular, test if interval composite shooting works with the SC2 as it does not work on the V,
but appears to be supported on the SC and S models.
  * the V and Z1 also has a setting for interval shooting optimized for tripod stabilization. Does this exist on SC2?
  What does it mean that "top/bottom correction and stitching conditions are optimized?"
* does [camera.reset](https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.reset/) also reset mySettings?
* The [Options overview](https://api.ricoh/docs/theta-web-api-v2.1/options/index/) chart provides a lot of
information on the differences between camera. However it does not list options for SC2.  Test what is
possible with the SC2.
* When should businesses use My Settings?  Explain the behavior.
* for [shutter speed](https://api.ricoh/docs/theta-web-api-v2.1/options/shutter_speed/), the documentation
is not clear if the values are strings or numbers. Clarify. It seems like the API allows both strings
and floating point numbers.  However, the stored value appears to be a number. The range
of specified values is not specified for SC2 or SC2B.


## Update Camera Firmware

Firmware for RICOH THETA cameras can be updated with the desktop app on Mac or Windows or the mobile app on Android or iOS.
The desktop app connects with a USB cable and is a good, stable connection.

## Using Windows Binary

run `theta.exe --help` from the command line on Windows 10.

```shell
PS C:\Users\craig\Documents\Development\ricoh\webapi> .\theta.exe help
access RICOH WebAPI

Usage: dart bin/main.dart <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  getMetadata                  Get image metadata from camera by passing URL of the file
  getOptions                   get camera options
  hdr                          Enable, save, delete, disable, and show hdr settings
  info                         Camera info: model, serialNumber, apiLevel...
  listFiles                    list all image and video files on camera
  offDisable                   Disable power off
  setExposureCompensationTwo   Set exposure compensation to 2.0.
  setExposureDelayFive         Set camera self timer
  setExposureDelayZero         Turn off camera self timer
  setModeImage                 Set camera to image mode
  state                        Camera state: batteryLevel, storageUri...
  takePicture                  take picture, similar to pressing shutter button

Run "./theta help <command>" for more information about a command.
```

### Using Preset Shooting Modes

The SC2 preset shooting modes are explained in the
[SC2 User Guide on the RICOH site](https://support.theta360.com/uk/manual/sc2/content/shooting-preset/shooting_preset_01.html).

To change the SC2 or SC2B from preset to standard image, set captureMode to image.

Contact jcasman@oppkey.com for additional information.

## Installation For Development and Testing

1. install [dart](https://dart.dev/) (*)
1. clone this repo
1. run `pub get` to install dependencies
1. connect workstation to THETA with camera in access point (AP) mode
1. run `main.dart` file in `bin` with the appropriate command

(*) Flutter 1.21 includes Dart.  If you plan to install Flutter, then you do not need to
install a standalone version of Dart.  You must adjust the PATH of your system to
use the Dart version that comes with Flutter. On my system, I installed Flutter
in `/home/username/opt/flutter`.  My dart binary is in `/home/username/opt/flutter/bin`.
You must also add the dart-sdk tools to your PATH.`/home/username/opt/flutter/bin/cache/dart-sdk/bin`

```bash
$ pub get
Resolving dependencies... (1.2s)
Downloading args 1.5.3...
Downloading http 0.12.0+4...
Downloading pedantic 1.9.0...
Downloading async 2.4.0...
Downloading source_span 1.6.0...
Downloading charcode 1.1.3...
Downloading meta 1.1.8...
Got dependencies!
```

### Camera to Workstation Connection

This sample application only connects with Wi-Fi in access point mode. You computer will need to connect to the camera as a hotspot.
The IP address of the camera will always be 192.168.1.1. You cannot change the IP address.  

To connect to the Internet, you must have two network interfaces on your computer.  For example, your computer can connect to your
home router with Ethernet and use Wi-Fi to connect to the THETA.  You can also use the existing Wi-Fi of your laptop to connect
to the Internet and a USB Wi-Fi adapter to connect to the THETA.

### Example Use When Editing the Code

```dart
$ dart bin/main.dart info
{
  "manufacturer": "RICOH",
  "model": "RICOH THETA SC2",
  "serialNumber": "20001005",
  "firmwareVersion": "01.31",
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
  "uptime": 2709,
  "_wlanMacAddress": "58:38:79:2b:ad:c5",
  "_bluetoothMacAddress": "6c:21:a2:47:d9:05"
}
```

Use `dart bin/main.dart help` for more usage information.

## Troubleshooting Camera

### Testing Connection with GET info

The simplest command to the camera is GET info.

You can test it in a browser, curl, Postman.  In the test program, you can
look for the URL below.

```dart
String url = 'http://192.168.1.1/osc/info';
```

If you are having problems getting a camera connection and want to test your
code with a known working API that returns a single JSON object, you can use a public Internet test server to return a single JSON object and print it out.

```dart
// String url = 'https://swapi.co/api/people/1';
// String url = 'https://jsonplaceholder.typicode.com/users/1';
```

## Running Documentation Locally

The documents for these code examples are stored in docs.  You can read them
online in a blog-like format at [https://theta360developers.github.io/webapi/](https://theta360developers.github.io/webapi/).  If you want to edit the blog locally and
contribute content, you can run Jekyll locally.

One time installation of required Ruby gems.

```shell
bundle install
```

The Gemfile will be saved to the /docs directory. To view the documents locally, run the following command while in the /docs directory:

```shell
bundle exec jekyll serve
```
