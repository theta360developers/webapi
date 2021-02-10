// import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:theta/theta.dart';

// String pretty(map) {
//   return (JsonEncoder.withIndent('  ').convert(map));
// }

void main(List<String> args) async {
  // var urlList = await ThetaFile.listUrls(await ThetaFile.totalEntries);
  var urlList = await ThetaFile.listUrls(2);

  for (var url in urlList) {
    print('Starting work on file at $url');
    var imageFilename = url.split('/')[6];
    print('Starting download and write process for $imageFilename');
    await File(imageFilename).writeAsBytes(await http.readBytes(url));
  }
}
