import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

const String _url = 'http://192.168.1.1/osc/commands/execute';
const Map<String, String> _headers = {
  'Content-Type': 'application/json;charset=utf-8'
};

/// take picture
/// https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.take_picture/
Future<Map<String, dynamic>> takePicture() async {
  var data = {'name': 'camera.takePicture'};
  //encode Map to JSON
  var body = jsonEncode(data);
  var response = await http.post(_url, headers: _headers, body: body);
  var responseBody = jsonDecode(response.body);
  return responseBody;
}
