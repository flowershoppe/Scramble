name = "Treasure Map";
description = "At the start of each match, a random unmodified space gains a 2x word multiplier and a coin.";
color = c_olive;

receiver = new Receiver();

receiver.add("match start", function() 
	{ 
		var _array = [];
		
		with(oTileHolder)
		{
			if(layer_get_name(layer) == "Board_Tile_Holders")
			{
				array_push(_array, id);
			}
		}
		
		var _length = array_length(_array);
		var _random = irandom_range(0, _length);
		
		var _bool = false;
		while(_bool == false)
		{
			var _random = irandom_range(0, _length - 1);
			var _holder = _array[_random];
			if(_holder.wmult == 1 and _holder.lmult == 1)
			{
				_holder.wmult = 2;
				animate = !animate;
				_bool = true;
				instance_create_layer(_holder.x, _holder.y, "Hand_Tiles", oCoin);
				broadcast("charm trigger");
			}
		}

		
	});
	