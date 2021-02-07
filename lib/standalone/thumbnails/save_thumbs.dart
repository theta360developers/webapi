import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  'Content-Type': 'application/json;charset=utf-8'
};

Future<void> saveThumbs(urls) async {
  // use httpClient instead of a one-off http.get command to
  // keep network connection open
  var client = http.Client();
  try {
    // loop through list of urls
    for (var i = 0; i < urls.length; i++) {
      var response =
          await client.get('${urls[i]}?type=thumb', headers: headers);
      print(response.statusCode);
      print('writing file ${i + 1}');
      await File('thumbnail-${i + 1}.jpg').writeAsBytes(response.bodyBytes);
    }
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }
}
