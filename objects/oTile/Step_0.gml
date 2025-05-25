if(global.paused){exit;}
var _tile = id;

//hover	
if(layer != true_layer & layer != layer_get_id("Grabbed"))
{
	true_layer = layer;	
}

if(oCursor.held_tile == noone and oCamera.dragging == false)
{
	var _intersect = false;
	
	if(on_board and place_meeting(x, y, oCursor))
	{
		_intersect = true;
	}
	else if(!on_board and position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id))
	{
		_intersect = true;
	}
	
	if(grabbable and _intersect)
	{
		if(oMatchManager.active){layer = layer_get_id("Grabbed");}
		xscale = 1.15;
		yscale = 1.15;
		hover = true;
	}

	else
	{
		layer = true_layer;
		xscale = 1;
		yscale = 1;
		hover = false;
	}
}

//exchanging
if(position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)
	and input_mouse_check_pressed(mb_left) and global.exchanging
		and in_hand)
{
	selected = !selected;
}

with(oTileHolder)
{
	if(tile == _tile)
	{		
		if(array_contains(oPlayerHand.tile_holder_array, id))
		{
			tile.in_hand = true;
		}
	}	
}

//blank
if(!on_board and blank == true)
{
	letter = "_";
	wait_for_input = false;
}
