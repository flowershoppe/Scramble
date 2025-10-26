name = "Snake";
description = "Each played S scores an additional point.";
color = c_green;

receiver = new Receiver();

receiver.add("calculate points", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		
		//check each letter of each word
		while(_i < _length)
		{
			var _word = _words[_i];
			var _word_array = string_to_array(_word)
			
			var _k = 0;
			while(_k < array_length(_word_array))
			{
				var _letter = _word_array[_k];
				if(_letter == "S")
				{
					animate = !animate; 
					broadcast("charm trigger");
					oMatchManager.total_points += 1;
					oMatchManager.last_play += 1;
				}
				_k++;
			}
			_i++;			
		}
	});
	