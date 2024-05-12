function resolution_select(_command)
{
	switch(_command)
	{
		case "Fullscreen":
			window_set_fullscreen(true);
			
		break;
		
		case "960 x 540":
			window_set_fullscreen(false);
			window_set_size(960, 540);
			
		break;
	}
}