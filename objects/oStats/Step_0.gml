play_time ++;
var _seconds = string(play_time div 60 mod 60)
var _minutes = string(play_time div 3600 mod 60)
var _hours = string(play_time div 216000)

time_string = _hours + " hours, " + _minutes + " minutes, " + _seconds + " seconds";

save_stats();