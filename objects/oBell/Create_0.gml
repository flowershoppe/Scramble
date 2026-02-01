event_inherited();
name = "Bell";
description = "Whenever a charm triggers, gain a point. This charm cannot trigger charms.";
color = c_yellow;

//sound = sdBell2;

receiver = new Receiver();

receiver.add("charm trigger", function() 
	{ 
		if(oMatchManager.active)
		{
			oMatchManager.total_points += 1;
			animate = !animate;
		}
	});
	