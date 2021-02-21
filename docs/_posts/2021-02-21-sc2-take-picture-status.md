---
title:  "SC2 Take Picture Status"
tags: theta-tester
date:   2021-02-21
categories: tester
cover: https://cdn.pixabay.com/photo/2017/06/07/01/51/ready-2379042_960_720.jpg
author: Craig Oda
license: false
---

Using `/osc/status` to see the completion of `startCapture` on the SC2 does not work.
You must use `/osc/state` to see when the interval or bracket sequence ends.

Using `/osc/status` with `takePicture` does work.  However, the SC2 has a problem
with handling individual HTTP requests in rapid sequence.

Using `/osc/status`, I can take pictures in rapid sequence with the Z1 camera if I
space out the shots by 1 second.  I can likely reduce this delay, but I have not tried.

For the SC2, tests with 1 second and 2 second delays failed.

If I insert a delay of 10 seconds between pictures, I can take 200 pictures.

```bash
for counter in {1..200}
do
    ./theta.exe takeAndReady
    echo that was picture $counter
    ((counter++))
    # waiting 10 seconds for SC2 test
    echo waiting 10 seconds for the next shot
    sleep 10s

done
echo finished endurance test
```

## Example of Camera Status Check

This is the check used in the tests.

```dart
Future<String> isDone(String id) async {
  var url = 'http://192.168.1.1/osc/commands/status';
  var data = {'id': id};

  var payload = jsonEncode(data);

  var response = await http.post(url,
      headers: {'Content-Type': 'application/json;charset=utf-8'},
      body: payload);

  Map<String, dynamic> status = jsonDecode(response.body);
  String state = status['state'];

  return state;
}
```
