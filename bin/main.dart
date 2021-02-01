import 'dart:convert';
import 'dart:io';
import 'package:theta/theta.dart';
import 'package:apitest/help.dart';
import 'package:apitest/options/reset_my_setting.dart';
import 'package:apitest/commands/delete_all.dart';
import 'package:apitest/thumbnails/not-working-list_all_thumnails.dart';
import 'package:apitest/options/set_autobracket.dart';
import 'package:apitest/download_ready.dart';
import 'package:args/args.dart';
import 'package:apitest/list_files.dart';
import 'package:apitest/commands/get_options.dart';
import 'package:apitest/download_file.dart';
import 'package:apitest/get_last_image_url.dart';
import 'package:apitest/commands/get_metadata.dart';
// import 'package:apitest/scratch/test.dart';
import 'package:apitest/download_file_from_state.dart';
import 'package:apitest/options/set_exposure_delay_five.dart';
import 'package:apitest/options/set_exposure_delay_zero.dart';
import 'package:apitest/options/get_timeshift.dart';
import 'package:apitest/options/set_capture_preset.dart';
import 'package:apitest/options/set_shutter.dart';
import 'package:apitest/commands/start_capture.dart';
import 'package:apitest/options/set_exposure_compensation_two.dart';
import 'package:apitest/options/set_language.dart';
import 'package:apitest/thumbnails/get_thumb.dart';
import 'package:apitest/thumbnails/get_thumb_2.dart';
import 'package:apitest/commands/reset.dart';
import 'package:apitest/options/sleep_off.dart';
import 'package:apitest/options/off_off.dart';
import 'package:apitest/list_urls.dart';
import 'package:apitest/thumbnails/save_thumbs.dart';
import 'package:apitest/thumbnails/get_all_thumbs.dart';
import 'package:apitest/thumbnails/write_all_thumbs.dart';
import 'package:apitest/commands/delete_test.dart';
import 'package:apitest/options/set_mode_image.dart';

void prettyPrint(map) {
  print(JsonEncoder.withIndent('  ').convert(map));
}

void main(List<String> args) async {
  //TODO: implement args for better command line option flexibility
  //check in docs/_notes for a good tutorial video
  // https://youtu.be/kcF-cakpNo8
  var parser = ArgParser();
  parser.addFlag('hdr',
      help: 'specify internal camera hdr. Image is saved as JPG');

  parser.addFlag('filter-show',
      help: 'show current image filter. Example: hdr', negatable: false);

  parser.addFlag('filter-save-show',
      help: 'show current saved filter. Example: hdr', negatable: false);

  parser.addFlag('hdr-save',
      help: 'save hdr filter to mySetting to survive reboot');

  parser.addFlag('help',
      abbr: 'h', help: 'Print usage information', negatable: false);

  var parsedArguments = parser.parse(args);

  if (parsedArguments.wasParsed('hdr')) {
    print('setting hdr to ${parsedArguments['hdr']}');
    // this is a boolean
    if (parsedArguments['hdr']) {
      await CameraOption.hdrSet();
      print(await CameraOption.filterSetting);
      exit(0);
    } else {
      await CameraOption.filterOff();
      print(await CameraOption.filterSetting);
      exit(0);
    }
  } else if (parsedArguments.wasParsed('hdr-save')) {
    print('saving hdr: ${parsedArguments['hdr-save']}');
    // this is a boolean
    if (parsedArguments['hdr-save']) {
      await CameraOption.hdrSave();
      print(await CameraOption.filterSavedSetting);
      exit(0);
    } else {
      await CameraOption.filterSavedOff();
      print(await CameraOption.filterSavedSetting);
      exit(0);
    }
  } else if (parsedArguments.wasParsed('help')) {
    print(parser.usage);
    exit(0);
  } else if (parsedArguments.wasParsed('filter-show')) {
    print(await CameraOption.filterSetting);
    exit(0);
  } else if (parsedArguments.wasParsed('filter-save-show')) {
    print(await CameraOption.filterSavedSetting);
    exit(0);
  }

  if (args.isEmpty) {
    print(help);
  } else {
    switch (args[0]) {

      /// test case is for scratch data that you can
      /// throw away after you run an API test
      case 'test':
        {
          prettyPrint(await Camera.model);
          // test();
        }
        break;

      case 'info':
        {
          /// RICOH THETA info
          /// example is in packages/theta/lib/src/
          // Official API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/info/

          prettyPrint(await Camera.info);
        }
        break;

      case 'state':
        {
          /// camera state
          /// API reference https://api.ricoh/docs/theta-web-api-v2.1/protocols/state/
          /// example is in packages/theta/lib/src
          prettyPrint(await Camera.state);
        }
        break;
      case 'batteryLevel':
        {
          print(await Camera.batteryLevel);
        }
        break;

      case 'takePicture':
        {
          /// take picture.  must pass payload that is json encoded
          /// API reference https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.take_picture/
          prettyPrint(await takePicture());
        }
        break;

      case 'listFiles':
        {
          /// list files
          /// API reference: https://api.ricoh/docs/theta-web-api-v2.1/commands/camera.list_files/
          await listFiles();
        }
        break;

      // case 'saveHdr':
      //   {
      //     await saveHdr();
      //   }
      //   break;

      case 'setModeImage':
        {
          await setModeImage();
        }
        break;

      case 'getOptions':
        {
          /// get options
          await getOptions();
        }
        break;

      case 'downloadFile':
        {
          /// download a single file
          downloadFile();
        }
        break;

      case 'getMetadata':
        {
          var url = await getLastImageUrl();
          await getMetadata(url);
        }
        break;

      case 'firmware':
        {
          print(await Camera.firmware);
        }
        break;

      case 'model':
        {
          print(await Camera.model);
        }
        break;

      case 'downloadReady':
        {
          await downloadReady();
        }
        break;

      case 'takeAndDownload':
        {
          await takeAndDownload();
        }
        break;

      case 'setExposureDelayFive':
        {
          await setExposureDelayFive();
        }
        break;

      case 'setExposureDelayZero':
        {
          await setExposureDelayZero();
        }
        break;

      case 'getTimeShift':
        {
          await getTimeShift();
        }
        break;

      case 'setCapturePreset':
        {
          await setPreset();
        }
        break;

      // case 'setHdr':
      //   {
      //     await setHdr();
      //   }
      //   break;

      case 'setShutter':
        {
          await setShutter();
        }
        break;

      case 'autoBracket':
        {
          await autoBracket();
        }
        break;

      case 'startCapture':
        {
          await startCapture();
        }
        break;

      case 'exposureCompensation':
        {
          await setExposureCompensationTwo();
        }
        break;

      // case 'filterOff':
      //   {
      //     await filterOff();
      //   }
      //   break;

      case 'status':
        {
          if (args.length == 2) {
            prettyPrint(await Camera.status(args[1]));
          } else {
            print('please supply id.  Example: dart main.dart status 306');
          }
        }
        break;

      case 'setLanguage':
        {
          if (args.length == 2) {
            print('setting lang');
            await setLanguage(args[1]);
          } else {
            print(args.length);
            print(
                'please supply language.  Example: dart main.dart setLanguage en-US');
            print(
                'supported values: en-US, en-GB, ja, fr, de, zh-TW, zh-CN, it, ko');
          }
        }
        break;

      case 'getThumb':
        {
          var lastImageUrl = await getLastImageUrl();
          await getThumb(lastImageUrl);
        }
        break;

      case 'getThumb2':
        {
          var lastImageUrl = await getLastImageUrl();
          await getThumb2(lastImageUrl);
        }
        break;

      case 'listAllThumbnails':
        {
          await listAllThumbnails();
        }
        break;

      case 'deleteAll':
        {
          await deleteAll();
        }
        break;

      case 'reset':
        {
          await reset();
        }
        break;

      case 'sleepOff':
        {
          await sleepOff();
        }
        break;

      case 'offOff':
        {
          await offOff();
        }
        break;

      case 'resetMySetting':
        {
          await resetMySetting();
        }
        break;

      case 'listUrls':
        {
          await listUrls();
        }
        break;
      case 'saveThumbs':
        {
          await saveThumbs(await listUrls());
        }
        break;

      case 'getAllThumbs':
        {
          await getAllThumbs(await listUrls());
        }
        break;

      case 'writeAllThumbs':
        {
          await writeAllThumbs();
        }
        break;

      case 'deleteTest':
        {
          await deleteTest();
        }
        break;

      case 'help':
        {
          print(help);
          print(parser.usage);
        }
        break;

      default:
        {
          print('\nfor extended usage information');
          print('dart bin/main.dart help');
          print(parser.usage);
          print('\n');
        }
        break;
    }
  }
}
