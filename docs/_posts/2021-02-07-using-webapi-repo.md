---
title:  "3 Ways To Use RICOH THETA WebAPI Test GitHub Repo"
tags: theta-tester
date:   2021-02-07
categories: tester
cover: /images/2021_02/tester_playlist.png
author: Craig Oda
license: false
---
## Using the Code Examples

There are different ways for you to use this repository.

### 1. Use Command Line Example Program

You can use this repository as a command line application to test the
RICOH THETA API.

There are two ways to use the command line application.

1. pre-compiled binaries for Windows and Linux are in the
[releases section](https://github.com/theta360developers/webapi/releases).
The binaries are faster to run, but more difficult to use in a
edit-build-test workflow. You can also build the binary yourself
with [dart2native](https://dart.dev/tools/dart2native).

2. if you have Dart installed on your computer, you can run the code
in debug mode, which is slower, but much better for the edit-test
development workflow.

```shell
dart bin/main.dart info
```

To quickly get started using the pre-compiled binaries, watch these
three videos in sequence.

1. [RICOH THETA API Command Line Tester introduction](https://youtu.be/yf--PIDahN8)
2. [Download Thumbnails, Set HDR, Disable Power Off with RICOH THETA WebAP](https://youtu.be/UXOlJwEc8gQ)
3. [RICOH THETA API - reset settings, reset my settings, delete all images, manage hdr](https://youtu.be/OZqUMtQEWCU)

### 2. Run Single or Multiple Commands From Standalone Scripts

The main function is in `bin/main.dart`. 

You can create another file with a different main function. For example,
this script is saved in `bin/test_standalone.dart`.

```dart
import 'package:apitest/standalone/protocols/info.dart';

void main() {
  getInfo();
}
```

Run it like this:

```shell
> dart .\bin\test_standalone.dart
{
  "manufacturer": "RICOH",
  "model": "RICOH THETA SC2",
```

### 3. Run Single or Multiple Commands From theta Package

If you import the [theta package](https://github.com/codetricity/theta),
you will have access to
all the [commands in the library](https://codetricity.github.io/theta/)
without having to import additional files.

```dart
import 'dart:convert';
import 'package:theta/theta.dart';

String pretty(map) {
  return (JsonEncoder.withIndent('  ').convert(map));
}

void main(List<String> args) async {
  print(await ThetaFile.listUrls(50));
}
```

Run the script with:

```shell
> dart .\bin\test_standalone.dart
{
  "manufacturer": "RICOH",
  "model": "RICOH THETA SC2",
```
