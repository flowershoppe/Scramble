name = "Fridge";
description = "Played food words gain a 2x word multiplier.";

receiver = new Receiver();

receiver.add("check words", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		
		for(_i = 0; _i < _length; _i++)
		{
			//if it's in the dicionary and the food dictionary
			if(global.dictionary.check(string_lower(_words[_i])) 
				and global.dictionary_food.check(string_lower(_words[_i])))
			{
				oPlayer.word_mult_bonus[_i] *= 2;
				animate = !animate; 
				broadcast("charm trigger");
			}
		}
	});
	