// not sure what this does. deleting from commands for now.
import 'package:apitest/thumbnails/get_all_thumbs.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';

import '../list_urls.dart';
// import 'pretty.dart';

class ThumbGetAllCli extends Command {
  @override
  final name = 'thumbGetAll';

  @override
  final description = 'Print all thumbnail byte data to screen.';

  ThumbGetAllCli() {
    //TODO: add verification check to make sure person really wants to delete the files
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    var urls = await listUrls();
    print(await getAllThumbs(urls));
    exit(0);
  }
}
