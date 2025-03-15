name = "Loop";
data[0] = 0;
description = "When you play an O, add 1 to this charm's point bonus. Resets at match end and when a turn passes without playing an O. Bonus: " + string(data[0]);

receiver = new Receiver();

receiver.add("check words", function() 
	{ 		
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		var _bool = false;	

		//check each letter of each word
		while(_i < _length)
		{
			var _word = _words[_i];
			var _word_array = string_to_array(_word)
			
			var _k = 0;
			while(_k < array_length(_word_array))
			{
				var _letter = _word_array[_k];
				if(_letter == "O")
				{
					data[0]++;
					broadcast("charm trigger");
					_bool = true;		
				}
				_k++;
			}
			_i++;			
		}
				
		if(_bool == false)
		{
			data[0] = 0;
		}
		
		oPlayer.play_point_bonus += data[0];
		description = "When you play an O, add 1 to this charm's point bonus. Resets when you don't play an O. Bonus: " + string(data[0]);
	});
	
receiver.add("exchange", function()
	{
		data[0] = 0;
		description = "When you play an O, add 1 to this charm's point bonus. Resets when you don't play an O. Bonus: " + string(data[0]);
	});
	
receiver.add("match end", function()
	{
		data[0] = 0;
		description = "When you play an O, add 1 to this charm's point bonus. Resets when you don't play an O. Bonus: " + string(data[0]);
	});