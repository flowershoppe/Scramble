event_inherited();

if(array_contains(oCharmManager.charms, id) and !has_increased)
{	
	repeat(2)
	{
		array_push(oShop.tiles, undefined);
		array_push(oShop.charms, undefined);
		add_tile_to_shop();
		add_charm_to_shop();
	}
	has_increased = true;
}