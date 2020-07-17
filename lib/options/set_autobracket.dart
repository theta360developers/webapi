import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';
import 'dart:async';
import 'dart:convert';

Future<http.Response> autoBracket() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.setOptions',
    'parameters': {
      'options': {
        "_autoBracket": {
          "_bracketNumber": 3,
          "_bracketParameters": [
            {
              "shutterSpeed": 0.004,
              "iso": 400,
              "_colorTemperature": 5100,
              "exposureProgram": 1,
              "whiteBalance": "auto"
            },
            {
              "shutterSpeed": 0.004,
              "iso": 320,
              "_colorTemperature": 5100,
              "exposureProgram": 1,
              "whiteBalance": "auto"
            },
            {
              "shutterSpeed": 0.004,
              "iso": 2500,
              "_colorTemperature": 5000,
              "exposureProgram": 1,
              "whiteBalance": "auto"
            }
          ]
        }
      }
    }
  };

  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  print("${response.statusCode}");
  prettyPrint("${response.body}");
  return response;
}
