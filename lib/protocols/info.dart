import 'dart:convert';
import 'package:http/http.dart' as http;

void getInfo() async {
  // test data to return a single JSON objects from Internet
  // String url = 'https://swapi.co/api/people/1';
  // String url = 'https://jsonplaceholder.typicode.com/users/1';

  String url = 'http://192.168.1.1/osc/info';

  http.Response response = await http.get(url);
  // the response.body is a String which can be printed as is.
  // the next lines format the String into more
  // human-readable form
  // there's a nice gist here
  // https://gist.github.com/kasperpeulen/d61029fc0bc6cd104602
  Map responseBody = jsonDecode(response.body);
  // print the map with nice formatting
  print(JsonEncoder.withIndent('  ').convert(responseBody));
  // print single value from map
  print("firmware: ${responseBody['firmwareVersion']}");
}
