import 'package:apitest/print_camera_response.dart';
import 'package:args/args.dart';

void main(List<String> args) async {
  print(args);
  var parser = ArgParser();
  parser.parse(args);

  // test data to return a single JSON objects from Internet
  // String url = 'https://swapi.co/api/people/1';
  // String url = 'https://jsonplaceholder.typicode.com/users/1';

  // RICOH THETA info
  String url = 'http://192.168.1.1/osc/info';
  connect(url);
}