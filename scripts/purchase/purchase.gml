function purchase(_item)
{
	if(_item == undefined){exit;}
	var _money = oPlayer.money;
	//BUY TILE
	if(_item.type == "tile")
	{
		if((_money - _item.price) >= 0)
		{
			add_tile_to_bag(_item.letter, _item.pointvalue, 1, true);
			_money -= _item.price;	
			oShop.tiles[array_get_index(oShop.tiles, _item)] = undefined;
			audio_play_sound_on(oGame.emitter_SE, sdPurchase, false, 1);
		}
		else
		{			
			audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1)	
		}
	}
	//BUY CHARM
	else if(_item.type == "charm")
	{
		if((_money - _item.price) >= 0)
		{
			if(add_charm(_item.charm))
			{
				_money -= _item.price;
				oShop.charms[array_get_index(oShop.charms, _item)] = undefined;
				audio_play_sound_on(oGame.emitter_SE, sdPurchase, false, 1);
			}
			else
			{			
				audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1)	
			}
		}
		else
		{			
			audio_play_sound_on(oGame.emitter_SE, sdBack, false, 1)	
		}
	}
	oPlayer.money = _money;
}