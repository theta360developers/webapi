/// SC2 does not reset mySetting with camera.reset
/// you need to initialize default values manually
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<http.Response> resetMySetting() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var data = {
    'name': 'camera._setMySetting',
    'parameters': {
      'options': {
        'exposureProgram': 2,
        '_filter': 'off',
        'exposureCompensation': 0.0,
        'whiteBalance': 'auto',
        'iso': 0,
        'shutterSpeed': 0,
        '_colorTemperature': 5000
      },
      'mode': 'image'
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'}, body: body);
  print('${response.statusCode}');
  prettyPrint('${response.body}');
  return response;
}
