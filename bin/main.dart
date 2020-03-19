import 'package:apitest/get_info.dart';
import 'package:args/args.dart';
import 'package:apitest/post_state.dart';
import 'package:apitest/take_picture.dart';
import 'package:apitest/list_files.dart';


void main(List<String> args) async {
  print(args);
  var parser = ArgParser();
  parser.parse(args);

  /// RICOH THETA info 
  /// Official API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/
  /// uncomment the line below to test info API
  // getInfo();

  /// camera state
  /// API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/state/
  // postState();

  /// take picture.  must pass payload that is json encoded
  /// API reference https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.take_picture/
  // takePicture();

  /// list files
  /// API reference: https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.list_files/
  listFiles();
}