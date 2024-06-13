// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function pause_game()
{
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