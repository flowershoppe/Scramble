event_inherited();
name = "Eraser";
description = "At the start of each turn, the first tile in your hand becomes a blank tile until end of match.";
color = c_white;

receiver = new Receiver();

receiver.add("hand filled", function() 
	{
		broadcast("charm trigger");
		animate = !animate;
		var _tile = oPlayerHand.tile_holder_array[0].tile;
		_tile.old_letter = _tile.letter;
		wiggle(_tile);
		_tile.blank = true;
		_tile = "_";		
	});
	