name = "Treble Clef";
description = "After you make a play, add a temporary S to your hand";

receiver = new Receiver();

receiver.add("calculate points", function() 
	{ 
		add_temp_tile("S", global.letters[? "S"], 1);
	});
	