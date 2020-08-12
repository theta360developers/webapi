import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';

void saveThumbs(urls) {
  urls.asMap().forEach((index, currentUrl) async {
    var response = await http.get('${urls[index]}?type=thumb',
        headers: {"Content-Type": "application/json;charset=utf-8"});
    print("${response.statusCode}");
    await Future.delayed(Duration(seconds: 1));

    // await File('thumbnail-$index.jpg').writeAsBytes(response.bodyBytes);
    print("$index");
  });
}
