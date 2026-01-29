//Animate tiles on play
yui_last_play = 0;
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

//animate points
var _point_x = _tile.x;
var _point_y = _tile.y;
var _font = oGame.tile_font;

instance_create_layer(_point_x, _point_y, "UI", oPointPrinter,
{
	pointvalue : scores[scores_count],
	font : _font
});
scores_count++;

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
	//print total score
	instance_create_layer(display_get_gui_width() / 2, display_get_gui_height() / 2, "UI", oPointPrinter,
	{
		pointvalue : scores[array_length(scores) - 1],
		font : _font,
		gui : true
	});
	word_ind = 0;
	letter_ind = 0;
	total_letters = 0;
	count = 0;
	scores = [];
	scores_count = 0;
	exit;
}
alarm_set(0, 5);