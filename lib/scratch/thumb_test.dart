import 'package:http/http.dart' as http;
import '../pretty_print.dart';
import 'dart:convert';
import 'dart:io';

int count = 3;
int start = 0;

Future<int> thumbTest() async {
  var url = 'http://192.168.1.1/osc/commands/execute';
  var stateUrl = 'http://192.168.1.1/osc/state';

  var stateResponse = await http.post(stateUrl);
  Map<String, dynamic> latestImage = jsonDecode(stateResponse.body);
  String latestImageUrl = latestImage['state']['_latestFileUrl'];

  Map executeCommand = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'all',
      'entryCount': count,
      'maxThumbSize': 640,
      '_detail': true,
      '_startFileUrl': latestImageUrl
    }
  };

  var body = jsonEncode(executeCommand);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=utf-8'}, body: body);

  Map<String, dynamic> imageInfo = jsonDecode(response.body);

  String thumb64 = imageInfo['results']['entries'][start]['thumbnail'];
  await File('thumbnail_${start + 1}.jpg').writeAsBytes(base64.decode(thumb64));

  if (start < count - 1) {
    start++;
    print('start is at $start');
    thumbTest();
  }
  return start;
}

// void iterateCounter() async {
//   print(await thumbTest());
//   // if (await thumbTest() < count - 1) {
//   //   start = start + 1;
//   //   print(start);
//   //   await thumbTest();
//   // }
// }
