name = "Treasure Map";
description = "At the start of each match, a random unmodified space gains a 2x word multiplier.";
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
			if(_array[_random].wmult == 1 and _array[_random].lmult == 1)
			{
				_array[_random].wmult = 2;
				animate = !animate;
				_bool = true;
			}
		}

		
	});
	