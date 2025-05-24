var _array = oBoard.holders;

_array[3, 3].start_point = true;

_array[1, 1].wmult = 2;
_array[5, 1].wmult = 2;
_array[1, 5].wmult = 2;
_array[5, 5].wmult = 2;
_array[0, 3].lmult = 2;
_array[6, 3].lmult = 2;

//random holes
/*
var _count = 5;
var _array = oBoard.holders;

for(var i = 0; i < _count; i++)
{
	var _x = irandom_range(1, oBoard.grid_width - 1);
	var _y = irandom_range(1, oBoard.grid_height - 1);
	var _holder = _array[_x, _y];
	i--;
	if(_holder != noone)
	{
		if(!_holder.start_point)
		{
			instance_destroy(_holder);
			_array[_x, _y] = noone;
			i++;
		}
	}
}*/