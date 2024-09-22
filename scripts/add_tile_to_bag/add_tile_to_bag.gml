//Add tile to bag

function add_tile_to_bag(_letter, _pointvalue, _count)
{
	var _inc = 0;
	var _tile;
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
		
		//put it in the bag
		array_insert(oTilebag.tiles, 0, _tile);
		
		_inc++;
	}
}