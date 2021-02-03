import 'connect.dart';

const String _url = 'http://192.168.1.1/osc/commands/execute';

class CameraOption {
  ///Turn on hdr filter
  static Future<Map<String, dynamic>> hdrSet() async {
    var data = {
      'name': 'camera.setOptions',
      'parameters': {
        'options': {
          '_filter': 'hdr',
        }
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }

  /// turn off filter, incuding hdr, DR Comp, Noise Reduction, Hh hdr
  static Future<Map<String, dynamic>> filterOff() async {
    var data = {
      'name': 'camera.setOptions',
      'parameters': {
        'options': {
          '_filter': 'off',
        }
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }

  static Future<Map<String, dynamic>> setExposureProgram(programValue) async {
    var data = {
      'name': 'camera.setOptions',
      'parameters': {
        'options': {
          'exposureProgram': int.parse(programValue),
        }
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }

  /// save hdr filter setting to my settings to survive
  /// camera reboot
  static Future<Map<String, dynamic>> hdrSave() async {
    var data = {
      'name': 'camera._setMySetting',
      'parameters': {
        'options': {
          '_filter': 'hdr',
        },
        'mode': 'image'
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }

  /// Turn off filter in mySetting
  static Future<Map<String, dynamic>> filterSavedOff() async {
    var data = {
      'name': 'camera._setMySetting',
      'parameters': {
        'options': {
          '_filter': 'off',
        },
        'mode': 'image'
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }

  /// get current filter settings
  static Future<Map<String, dynamic>> get filterSetting async {
    var data = {
      'name': 'camera.getOptions',
      'parameters': {
        'optionNames': ['_filter']
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }

  /// get  filter saved settings
  static Future<Map<String, dynamic>> get filterSavedSetting async {
    var data = {
      'name': 'camera._getMySetting',
      'parameters': {
        'optionNames': ['_filter'],
        'mode': 'image'
      }
    };
    var response = connect(_url, 'post', data);
    return response;
  }
}
