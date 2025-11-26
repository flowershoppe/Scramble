function create_levels(_amount, _type)
{
	var _active = false;
	var _spr = 0;
	for(var _i = 1; _i <= _amount; _i++)
	{
		if(_i == 1)
		{
			_active = true;
		}
		else
		{
			_active = false;
		}
		
		if(_i < _amount)
		{
			_spr = spIconCircuit;
		}
		else
		{
			_spr = spIconProcessor;
		}
		var _lv = instance_create_layer(room_width * (_i / (_amount + 1)), room_height * 0.5, "YUI", _type, 
			{
				active : _active,
				sprite_index : _spr
			});
		array_push(oRun.levels, _lv);	
	}
}