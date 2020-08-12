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
