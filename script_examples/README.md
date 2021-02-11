# bash script for RICOH THETA WebAPI

bash scripts to run the command line tester from Oppkey on the RICOH THETA cameras.
The tester is incomplete.  We use it for our own testing and make it available so
people can replicate our tests or run their own tests. Good alternatives to this
tool are [curl](https://curl.se/) and [Postman](https://www.postman.com/).  As this
tool is incomplete, it can't replace curl or Postman.  However, it can help you
to browse the THETA API functionality and test behavior without having to constantly reference
the API documentation. 

To see available commands run `./theta.exe --help`

```shell
PS C:\Users\craig\Documents\Development\ricoh\webapi> .\theta.exe --help
RICOH WebAPI Tester

Usage: ./theta <command> [arguments]       

Global options:
-h, --help    Print this usage information.

Available commands:
  autoBracket            apply test 3 image auto bracket settings
  deleteAll              DANGER: Delete all image and video files from camera
  downloadFile           Download newest file and save to local computer
  exposureCompensation   set exposure compensation with --value=2.0
  exposureDelay          set self timer delay in seconds
  exposureProgram        set exposure program 1 (manual), 2 (auto), 3 (aperture Z1 only), 4 (shutter), 9 (iso)        
  getMetadata            Get image metadata from camera by passing URL of the file
  getOptions             get camera options
  getTimeShift           get Time Shift settings. SC2B, V, Z1 only
  hdr                    Enable, save, delete, disable, and show hdr settings
  info                   Camera info: model, serialNumber, apiLevel...
  listFiles              list all image and video files on camera
  listUrls               print and return URLs as an array of strings
  offDisable             Disable power off
  preset                 SC2 only. Preset shooting modes. face, night, lens-by-lens
  reset                  Reset camera settings. Camera will turn off. Need to reconnect
  resetMySetting         Reset mySettings (saved settings) to factory default
  setLanguage            Z1, V only. Set language with --lang=en-US
  setModeImage           Set camera to image mode
  setShutter             set shutter speed
  sleepDisable           Disable camera auto-sleep.
  startCapture           Start capture. Must specifiy capture mode
  state                  Camera state: batteryLevel, storageUri...
  status                 Show camera status. Requires id value returned from takePicture
  takeAndDownload        Take picture. Show elapsed time. Download to local disk.
  takeAndReady           Take picture. Show elapsed time. Show file URI when ready for download
  takePicture            take picture, similar to pressing shutter button
  thumbGet               Print image thumbnail byte data to screen. Pass URL of the file
  thumbWriteAll          Download and save all thumbnails to local storage.

Run "./theta help <command>" for more information about a command.
```

## setting complex options

Most of the commands and options are specified on the same line as `theta.exe`.

For most options, you do not need to create an options file.  If there is
only one parameter, specify the parameter with this convention.

```shell
.\theta.exe setOption --name=captureMode --value=video 
```

If the option consists of multiple parts, you can store the option parameters
in a file as a JSON string.  You can then use the file with the command below.

```bash
theta.exe setOption --jsonFile=options/bracket_2_config.json
```

You can see the parameters with `./theta.exe getOptions`

```shell
> .\theta.exe getOptions
200
{
  "name": "camera.getOptions",
  "results": {
    "options": {
      "_autoBracket": {
        "_bracketNumber": 2,
        "_bracketParameters": [
          {
            "aperture": 2.1,
            ...
```

### format of options file

The options file contains a JSON string.  It is not a dart map, though the
formats look almost identical. 

#### single option example of complex _autobracket

```shell
cat options/bracket_2_config.json
{
    "_autoBracket": {
      "_bracketNumber": 2,
      "_bracketParameters": [
        {
          "shutterSpeed": 0.004,
          "iso": 400,
          "_colorTemperature": 5100,
          "exposureProgram": 1,
          "whiteBalance": "auto"
        },
        {
          "shutterSpeed": 0.004,
          "iso": 320,
          "_colorTemperature": 5100,
          "exposureProgram": 1,
          "whiteBalance": "auto"
        }
      ]
    }
  }
  ```

