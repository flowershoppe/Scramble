var _array = oBoard.holders;

_array[4, 0].start_point = true;

remove_holder(3, 2);
remove_holder(4, 2);
remove_holder(5, 2);

_array[0, 2].lmult = 2;
_array[8, 2].lmult = 2;
_array[4, 3].wmult = 2;
_array[8, 4].wmult = 2;
_array[0, 4].wmult = 2;


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