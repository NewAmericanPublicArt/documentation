# Notes for tweaking installation #

There are three Teensy's in each of the two installations: the sensor Teensy, the audio Teensy, and the datalogger Teensy. Each runs firmware that needs to be separately compiled from the [source code](https://github.com/newamericanpublicart/ourself)

# About the datalogger #

The datalogger watches three pins and writes to a file called "datalog.txt" on the FAT32-formatted SD card. (This is the default format for most SD cards.) When one or more of the pins are high, it writes lines like this to the datalog:

```
2016-05-12T14:23:01Z,ARR,,
2016-05-12T14:23:02Z,ARR,,
2016-05-12T14:23:03Z,ARR,,
2016-05-12T14:23:04Z,,OCC,
2016-05-12T14:23:05Z,,OCC,
2016-05-12T14:23:06Z,,,DEP
2016-05-12T14:23:07Z,,,DEP
```

With the current state machine running on the sensor Teensy, `ARR` means that the microwave sensors have been triggered, but nobody is on the platform, i.e. it seems like someone has arrived. `OCC` means that someone is occupying the platform. `DEP` means that the platform was recently vacated and the microwave sensors are triggered, i.e. someone is probably departing.

### Warning ###

Don't delete the file "datalog.txt", or if you do, recreate it. If it doesn't exist, no data will be logged and you will be sad.

