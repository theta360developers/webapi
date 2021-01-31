import 'package:theta/theta.dart';

void main(List<String> args) async {
  switch (args[0]) {
    case 'info':
      {
        /// RICOH THETA info
        /// example is in packages/theta/lib/src
        print(await Camera.info);
      }
      break;
  }
}
