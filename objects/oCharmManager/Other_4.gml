//create charms ui
if(room == rMap or room == rGame or room == rGameOver)
{
	var _st = global.stCharms;
	instance_create_layer(0, 0, "YUI", yui_document, _st);
}