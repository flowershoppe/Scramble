name = "Eraser";
description = "When you exchange only 1 tile, destroy it (permanently).";
color = c_white;

receiver = new Receiver();

receiver.add("exchange", function() 
	{ 
		var _e = oPlayer.exchanged_tiles;
		var _length = array_length(_e);
		
		if(_length == 1)
		{						
			array_delete(oTilebag.tiles, array_get_index(oTilebag.tiles, _e[0].id), 1);
			array_delete(oTilebag.match_tiles, array_get_index(oTilebag.match_tiles, _e[0].id), 1);
			instance_destroy(_e[0].id);	
			broadcast("charm trigger");
			animate = !animate;
		}
	});
	