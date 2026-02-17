function add_charm_to_shop()
{
	with(oShop)
	{
		//populate charms
		var _noshop =
		[
			oRupee
		];
		//if player has all charms, exit
		if(array_length(global.charms) == array_length(oCharmManager.charms)){exit;}
			
		//randomly select a charm until an unowned one is chosen
		var _charm = global.charms[irandom_range(0, array_length(global.charms) - 1)];
		var _inShop = false;
		var i = 0;
		repeat(array_length(charms))
		{
			if(charms[i] != undefined and charms[i].charm == _charm)
			{
				_inShop = true;	
				break;
			}
			i++
		}
		while(_inShop or instance_exists(_charm) or array_contains(charms, _charm) or array_contains(_noshop, _charm))
		{
			_charm = global.charms[irandom_range(0, array_length(global.charms) - 1)];
			i = 0;
			_inShop = false;
			repeat(array_length(charms))
			{
				if(charms[i] != undefined and charms[i].charm == _charm)
				{
					_inShop = true;	
					break;
				}
				i++
			}
		}
		instance_create_layer(0, 0, "Meta", _charm);
		var _item = 
		{
			type : "charm",
			charm : _charm,
			name : _charm.name,
			description : _charm.description,
			spr : _charm.sprite_index,
			color : _charm.color,
			price : oShop.price_charm
		};
		instance_destroy(_charm);
		charms[array_get_index(charms, undefined)] = _item;
	}
}