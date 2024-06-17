//place tile ids that constitute words formed by placed tiles into player.words_tiles
//return total point score
function calculate_points()
{
	if(oMatchState.active == false){exit;}
	
	var _player = oPlayer;
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
				_next_tile = instance_place(_tile.x - _spr_size, _tile.y, oTile);
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
				_next_tile = instance_place(x + _spr_size, y, oTile);
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
				_next_tile = instance_place(x, y - _spr_size, oTile);
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
				_next_tile = instance_place(_tile.x, _tile.y + _spr_size, oTile);
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
			
		}
		#endregion
	
	}
	
	//-----VERIFY WORDS SPELLED-----
	#region
	
	var _fake_words = [];
	var _spelled_words = [];
	for(var _index = 0; _index < array_length(_player_words_tiles); _index++)
	{
		_word = "";
		for(var _array_index = 0; _array_index < array_length(_player_words_tiles[_index]); _array_index++)
		{
			var _letter = _player_words_tiles[_index][_array_index].letter;
			_word = string_concat(_word, _letter);
		}
		if(!global.dictionary.check(string_lower(_word)))
		{
			array_push(_fake_words, _word);
		}
		else
		{
			array_push(_spelled_words, _word);
			if(string_length(_word) > string_length(oMatchStats.largest_word))
			{oMatchStats.largest_word = _word;}
		}
	}
	
	//display spelled/fake words
	if(array_length(_fake_words) > 0)
	{
		oMatchStats.print_message = "The following spelled words do not appear in the dictionary: " + 	"\n" + string(_fake_words);
		return 0;
	}
	else
	{
		oMatchStats.last_words = _spelled_words;
		oMatchStats.print_message = "";
	}
	
	//-----CALCULATE POINTS-----
	#region
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
				var _points = pointvalue;
				highlight = true;
				
				_holder = instance_place(x, y, oTileHolder);
				_lmult = instance_place(x, y, oTileHolder).lmult;
				_points *= _lmult;
				//accumulate word multipliers
				_wmult *= _holder.wmult;
				//subtotal
				_subt += _points;
			}
		}
		
		_subt *= _wmult;
		_total += _subt;		
	}
	
	//update stats
	oMatchStats.total_tiles += array_length(_player_words_tiles);
	if(_total > oMatchStats.largest_play){oMatchStats.largest_play = _total;}
	
	#endregion
	
	
	
	
	
	audio_play_sound(sdSciBell, 0, 0);
	
	return _total;
	
	
	
}