/// only works on SC2 For Business
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';


Future<http.Response> getTimeShift () async {
  var url ='http://192.168.1.1/osc/commands/execute';

 Map data = {
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': [
        "_timeShift"
      ]
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );
  print("${response.statusCode}");
  prettyPrint("${response.body}");
  return response;
}