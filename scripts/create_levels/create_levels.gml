function create_levels(_amount, _type)
{
	var _active = false;
	for(var _i = 1; _i <= _amount; _i++)
	{
		if(_i == 1){_active = true;}
		else{_active = false;}
		array_push(oRun.levels, 
			instance_create_layer(room_width * (_i / (_amount + 1)), room_height * 0.5, "YUI", _type, {active : _active}));	
	}
}