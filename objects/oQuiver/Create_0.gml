name = "Quiver";
description = "Hand size increased by 1.";
color = 359082;
has_increased = false;

receiver = new Receiver();

receiver.add("match start", function()
	{
		broadcast("charm trigger");
		animate = !animate;
	});