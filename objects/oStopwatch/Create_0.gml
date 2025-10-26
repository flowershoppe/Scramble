name = "Stopwatch";
description = "Turn maximum increased by 1.";
color = c_silver;
has_increased = false;

receiver = new Receiver();

receiver.add("match start", function()
{
	if(!isnegative(oMatchManager.turn_max))
	{
		broadcast("charm trigger");
		oMatchManager.turn_max ++;
		animate = !animate;
	}
});