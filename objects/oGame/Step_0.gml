

if(keyboard_check_pressed(global.return_button) and room == rGame and array_length(oPlayer.placed_tiles) > 0)
{
	return_tiles();	
}