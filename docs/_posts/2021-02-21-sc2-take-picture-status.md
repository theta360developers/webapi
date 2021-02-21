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

## SC2 Sequence Shot Result Summary


| Test # | delay after done | total delay between shots | number of shots | result |
| ------ | ---------------- | ------------------------- | --------------- | ------ |
| 1 | 1 second | 9 seconds | 200 | fail |
| 2 | 2 second | 10 seconds | 200 | fail |
| 3 | 10 seconds | 18 seconds | 200 | success |
| 4 | 5 seconds | 13 seconds | 200 | fail |
| 5 | 8 seconds | 16 seconds | 200 | success |
| 6 | 6 seconds | 14 seconds | 200 | success |
| 7 | 5 seconds | 13 seconds | 200 | success |
| 8 | 3 seconds | 11 seconds | 100 | ? |


## Test Environment

* uses takePicture, not startCapture
* uses non-HDR pictures
* SC2 with firmware 1.51
* SC2 is plugged into a power source with a USB cable.  However, this should not
be needed and should not impact the test
* SC2 is connected to Windows 10 computer with 2.4GHz Wi-Fi
* camera is within 50cm of computer
* camera is indoor, in the shade, during winter
* all media is deleted from camera prior to test

## Test Scripts

### Loop to take 200 Pictures

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

### Camera Status Check Code Snippet

This is the check used in the tests.  I put it into a loop to check
the status after each shot.  I check the status every second.

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

At the end of 200 files, I received this:

```shell
thumbnail download test completed
thumbnails are in local storage for inspection
```

## Example with 5 second delay

```bash
for counter in {1..200}
do
    ./theta.exe takeAndReady
    echo that was picture $counter
    ((counter++))
    # waiting 5 seconds for SC2 test
    echo waiting 5 seconds for the next shot
    sleep 5s
done
echo finished endurance test
```

__Result__
Fail.  Lost connection.

