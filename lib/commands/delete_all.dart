/// parameter 'all' does not work with SC2
/// you must delete only one URL at a time.
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/list_files.dart';

var url = 'http://192.168.1.1/osc/commands/execute';
Map<String, String> headers = {
  "Content-Type": "application/json;charset=utf-8"
};

Future<void> deleteAll() async {
  var client = http.Client();
  http.Response allFilesResponse = await listFiles();
  var fileListing = jsonDecode(allFilesResponse.body)["results"]["entries"];
  print('there are ${fileListing.length} images in the camera');

  var urlList = [];
  var numberOfImages = fileListing.length;

  for (var i = 0; i < numberOfImages; i++) {
    urlList.add(fileListing[i]["fileUrl"]);
  }

// loop through images on camera and delete all images

  try {
    for (var i = 0; i < numberOfImages; i++) {
      print('Attempting to delete file ${i + 1} at ${urlList[i]}');

      var body = jsonEncode({
        'name': 'camera.delete',
        'parameters': {
          'fileUrls': [urlList[i]]
        }
      });
      // use client.post instead of http.post to keep the network connection
      // open to send multiple commands.
      // make sure to close the connection with client.close() at the
      // end of the command sequence
      var testResponse = await client.post(url, headers: headers, body: body);
      if (testResponse.statusCode == 200) {
        print('successfully deleted image ${i + 1}');
        print('------------------------------------\n');
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
}
