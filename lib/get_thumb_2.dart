/// this does not appear to work and seems to corrupt the image
/// file in my tests
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<String> getThumb2(imageUrl) async {
  print(imageUrl);
  var response = await http.get('${imageUrl}?type=thumb',
      headers: {"Content-Type": "application/json;charset=utf-8"});
  print("${response.statusCode}");

  File('thumbnail.jpg').writeAsBytes(response.bodyBytes);

  return response.body;
}
