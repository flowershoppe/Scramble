name = "Bass Clef";
description = "Increases point value of each consonant tile added to the tilebag by 1.";

receiver = new Receiver();

receiver.add("add tile to bag", function() 
	{ 
		var _tile = oTilebag.last_tile;
		
		if(array_contains(global.consonants, _tile.letter))
		{
			_tile.pointvalue++;	
		}
		
		broadcast("charm trigger");
	});
	