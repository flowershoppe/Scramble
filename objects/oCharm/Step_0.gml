if(oldanimate != animate)
{
	sprite_set_offset(sprite_index, sprite_width / 2, sprite_height / 2);
	audio_play_sound_on(oGame.emitter_SE, sound, false, 1);	
	wiggle(id);
}
oldanimate = animate;

if(wiggleAmplitude > 0) 
{
    wiggleTime++;
    image_angle = sin(wiggleTime * 2 * pi / wigglePeriod) * wiggleAmplitude;
    wiggleAmplitude = max(wiggleAmplitude - wiggleFalloff, 0);
}
else 
{
    image_angle = 0;
	sprite_set_offset(sprite_index, 0, 0);
}