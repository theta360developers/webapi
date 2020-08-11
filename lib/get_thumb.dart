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
      'entryCount': 5,
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
