import 'package:apitest/options/set_language.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SetLanguageCli extends Command {
  @override
  final name = 'setLanguage';

  @override
  final description = 'Z1, V only. Set language with --lang=en-US';

  SetLanguageCli() {
    argParser
      ..addOption('lang', help: 'set language --lang=en-US', allowed: [
        'en-US',
        'en-GB',
        'ja',
        'fr',
        'de',
        'zh-TW',
        'zh-CN',
        'it',
        'ko'
      ]);
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    if (argResults.wasParsed('lang')) {
      await setLanguage(argResults['lang']);
      exit(0);
    } else {
      print('specify lang option --lang=en-US');
      printUsage();
    }
  }
}
