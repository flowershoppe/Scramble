name = "Poker Chip";
description = "When a random chance succeeds, gain 1 credit.";
color = c_green;

receiver = new Receiver();

receiver.add("random success", function() 
	{ 
		oPlayer.money++;
		
		broadcast("gain money");
		animate = !animate; 
		broadcast("charm trigger");
	});
	