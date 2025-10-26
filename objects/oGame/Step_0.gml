global.gui_scaling = window_get_width() / 960;

if(input_check_pressed("cancel") and room == rGame and array_length(oPlayer.placed_tiles) > 0)
{
	return_tiles();
}
if(input_check_pressed("cancel") and global.exchanging)
{
	global.exchanging = false;
}

if(input_check_pressed("pause"))
{
	toggle_pause();
}

if(input_check_pressed("special") and room == rGame)
{	
	exchange_tiles();	
}
if(input_keyboard_check_pressed(ord("H")))
{
	//with(oLevel){active = true;}
	oPlayer.money = 9999;
	add_charm(oHeadphones);
	add_charm(oD6);
	add_charm(oD20);
}
if(input_keyboard_check_pressed(ord("I")))
{
	oMatchManager.total_points += 10;	
}