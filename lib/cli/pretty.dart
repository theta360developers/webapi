import 'dart:convert';

String pretty(map) {
  return (JsonEncoder.withIndent('  ').convert(map));
}
