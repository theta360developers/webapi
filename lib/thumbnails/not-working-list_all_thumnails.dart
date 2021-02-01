// this is not working
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

int count = 5;
int start = 0;

Future<String> generateUrl() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var singleImage = {
    'name': 'camera.listFiles',
    'parameters': {'fileType': 'image', 'entryCount': '1', 'maxThumbSize': '0'}
  };

  var body = jsonEncode(singleImage);

  var singleResponse = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'}, body: body);

  Map<String, dynamic> latestImage = jsonDecode(singleResponse.body);
  var latestImageUrl = latestImage['results']['entries'][0]['fileUrl'];
  print(latestImageUrl);
  return latestImageUrl;
}

Future<int> listAllThumbnails() async {
  var url = 'http://192.168.1.1/osc/commands/execute';

  var executeCommand = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'all',
      'entryCount': count,
      'maxThumbSize': 640,
      '_detail': true,
      '_startFileUrl': await generateUrl()
      // '_startFileUrl':
      //     'http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010132.JPG'
    }
  };

  var body = jsonEncode(executeCommand);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json; charset=utf-8'}, body: body);

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
