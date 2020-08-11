/// parameter 'all' does not work with SC2
/// you must delete only one URL at a time.
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<http.Response> deleteAll() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.delete',
    'parameters': {
      'fileUrls': [
        '/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010128.JPG'
      ]
    }
  };
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  print("The HTTP response code is: ${response.statusCode}");
  prettyPrint("${response.body}");
  return response;
}
