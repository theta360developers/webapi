import 'package:apitest/thumbnails/write_all_thumbs.dart';
import 'package:theta/theta.dart';
import 'package:args/command_runner.dart';
import 'dart:io';

class ThumbWriteCli extends Command {
  @override
  final name = 'thumbWrite';

  @override
  final description = 'Save thumbnails to local storage. All or last.';

  ThumbWriteCli() {
    argParser
      ..addFlag('all',
          help: 'save all thumbs to local storage', negatable: false)
      ..addFlag('last',
          help: 'save last thumbnail to local storage', negatable: false);
    ;
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
    } else if (argResults.wasParsed('last')) {
      await File('thumbnail.jpg')
          .writeAsBytes(await ThetaFile.getLastThumbBytes());
      exit(0);
    } else if (argResults.wasParsed('all')) {
      //TODO: move to library. move print statement outside of library
      await writeAllThumbs();
      exit(0);
    } else {
      printUsage();
    }
  }
}
