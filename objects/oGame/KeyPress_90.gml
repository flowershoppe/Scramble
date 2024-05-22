var _test = valid_play();
if(_test)
{
	
	oPlayer.point_total += calculate_points();
	debug3 = calculate_points();
	
	next_turn();
}

