function purchase(_id)
{
	var _money = oPlayer.money;
	var _ind = _id.object_index;
	if(_ind == oTile)
	{
		var _tiles = oShop.tiles;
		if((_money - oShop.price_tile) >= 0)
		{
			add_tile_to_bag(_id.letter, _id.pointvalue, 1, true);
			_money -= oShop.price_tile;
			array_delete(oShop.tile_specs, array_get_index(_tiles, _id), 1);
			array_delete(_tiles, array_get_index(_tiles, _id), 1);			
			instance_destroy(_id);
		}
	}
	else if(object_is_ancestor(_ind, oCharm))
	{
		var _charms = oShop.charms;
		if((_money - oShop.price_charm) >= 0)
		{
			add_charm(_ind);
			_money -= oShop.price_charm;
			array_delete(_charms, array_get_index(_charms, _ind), 1);
			instance_destroy(_id);
		}
	}
	oPlayer.money = _money;
}