name = "Ocarina";
description = "When you make a play, double its total point value if it contains only letters from the following: A, B, C, D, E, F, G";
color = c_aqua;

receiver = new Receiver();

receiver.add("check words", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		var _bool = true;	

		//check each letter of each word
		while(_i < _length)
		{
			var _word = _words[_i];
			var _word_array = string_to_array(_word)
			
			var _k = 0;
			while(_k < array_length(_word_array))
			{
				var _letter = _word_array[_k];
				if(ord(_letter) < ord("A") or ord(_letter) > ord("G"))
				_bool = false;		
				_k++;
			}
			_i++;			
		}
		
		if(_bool == true)
		{
			oPlayer.play_mult_bonus *= 2;	
			animate = !animate; 
			broadcast("charm trigger");
		}
	});