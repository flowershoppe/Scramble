alpha = 0;
typist = scribble_typist();
typist.in(1, 50);
wait = true;
alarm_set(0, 60);
sprite_prefetch_multi([spLetterTile]);

//PRELOAD
#region
var i = 0;
while(i < 10)
{
	audio_play_sound_on(oGame.emitter_SE, sdPlayTile, false, 1, 0, , 1 + (0.5),);
	audio_play_sound_on(oGame.emitter_SE, sdHit, false, 1, 0, , 1 + (0.5),);
	instance_create_depth(-64, -64, 0, oTile);
	instance_create_depth(-64, -64, 0, oShine);
	i++;
}
#endregion