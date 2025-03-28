name = "Cheese Wedge";
description = "When a turn starts, add 1 to this charm's sell value. Value: " + string(value);
color = c_yellow;

receiver = new Receiver();

receiver.add("turn start", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		value += oMatchManager.turn;
		description = "When a turn starts, add 1 to this charm's sell value. Value: " + string(value);
	});
