name = "2-Sided Die";
description = "When a turn starts, has a 1-in-2 chance to award 1 point plus another for each consecutive success. Streak: " + string(data);

receiver = new Receiver();

color = c_gray;
data = 0;

receiver.add("turn start", function() 
	{ 
		if(irandom_range(1, 2 * oPlayer.random_mod) >= 2)
		{					
			data++;
			oMatchManager.total_points += data;			
			broadcast("random success");
			animate = !animate;
			broadcast("charm trigger");
		}
		else
		{
			data = 0;	
		}
		description = "When a turn starts, has a 1-in-2 chance to award 1 point plus another for each consecutive success. Streak: " + string(data);
	});