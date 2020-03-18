import 'dart:html';
import 'dart:convert';
void postState() {
  var data = { 'title' : 'My first post' };
  HttpRequest.request(
    'https://jsonplaceholder.typicode.com/posts',
    method: 'POST',
    sendData: json.encode(data),
    requestHeaders: {
      'Content-Type': 'application/json; charset=UTF-8'
    }
  )
  .then((resp) {
    print(resp.responseUrl);
    print(resp.responseText);           
  });
}