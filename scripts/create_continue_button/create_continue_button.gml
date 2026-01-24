function create_continue_button()
{
	instance_create_layer(0, 0, "YUI", yui_document,
	{
		yui_file: "YUI screens/continue_button.yui",
		is_full_screen: true
	});
}