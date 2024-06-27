with(oTileHolder)
{
	if(array_contains(oPlayerHand.tile_holder_array, id) and tile != noone)
	{
		if(tile.blank)
		{
			tile.wait_for_input = false;
			tile.letter = "_";
		}
	}
}