// import 'dart:convert';
import 'package:theta/theta.dart';

// String pretty(map) {
//   return (JsonEncoder.withIndent('  ').convert(map));
// }

void main(List<String> args) async {
  await Camera.checkForUpdates('FIG_0006');
}
