name = "Snake";
description = "After you make a play, add a temporary S to your hand";
color = c_green;

receiver = new Receiver();

receiver.add("calculate points", function() 
	{ 
		animate = !animate; 
		broadcast("charm trigger");
		add_temp_tile("S", global.letters[? "S"], 1);
	});
	