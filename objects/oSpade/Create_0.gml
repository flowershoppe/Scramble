event_inherited();
name = "Spade";
description = "Double a play's value if it contains at least 4 played vowels";
color = 5131854;

receiver = new Receiver();

receiver.add("check words", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		var _count = 0;

		//check each letter of each word
		while(_i < _length)
		{
			var _word = _words[_i];
			var _word_array = string_to_array(_word)
			
			var _k = 0;
			while(_k < array_length(_word_array))
			{
				var _letter = _word_array[_k];
				if(array_contains(global.vowels, _letter))
				{
					_count++;	
				}
				_k++;
			}
			_i++;			
		}
		if(_count >= 4)
		{
			animate = !animate; 
			broadcast("charm trigger");
			oPlayer.play_mult_bonus += 2
		}
	});
	