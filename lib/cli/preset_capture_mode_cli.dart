/// preset shooting for SC2 only
///
import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';
// import 'package:dcli/dcli.dart';

class PresetCaptureModeCli extends Command {
  @override
  final name = 'preset';

  @override
  final description =
      'SC2 only. Preset shooting modes. face, night, lens-by-lens';

  PresetCaptureModeCli() {
    argParser
      ..addFlag('face',
          help: 'Portrait shooting. Face is adjusted to center of image',
          negatable: false)
      ..addFlag('night',
          help: 'Reduces noise. Detects face and attempts to clear face',
          negatable: false)
      ..addFlag('lens-by-lens',
          help: 'white balance and exposure adjustment per lens',
          negatable: false)
      ..addFlag('room', help: 'SC2B-specific preset', negatable: false)
      ..addFlag('image', help: 'set to default image mode', negatable: false);
  }

  Future<void> printPreset() async {
    var response = await CameraOption.getOption('_preset');
    //ignore: omit_local_variable_types
    String preset = response['results']['options']['_preset'];
    print('The RICOH THETA camera preset is set to $preset');
  }

  @override
  void run() async {
    if (argResults.wasParsed('face')) {
      await CameraOption.setOption('captureMode', '_preset');
      await CameraOption.setOption('_preset', 'face');
      await printPreset();
      exit(0);
    } else if (argResults.wasParsed('night')) {
      await CameraOption.setOption('captureMode', '_preset');
      await CameraOption.setOption('_preset', 'nightView');
      await printPreset();
      exit(0);
    } else if (argResults.wasParsed('lens-by-lens')) {
      await CameraOption.setOption('captureMode', '_preset');
      await CameraOption.setOption('_preset', 'lensbylensExposure');
      await printPreset();
      exit(0);
    } else if (argResults.wasParsed('room')) {
      await CameraOption.setOption('captureMode', '_preset');
      await CameraOption.setOption('_preset', 'lensbylensExposure');
      await printPreset();
      exit(0);
    } else if (argResults.wasParsed('image')) {
      await CameraOption.setOption('captureMode', 'image');
      await printPreset();
      print(
          'However, setting captureMode to image will override the preset and');
      print('the preset will be ignored');
      exit(0);
    } else {
      printUsage();
      exit(1);
    }
  }
}
