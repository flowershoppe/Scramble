name = "Seedling";
description = "When a turn starts, gain points equal to the current turn.";
color = c_green;

receiver = new Receiver();

receiver.add("turn start", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		oMatchManager.total_points += oMatchManager.turn;
	});
