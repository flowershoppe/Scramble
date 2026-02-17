if(inc > 0)
{
	var _ind = array_length(oMainMenu.menu_letters) - inc
	var _tile = noone;
	for(var i = 0; i < array_length(oTilebag.tiles); i++)
	{
		if(oTilebag.tiles[i].letter == oMainMenu.menu_letters[_ind])
		{
			_tile = oTilebag.tiles[i];
		}
	}
	var _tile_holder = tile_holder_array[_ind];
	alarm_set(1, interval);
	inc--
	audio_play_sound_on(oGame.emitter_SE, sdPlace1, false, 1);
	//place tile id in tile holder
	_tile_holder.tile = _tile;
	_tile.layer = layer_get_id("Hand_Tiles");
	_tile.visible = true;
	_tile.in_hand = true;
	_tile.x = _tile_holder.x;
	_tile.y = _tile_holder.y;
	_tile.persistent = false;
	wiggle(_tile);
}
