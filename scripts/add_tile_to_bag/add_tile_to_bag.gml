//Add tile to bag

function add_tile_to_bag(_letter, _pointvalue)
{
	var _tile;
	
	//create new tile and assign its values
	_tile = instance_create_layer(0, 0, "Tilebag", obj_tile);
	_tile.letter = _letter;
	_tile.pointvalue = _pointvalue;
	
	//put it in the bag
	array_insert(tilebag.tiles, 0, _tile);
}