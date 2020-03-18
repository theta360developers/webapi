import 'dart:io';
import 'dart:convert';
import 'package:apitest/pretty_print.dart';

void connect(url) async {


  var request = await HttpClient().getUrl(Uri.parse(url));
  // sends the request
  var response = await request.close(); 

  // transforms and prints the response
  await for (var contents in response.transform(Utf8Decoder())) {
    prettyPrint(contents.toString());
  }

}