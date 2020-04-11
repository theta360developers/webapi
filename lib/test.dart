import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';
import 'package:apitest/take_picture.dart';

Future<String> commandState(String id) async {
  var url ='http://192.168.1.1/osc/commands/status';
  Map data = {
    'id': id
  };

  var payload = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: payload
  );
  print("${response.statusCode}");
  prettyPrint("${response.body}");
  return response.body;
}

Future<String> test () async {

  var takePictureResponse = await takePicture();
  // print(takePictureResponse);
  Map<String, dynamic> pictureInfo = jsonDecode(takePictureResponse.body);
  String id = pictureInfo['id'];
  print(id);

  //TODO put into loop
  return commandState(id);
}