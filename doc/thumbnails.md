<img src="images/theta-dotguide-logo.png" width=20%>


# RICOH THETA SC2 Image Thumbnails

Last updated August 12, 2020.

This is a community document based on contributions of
informal test results 
from the [theta360.guide independent community](https://www2.theta360.guide/).  This is
not an official RICOH document.  For official information, please
contact RICOH.  You should confirm these community tips with your
own tests prior to deployment in a business setting.  As these are
unofficial tips, the official RICOH THETA API may change unexpectedly
and these techniques could stop working. 

![thumbnail with camera](images/thumbnail-camera.png)

## Problem

Using camera.listFiles does not return image thumbnails even
when the maxThumbSize is set to 640.  In community tests, the
SC2 hangs or freezes when 640 was specified as the maxThumbSize. No
thumbnail was returned.

As the thumbnail is usually under 40kB compared to 3.5MB to 4MB for the SC2 image,
using the full-size image as the visual tool to manage the 
images on the camera will slow down your mobile app during network transfer. 


## Workarounds Overview and Limitations

This article describes two different workarounds. Both techniques
will only return a single thumbnail.  To get all the 
thumbnails, you will need to implement
a loop and manage async issues for the network and camera.

## Workaround #1 - listFiles and _startFileUrl

### Quick Point

Grab the URL of the file you want to get the thumbnail for and 
then specify it in `_startFileUrl`.


### Example Request

Example in Dart map.

```dart
  Map data = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 1,
      'maxThumbSize': 640,
      '_detail': true,
      '_startFileUrl':
          'http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010129.JPG'
    }
```

### Example Response

This is the response from a THETA SC2. 

```json
200
{
  "name": "camera.listFiles",
  "results": {
    "entries": [
      {
        "name": "R0010129.JPG",
        "fileUrl": "http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010129.JPG",
        "size": 3943866,
        "isProcessed": true,
        "previewUrl": "",
        "dateTimeZone": "2020:08:01 15:07:50-07:00",
        "width": 5376,
        "height": 2688,
        "_thumbSize": 7349,
        "thumbnail": "/9j/2wCEAAsICAoIBwsKCQoNDAsNERwSEQ8PESIZGhQcKSQrKigkJyctMkA3LTA9MCcnOEw5PUNFSElIKzZPVU5GVEBHSEUBDA0NEQ8RIRISIUUuJy5FRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRUVFRf/EAaIAAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKCxAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo
        ...
```

### Example Using the Thumbnail

The thumbnail is a base64 encoded string.  Most languages have a library to
decode base64 into bytes.  You can then display the thumbnail to your
mobile app screen or save it to disk.  In the following example,
the thumbnail is saved to disk.

![screenshot of thumbnails](images/thumbnail-screenshot.png)

```dart

/// returns base64 encoded string of the thumbnail
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<String> getThumb(imageUrl) async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 1,
      '_startFileUrl': imageUrl,
      'maxThumbSize': 640,
      '_detail': true,
    }
  };
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  print("${response.statusCode}");
  prettyPrint("${response.body}");
  Map<String, dynamic> imageInfo = jsonDecode(response.body);
  String thumb64 = imageInfo['results']['entries'][0]['thumbnail'];
  File('thumbnail.jpg').writeAsBytes(base64.decode(thumb64));

  return thumb64;
}
```

## Workaround #2 - GET fileUrl with ?type=thumb

You must first get the URL of the file you want to get the thumbnail for.

Once you have the URL, you can get the thumbnail by 
adding `?type=thumb` to the end of the URL.

### Workaround #2 - Example Request

The example below accepts a single URL as a parameter.

```dart
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> getThumb2(imageUrl) async {
  print(imageUrl);
  var response = await http.get('${imageUrl}?type=thumb',
      headers: {"Content-Type": "application/json;charset=utf-8"});
  print("${response.statusCode}");

  File('thumbnail.jpg').writeAsBytes(response.bodyBytes);

  return response.body;
}
```

### Example to get a list of URLs

This example shows how to get the last five image URLs on the 
camera and return it as a list.  You can then iterate through the
list and grab the thumbnail for each image.

```dart
/// list urls of images on camera
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var urls = [];

Future<List<dynamic>> listUrls() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 5,
      'maxThumbSize': 0,
      '_detail': true,
    }
  };
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  print("${response.statusCode}");
  var entries = await jsonDecode(response.body)["results"]["entries"];
  entries.forEach((element) {
    urls.add(element["fileUrl"]);
  });
  print(urls);
  return urls;
}
```

## Get All Thumbnails in a Loop

![all thumbnails](images/all-thumbs.png)

In the next example, I'm loading 29 thumbnails into an array of bytes.

The sequence of actions on my app is:

1. create http client object
2. open http connection to camera
3. grab each thumbnail individually, once per loop.  Loop runs 29 times.
4. add bytes of thumbnail into array each time through the loop
5. close http connection
6. return array

### Load Array of thumbnails as bytes

```dart
import 'dart:async';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  "Content-Type": "application/json;charset=utf-8"
};

Future<List<dynamic>> getAllThumbs(urls) async {
  // use httpClient instead of a one-off http.get command to
  // keep network connection open
  var client = http.Client();

  List<dynamic> thumbs = [];

  try {
    // loop through list of urls
    for (var i = 0; i < urls.length; i++) {
      var response =
          await client.get('${urls[0]}?type=thumb', headers: headers);
      print(response.statusCode);
      print('loading file ${i + 1}');
      thumbs.add(response.bodyBytes);
    }
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
  return thumbs;
}

```


### Write Thumbnails to Local Storage

Once you have the array of thumbnails as bytes, you can display
it to your mobile app screen or save the bytes to local storage.
The files are JPG images of 320x160px

```dart
/// test of receiving thumbnails as an array of bytes
/// and writing thumbnails to local storage
/// intend to use as basis for Flutter app to display
/// thumbnails to mobile app screen
import 'package:apitest/thumbnails/get_all_thumbs.dart';
import 'package:apitest/list_urls.dart';
import 'dart:io';

Future<void> writeAllThumbs() async {
  // get thumbs in byte format
  try {
    var thumbs = await getAllThumbs(await listUrls());
    for (var i = 0; i < thumbs.length; i++) {
      File('thumbnail-$i.jpg').writeAsBytes(thumbs[i]);
    }
  } catch (e) {
    print(e);
  }
}
```


## Summary

There appears to be a bug in the SC2 API that prevents it from
returning thumbnails in the listing of listFiles. Additionally,
in some cases, the documented method of acquiring the thumbnail
may lock the camera.

Developers can acquire the thumbnail with one of two
workarounds. When using `listFiles`, 
specifying a String for `_startFileUrl` will give you a response with
a base64 String that needs to be decoded into bytes.  The 
bytes can be saved to storage or displayed to the mobile app
screen.

Adding `?type=thumb` to the end of the fileUrl and sending the
URL as a GET HTTP request will give you a binary image
file that you can display to the mobile app screen or save to local 
storage.

---
This tip and many more SC2 developer articles are available on the 
[SC2 Developers Community Site](https://theta360.guide/special/sc2/).
Markdown to PDF conversion done with [Grip](https://github.com/joeyespo/grip). 

__This is not an official RICOH document. It is produced by
an independent community.  Please contact RICOH for official
information.__ 