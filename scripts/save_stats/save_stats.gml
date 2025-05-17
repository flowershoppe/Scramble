function save_stats()
{
	var _saveData = 
	{
		wins : wins,
		losses : losses,
		play_time : play_time,
		run_count : run_count,
		tiles_played : tiles_played,
		words_spelled : words_spelled,
		
	}
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);

	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, game_save_id + "stats.save");
	buffer_delete(_buffer);

	show_debug_message("Game successfully saved at " + game_save_id)
}