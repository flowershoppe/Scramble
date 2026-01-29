name = "Ice Cream";
description = "When a match starts, gain 10 points. Lose 1 point when a turn starts.";

receiver = new Receiver();

receiver.add("match start", function()
	{
		animate = !animate;
		broadcast("charm trigger");
		oMatchManager.total_points += 10;
	});
receiver.add("turn start", function() 
	{ 
		animate = !animate;
		broadcast("charm trigger");
		oMatchManager.total_points --;
	});