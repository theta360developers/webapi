import 'package:apitest/protocols/info.dart';
import 'package:apitest/protocols/state.dart';
import 'package:apitest/download_ready.dart';
import 'package:apitest/firmware_version.dart';
import 'package:args/args.dart';
import 'package:apitest/commands/take_picture.dart';
import 'package:apitest/list_files.dart';
import 'package:apitest/commands/get_options.dart';
import 'package:apitest/download_file.dart';
import 'package:apitest/get_last_image_url.dart';
import 'package:apitest/commands/get_metadata.dart';
import 'package:apitest/scratch/test.dart';
import 'package:apitest/download_file_from_state.dart';
import 'package:apitest/options/set_exposure_delay_five.dart';
import 'package:apitest/options/set_exposure_delay_zero.dart';
import 'package:apitest/options/get_timeshift.dart';
import 'package:apitest/options/set_capture_preset.dart';


/// Official API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/


void printUsage() {
  print("\n  usage: dart bin/main.py command");
  print("    command must be one of the following:");
  print("    info, state, takePicture, listFiles, getOptions, downloadFile \n");
  print("    getMetadata, firmware, downloadReady, takeAndDownload, setExposureDelayFive \n");
  print("    setExposureDelayZero");
  print("    example: dart bin/main.py info \n");
}

void main(List<String> args) async {


  var parser = ArgParser();
  parser.parse(args);

  if (args.length < 1) {
    printUsage();
  } else {
    switch (args[0]) {

      /// test case is for scratch data that you can 
      /// throw away after you run an API test
      case "test":
        {
          test();
        }
        break;

      case "info":
        {
          /// RICOH THETA info
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
      
      case "downloadFile":
        {
          /// download a single file
          downloadFile();
        }
        break;

      case "getMetadata":
        {
          getLastImageUrl().then((url) {
            getMetadata(url);
          });
        }
        break;

      case "firmware":
        {
          firmwareVersion();
        }
        break;

      case "downloadReady":
        {
          downloadReady();
        }
        break;

      case "takeAndDownload":
        {
          takeAndDownload();
        }
        break;
      
      case "setExposureDelayFive":
        {
          setExposureDelayFive();
        }
        break;

      case "setExposureDelayZero":
        {
          setExposureDelayZero();
        }
        break;

      case "getTimeShift":
        {
          getTimeShift();
        }
        break;

      case "setCapturePreset":
        {
          setPreset();
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
