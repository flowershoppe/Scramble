function refresh_shop(_price)
{
	if(oPlayer.money >= _price)
	{
		audio_play_sound_on(oGame.emitter_SE, sdSelect, false, 1);
		
		oPlayer.money -= _price;
		
		for(var i = 0; i < array_length(oShop.tiles); i++)
		{
			oShop.tiles[i] = undefined;
		}
		for(var i = 0; i < array_length(oShop.charms); i++)
		{
			oShop.charms[i] = undefined;
		}
		repeat(array_length(oShop.tiles))
		{
			add_tile_to_shop();
		}
		repeat(array_length(oShop.charms))
		{
			add_charm_to_shop();
		}
	}
	else
	{
		audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1);	
	}
}