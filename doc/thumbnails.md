# RICOH THETA SC2 Image Thumbnails

## Problem

Using camera.listFiles does not return image thumbnails even
when the maxThumbSize is set to 640.  In community tests, the
SC2 hangs or freezes when 640 was specified as the maxThumbSize. No
thumbnail was returned.


## Workaround

Grab the URL of the file you want to get the thumbnail for and 
then specify it in `_startFileUrl`.

Example in Dart map.

```dart
  Map data = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 5,
      'maxThumbSize': 640,
      '_detail': true,
      '_startFileUrl':
          'http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010129.JPG'
    }
```

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

## Using the Thumbnail

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

## Summary

There appears to be a bug in the SC2 API that prevents it from
returning thumbnails.  Developers can acquire the thumbnail
by specifying a String for `_startFileUrl`.  The response will
be a base64 String that needs to be decoded into bytes.  The 
bytes can be saved to storage or displayed to the mobile app
screen.