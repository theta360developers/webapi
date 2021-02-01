/// list urls of images on camera
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var urls = [];

Future<List<dynamic>> listUrls() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var data = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 50,
      'maxThumbSize': 0,
      '_detail': true,
    }
  };
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'}, body: body);
  print('${response.statusCode}');
  var entries = await jsonDecode(response.body)['results']['entries'];
  entries.forEach((element) {
    urls.add(element['fileUrl']);
  });
  print(urls);
  return urls;
}
