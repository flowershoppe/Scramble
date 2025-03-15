name = "Cheese Wedge";
description = "When a turn starts, gain points equal to the current turn.";

receiver = new Receiver();

receiver.add("turn start", function()
	{
		oMatchManager.total_points += oMatchManager.turn;
	});
