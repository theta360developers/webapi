---
title:  "Running Multiple Commands in Sequence"
tags: state dart
date:   2020-05-05
categories: basic
cover: https://cdn.pixabay.com/photo/2015/11/15/07/44/mathematics-1044080_960_720.jpg
license: false
---


## Running http commands in sequence

Use http.Client instead of http.post to keep connection open.

The documentation for the Dart http package has the following advice:

> If you're making multiple requests to the same server, you can keep open a persistent connection by using a Client rather than making one-off requests. If you do this, make sure to close the client when you're done:

```dart
var url = 'http://192.168.1.1/osc/commands/execute';
Map<String, String> headers = {
  "Content-Type": "application/json;charset=utf-8"
};
try {
  for (var i = 0; i < numberOfImages; i++) {
    print('deleting file ${urlList[i]}');

    var body = jsonEncode({
      'name': 'camera.delete',
      'parameters': {
        'fileUrls': [urlList[i]]
      }
    });
    var testResponse = await client.post(url, headers: headers, body: body);
    if (testResponse.statusCode == 200) {
      print('successfully deleted');
    } else {
      print(
          'Something went wrong.  Check http status code: ${testResponse.statusCode}');
    }
  }
} catch (e) {
  print(e);
} finally {
  client.close();
  print('closed client');
}

```