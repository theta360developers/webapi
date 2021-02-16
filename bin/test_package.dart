// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:theta/theta.dart';

// String pretty(map) {
//   return (JsonEncoder.withIndent('  ').convert(map));
// }

void main(List<String> args) async {
  // var jsonConfig = (await File('options/option_config.json').readAsString());
  // var jsonConfig = (await File('options/bracket_2_config.json').readAsString());
  // var response = await CameraOption.setOptionJson(jsonConfig);
  // var response = await ThetaRun.stopCapture();
  var response = await (CameraOption.getMySetting());
  print(response);
}
