import 'package:apitest/options/set_autobracket.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class AutoBracketCli extends Command {
  @override
  final name = 'autoBracket';

  @override
  final description = 'apply test 3 image auto bracket settings';

  AutoBracketCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await autoBracket();
    exit(0);
  }
}
