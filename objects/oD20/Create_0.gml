name = "20-Sided Die";
description = "When a turn starts, has a 1-in-20 chance to quadruple the point value of a random tile in hand until end of match.";
color = c_blue;

receiver = new Receiver();

receiver.add("turn start", function() 
	{ 
		if(irandom(20) == 20)
		{
			var _tile = oPlayerHand.tile_holder_array[irandom_range(0, oPlayerHand.size)].tile;
			
			_tile.pointvalue *= 4;	
			
			broadcast("random success");
			animate = !animate; 
			broadcast("charm trigger");
		}
	});

	