name = "Poker Chip";
description = "When a random chance succeeds, gain 1 credit.";

receiver = new Receiver();

receiver.add("random success", function() 
	{ 
		oPlayer.money++;
		
		broadcast("gain money");
	});
	