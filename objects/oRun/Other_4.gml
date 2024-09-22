instance_create_layer(0, 0, "YUI", yui_document,
{
	x: 0,
	y: 0,
	image_xscale: window_get_width() / image_xscale,
	image_yscale: 0.75,
	yui_file: "YUI screens/info_bar.yui",
	data_context: oRun,
	is_full_screen: false,
});