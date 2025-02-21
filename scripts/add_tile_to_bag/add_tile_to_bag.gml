//Add tile to bag

function add_tile_to_bag(_letter, _pointvalue, _count, _is_permanent)
{
	var _inc = 0;
	var _tile;
	if(_is_permanent)
	{var _array = oTilebag.tiles;}
	else 
	{var _array = oTilebag.match_tiles;}
	
	while(_inc < _count)
	{	
		//create new tile and assign its values
		_tile = instance_create_layer(0, 0, "Tilebag", oTile);
		_tile.letter = _letter;
		_tile.pointvalue = _pointvalue;
		_tile.visible = false;
		
		if(_letter == "_")
		{
			_tile.blank = true;	
		}
		
		if(_is_permanent)
		{
			_tile.persistent = true;	
		}
		
		//put in bag
		array_push(_array, _tile);
		
		//sort the bag
		var _function = function(a, b)
		{
			return ord(a.letter) - ord(b.letter);
		}	

		array_sort(_array, _function);	
		
		
		oTilebag.last_tile = _tile;
		
		_inc++;
		
		broadcast("add_tile_to_bag");
	}
}