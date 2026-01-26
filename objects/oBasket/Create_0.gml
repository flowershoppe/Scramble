name = "Basket";
description = "When a match ends, store half of all extra points here. When a match starts, gain those points. Carrying: " + string(data);

receiver = new Receiver();
color = 6734587;
data = 0;

receiver.add("match end", function() 
	{ 
		data = round((oMatchManager.total_points - oMatchManager.point_min) / 2);
		animate = !animate;
		broadcast("charm trigger");
		description = "When a match ends, store half of all extra points here. When a match starts, gain those points. Carrying: " + string(data);
	});
	
receiver.add("match start", function()
	{
		oMatchManager.total_points += data;
		data = 0;
		description = "When a match ends, store half of all extra points here. When a match starts, gain those points. Carrying: " + string(data);
	});