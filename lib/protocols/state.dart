import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';


void postState() async {
  var response = await http.post('http://192.168.1.1/osc/state');
  prettyPrint(response.body);
}