import 'package:apitest/options/set_shutter.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SetShutterCli extends Command {
  @override
  final name = 'setShutter';

  @override
  final description = 'set shutter speed';

  SetShutterCli() {
    argParser
      ..addOption('speed',
          help: 'specify shutter speed as floating point number --speed=0.0004',
          allowed: [
            '0.00004',
            '0.00005',
            '0.0000625',
            '0.00008',
            '0.0001',
            '0.000125',
            '0.00015625',
            '0.0002',
            '0.00025',
            '0.0003125',
            '0.0004',
            '0.0005',
            '0.000625',
            '0.0008',
            '0.001',
            '0.00125',
            '0.0015625',
            '0.002',
            '0.0025',
            '0.003125',
            '0.004',
            '0.005',
            '0.00625',
            '0.008',
            '0.01',
            '0.0125',
            '0.01666666',
            '0.02',
            '0.025',
            '0.03333333',
            '0.04',
            '0.05',
            '0.06666666',
            '0.07692307',
            '0.1',
            '0.125',
            '0.16666666',
            '0.2',
            '0.25',
            '0.33333333',
            '0.4',
            '0.5',
            '0.625',
            '0.76923076',
            '1',
            '1.3',
            '1.6',
            '2',
            '2.5',
            '3.2',
            '4',
            '5',
            '6',
            '8',
            '10',
            '13',
            '15',
            '20',
            '25',
            '30',
            '60',
          ]);
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    if (argResults.wasParsed('speed')) {
      await setShutter(argResults['speed']);
      exit(0);
    } else {
      print('specify speed option --speed=0.002');
      printUsage();
    }
  }
}
