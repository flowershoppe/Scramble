//if holding a tile
if(held_tile != noone)
{
	//if not overlapping with an ungrabbed tile and touching the board
	if((instance_place(x, y, obj_tile).layer != layer) and place_meeting(x, y, board_sprite))
	{
		with(held_tile)
		{
			//move held tile to tile layer
			layer = layer_get_id("Tiles");
			grabbed = false;
			move_snap(sprite_get_width(spr), sprite_get_height(spr));
			audio_play_sound(place_sounds[random_range(0, array_length(place_sounds))], 1, 0, 0.8)
		}
		held_tile = noone;
	}
}
