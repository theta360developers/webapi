import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

void test() async {

  
  // test data to return a single JSON objects from Internet
  // String url = 'https://swapi.co/api/people/1';
  // String url = 'https://jsonplaceholder.typicode.com/users/1';

  String url = 'http://192.168.1.1/osc/info';
  var response = await http.get(url);

  Map<String, dynamic> info = jsonDecode(response.body);

  print("Running firmware version ${info['firmwareVersion']} on ${info['model']}");
}