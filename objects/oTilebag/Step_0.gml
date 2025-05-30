if(global.paused){exit;}
//hover
if(oCursor.held_tile == noone and oCamera.dragging == false)
{
	if(position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
	{
		if(bag_menu == noone)
		{
			//display contents
			bag_menu = instance_create_layer(0, 0, "UI", yui_document,
			{
				data_context : oTilebag,
				yui_file : "YUI screens/tilebag.yui",
			});
			
			stats_menu = instance_create_layer(0, 0, "UI", yui_document,
			{
				data_context : oRun,
				yui_file : "YUI screens/run_stats.yui"
			});
		}
		image_xscale = 1.15;
		image_yscale = 1.15;
	}
	else
	{
		instance_destroy(bag_menu);	
		instance_destroy(stats_menu);
		bag_menu = noone;
		stats_menu = noone;
		image_xscale = 1;
		image_yscale = 1;
	}
}

if(room == rResults)
{
	layer = layer_get_id("UI");	
}
else
{
	layer = layer_get_id("Tilebag");	
}