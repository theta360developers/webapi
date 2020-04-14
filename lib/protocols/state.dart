import 'package:http/http.dart' as http;
import 'package:apitest/pretty_print.dart';


void postState() async {
  // test server
  // var response = await http.post('https://jsonplaceholder.typicode.com/posts',
  //   body: {
  //     'title': 'Post 1',
  //     'content': 'Lorem ipsum dolor sit amet',
  //   });
  var response = await http.post('http://192.168.1.1/osc/state');
  prettyPrint(response.body);
}