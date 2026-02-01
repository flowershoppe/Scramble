event_inherited();
name = "20-Sided Die";
description = "When a turn starts, has a 1-in-20 chance to quadruple the point value of the right-most tile in hand until end of match.";
color = c_blue;

receiver = new Receiver();

receiver.add("turn start", function() 
	{ 
		if(irandom_range(1, 20 * (oPlayer.random_mod)) >= 20)
		{
			var _tile = oPlayerHand.tile_holder_array[oPlayerHand.size - 1].tile;
			
			_tile.pointvalue *= 4;	
			
			broadcast("random success");
			animate = !animate; 
			broadcast("charm trigger");
		}
	});

	