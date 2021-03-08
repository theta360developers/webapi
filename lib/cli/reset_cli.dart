import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class ResetCli extends Command {
  @override
  final name = 'reset';

  @override
  final description =
      'Reset camera settings. Camera will turn off. Need to reconnect';

  ResetCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //ignore: omit_local_variable_types
    String model = await Camera.model;

    if (model.contains('SC2')) {
      print(
          'You are using a RICOH THETA SC2. We will perform addition reset commands');
      print('setting exposureProgram to 2 (auto)');
      await CameraOption.setMySetting('exposureProgram', 2);
      print('setting _filter to off (no hdr or other filters)');
      await CameraOption.setMySetting('_filter', 'off');
      print('setting exposureCompensation to 0.0 (all auto)');
      await CameraOption.setMySetting('exposureCompensation', 0.0);
      print('setting whiteBalance to auto');
      await CameraOption.setMySetting('whiteBalance', 'auto');
      print('setting iso to 0 (auto iso)');
      await CameraOption.setMySetting('iso', 0);
      print('setting shutterSpeed to 0 (auto shutter speed)');
      await CameraOption.setMySetting('shutterSpeed', 0);
      print('setting _colorTemperature to 5000');
      await CameraOption.setMySetting('_colorTemperature', 5000);
    }

    await Ambulance.reset();
    exit(0);
  }
}
