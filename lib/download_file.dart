import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;


void downloadFile() async {

  var url ='http://192.168.1.1/osc/commands/execute';

  Map data = {
    'name': 'camera.listFiles',
    'parameters': {
      'fileType': 'image',
      'entryCount': 1,
      'maxThumbSize': 0
    }
  };
  //encode Map to JSON
  var body = jsonEncode(data);

  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"},
      body: body
  );

  Map<String, dynamic> thetaImage = jsonDecode(response.body);

  // test data
  // final testFileUrl = 'https://picsum.photos/200/300/?random';

  String imageFileUrl = thetaImage['results']['entries'][0]['fileUrl'];
  print("Writing file from the following URL");
  print(imageFileUrl);

  String imageFileName = imageFileUrl.split("/")[6];
  
  await File(imageFileName).writeAsBytes(await http.readBytes(imageFileUrl));

}

