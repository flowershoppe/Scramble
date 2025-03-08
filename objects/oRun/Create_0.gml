time = 0;
tiles_played = 0;
words_spelled = 0;
total_score = 0;
largest_word = "";
largest_play = 0;
money_earned = 0;

receiver = new Receiver();

receiver.add("gain money", function() 
	{ 
		money_earned++;
	});
	