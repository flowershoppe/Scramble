// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function toggle_pause()
{
	var _paused = oPauseMenu.paused;	
	if(!_paused)
	{		
		instance_create_depth(0, 0, -10, yui_document, global.stPauseMenu);
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
	else if(_paused)
	{
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
		with(yui_document){	if(data_context == oPauseMenu){instance_destroy();}	}
	}
	
	oPauseMenu.paused = !oPauseMenu.paused;
}