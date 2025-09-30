//place tile ids that constitute words formed by placed tiles into player.words_tiles
//return total point score
function check_words()
{
	if(oMatchManager.active == false){exit;}
	
	var _player = oPlayer;
	var _word = "";
	var _player_words_tiles = []
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
				_next_tile = instance_place(x - _spr_size, y, oTile);
				if(_next_tile != noone)
				{
					if(!_next_tile.on_board){ _next_tile = noone; }
				}
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
				if(_next_tile != noone)
				{
					if(!_next_tile.on_board){ _next_tile = noone; }
				}
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
				if(_next_tile != noone)
				{
					if(!_next_tile.on_board){ _next_tile = noone; }
				}
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
				if(_next_tile != noone)
				{
					if(!_next_tile.on_board){ _next_tile = noone; }
				}
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
	
	//-----CHECK DICTIONARY-----
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
		if(!global.dictionary.check(string_lower(_word)) and !global.cheat)
		{
			array_push(_fake_words, _word);
		}
		else
		{
			array_push(_spelled_words, _word);
			if(string_length(_word) > string_length(oMatchManager.largest_word))
			{oMatchManager.largest_word = _word;}
			if(string_length(_word) > string_length(oRun.largest_word))
			{oRun.largest_word = _word;}
		}
	}
	
	//display spelled/fake words
	if(array_length(_fake_words) > 0 and !global.cheat)
	{
		oMatchManager.print_message = "The following spelled words do not appear in the dictionary: " + 	"\n" + string(_fake_words);
		return false;
	}
	else //WORD IS VALID AND REAL
	{
		//each word spelled has a word mult bonus for charm purposes
		for(var i = 0; i < array_length(_spelled_words); i++)
		{
			array_push(oPlayer.word_mult_bonus, 1);
			array_push(oPlayer.word_point_bonus, 0);
		}
		
		oPlayer.turn_spelled_words = _spelled_words;
		oPlayer.words_tiles = _player_words_tiles;
		oMatchManager.last_words = [];
		for(var _index = 0; _index < array_length(_spelled_words); _index++)
		{
			var _spelled_word = _spelled_words[_index]	
			array_push(oMatchManager.spelled_words, _spelled_word);
			array_push(oMatchManager.last_words, _spelled_word);
		}
		oMatchManager.print_message = "";
		
		broadcast("check words");
		return true;
	}
	#endregion
	
	
}