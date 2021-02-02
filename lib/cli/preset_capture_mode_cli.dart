import 'package:apitest/options/set_capture_preset.dart';
import 'package:apitest/options/set_mode_image.dart';

/// preset shooting for SC2 only
///
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';
import 'package:dcli/dcli.dart';

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
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    if (argResults.wasParsed('face')) {
      await setPreset('face');
      exit(0);
    } else if (argResults.wasParsed('night')) {
      await setPreset('nightView');
      exit(0);
    } else if (argResults.wasParsed('lens-by-lens')) {
      await setPreset('lensbylensExposure');
      exit(0);
    } else if (argResults.wasParsed('room')) {
      await setPreset('room');
      exit(0);
    } else if (argResults.wasParsed('image')) {
      await setModeImage();
      exit(0);
    } else {
      printUsage();
    }
  }
}
