import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:theta/theta.dart';

Future<String> isDone(String id) async {
  var url = 'http://192.168.1.1/osc/commands/status';
  var data = {'id': id};

  var payload = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'},
      body: payload);

  Map<String, dynamic> status = jsonDecode(response.body);
  String state = status['state'];

  return state;
}

Future<String> downloadReady() async {
  var takePictureResponse = await ThetaRun.takePicture();
  String id = takePictureResponse['id'];

  var keepGoing = true;

  while (keepGoing) {
    var currentStatus = await isDone(id);

    await Future.delayed(const Duration(seconds: 1));
    if (currentStatus == 'done') {
      keepGoing = false;
    }
  }

  return 'ready';
}
