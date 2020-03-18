import 'package:apitest/get_info.dart';
import 'package:args/args.dart';

void main(List<String> args) async {
  print(args);
  var parser = ArgParser();
  parser.parse(args);

  // RICOH THETA info
  String url = 'http://192.168.1.1/osc/info';
  getInfo(url);
}