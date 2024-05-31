if(array_length(oPlayer.placed_tiles) == 0){exit;}
if(valid_play())
{	
	if(calculate_points() > 0)
	{
		oPlayer.point_total += calculate_points();
		debug3 = "score: " + string(oPlayer.point_total);
		debug4 = "last play: " + string(calculate_points());
	
		next_turn();
	}
}

