if(valid_play())
{
	oPlayer.point_total += calculate_points();
	debug3 = calculate_points();
	
	next_turn();
}

