function screen_message(_str, _len)
{
	instance_destroy(oPrinter);
	instance_create_layer(0, 0, "UI", oPrinter,
	{
		length : _len,
		str : _str
	});
}