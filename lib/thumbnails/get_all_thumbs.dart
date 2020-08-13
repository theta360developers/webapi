import 'dart:async';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  "Content-Type": "application/json;charset=utf-8"
};

Future<List<dynamic>> getAllThumbs(urls) async {
  // use httpClient instead of a one-off http.get command to
  // keep network connection open
  var client = http.Client();

  List<dynamic> thumbs = [];

  try {
    // loop through list of urls
    for (var i = 0; i < urls.length; i++) {
      var response =
          await client.get('${urls[0]}?type=thumb', headers: headers);
      print(response.statusCode);
      print('loading file ${i + 1}');
      thumbs.add(response.bodyBytes);
    }
  } catch (e) {
    print(e);
  } finally {
    client.close();
  }

  return thumbs;
}
