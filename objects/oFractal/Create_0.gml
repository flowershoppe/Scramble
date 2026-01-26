name = "Fractal";
description = "Finishing a level increases the base turn multiplier Myte reward by 1. Current base: " + string(oRewardsManager.t_bonus_mult);
color = c_yellow;
has_increased = false;

receiver = new Receiver();

receiver.add("match end", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		oRewardsManager.t_bonus_mult++;
		value = oRewardsManager.t_bonus_mult;
		description = "Finishing a level increases the turn multiplier Myte reward by 1. Current mult: " + string(value);
	});
