name = "Receipt";
data = [1];
description = "Your first exchange each match applies no reward penalty.";
color = c_white;

active = true;

receiver = new Receiver();

receiver.add("exchange", function() 
	{ 
		if(oMatchManager.exchange_count > 0 and active)
		{
			broadcast("charm trigger");
			oMatchManager.exchange_count--;
			active = false;
			animate = !animate; 
		}
	});
	
receiver.add("match end", function()
	{
		active = true;
	});