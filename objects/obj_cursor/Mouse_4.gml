held_tile = instance_place(x, y, obj_tile);

if(held_tile != noone)
{
	held_tile.layer = layer_get_id("Grabbed");
	held_tile.grabbed = true;
	audio_play_sound(place_sounds[random_range(0, array_length(place_sounds))], 1, 0, 0.8, 0, 1.5)
}