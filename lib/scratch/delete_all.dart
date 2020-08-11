/// parameter 'all' does not work with SC2
/// you must delete only one URL at a time.
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';
import 'package:apitest/list_files.dart';

Future<http.Response> deleteAll() async {
  var url = 'http://192.168.1.1/osc/commands/execute';
  http.Response allFilesResponse = await listFiles();
  var fileListing = jsonDecode(allFilesResponse.body)["results"]["entries"];
  print('there are ${fileListing.length} images in the camera');

  var urlList = [];

  for (var i = 0; i < fileListing.length; i++) {
    urlList.add(fileListing[0]["fileUrl"]);
  }

  urlList.forEach((currentUrl) {
    print('deleting $currentUrl');
    Future.delayed(const Duration(seconds: 1), () async {
      print("delay a second");
      Map data = await {
        'name': 'camera.delete',
        'parameters': {
          'fileUrls': [currentUrl]
        }
      };
      //encode Map to JSON
      var body = await jsonEncode(data);

      var response = await http.post(url,
          headers: {"Content-Type": "application/json;charset=utf-8"},
          body: body);
      print("The HTTP response code is: ${response.statusCode}");
      prettyPrint("${response.body}");
    });
  });

  return allFilesResponse;
}
