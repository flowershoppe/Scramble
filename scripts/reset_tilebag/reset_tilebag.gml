function reset_tilebag()
{
	var _array = oTilebag.tiles;
	oTilebag.match_tiles = [];
	with(oTile)
	{
		layer = layer_get_id("Tilebag");
		visible = false;
		in_hand = false;
		on_board = false;
		highlight = false;
		wait_for_input = false;
		grabbable = true;
		selected = false;

		x = 0;
		y = 0;
		
		//destroy any tiles that aren't supposed to be in the bag
		if(!array_contains(_array, id))
		{
			instance_destroy(id);	
		}
	}
}