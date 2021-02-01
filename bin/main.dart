import 'package:apitest/cli/get_metadata.dart';
import 'package:apitest/cli/get_options_cli.dart';
import 'package:apitest/cli/set_mode_image_cli.dart';
import 'package:theta/theta.dart';
import 'dart:convert';
import 'package:apitest/cli/info_cli.dart';
import 'package:apitest/cli/state_cli.dart';
import 'package:apitest/cli/take_picture_cli.dart';
import 'package:apitest/cli/list_files_cli.dart';
// import 'package:apitest/help.dart';
import 'package:apitest/options/reset_my_setting.dart';
import 'package:apitest/commands/delete_all.dart';
import 'package:apitest/thumbnails/not-working-list_all_thumnails.dart';
import 'package:apitest/options/set_autobracket.dart';
import 'package:apitest/download_ready.dart';
// import 'package:args/args.dart';
import 'package:apitest/list_files.dart';
import 'package:apitest/commands/get_options.dart';
import 'package:apitest/download_file.dart';
import 'package:apitest/get_last_image_url.dart';
import 'package:apitest/commands/get_metadata.dart';
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
import 'package:args/command_runner.dart';
import 'package:apitest/cli/hdr_cli.dart';

void prettyPrint(map) {
  print(JsonEncoder.withIndent('  ').convert(map));
}

void main(List<String> args) async {
  final runner = CommandRunner('dart bin/main.dart', 'access RICOH WebAPI')
    ..addCommand(HdrCli())
    ..addCommand(InfoCli())
    ..addCommand(StateCli())
    ..addCommand(TakePictureCli())
    ..addCommand(ListFilesCli())
    ..addCommand(SetModeImageCli())
    ..addCommand(GetOptionsCli())
    ..addCommand(GetMetadataCli());
  await runner.run(args);

  if (args.isEmpty) {
    print('moving to args package.  Help will be updated soon');
  } else {
    switch (args[0]) {
      // case 'saveHdr':
      //   {
      //     await saveHdr();
      //   }
      //   break;

      case 'downloadFile':
        {
          /// download a single file
          downloadFile();
        }
        break;

      // case 'getMetadata':
      //   {
      //     var url = await getLastImageUrl();
      //     await getMetadata(url);
      //   }
      //   break;

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
          print('moving to args package.  Help will be updated soon');
          // print(parser.usage);
        }
        break;

      default:
        {
          print('moving to args package.  Help will be updated soon');
          print('\n');
        }
        break;
    }
  }
}
