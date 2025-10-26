name = "Metal Detector";
description = "After each match, gain credits equal to number of turns passed.";
color = c_grey;

receiver = new Receiver();

receiver.add("match end", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		broadcast("gain money");
		oPlayer.money += oMatchManager.turn;
	});
