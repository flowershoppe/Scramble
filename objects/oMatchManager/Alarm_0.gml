//Animate tiles on play
audio_play_sound_on(oGame.emitter_SE, sdPlayTile, false, 1, , , i + 1,);
for(var k = 0; k < array_length(oPlayer.words_tiles) - 1; k ++)
{
	oPlayer.words_tiles[k][i].highlight = true;	
}

if(i < array_length(oPlayer.words_tiles))
{
	i++;
	alarm_set(0, 30);
}
else
{
	oPlayer.words_tiles = [];	
}