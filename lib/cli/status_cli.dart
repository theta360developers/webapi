import 'package:apitest/cli/pretty.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';

class StatusCli extends Command {
  @override
  final name = 'status';

  @override
  final description =
      'Show camera status. Requires id value returned from takePicture';

  StatusCli() {
    argParser..addOption('id', help: 'Example: --id=9580');
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (!argResults.wasParsed('id')) {
      print('Specify id with --id=9580');
      exit(1);
    } else {
      print(pretty(await Camera.status(int.parse(argResults['id']))));
      exit(0);
    }
  }
}
