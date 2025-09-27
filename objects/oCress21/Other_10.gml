var _count = 5;
var _array = oBoard.holders;

for(var i = 0; i < _count; i++)
{
	var _x = irandom_range(0, oBoard.grid_width - 1);
	var _y = irandom_range(0, oBoard.grid_height - 1);
	if(_array[_x, _y] != noone)
	{
		instance_destroy(_array[_x, _y]);
		_array[_x, _y] = noone;
	}
}

//randomly assign an existing tile holder as start
var _start = _array[irandom_range(0, oBoard.grid_width - 1), irandom_range(0, oBoard.grid_height - 1)];
while(_start == noone)
{
	var _start = _array[irandom_range(0, oBoard.grid_width - 1), irandom_range(0, oBoard.grid_height - 1)];
}
_start.start_point = true;