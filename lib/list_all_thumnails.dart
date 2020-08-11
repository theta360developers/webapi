import 'package:http/http.dart' as http;
import './pretty_print.dart';
import 'dart:convert';
import 'dart:io';

int count = 5;
int start = 0;

Future<int> listAllThumbnails() async {
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
  // print(response.statusCode);
  // prettyPrint(stateResponse.body);
  // print(latestImageUrl);
  // prettyPrint(response.body);

  Map<String, dynamic> imageInfo = jsonDecode(response.body);

  String thumb64 = imageInfo['results']['entries'][start]['thumbnail'];
  await File('thumbnail_${start + 1}.jpg').writeAsBytes(base64.decode(thumb64));

  if (start < count - 1) {
    iterateCounter();
  }
  return start;
}

void iterateCounter() async {
  // print(await listFiles());
  if (await listAllThumbnails() < count - 1) {
    start = start + 1;
    print(start);
    await listAllThumbnails();
  }
}
