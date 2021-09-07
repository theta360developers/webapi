var pubspecContents = '''
name: apitest
version: 0.1.4-alpha
description: >-
  RICOH THETA WebAPI test implementation with Dart by Oppkey and the community.
  Based on RICOH THETA API v2.1 
  Direct questions to the community.theta360.guide. 
  The WebAPI is usually used with mobile apps.  This tool is a command line 
  interface to a Dart library that can also be used with Flutter for iOS 
  and Android.  This command line tool can be put into bash scripts. 
dependencies:
  http: ^0.12.2
  args: ^1.6.0
  theta:
    git:
      url: https://github.com/codetricity/theta
      ref: main
    # change the path below to the path above for production use
    # path: ../theta
  dcli: ^0.41.0
  yaml: ^2.2.1
  path: ^1.7.0  

environment:
  sdk: '>=2.10.0 <3.0.0'

dev_dependencies:
  pedantic: ^1.0.0

repository: https://github.com/theta360developers/webapi
homepage: https://theta360developers.github.io/webapi/
''';
