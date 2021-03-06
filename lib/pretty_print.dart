import 'dart:convert';

void prettyPrint(String input) {
  const decoder = JsonDecoder();
  const encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  prettyString.split('\n').forEach((dynamic element) => print(element));
}
