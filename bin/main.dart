import 'dart:io';

import 'package:apitest/cli/download_file_cli.dart';
import 'package:apitest/cli/reset_cli.dart';
import 'package:apitest/cli/sleep_disable_cli.dart';
import 'package:apitest/cli/take_and_download_cli.dart';
import 'package:apitest/cli/take_and_ready_cli.dart';
import 'package:apitest/cli/get_metadata_cli.dart';
import 'package:apitest/cli/get_options_cli.dart';
import 'package:apitest/cli/off_disable_cli.dart';
import 'package:apitest/cli/set_exposure_compensation_two_cli.dart';
import 'package:apitest/cli/set_exposure_delay_five_cli.dart';
import 'package:apitest/cli/set_exposure_delay_zero_cli.dart';
import 'package:apitest/cli/set_mode_image_cli.dart';
import 'package:theta/theta.dart';
import 'dart:convert';
import 'package:apitest/cli/info_cli.dart';
import 'package:apitest/cli/state_cli.dart';
import 'package:apitest/cli/take_picture_cli.dart';
import 'package:apitest/cli/list_files_cli.dart';
import 'package:apitest/options/reset_my_setting.dart';
import 'package:apitest/commands/delete_all.dart';
import 'package:apitest/thumbnails/not-working-list_all_thumnails.dart';
import 'package:apitest/options/set_autobracket.dart';
import 'package:apitest/get_last_image_url.dart';
import 'package:apitest/options/get_timeshift.dart';
import 'package:apitest/options/set_capture_preset.dart';
import 'package:apitest/options/set_shutter.dart';
import 'package:apitest/commands/start_capture.dart';
import 'package:apitest/options/set_language.dart';
import 'package:apitest/thumbnails/get_thumb.dart';
import 'package:apitest/thumbnails/get_thumb_2.dart';
import 'package:apitest/list_urls.dart';
import 'package:apitest/thumbnails/save_thumbs.dart';
import 'package:apitest/thumbnails/get_all_thumbs.dart';
import 'package:apitest/thumbnails/write_all_thumbs.dart';
import 'package:apitest/commands/delete_test.dart';
import 'package:args/command_runner.dart';
import 'package:apitest/cli/hdr_cli.dart';

void prettyPrint(map) {
  print(JsonEncoder.withIndent('  ').convert(map));
}

void main(List<String> args) async {
  final runner = CommandRunner('./theta', 'RICOH WebAPI Tester')
    ..addCommand(HdrCli())
    ..addCommand(InfoCli())
    ..addCommand(StateCli())
    ..addCommand(TakePictureCli())
    ..addCommand(ListFilesCli())
    ..addCommand(SetModeImageCli())
    ..addCommand(GetOptionsCli())
    ..addCommand(GetMetadataCli())
    ..addCommand(SetExposureDelayFiveCli())
    ..addCommand(SetExposureDelayZeroCli())
    ..addCommand(SetExposureCompensationTwoCli())
    ..addCommand(OffDisableCli())
    ..addCommand(DownloadFileCli())
    ..addCommand(TakeAndReadyCli())
    ..addCommand(TakeAndDownloadCli())
    ..addCommand(ResetCli())
    ..addCommand(SleepDisableCli());

  await runner.run(args).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64);
  });

// The code below is not used
// it is being moved to the args package above
  if (args.isEmpty) {
    print('\n');
  } else {
    switch (args[0]) {
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

      default:
        {
          print('\n');
        }
        break;
    }
  }
}
