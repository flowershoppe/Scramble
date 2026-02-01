event_inherited();
name = "Hammer and Sickle";
description = "Each additional word spelled in a play doubles this charm's point bonus. Resets at end of turn. Point bonus: 1";
color = c_red;

receiver = new Receiver();

receiver.add("calculate points", function() 
	{ 
		var _factor = 1;
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		
		if(_length > 1)
		{
			for(var _i = 1; _i < _length; _i++)
			{
				_factor *= 2;
			}
			animate = !animate; 
			broadcast("charm trigger");
		}
		
		oPlayer.play_point_bonus += _factor;
	});
	