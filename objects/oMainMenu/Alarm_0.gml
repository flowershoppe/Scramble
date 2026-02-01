if(room != rMainMenu)
{
	ind = 0
	x_loc = (room_width / 2) - (width / 2);
	y_loc = room_height * 0.25;
	exit;
}
audio_play_sound_on(oGame.emitter_SE, sdPlace1, false, 1);//, 1, , , 1 + (0.5 * ind),);
//audio_play_sound_on(oGame.emitter_SE, sdHit, false, 1, , , 1 + (0.5 * ind),);
var _letter = letters[ind];
var _tile = instance_create_layer(x_loc, y_loc, "Tiles", oTile,
{
	on_board : true,
	letter : _letter,
	pointvalue : global.letters[? _letter],
	x : x_loc,
	y : y_loc
});
wiggle(_tile);
with(instance_nearest(x_loc, y_loc, oTileHolder))
{
	tile = _tile;
}
/*instance_create_depth(x_loc, y_loc, layer_get_depth(layer_get_id("Tiles")) - 1, oShine,
{
	alpha : 0.75,
	fade : true,
	color : 15784459
});*/
ind++;
x_loc += size;

if(ind < length)
{
	alarm_set(0, 5);
}
else
{
	ind = 0;
	x_loc = (room_width / 2) - (width / 2);
	y_loc = room_height * 0.25;
}