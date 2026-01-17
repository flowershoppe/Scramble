function add_charm(_charm)
{
	var _charms = oCharmManager.charms;
	if(array_contains(_charms, -1))
	{
		var _c = instance_create_layer(0, 0, "Meta", _charm, {isininventory : true});
		var _ind = array_get_index(_charms, -1)
		oCharmManager.charms[_ind] = _c;
		_c.index = _ind;
		return true;
	}
	else
	{
		with(oCharmManager)
		{
			charms_full_message = true;
			alarm_set(0, 120);
		}
		return false;
	}
}
