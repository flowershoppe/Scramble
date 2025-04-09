charms = [];


var _c = instance_create_layer(0, 0, "Meta", oEraser);
array_push(charms, _c);
var _c = instance_create_layer(0, 0, "Meta", oPiggyBank);
array_push(charms, _c);
var _c = instance_create_layer(0, 0, "Meta", oSnake);
array_push(charms, _c);
var _c = instance_create_layer(0, 0, "Meta", oCheese);
array_push(charms, _c);
var _c = instance_create_layer(0, 0, "Meta", oOcarina);
array_push(charms, _c);

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