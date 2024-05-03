player_name			= "Name";
point_total			= 0;
hand_size			= 7;
hand				= instance_create_layer(0, 0, "Hand", obj_playerhand);
hand.hand_width		= hand_size;
placed_tiles		= [];
turn_spelled_words	= [];