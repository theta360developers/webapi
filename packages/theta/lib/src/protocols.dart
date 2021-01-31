import 'connect.dart';

const String _baseUrl = 'http://192.168.1.1/osc/';

class Camera {
  /// construct a map from the response body and get camera
  /// info, including firmware version and camera model
  /// This is the request: GET http://192.168.1.1/osc/info
  ///
  static Future<Map<String, dynamic>> get info async {
    // GET http://192.168.1.1/osc/info
    var url = _baseUrl + 'info';
    var response = connect(url, 'get');
    return response;
  }

  static Future<String> get firmware async {
    var cameraInfo = await info;
    return cameraInfo['firmwareVersion'];
  }

  static Future<String> get model async {
    var cameraInfo = await info;
    return cameraInfo['model'];
  }

  /// request: POST http://192.168.1.1/osc/state
  /// POST request to get camera state
  /// example output
  /// {
  ///  "fingerprint": "FIG_0001",
  /// "state": {
  ///    "batteryLevel": 0.8,
  ///    "storageUri": "http://192.168.1.1/files/thetasc26c21a247d9055838792badc5",
  ///    "_apiVersion": 2,
  ///    "_batteryState": "charged",
  ///    "_cameraError": [],
  ///    "_captureStatus": "idle",
  ///    "_capturedPictures": 0,
  ///    "_latestFileUrl": "http://192.168.1.1/files/thetasc26c21a247d9055838792badc5/100RICOH/R0010294.JPG",
  ///    "_recordableTime": 0,
  ///    "_recordedTime": 0,
  ///    "_function": "normal"
  ///  }
  /// }
  static Future<Map<String, dynamic>> get state async {
    var url = _baseUrl + 'state';
    // request: POST http://192.168.1.1/osc/state
    var response = connect(url, 'post');
    return response;
  }

  /// battery charge percentage
  static Future<double> get batteryLevel async {
    var cameraState = await state;
    return cameraState['state']['batteryLevel'];
  }

  /// get camera status.  Request that ID is passed
  /// POST http://192.168.1.1/osc/commands/status
  /// Get the ID from a command such as takePicture
  static Future<Map<String, dynamic>> status(id) async {
    //POST http://192.168.1.1/osc/commands/status
    var url = _baseUrl + 'commands/status';

    var body = {'id': id};
    var response = connect(url, 'post', body);
    return response;
  }
}
