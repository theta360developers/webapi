import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<http.Response> reset() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var data = {'name': 'camera.reset'};
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'}, body: body);
  print('The HTTP response code is: ${response.statusCode}');
  print('The HTTP response from camera.reset is:');
  prettyPrint('${response.body}');
  return response;
}
