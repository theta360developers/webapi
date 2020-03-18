# RICOH THETA Dart HTTP Request tests

RICOH THETA API requests for models V, Z1, and SC2. [API reference](https://api.ricoh/docs/theta-web-api-v2.1/)



![screenshot](images/screenshot.png)

## Usage

1. connect workstation to THETA with camera in access point (AP) mode
2. run `main.dart` file in `bin`

    dart bin/main.dart

## Camera Firmware Tested

* Z1 1.31.1
* RICOH THETA SC 1.20

![sc2 screenshot](images/sc2-screenshot.png)


## Troubleshooting Camera

### Testing Connection with GET info

The simplest command to the camera is GET info.

You can test it in a browser, curl, Postman.  In the test program, you can
look for the URL below.

    String url = 'http://192.168.1.1/osc/info';

If you are having problems getting a camera connection and want to test your
code with a known working API that returns a single JSON object, you can use a public Internet test server to return a single JSON object and print it out.

    // String url = 'https://swapi.co/api/people/1';
    // String url = 'https://jsonplaceholder.typicode.com/users/1';

## References

* [Dart HttpClient](https://codeburst.io/quick-tip-how-to-make-http-requests-in-dart-53fc407daf31)
* [Pretty Print JSON](https://colinstodd.com/posts/code/pretty-print-json-in-dart.html)

## Notes

https://pub.dev/packages/args

