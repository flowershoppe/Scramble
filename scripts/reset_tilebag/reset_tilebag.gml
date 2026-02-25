function reset_tilebag()
{
	var _array = oTilebag.tiles;
	oTilebag.match_tiles = [];
	with(oTile)
	{
		if(letter == "_")
		{
			var a = 1;	
		}
		layer = layer_get_id("Tilebag");
		visible = false;
		in_hand = false;
		on_board = false;
		highlight = false;
		wait_for_input = false;
		grabbable = true;
		selected = false;
		letter = old_letter;

		x = 0;
		y = 0;
		
		//destroy any tiles that aren't in the bag
		if(!array_contains(_array, id))
		{
			instance_destroy(id);
		}
	}
}