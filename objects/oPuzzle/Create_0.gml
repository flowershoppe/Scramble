name = "Puzzle Piece";
description = "When you make a play, each letter used that is already on the board adds 1 point to the play.";
color = c_yellow

receiver = new Receiver();

receiver.add("check words", function() 
	{ 	
		var _bonus = 0;
		var _words_tiles = oPlayer.words_tiles;
		var _length = array_length(_words_tiles);		
		
		for(var _j = 0; _j < _length; _j++)
		{			
			for(var _k = 0; _k < array_length(_words_tiles[_j]); _k++)
			{
				var _tile = _words_tiles[_j][_k];
				if(_tile.grabbable == false)
				{
					_bonus++;	
				}
			}
		}
		oPlayer.play_point_bonus += _bonus;
		animate = !animate; 
		broadcast("charm trigger");
	});
	