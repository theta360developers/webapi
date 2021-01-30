/// single purpose commands to get information
/// from camera or to help another command
import 'dart:convert';
import 'package:http/http.dart' as http;

const _baseUrl = 'http://192.168.1.1/osc/';

/// return firmwareVersion of camera
Future<String> firmware() async {
  var url = _baseUrl + 'info';
  var response = await http.get(url);

  Map<String, dynamic> responseBody = jsonDecode(response.body);
  String firmwareVersion = responseBody['firmwareVersion'];
  return firmwareVersion;
}
