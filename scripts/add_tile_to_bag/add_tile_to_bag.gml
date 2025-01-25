//Add tile to bag

function add_tile_to_bag(_letter, _pointvalue, _count)
{
	var _inc = 0;
	var _tile;
	var _array = oTilebag.tiles;
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
		
		//put in bag
		array_push(_array, _tile);
		
		//sort the bag
		var _function = function(a, b)
		{
			return ord(a.letter) - ord(b.letter);
		}	

		array_sort(_array, _function);	
		
		_inc++;
	}
}