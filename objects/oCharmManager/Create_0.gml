charms = [-1, -1, -1, -1, -1];
max_charms = 5;
charms_full_message = false;

add_charm(oBClef);
add_charm(oChip);
add_charm(oD6);
add_charm(oPuzzle);
add_charm(oTMap);

var _bool = false;

with(yui_document)
{
	if(data_context == oCharmManager)
	{
		_bool = true;
	}
}

if(_bool == false)
{
	var _st = global.stCharms;
	instance_create_layer(0, 0, "YUI", yui_document, _st);
}