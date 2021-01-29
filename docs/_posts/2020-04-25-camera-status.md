---
title: Checking if image is ready for download
tags: state
date:   2020-04-25 5:22:40 -0800
article_header:
  type: cover
  image:
    src: /images/camera-status-state.png
cover: /images/camera-status-state.png
license: false
---

```dart
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<http.Response> status(id) async {
  var url = 'http://192.168.1.1/osc/commands/status';

  Map data = {'id': id};
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  print("The HTTP response code is: ${response.statusCode}");
  print("The HTTP response from status is:");
  prettyPrint("${response.body}");
  return response;
}
```

```dart
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/commands/take_picture.dart';


Future<String> isDone(String id) async {
  var url ='http://192.168.1.1/osc/commands/status';
  Map data = {
    'id': id
  };

  var payload = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: payload
  );

  Map<String, dynamic> status = jsonDecode(response.body);
  String state = status['state'];
  
  return state;
  
}

Future<String> downloadReady () async {

  print("Test of taking picture and then checking to see if picture is ready for download");
  print("---");
  var takePictureResponse = await takePicture();
  // print(takePictureResponse);
  Map<String, dynamic> pictureInfo = jsonDecode(takePictureResponse.body);
  String id = pictureInfo['id'];
  print('The status ID is $id');

  bool keepGoing = true;
  int elapsedSeconds = 0;  

  while (keepGoing) {
    var currentStatus = await isDone(id);
    // print(currentStatus);

    await new Future.delayed(const Duration(seconds: 1));
    print("Elapsed time: $elapsedSeconds seconds. State: $currentStatus");
    elapsedSeconds++;
    if (currentStatus == "done") {
      keepGoing = false;
    }
  }

  // String fileUrl = await getLastImageUrl();
  print("picture ready for download");
  return 'ready';
}
```

![check camera progress](/webapi/images/check-camera-progress.png)
