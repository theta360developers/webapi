String get help => '''
usage: dart bin/main.py command

command must be one of the following:

help - prints this help file

info - 
  returns: manufacturer, model, serialNumber, _wlanMacAddress, 
  _bluetoothMacAddress, firmwareVersion, supportUrl, gps,
  gyro, uptime, api, endpoints, apiLevel.

model -  THETA model. SC2, V, Z1, other

firmware - camera firmware.  example: 1.60.1

state - current camera information
  returns: batteryLevel, storageUri, _apiVersion, _batteryState,
  _cameraError[], _captureStatus, _capturedPictures, _latestFileUri,
  _recordableTime, _recordedTime, _function

batteryLevel - shows camera battery level as a double number such as 0.8

status - 

takePicture - 

listFiles - 

getOptions - 

downloadFile - 

getMetadata - 

downloadReady - 

takeAndDownload - 

setExposureDelayFive - 

setExposureDelayZero - 

exposureCompensation - 

getTimeShift - 

setCapturePreset - 

setHdr - 

saveHdr - 

setShutter - 

filterOff - 

sleepOff - 

offOff - 

reset - 

resetMySetting - 

autoBracket - 

startCapture - 

setLanguage - 

saveThumbs - 

getThumb - 

getThumb2 - 

deleteAll - 

setModeImage - 

---

Example: dart bin/main.py info

''';
