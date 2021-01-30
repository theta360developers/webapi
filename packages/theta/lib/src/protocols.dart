import 'dart:convert';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://192.168.1.1/osc/';
const Map<String, String> _headers = {
  'Content-Type': 'application/json;charset=utf-8'
};

/// construct a map from the response body and get camera
/// info, including firmware version and camera model
/// This is the request: GET http://192.168.1.1/osc/info
/// Example output
/// {
///   "manufacturer": "RICOH",
///   "model": "RICOH THETA SC2",
///   "serialNumber": "20001005",
///   "firmwareVersion": "01.51",
///   "supportUrl": "https://theta360.com/en/support/",
///   "gps": false,
///   "gyro": true,
///   "endpoints": {
///     "httpPort": 80,
///     "httpUpdatesPort": 80
///   },
///     2
///   ],
///   "api": [
///     "/osc/info",
///     "/osc/state",
///     "/osc/checkForUpdates",
///     "/osc/commands/execute",
///     "/osc/commands/status"
///   ],
///   "uptime": 219,
///   "_wlanMacAddress": "58:38:79:2b:ad:c5",
///   "_bluetoothMacAddress": "6c:21:a2:47:d9:05"
/// }
Future<Map<String, dynamic>> info() async {
  // GET http://192.168.1.1/osc/info
  var url = _baseUrl + 'info';

  try {
    var response = await http.get(url, headers: _headers);
    if (response.statusCode != 200) {
      print('request failed.  Camera may not be connected');
      print('response status code: ${response.statusCode}');
      return {'error': 'failed with status code ${response.statusCode}'};
    } else {
      print(response.request);
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

/// POST request to get camera state
/// example output
/// {
///  "fingerprint": "FIG_0001",
/// "state": {
///    "batteryLevel": 0.8,
///    "storageUri": "http://192.168.1.1/files/thetasc26c21a247d9055838792badc5",
///    "_apiVersion": 2,
///    "_batteryState": "charged",
///    "_cameraError": [],
///    "_captureStatus": "idle",
///    "_capturedPictures": 0,
///    "_latestFileUrl": "http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010294.JPG",
///    "_recordableTime": 0,
///    "_recordedTime": 0,
///    "_function": "normal"
///  }
/// }
Future<Map<String, dynamic>> state() async {
  var url = _baseUrl + 'state'; // osc/state
  var response = await http.post(url, headers: _headers);
  Map responseBody = jsonDecode(response.body);
  return responseBody;
}

/// get camera status.  Request that ID is passed
Future<Map<String, dynamic>> status(id) async {
  var url = _baseUrl + 'commands/status';

  var data = {'id': id};
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url, headers: _headers, body: body);
  print('The HTTP response code is: ${response.statusCode}');
  print('The HTTP response from status is:');
  Map responseBody = jsonDecode(response.body);
  // print(JsonEncoder.withIndent('  ').convert(responseBody));
  return responseBody;
}
