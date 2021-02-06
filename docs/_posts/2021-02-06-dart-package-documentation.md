---
title:  "THETA WebAPI Dart Package Documentation"
tags: theta-tester
date:   2021-02-06
categories: tester
cover: /images/2021_02/theta_doc.png
author: Craig Oda
license: false
---

Documentation for the Dart package for the RICOH THETA WebAPI is being
built up at [https://codetricity.github.io/theta/](https://codetricity.github.io/theta/).

The dartdoc tool to automatically generates documentation based on
embedded docstrings.

The package currently uses static properties and methods to expose the camera
information.

![static packages](/webapi/images/2021_02/theta_package_static.png)

The package can be installed either from GitHub with a link in pubspec.yaml or by
copying the package into your project.

### Install from Files

```yaml
dependencies:
  theta:
    path: packages/theta
```

### Install from GitHub Link

```yaml
dependencies:
  theta:
    git:
      url: https://github.com/codetricity/theta
      ref: main
```


## Example Command Line Use

```dart
...
yourFunction() async {
    print(await Camera.info);
}
```

### Full Program Example

A fully working program showing the `main` top-level function where the Dart
app starts working.

```dart
import 'package:theta/theta.dart';

void main(List<String> args) async {
  print(await Camera.info);
}
```

Assuming the test program is in `./bin/test_temporary.dart`, you can run the program and
see the output with:

```shell
> dart .\bin\test_temporary.dart     
{manufacturer: RICOH, model: RICOH THETA SC2, serialNumber: 20001005, firmwareVersion: 01.51, supportUrl: https://theta360.com/en/support/, gps: false, gyro: true, endpoints: {httpPort: 80, httpUpdatesPort: 80}, apiLevel: [2], api: [/osc/info, /osc/state, /osc/checkForUpdates, /osc/commands/execute, /osc/commands/status], uptime: 2088, _wlanMacAddress: 58:38:79:2b:ad:c5, _bluetoothMacAddress: 
6c:21:a2:47:d9:05}
```

### Formatting Camera Output for Humans to Read

You can format the output with the following conversion where `map` is the output from info.

```dart
JsonEncoder.withIndent('  ').convert(map)
```

Example:

```dart
import 'dart:convert';
import 'package:theta/theta.dart';

String pretty(map) {
  return (JsonEncoder.withIndent('  ').convert(map));
}

void main(List<String> args) async {
  print(pretty(await Camera.info));
}
```

Your output will now have nice indents.

```shell
> dart .\bin\test_temporary.dart
{
  "manufacturer": "RICOH",
  "model": "RICOH THETA SC2",
  "serialNumber": "20001005",
  "firmwareVersion": "01.51",
  "supportUrl": "https://theta360.com/en/support/",
  "gps": false,
  "gyro": true,
  "endpoints": {
    "httpPort": 80,
```
