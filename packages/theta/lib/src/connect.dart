import 'dart:convert';
import 'package:http/http.dart' as http;

const Map<String, String> _headers = {
  'Content-Type': 'application/json;charset=utf-8'
};

Future<Map<String, dynamic>> connect(String url, String protocol,
    [Map requestBodyMap]) async {
  http.Response response;

  try {
    if (protocol == 'get') {
      response = await http.get(url, headers: _headers);
      // print('request: ${response.request}');
    } else {
      if (requestBodyMap == null) {
        // print('the request body is null');
        response = await http.post(url, headers: _headers);
      } else {
        // print('the body is $requestBodyMap');
        response = await http.post(url,
            headers: _headers, body: jsonEncode(requestBodyMap));
        // print(response.body);
        // print(response.request);
      }
    }
    if (response.statusCode != 200) {
      print('request failed.  Camera may not be connected');
      print('response status code: ${response.statusCode}');
      print('request: ${response.request}');
      return {'error': 'failed with status code ${response.statusCode}'};
    } else {
      Map responseBody = jsonDecode(response.body);
      // print(JsonEncoder.withIndent('  ').convert(responseBody));
      // return a Dart map, not JSON
      return responseBody;
    }
  } catch (error) {
    print('an error occurred');
    print(error.runtimeType);
    return {'error': error.toString()};
  }
}
