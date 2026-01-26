name = "Scales";
description = "Double the value of your play if it contains equal vowels and consonants. Halve the value of all other plays.";
color = 37541;

receiver = new Receiver();

receiver.add("calculate points", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		var _array = oPlayer.turn_spelled_words;
		var _c = 0;
		var _v = 0;
		for(var i = 0; i < array_length(_array); i++)
		{
			var _word = _array[i];
			for(var j = 1; j <= string_length(_word); j++)
			{
				var _letter = string_char_at(_word, j);
				if(array_contains(global.vowels, _letter))
				{
					_v++;	
				}
				else
				{
					_c++;	
				}
			}
		}
		if(_c == _v)
		{
			oPlayer.play_mult_bonus *= 2;
		}
		else
		{
			oPlayer.play_mult_bonus /= 2;
		}
	});
