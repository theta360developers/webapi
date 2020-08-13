import 'package:apitest/options/reset_my_setting.dart';
import 'package:apitest/commands/delete_all.dart';
import 'package:apitest/list_all_thumnails.dart';
import 'package:apitest/options/set_autobracket.dart';
import 'package:apitest/protocols/info.dart';
import 'package:apitest/protocols/state.dart';
import '../lib/protocols/status.dart';
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
import 'package:apitest/options/set_hdr.dart';
import 'package:apitest/options/set_shutter.dart';
import 'package:apitest/commands/start_capture.dart';
import 'package:apitest/options/set_my_setting.dart';
import 'package:apitest/options/set_exposure_compensation_two.dart';
import 'package:apitest/options/filter_off.dart';
import '../lib/options/set_language.dart';
import '../lib/get_thumb.dart';
import 'package:apitest/get_thumb_2.dart';
import 'package:apitest/scratch/thumb_test.dart';
import 'package:apitest/commands/reset.dart';
import 'package:apitest/options/sleep_off.dart';
import 'package:apitest/options/off_off.dart';
import 'package:apitest/list_urls.dart';
import 'package:apitest/scratch/save_thumbs.dart';

/// Official API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/

void printUsage() {
  print("\n  usage: dart bin/main.py command");
  print("    command must be one of the following:");
  print("    info, state, status, takePicture");
  print("    listFiles, getOptions, downloadFile");
  print("    getMetadata, firmware, downloadReady, takeAndDownload");
  print("    setExposureDelayFive, setExposureDelayZero, exposureCompensation");
  print("    getTimeShift, setCapturePreset, setHdr, saveHdr, setShutter");
  print("    filterOff, sleepOff, offOff, reset, resetMySetting");
  print("    autoBracket, startCapture, setLanguage, getThumb, getThumb2");
  print("    deleteAll");
  print("    example: dart bin/main.py info");
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

      case "saveHdr":
        {
          saveHdr();
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

      case "setHdr":
        {
          setHdr();
        }
        break;

      case "setShutter":
        {
          setShutter();
        }
        break;

      case "autoBracket":
        {
          autoBracket();
        }
        break;

      case "startCapture":
        {
          startCapture();
        }
        break;

      case "exposureCompensation":
        {
          setExposureCompensationTwo();
        }
        break;

      case "filterOff":
        {
          filterOff();
        }
        break;

      case "status":
        {
          if (args.length == 2) {
            status(args[1]);
          } else {
            print('please supply id.  Example: dart main.dart status 306');
          }
        }
        break;

      case "setLanguage":
        {
          if (args.length == 2) {
            print('setting lang');
            setLanguage(args[1]);
          } else {
            print(args.length);
            print(
                'please supply language.  Example: dart main.dart setLanguage en-US');
            print(
                'supported values: en-US, en-GB, ja, fr, de, zh-TW, zh-CN, it, ko');
          }
        }
        break;

      case "getThumb":
        {
          String lastImageUrl = await getLastImageUrl();
          getThumb(lastImageUrl);
        }
        break;

      case "getThumb2":
        {
          String lastImageUrl = await getLastImageUrl();
          getThumb2(lastImageUrl);
        }
        break;

      case "listAllThumbnails":
        {
          listAllThumbnails();
        }
        break;

      case "thumbTest":
        {
          thumbTest();
        }
        break;

      case 'deleteAll':
        {
          deleteAll();
        }
        break;

      case "reset":
        {
          reset();
        }
        break;

      case "sleepOff":
        {
          sleepOff();
        }
        break;

      case "offOff":
        {
          offOff();
        }
        break;

      case "resetMySetting":
        {
          resetMySetting();
        }
        break;

      case "listUrls":
        {
          listUrls();
        }
        break;
      case "saveThumbs":
        {
          saveThumbs(await listUrls());
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
