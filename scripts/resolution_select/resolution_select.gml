function resolution_select(_command)
{
	var _display_w = display_get_width();
	var _display_h = display_get_height();
	var _win_w = 0;
	var _win_h = 0;
	
	switch(_command)
	{
		case "Fullscreen":
			window_set_fullscreen(true);
			
		break;
		
		case "960 x 540":
			window_set_fullscreen(false);
			_win_w = 960;
			_win_h = 540;
			window_set_size(_win_w, _win_h);
			window_set_position(_display_w - _win_w * 1.5, _display_h - _win_h * 1.5);
			
		break;
		
		case "1920 x 1080":
			window_set_fullscreen(false);
			_win_w = 1920;
			_win_h = 1080;
			window_set_size(_win_w, _win_h);
			window_set_position(_display_w - _win_w, _display_h - _win_h);
		break;
	}
}