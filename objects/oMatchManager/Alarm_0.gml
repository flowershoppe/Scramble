//Animate tiles on play
yui_last_play = 0;
if(loss){exit;}
if(count < 7){count++;}
/*if(total_letters == 0)
{
	for(var i = 0; i < array_length(oPlayer.words_tiles); i++)
	{
		total_letters += array_length(oPlayer.words_tiles[i]);
	}
}*/
audio_play_sound_on(oGame.emitter_SE, sdPlayTile, false, 1, , , 1 + (0.5 * count),);
audio_play_sound_on(oGame.emitter_SE, sdHit, false, 1, , , 1 + (0.5 * count),);
var _tile = oPlayer.words_tiles[word_ind][letter_ind];
_tile.highlight = true;
instance_create_depth(_tile.x, _tile.y, _tile.depth - 1, oShine,
{
	alpha : 0.75,
	fade : true,
	color : 15784459
});

//move to next word
if(letter_ind >= array_length(oPlayer.words_tiles[word_ind]) - 1)
{
	word_ind++;
	letter_ind = 0;
}
//move to next letter
else if(word_ind < array_length(oPlayer.words_tiles))
{	
	letter_ind++;	
}
//reset
if(word_ind >= array_length(oPlayer.words_tiles))
{
	word_ind = 0;
	letter_ind = 0;
	total_letters = 0;
	count = 0;
	exit;
}
alarm_set(0, 5);