name = "Piggy Bank";
description = "When another charm effect triggers, gain 1 credit. This effect cannot trigger charms.";
color = c_fuchsia;

receiver = new Receiver();

receiver.add("charm trigger", function() 
	{
		oPlayer.money++;
		broadcast("gain money");
	});
	