import 'dart:io';
import 'dart:convert';
import 'prettyPrint.dart';
import 'package:args/args.dart';

void main(List<String> args) async {
  print(args);
  var parser = ArgParser();
  parser.addOption('info');

  // String url = 'https://swapi.co/api/people/1';
  // test data to return a single JSON objects from Internet
  String url = 'https://jsonplaceholder.typicode.com/users/1';

  // RICOH THETA info
  // String url = 'http://192.168.1.1/osc/info';
  // produces a request object
  var request = await HttpClient().getUrl(Uri.parse(url));
  // sends the request
  var response = await request.close(); 

  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    prettyPrint(contents.toString());
  }
}