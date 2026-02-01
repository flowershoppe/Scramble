event_inherited();
name = "Headphones";
description = "Played music words gain a 2x word multiplier.";

receiver = new Receiver();

receiver.add("check words", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		
		for(_i = 0; _i < _length; _i++)
		{
			var _word = string_lower(_words[_i]);
			var _word_length = string_length(_word);
			var _last_letter = string_char_at(_word, _word_length - 1);
			var _plural = string_delete(_word, _word_length - 1, 1);
			var _isplural = false;
			if(_last_letter == "s" and global.dictionary.check(_plural))
			{
				_isplural = true;
			}
			//if it's in the dicionary and the music dictionary
			if(global.dictionary.check(string_lower(_words[_i])) 
				and (global.dictionary_food.check(string_lower(_words[_i]))
					or (global.dictionary_food.check(_plural) and _isplural)))
			{
				oPlayer.word_mult_bonus[_i] *= 2;
				animate = !animate; 
				broadcast("charm trigger");
			}
		}
	});
	