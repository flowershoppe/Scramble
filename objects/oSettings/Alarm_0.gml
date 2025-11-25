var _str = string(window_width) + " x " + string(window_height);
if(isfullscreen){_str = "Fullscreen";}
resolution_selector = new YuiArraySelector(resolution_items, _str);