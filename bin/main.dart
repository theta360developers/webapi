/// main.dart functions as a command router and runs
/// the command specified on the terminal. The command runner is stored in lib/cli
/// the scripts that talk to the camera are in either lib or packages/lib/src
/// Note that most of the commands will eventually be moved to packages/lib/src
/// to make it easier to reuse the scripts in other apps, including Flutter apps.
/// if you want to test a standalone script that is in a function,
/// call the function from a temporary file such as test_temporary.dart and then run the script.
/// Example use:
/// > ./theta info
/// returns
/// {
///  "manufacturer": "RICOH",
///  "model": "RICOH THETA SC2",
///  "serialNumber": "2000...5",
///  "firmwareVersion": "01.51",
///  ...
import 'dart:io';
import 'package:apitest/cli/auto_bracket_cli.dart';
import 'package:apitest/cli/delete_all_cli.dart';
import 'package:apitest/cli/download_file_cli.dart';
import 'package:apitest/cli/exposure_compensation_cli.dart';
import 'package:apitest/cli/exposure_delay_cli.dart';
import 'package:apitest/cli/exposure_program_cli.dart';
import 'package:apitest/cli/get_time_shift_cli.dart';
import 'package:apitest/cli/list_urls_cli.dart';
import 'package:apitest/cli/preset_capture_mode_cli.dart';
import 'package:apitest/cli/reset_mysetting_cli.dart';
import 'package:apitest/cli/set_language_cli.dart';
import 'package:apitest/cli/set_shutter_cli.dart';
import 'package:apitest/cli/start_capture_cli.dart';
import 'package:apitest/cli/status_cli.dart';
import 'package:apitest/cli/thumb_write_cli.dart';
import 'package:apitest/cli/reset_cli.dart';
import 'package:apitest/cli/sleep_disable_cli.dart';
import 'package:apitest/cli/take_and_download_cli.dart';
import 'package:apitest/cli/take_and_ready_cli.dart';
import 'package:apitest/cli/get_metadata_cli.dart';
import 'package:apitest/cli/get_options_cli.dart';
import 'package:apitest/cli/off_disable_cli.dart';
import 'package:apitest/cli/set_mode_image_cli.dart';
import 'package:apitest/cli/info_cli.dart';
import 'package:apitest/cli/state_cli.dart';
import 'package:apitest/cli/take_picture_cli.dart';
import 'package:apitest/cli/list_files_cli.dart';
import 'package:args/command_runner.dart';
import 'package:apitest/cli/hdr_cli.dart';

//TODO: add filterOff for all all filters. can copy from the hdr library

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
    ..addCommand(ExposureDelayCli())
    ..addCommand(ExposureCompensationCli())
    ..addCommand(OffDisableCli())
    ..addCommand(DownloadFileCli())
    ..addCommand(TakeAndReadyCli())
    ..addCommand(TakeAndDownloadCli())
    ..addCommand(ResetCli())
    ..addCommand(SleepDisableCli())
    ..addCommand(DeleteAllCli())
    ..addCommand(ThumbWriteCli())
    ..addCommand(ListUrlsCli())
    ..addCommand(PresetCaptureModeCli())
    ..addCommand(StartCaptureCli())
    ..addCommand(AutoBracketCli())
    ..addCommand(ResetMySettingCli())
    ..addCommand(SetShutterCli())
    ..addCommand(GetTimeShiftCli())
    ..addCommand(StatusCli())
    ..addCommand(SetLanguageCli())
    ..addCommand(ExposureProgramCli());

  await runner.run(args).catchError((error) {
    if (error is! UsageException) throw error;
    print(error);
    exit(64);
  });
}
