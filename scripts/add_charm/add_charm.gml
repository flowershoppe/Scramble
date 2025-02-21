function add_charm(_charm)
{
	var _c = instance_create_layer(0, 0, "Meta", _charm);
	array_push(oCharmManager.charms, _c);
}