//create charms ui
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
	if(room == rMap or room == rGame or room == rGameOver)
	{
		var _st = global.stCharms;
		instance_create_layer(0, 0, "YUI", yui_document, _st);
	}
}
