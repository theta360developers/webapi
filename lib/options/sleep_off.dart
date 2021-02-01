/// disable camera sleep
/// 65535 disables sleep
/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
/// https://api.ricoh/docs/theta-web-api-v2.1/options/sleep_delay/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

Future<http.Response> sleepOff() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        'sleepDelay': 65535,
      }
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
