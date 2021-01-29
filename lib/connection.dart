import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Connection {
  Connection({String this.protocol});
  final protocol;
  static const String baseUrl = 'http://192.168.1.1/osc/';
  static const String header =
      '{"Content-Type": "application/json;charset=utf-8"}';
}
