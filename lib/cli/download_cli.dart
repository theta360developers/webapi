import 'package:theta/theta.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class DownloadCli extends Command {
  @override
  final name = 'download';

  @override
  final description =
      'Save images, thumbnails or video files to local storage.';

  DownloadCli() {
    argParser
      ..addOption('thumb',
          help: 'save thumbnails. thumb=all or thumb=last',
          allowed: ['last', 'all'])
      ..addOption('files',
          help: 'save image and video files. may take a while',
          allowed: ['last', 'all']);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
    } else if (argResults.wasParsed('thumb')) {
      if (argResults['thumb'] == 'last') {
        await File('thumbnail.jpg')
            .writeAsBytes(await ThetaFile.getLastThumbBytes());
        exit(0);
      } else {
        try {
          var thumbs = await ThetaFile.getThumbs(await ThetaFile.totalEntries);
          for (var i = 0; i < thumbs.length; i++) {
            await File('thumbnail-$i.jpg').writeAsBytes(thumbs[i]);
          }
          exit(0);
        } catch (e) {
          print(e);
          exit(1);
        }
      }
    } else if (argResults.wasParsed('files')) {
      var numberOfFiles = 0;
      if (argResults['files'] == 'all') {
        print('saving all files. This may take some time');
        numberOfFiles = await ThetaFile.totalEntries;
      } else {
        print('saving last file');
        numberOfFiles = 1;
      }
      var urlList = await ThetaFile.listUrls(numberOfFiles);

      for (var url in urlList) {
        print('Starting work on file at $url');
        var imageFilename = url.split('/')[6];
        print('Starting download and write process for $imageFilename');
        await File(imageFilename).writeAsBytes(await http.readBytes(url));
      }
    } else {
      printUsage();
    }
  }
}
