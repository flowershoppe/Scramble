var _count = 5;
var _array = oBoard.holders;

for(var i = 0; i < _count; i++)
{
	var _x = irandom_range(0, oBoard.grid_width);
	var _y = irandom_range(0, oBoard.grid_height);
	if(_array[_x, _y] != noone)
	{
		instance_destroy(_array[_x, _y]);
		_array[_x, _y] = noone;
	}
}