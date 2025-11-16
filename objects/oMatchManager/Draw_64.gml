var _x = view_get_wport(0) / 2;
var _y = view_get_hport(0) / 3;
if(typist != 0)
{	
	var t = scribble("[cycle, 140, 140, 140, 130][fnt_reality_hyper_big][fa_center]Memory Processed");
	scribble_anim_cycle(0.5, 255, 255);
	t.draw(_x, _y, typist);
	t.sdf_outline(c_black, 2);
	//val = sin_oscillate(160, 255, 2);
}
/*
if(global.exchanging)
{
	var _string = "Select Tiles to Exchange";
	
	draw_text_color((window_get_width() / 2) - string_length(_string) / 2, (window_get_height / 2), _string,
					c_white, c_white, c_white, c_white, 1);	
}

ANIMATE RESULTS SCREEN