var _bool = false;

with(yui_document)
{
	if(yui_file == "YUI screens/charms.yui")
	{
		_bool = true;
	}
}

if(_bool == false)
{
	var _st = global.stCharms;
	instance_create_layer(0, 0, "YUI", yui_document, _st);
}
