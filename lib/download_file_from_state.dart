/// This example uses osc/commands/status to get the state of takePicture,
/// then it uses osc/state to get the URL of the file for download.
/// The full process is:
/// 1. takePicture
/// 2. check on status of take picture and make sure state is done
/// 3. if the status does not show state as done, then loop back to the check
/// 4. if the status shows state as done, then get the URL of the last image with state
/// 5. download file and save to disk.  This only works on the command line

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apitest/download_ready.dart';
import 'package:apitest/firmware_version.dart';

Future<String> takeAndDownload() async {

  firmwareVersion();

  String readyStatus = await downloadReady();

  if (readyStatus == "ready") {
  var url ='http://192.168.1.1/osc/state';


  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}
  );

  Map<String, dynamic> thetaState = jsonDecode(response.body);


  // print(thetaState);
  String imageFileUrl = thetaState['state']['_latestFileUrl'];
  print("Writing file from the following URL");
  print(imageFileUrl);

  String imageFileName = imageFileUrl.split("/")[6];
  
    await File(imageFileName).writeAsBytes(await http.readBytes(imageFileUrl));
    print("download complete");
    return "success";
  } else {
    print("download failed");
    return "fail";
  }
}

