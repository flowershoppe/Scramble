instance_create_layer(0, 0, "YUI", yui_document,
{
	x: 50,
	y: 50,
	image_xscale: 1,//window_get_width() / image_xscale,
	image_yscale: 1,
	yui_file: "YUI screens/info_bar.yui",
	data_context: oRun,
	is_full_screen: false,
});