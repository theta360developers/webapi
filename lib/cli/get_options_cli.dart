import 'package:apitest/commands/get_options.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class GetOptionsCli extends Command {
  @override
  final name = 'getOptions';

  @override
  final description = 'get camera options';

  GetOptionsCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await getOptions();
    exit(0);
  }
}
