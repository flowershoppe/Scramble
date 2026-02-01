ind = 0;
letters = ["S", "C", "R", "A", "M", "B", "L", "E"];
length = array_length(letters);
size = sprite_get_width(spLetterTile);
width = size * (length - 1);
animate = false;
wiggle_count = 0;

x_loc = (room_width / 2) - (width / 2);
y_loc = room_height * 0.25;

//PRELOAD
#region
audio_play_sound_on(oGame.emitter_SE, sdPlayTile, false, 1, 0, , 1 + (0.5 * ind),);
audio_play_sound_on(oGame.emitter_SE, sdHit, false, 1, 0, , 1 + (0.5 * ind),);
var _letter = letters[ind];
var _tile = instance_create_layer(x_loc, y_loc, "Meta", oTile,
{
	on_board : true,
	letter : _letter,
	pointvalue : global.letters[? _letter],
	x : -64,
	y : -64,
	persistent : false,
});
with(instance_nearest(x_loc, y_loc, oTileHolder))
{
	tile = _tile;
}
instance_create_layer(-64, -64, "Meta", oShine);
#endregion

