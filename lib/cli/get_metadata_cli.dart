import 'package:apitest/commands/get_metadata.dart';
import 'package:apitest/get_last_image_url.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
// import 'pretty.dart';

class GetMetadataCli extends Command {
  @override
  final name = 'getMetadata';

  @override
  final description =
      'Get image metadata from camera by passing URL of the file';

  GetMetadataCli() {
    argParser
      //TODO: add option to get last file
      ..addOption('url',
          help: 'Example: --url=http://192.168.1.1/files/../R0010307.JPG');
  }

  @override
  void run() async {
    if (!argResults.wasParsed('url')) {
      var lastUrl = await getLastImageUrl();
      await getMetadata(lastUrl);
      print(
          'No URL specified. Using last image taken. Specify file with --url=http://192...');
      exit(0);
    } else {
      //TODO: move to library. move print statement outside of library
      await getMetadata(argResults['url']);
      exit(0);
    }
  }
}
