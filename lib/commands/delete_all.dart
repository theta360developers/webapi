/// parameter 'all' does not work with SC2
/// you must delete only one URL at a time.
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';
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
}
