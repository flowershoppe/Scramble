function resolution_select(_command)
{
	var _display_w = display_get_width();
	var _display_h = display_get_height();
	var _win_w = 0;
	var _win_h = 0;
	var _d_width = global.display_width;
	var _d_height = global.display_height;
	
	switch(_command)
	{
		case "Fullscreen":		
			window_set_fullscreen(true);
			_win_w = display_get_width();
			_win_h = display_get_height();
			
		break;
		
		case "720 x 480":
			window_set_fullscreen(false);
			_win_w = 720;
			_win_h = 480;
			
		break;
		
		case "960 x 540":
			window_set_fullscreen(false);
			_win_w = 960;
			_win_h = 540;
			
		break;
		
		case "1280 x 720":
			window_set_fullscreen(false);
			_win_w = 1280;
			_win_h = 720;
			
		break;
		
		case "1600 x 900":
			window_set_fullscreen(false);
			_win_w = 1600;
			_win_h = 900;
			
		break;
		
		case "1920 x 1080":
			window_set_fullscreen(false);
			_win_w = 1920;
			_win_h = 1080;
		break;			
	}
	
	window_set_size(_win_w, _win_h)	
	instance_create_layer(0, 0, "Meta", oAppResizer);
	oAppResizer.win_w = _win_w;
	oAppResizer.win_h = _win_h;
	window_center();
	yui_document.reload();
}