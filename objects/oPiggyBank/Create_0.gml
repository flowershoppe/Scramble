event_inherited();
name = "Piggy Bank";
description = "When another charm effect triggers, gain 1 credit. This charm cannot trigger charms.";
color = 10658559;

receiver = new Receiver();

receiver.add("charm trigger", function() 
	{
		oPlayer.money++;
		broadcast("gain money");
		animate = !animate;
	});
	