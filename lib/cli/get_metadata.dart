import 'package:apitest/commands/get_metadata.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';
import 'package:dcli/dcli.dart';

class GetMetadataCli extends Command {
  @override
  final name = 'getMetadata';

  @override
  final description =
      'Get image metadata from camera by passing URL of the file';

  GetMetadataCli() {
    argParser
      ..addOption('url',
          help: 'Example: --url=http://192.168.1.1/files/../R0010307.JPG');
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (!argResults.wasParsed('url')) {
      print(red('please provide file URI on camera'));
      print(argParser.usage);
      exit(1);
    } else {
      //TODO: move to library. move print statement outside of library
      await getMetadata(argResults['url']);
      exit(0);
    }
  }
}
