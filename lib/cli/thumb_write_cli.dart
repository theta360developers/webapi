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
      try {
        var thumbs = await ThetaFile.getThumbs(await ThetaFile.totalEntries);
        for (var i = 0; i < thumbs.length; i++) {
          await File('thumbnail-$i.jpg').writeAsBytes(thumbs[i]);
        }
      } catch (e) {
        print(e);
      }

      exit(0);
    } else {
      printUsage();
    }
  }
}
