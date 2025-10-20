tile_sprite = global.tile_sprite;
hand_sprite = global.hand_sprite;
if(!global.paused){time ++;}
var _seconds = string(time div 60 mod 60)
var _minutes = string(time div 3600 mod 60)
var _hours = string(time div 216000)

length = "Run length: " + _hours + " H, " + _minutes + " M, " + _seconds + " S";

if(input_check_pressed("confirm") and room == rGameOver)
{
	room_goto(rMainMenu);
}

var _bool = false;

with(yui_document)
{
	if(yui_file == "YUI screens/results.yui")
	{
		_bool = true;	
	}
}

if(room == rResults and _bool == false)
{
	instance_create_layer(0, 0, "YUI", yui_document, global.stResults);		
}