# Working commands

* info
* state
* takePicture
* listFiles - list last 10 files taken
* getOptions - specify list of options you want to get
* downloadFile - example of downloading the last file taken
* getMetadata - show all metadata.  Does not fully work on SC with firmware 1.31
* firmware - prints firmware version and camera model
* downloadReady - takes pictures and checks if picture is ready for download
* takeAndDownload - take picture and download using osc/state to get file URL
* setExposureDelayFive - set self-timer to five
* setExposureDelayZero - turn off self-timer
* getTimeShift - check if SC2 is in timeshift mode, takes two pictures, one lens at a time
* setCapturePreset - set SC2-specific preset modes to SC2. "face", "nightView", "lensbylensExposure"
* setHdr - SC2-specific command to set the _filter option that controls HDR mode
* setShutter - set shutter speed
* autoBracket - set SC2 to take bracketed images
* startCapture - start continuous shooting.  The type of shooting is controlled by `_mode`.
* saveHdr - uses `_setMySetting to save` `_filter` as hdr.  If you don't save the setting, it will revert back to _filter off.
* filterOff - turns off SC2 image filter.  This disables hdr, Hh hdr, Noise Reduction, DR Comp.  The _filter value is normally turned off when the camera goes to sleep or the Wi-Fi connection is dropped.
* sleepOff - disable camera auto-sleep
* offOff - disable camera auto power off
* reset - reset camera to default settings (SC2 does not reset all settings)
* getThumb - get thumbnail from SC2 list files.  This is a workaround as the published
API does not work with the SC2.  Saves single thumbnail to local storage for testing. Uses last image taken.
* getThumb2 - alternate method of getting thumbnails using type=thumb
* setlanguage - set human language of device.  supported values: en-US, en-GB, ja, fr, de, zh-TW, zh-CN, it, ko
* status - check camera status with ID
* resetMySetting - resets camera settings stored in MySetting. This could include
HDR, exposure compensation, whiteBalance, iso, shutterSpeed, and _colorTemperature
* deleteAll - delete all files on SC2.  Uses listFiles to get the number of files, then deletes each file
in a loop.  The SC2 API has a bug that prevents deletion of multiple files from the command with a single
API call.
* saveThumbs - save last 100 or less thumbnails to local storage for testing
