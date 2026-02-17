event_inherited();
name = "Poker Chip";
description = "When a random chance succeeds, gain 5 credits.";
color = 8112224;

receiver = new Receiver();

receiver.add("random success", function() 
	{ 
		oPlayer.money += 5;
		
		broadcast("gain money");
		animate = !animate; 
		broadcast("charm trigger");
	});
	