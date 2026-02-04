event_inherited();
name = "Disguise";
description = "When a turn starts, randomize the right-most tile's letter"
color = c_white;

receiver = new Receiver();

receiver.add("hand filled", function()
	{
		broadcast("charm trigger");
		animate = !animate;
		var _tile = oPlayerHand.tile_holder_array[oPlayerHand.size - 1].tile;
		wiggle(_tile);
		var _array = array_concat(global.vowels, global.consonants);
		_tile.letter = _array[irandom_range(0, array_length(_array) - 1)];
	});
