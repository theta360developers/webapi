import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<http.Response> startCapture(_mode) async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var data = {
    'name': 'camera.startCapture',
    'parameters': {'_mode': _mode}
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'}, body: body);
  print('The HTTP response code is: ${response.statusCode}');
  print('The HTTP response from camera.startCapture is: ');
  prettyPrint('${response.body}');
  return response;
}
