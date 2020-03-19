import 'package:apitest/get_info.dart';
import 'package:args/args.dart';
import 'package:apitest/post_state.dart';
import 'package:apitest/take_picture.dart';
import 'package:apitest/list_files.dart';
import 'package:apitest/get_options.dart';

void printUsage() {
  print("\n  usage: dart bin/main.py command");
  print("    command must be one of the following:");
  print("    info, state, takePicture, listFiles, getOptions \n");
  print("    example: dart bin/main.py info \n");
}

void main(List<String> args) async {
  var parser = ArgParser();
  parser.parse(args);

  if (args.length < 1) {
    printUsage();
  } else {
    switch (args[0]) {
      case "info":
        {
          /// RICOH THETA info
          /// Official API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/
          /// uncomment the line below to test info API
          getInfo();
        }
        break;

      case "state":
        {
          /// camera state
          /// API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/state/
          postState();
        }
        break;

      case "takePicture":
        {
          /// take picture.  must pass payload that is json encoded
          /// API reference https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.take_picture/
          takePicture();
        }
        break;

      case "listFiles":
        {
          /// list files
          /// API reference: https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.list_files/
          listFiles();
        }
        break;

      case "getOptions":
        {
          /// get options
          getOptions();
        }
        break;

      default:
        {
          printUsage();
        }
        break;
    }
  }
}
