import 'dart:convert';
import 'package:http/http.dart' as http;

/// construct a map from the response body and get camera
/// info, including firmware version and camera model
Future<Map<String, dynamic>> getInfo() async {
  // test data to return a single JSON objects from Internet
  // String url = 'https://swapi.co/api/people/1';
  // String url = 'https://jsonplaceholder.typicode.com/users/1';

  var url = 'http://192.168.1.1/osc/info';

  var response = await http.get(url);
  // the response.body is a String which can be printed as is.
  // the next lines format the String into more
  // human-readable form
  // there's a nice gist here
  // https://gist.github.com/kasperpeulen/d61029fc0bc6cd104602

  Map responseBody = jsonDecode(response.body);
  // print single values from map
  String firmware = responseBody['firmwareVersion'];
  String cameraModel = responseBody['model'];
  String serialNumber = responseBody['serialNumber'];
  print('Your camera is a $cameraModel running firmware $firmware');
  print('The camera serial number is $serialNumber');
  // print the map with nice formatting
  print(JsonEncoder.withIndent('  ').convert(responseBody));
  // return a Dart map, not JSON
  return responseBody;
}

/// POST request to get camera state
Future<Map<String, dynamic>> postState() async {
  var response = await http.post('http://192.168.1.1/osc/state');
  Map responseBody = jsonDecode(response.body);
  print(JsonEncoder.withIndent('  ').convert(responseBody));
  return responseBody;
}

Future<Map<String, dynamic>> status(id) async {
  var url = 'http://192.168.1.1/osc/commands/status';

  var data = {'id': id};
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'}, body: body);
  print('The HTTP response code is: ${response.statusCode}');
  print('The HTTP response from status is:');
  Map responseBody = jsonDecode(response.body);
  print(JsonEncoder.withIndent('  ').convert(responseBody));
  return responseBody;
}
