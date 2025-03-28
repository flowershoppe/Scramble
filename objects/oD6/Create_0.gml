name = "6-Sided Die";
description = "When a turn starts, has a 1-in-6 chance to double the point value of a random tile in hand until end of match.";

receiver = new Receiver();

receiver.add("turn start", function() 
	{ 
		if(irandom(6) == 6)
		{
			var _tile = oPlayerHand.tile_holder_array[irandom_range(0, oPlayerHand.size)].tile;
		
			_tile.pointvalue *= 2;	
			
			broadcast("random success");
			animate = !animate; 
			broadcast("charm trigger");
		}
	});

	