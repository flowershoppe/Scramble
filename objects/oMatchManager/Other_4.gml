var _array = 
[
	spGameBG1,
	spGameBG2,
	spGameBG3,
	spGameBG4,
	spGameBG5,
	spGameBG6
];
var _spr = _array[irandom_range(0, array_length(_array) - 1)];
switch(room)
{
	case rGame:
		if(!instance_exists(oBackground))
		{
			instance_create_layer(0, 0, "Background", oBackground, {spr : _spr});
		}	
		
	break;
}