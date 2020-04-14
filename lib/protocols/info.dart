import 'dart:io';
import 'dart:convert';
import 'package:apitest/pretty_print.dart';

void getInfo() async {

  
  // test data to return a single JSON objects from Internet
  // String url = 'https://swapi.co/api/people/1';
  // String url = 'https://jsonplaceholder.typicode.com/users/1';

  String url = 'http://192.168.1.1/osc/info';

  var request = await HttpClient().getUrl(Uri.parse(url));
  // sends the request
  var response = await request.close(); 

  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    prettyPrint(contents.toString());
  }

}