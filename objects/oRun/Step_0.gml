time ++;
var _seconds = string(time div 60 mod 60)
var _minutes = string(time div 3600 mod 60)
var _hours = string(time div 21600)


length = "Run length: " + _hours + " hours, " + _minutes + " minutes, " + _seconds + " seconds";