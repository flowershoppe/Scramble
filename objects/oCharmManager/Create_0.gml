charms = [];

/*if(!instance_exists(oLoop))
{
	var _c = instance_create_layer(0, 0, "Meta", oLoop);
	array_push(charms, _c);
}*/


var _st = global.stCharms;

instance_create_layer(0, 0, "YUI", yui_document, _st);
//var _yui = yui_document_create(_st.yui_file, _st.data_context, _st.persist, _st.x, _st.y, 0)
//_yui.is_full_screen = false;
//instance_create_layer(0, 0, "YUI", yui_document, global.stCharms);

