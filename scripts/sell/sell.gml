function sell(_charm, _value)
{
	oPlayer.money += (_charm.value / 2);
	array_delete(oCharmManager.charms, array_get_index(oCharmManager.charms, _charm), 1);
	instance_destroy(_charm);
}