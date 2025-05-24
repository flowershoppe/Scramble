//Add tile to hand
function add_temp_tile(_letter, _point, _amount)
{
	var _hand = oPlayerHand;
	
	for(var _count = 0; _count < _amount; _count++)
	{	
		//loop through until an empty tile holder is found
		for(var i = 0; i < _hand.size; i++)
		{
			var _tile_holder = _hand.tile_holder_array[i];
			
			if(_tile_holder.tile == noone)
			{			
				var _tile = instance_create_layer(_tile_holder.x, _tile_holder.y, "Hand_Tiles", oTile,
					{
						visible : true,
						in_hand : true,
						pointvalue : _point,
						letter : _letter,
						temp : true,
						persistent : false
					});
					
				//place tile id in tile holder
				_tile_holder.tile = _tile.id;
				
				i = _hand.size;
			}
		}
	}
}