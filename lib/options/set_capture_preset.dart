/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.set_options/
/// https://api.ricoh/docs/theta-web-api-v2.1/options/exposure_delay/
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';


Future<http.Response> setPreset () async {
  var url ='http://192.168.1.1/osc/commands/execute';

/// For SC2 and SC2B preset can be "face", "nightView", "lensbylensExposure"
/// For SC2B, in addition, the preset can be "room"
 Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "captureMode": "_preset",
        "_preset": "lensbylensExposure"
      }
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );
  print("${response.statusCode}");
  prettyPrint("${response.body}");
  return response;
}