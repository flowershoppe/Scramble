event_inherited();
name = "Eraser";
description = "At the start of each turn, the first tile in your hand becomes a blank tile.";
color = c_white;

receiver = new Receiver();

receiver.add("turn start", function() 
	{ 						
		oPlayerHand.tile_holder_array[0].tile.letter = "_";		
	});
	