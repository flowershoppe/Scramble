event_inherited();
name = "Sewing Needle";
description = "When a match ends, if score equals target, gain 20 mytes" + string(value);
color = c_silver;

receiver = new Receiver();

receiver.add("match end", function()
	{
		if(oMatchManager.total_points == oMatchManager.point_min)
		{
			animate = !animate;
			broadcast("charm trigger");
			oPlayer.money += 20;	
		}
	});
