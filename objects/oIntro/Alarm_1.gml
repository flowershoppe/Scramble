var _tile_size = sprite_get_width(spLetterTile);
var _letter = chr(irandom_range(65, 91));

audio_play_sound_on(oGame.emitter_SE, sdPlayTile, false, 1, 0.1 - count, , 1 + (0.5),);
audio_play_sound_on(oGame.emitter_SE, sdHit, false, 1, 0.1 - count, , 1 + (0.5),);
instance_create_depth(irandom_range(0, room_width), irandom_range(0, room_height), 0, oTile,
	{
		letter : _letter	
	});

if(count < 50)
{
	count++;
	alarm_set(1, 5);
}
else
{
	alarm_set(2, 200);	
}