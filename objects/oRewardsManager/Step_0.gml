//check for collision with info bar
var _yui = noone;
with(yui_document)
{
	if(yui_file == "YUI screens/info_bar.yui")
	{
		_yui = id;
	}
}
if(_yui != noone)
{
	var _bool = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), _yui)
}

//create rewards interface
if(room == rResults and (input_check_pressed("confirm") or input_mouse_check_pressed(mb_left)) 
	and !_bool and !global.paused and !rewarding)
{	
	//reward
	if(oMatchManager.exchange_count < 1){event_user(0);}
	rewarding = true;
}