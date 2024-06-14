function unpause_game()
{
	if(room == rMainMenu){instance_create_layer(0, 0, "Meta", yui_document, global.stMainMenu);}
	instance_activate_layer("Meta");
	instance_activate_layer("UI");
	instance_activate_layer("Grabbed");
	instance_activate_layer("Hand_Tiles");
	instance_activate_layer("Hand_Tile_Holders");
	instance_activate_layer("Hand");
	instance_activate_layer("Tilebag");
	instance_activate_layer("Tiles");
	instance_activate_layer("Board_Tile_Holders");
	instance_activate_layer("Board");
	instance_activate_layer("Background");
	instance_destroy(oSettings.menu);
}