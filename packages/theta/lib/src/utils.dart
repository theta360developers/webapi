/// single purpose commands to get information
/// from camera or to help another command
import 'dart:convert';
import 'package:http/http.dart' as http;

/// return firmwareVersion of camera
Future<String> firmware() async {
  var url = 'http://192.168.1.1/osc/info';
  var response = await http.get(url);

  Map<String, dynamic> responseBody = jsonDecode(response.body);
  String firmwareVersion = responseBody['firmwareVersion'];
  return firmwareVersion;
}
