function gen_specs(_lvl)
{
	switch(_lvl)
	{
		case oLevel1:
			var _ran = irandom_range(3, 3);
			switch(_ran)
			{
				case 1:
					specs(25, -1, -1, 5);
				break;
				case 2:
					specs(-1, 10, 3, -1);
				break;
				case 3:
					specs(10, 25, 5, 5);
				break;
			}
		break;
	}
}

function specs(_point_min, _point_max, _turn_min, _turn_max)
{
	var _o = oMatchManager;
	_o.point_min = _point_min;
	_o.point_max = _point_max;
	_o.turn_min = _turn_min;
	_o.turn_max = _turn_max;
}