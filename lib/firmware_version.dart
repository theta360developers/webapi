import 'dart:convert';
import 'package:http/http.dart' as http;

void firmwareVersion() async {
  
  // test data to return a single JSON objects from Internet
  // String url = 'https://swapi.co/api/people/1';
  // String url = 'https://jsonplaceholder.typicode.com/users/1';

  String url = 'http://192.168.1.1/osc/info';
  var response = await http.get(url);

  Map<String, dynamic> info = jsonDecode(response.body);
  String firmwareVersion = info['firmwareVersion'];
  String model = info['model'];
  print("Running firmware version $firmwareVersion on $model");
}