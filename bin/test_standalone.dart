/// in the project root, look for ./lib/standalone
/// copy a script to another file such as info2.dart
/// 1. modify your new file
/// 2. import it with import 'package:apitest/standalone/mytests/info2.dart';
/// 3. run it with dart ./bin/test_standalone.dart
///
/// The scripts in standalone are only for reference and no longer used
/// by the comand line application
/// If you chain commands together, you may need to check camera status
/// between commands.  For example, if you attempt to take multiple
/// pictures in sequence, you need a delay of around 10 seconds for
/// the SC2.
///
/// Check status of camera to be safer.  The delay is easy for
/// testing, but it's better to check camera status for production.

import 'package:apitest/standalone/protocols/info.dart';

// import 'dart:io';

void main() async {
  getInfo();
}
