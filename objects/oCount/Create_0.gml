name = "The Count";
data = [1];
description = "Playing this charm's point bonus permanently increases its point bonus by 1. Point Bonus: " + string(data[0]) + ".";
color = c_fuchsia;

receiver = new Receiver();

receiver.add("check words", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		var _i = 0;
		var _bool = false;

		for(_i = 0; _i < _length; _i++)
		{
			if(wordify(data[0]) == _words[_i])
			{
				_bool = true;	
			}
		}
		
		if(_bool == true)
		{
			broadcast("charm trigger");
			data[0]++;	
			description = "Playing this charm's point bonus permanently increases its point bonus by 1. Point Bonus: " + string(data[0]) + ".";
		}
	});