import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';
import 'package:apitest/list_files.dart';

var url = 'http://192.168.1.1/osc/commands/execute';
Map<String, String> headers = {
  "Content-Type": "application/json;charset=utf-8"
};

Future<void> deleteTest() async {
  Map payload = {
    "name": "camera.delete",
    "parameters": {
      "fileUrls": ["all"]
    }
  };
  var body = jsonEncode(payload);
  var response = await http.post(url, headers: headers, body: body);
  print('HTTP status code: ${response.statusCode}');
  print(response.body);
}
