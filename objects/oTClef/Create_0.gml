event_inherited();
name = "Treble Clef";
description = "Increases point value of each vowel tile added to the tilebag by 1.";

receiver = new Receiver();

receiver.add("add tile to bag", function() 
	{ 
		var _tile = oTilebag.last_tile;
		
		if(array_contains(global.vowels, _tile.letter))
		{
			_tile.pointvalue++;	
			animate = !animate; 
			broadcast("charm trigger");
		}
	});
	