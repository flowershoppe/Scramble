name = "Cassette Tape";
data[0] = 0;
description = "Each time you spell a word you've spelled on a previous turn this match, this charm gains 1 point bonus. Point Bonus: " + string(data[0]);
color = c_ltgray;

//old words
data[1] = [];

receiver = new Receiver();

receiver.add("check words", function() 
	{ 
		var _words = oPlayer.turn_spelled_words;
		var _length = array_length(_words);
		
		for(var _i = 0; _i < _length; _i++)
		{
			var _word = _words[_i];
			if(array_contains(data[1], _word))
			{
				animate = !animate;
				broadcast("charm trigger");
				data[0] += 2;
				description = "Each time you spell a word you've spelled on a previous turn this match, this charm gains 2 point bonus. Point Bonus: " + string(data[0]);
			}
		}		
		data[1] = oMatchManager.spelled_words;
	});
	