---
title:  "Flutter Demo of THETA WebAPI Tester"
tags: theta-tester
date:   2021-02-05
categories: tester
cover: /images/2021_02/theta_tester_flutter.png
author: Craig Oda
license: false
---

I've implemented a small subset of the THETA WebAPI into a [library on
GitHub](https://github.com/codetricity/theta).

![flutter demo](https://raw.githubusercontent.com/codetricity/theta_webapi_flutter_minimal/main/docs/images/android_demo.gif)

The [command line tool](https://github.com/theta360developers/webapi)
and the [Flutter tool](https://github.com/codetricity/theta_webapi_flutter_minimal)
are using the same library.

In the Flutter pubspec.yaml, add the theta package to the dependencies.

```yaml
dependencies:
  flutter:
    sdk: flutter
  theta:
    git:
      url: https://github.com/codetricity/theta
      ref: main
  http: ^0.12.2
```

In `main.dart`, import the `theta` package.

```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:theta/theta.dart';
```

You can now grab the camera info with `Camera.info`.

Example of code called by button press.

```dart
void _info() async {
    _displayResponse(await Camera.info);
}
```

The `_displayResponse()` method is an utility that
simply formats the Dart map as JSON with indents.

The button is constructed with this code.

```dart
MaterialButton(
    onPressed: _info,
    child: Text('info'),
    color: Colors.lightGreen,
),
```

