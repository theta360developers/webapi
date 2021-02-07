import 'dart:convert';
import 'package:theta/theta.dart';

String pretty(map) {
  return (JsonEncoder.withIndent('  ').convert(map));
}

void main(List<String> args) async {
  print(await ThetaFile.listUrls(50));
}
