import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';


Future<http.Response> getMetadata (fileUrl) async {
  var url ='http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera._getMetadata',
    'parameters': {
      'fileUrl': fileUrl
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