import 'package:apitest/commands/delete_all.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class DeleteAllCli extends Command {
  @override
  final name = 'deleteAll';

  @override
  final description = 'DANGER: Delete all image and video files from camera';

  DeleteAllCli() {
    //TODO: add verification check to make sure person really wants to delete the files
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await deleteAll();
    exit(0);
  }
}
