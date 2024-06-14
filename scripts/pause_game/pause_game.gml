// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pause_game()
{
	if(room == rMainMenu){instance_destroy(yui_document);}
	oSettings.menu = instance_create_layer(0, 0, "Settings", yui_document,
	{	
		data_context: oSettings,
		yui_file: "YUI/settings.yui",
	});	
	instance_deactivate_layer("Meta");
	instance_deactivate_layer("UI");
	instance_deactivate_layer("Grabbed");
	instance_deactivate_layer("Hand_Tiles");
	instance_deactivate_layer("Hand_Tile_Holders");
	instance_deactivate_layer("Hand");
	instance_deactivate_layer("Tilebag");
	instance_deactivate_layer("Tiles");
	instance_deactivate_layer("Board_Tile_Holders");
	instance_deactivate_layer("Board");
	instance_deactivate_layer("Background");
	
}