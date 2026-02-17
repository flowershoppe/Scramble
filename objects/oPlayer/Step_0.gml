if(yui_money < money)
{
	yui_money++;	
}
else if(yui_money > money)
{
	yui_money--;
}

//clean placed tiles array
for(var i = 0; i < array_length(placed_tiles); i++)
{
	if(layer_get_name(placed_tiles[i].layer) == "Hand_Tiles")
	{
		array_delete(placed_tiles, i, 1);	
	}
}