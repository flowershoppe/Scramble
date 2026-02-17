function game_over()
{
	oTilebag.yui_tiles = oTilebag.tiles;
	reset_tilebag();
	instance_create_layer(0, 0, "YUI", yui_document,
	{ 
		yui_file : "YUI screens/game_over.yui",
		data_context : 	oRun
	});
}