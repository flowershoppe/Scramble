//place tile ids that constitute words formed by placed tiles into player.words_tiles
//return total point score
function calculate_points(_player)
{
	var _word = "";
	var _player_words_tiles = _player.turn_spelled_words;
	var _player_tiles = _player.placed_tiles;
	var _tile = _player.placed_tiles[0];
	var _spr_size = _tile.spr_size;
	var _next_tile;
	var _array_tiles = [];
	var i = 0;
	var j = 0;
	var k = 0;
	var _val = 0;
	var _array_in_array = false;
	
	//run code on each tile in placed_tiles
	for(i = 0; i < array_length(_player_tiles); i++)
	{
		j = 0;
		
		//reset tile and array
		_tile = _player_tiles[i];
		_array_tiles = [];
		
		//HORIZONTAL
		#region
		//LEFT
		while(_tile != noone)
		{
			//insert tile id into temp array
			array_insert(_array_tiles, 0, _tile);
			
			//set tile to next tile to left
			with(_tile)
			{
				_next_tile = instance_place(_tile.x - _spr_size, _tile.y, obj_tile);
			}
			
			_tile = _next_tile;
		}
		
		//reset tile
		_tile = _player_tiles[i];
		
		//RIGHT
		while(_tile != noone)
		{
			//set tile to next tile to right
			with(_tile)
			{
				_next_tile = instance_place(x + _spr_size, y, obj_tile);
			}
			_tile = _next_tile;
			
			if(_tile != noone)
			{
				//insert tile id into temp array
				array_push(_array_tiles, _tile);
			}
		}
		
		_array_in_array = false;
		for(var a = 0; a < array_length(_player_words_tiles); a++)
		{
			if(_array_in_array == false)
			{
				_array_in_array = array_equals(_player_words_tiles[a], _array_tiles);
			}
		}
		//add tile id array to array if it hasn't appeared there yet
		if(_array_in_array == false and array_length(_array_tiles) > 1)
		{
			_player_words_tiles[k] = _array_tiles;
			k++;
			
		}
		#endregion
		
		//reset tile and array
		_tile = _player_tiles[i];
		_array_tiles = [];
		
		//VERTICAL
		#region
		//UP
		while(_tile != noone)
		{
			//insert tile id into temp array
			array_insert(_array_tiles, 0, _tile);
			
			//set tile to next tile up
			with(_tile)
			{
				_next_tile = instance_place(x, y - _spr_size, obj_tile);
			}
			_tile = _next_tile;
		}
		
		//reset tile
		_tile = _player_tiles[i];
		
		//DOWN
		while(_tile != noone)
		{
			//set tile to next tile down
			with(_tile)
			{
				_next_tile = instance_place(_tile.x, _tile.y + _spr_size, obj_tile);
			}
			_tile = _next_tile;
			
			if(_tile != noone)
			{
				//insert tile id into temp array
				array_push(_array_tiles, _tile);
			}
		}
		
		_array_in_array = false;
		a = 0;
		for(a = 0; a < array_length(_player_words_tiles); a++)
		{
			if(!_array_in_array)
			{
				_array_in_array = array_equals(_player_words_tiles[a], _array_tiles);
			}
		}
		//add tile id array to array if it hasn't appeared there yet
		if(!_array_in_array and array_length(_array_tiles) > 1)
		{
			_player_words_tiles[k] = _array_tiles;
			k++;
			
			//highlight tiles part of a spelled word
			for(j = 0; j < array_length(_array_tiles); j++)
			{
				_array_tiles[j].highlight = true;
			}
		}
		#endregion
	
	}
	
	var _lmult = 1;
	var _wmult = 1;
	var _subt = 0;
	var _holder = noone;
	var _total = 0;
	j = 0;
	k = 0;
	
	
	for(j = 0; j < array_length(_player_words_tiles); j++)
	{
		_lmult = 1;
		_wmult = 1;
		_subt = 0;
		
		for(k = 0; k < array_length(_player_words_tiles[j]); k++)
		{
			with(_player_words_tiles[j][k])
			{
				instance_create_layer(x, y, "UI", obj_highlighter);
				
				_holder = instance_place(x, y, obj_tile_holder);
				_lmult = instance_place(x, y, obj_tile_holder).lmult;
				pointvalue *= _lmult;
				//accumulate word multipliers
				_wmult *= _holder.wmult;
				//subtotal
				_subt += pointvalue;
			}
		}
		
		_subt *= _wmult;
		_total += _subt;
	}
		
	audio_play_sound(snd_sci_fi_bell, 0, 0);
	
	return _total;
	
	
	
}