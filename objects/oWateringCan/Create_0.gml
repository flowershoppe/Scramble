event_inherited();
name = "Watering Can";
description = "At the start of each turn, increase the value of all tiles on board by 1.";
color = 5612366;

receiver = new Receiver();

receiver.add("turn start", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		with(oTile)
		{
			if(on_board)
			{
				pointvalue++;	
			}
		}
	});
