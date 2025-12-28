function remove_holder(_x, _y)
{
	var _array = oBoard.holders;
	var _holder = _array[_x, _y];
	var _coin = noone;
	with(_holder){_coin = instance_place(_array[_x, _y].x, _array[_x, _y].y, oCoin);}
	_holder.visible = false;
	_holder.active = false;	
	if(_coin != noone)
	{
		instance_destroy(_coin);	
	}
}