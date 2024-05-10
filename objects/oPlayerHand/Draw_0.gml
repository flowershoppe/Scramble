//set to static location relative to camera
var _cam = global.maincam;
var _camw = camera_get_view_width(_cam);
var _camh = camera_get_view_height(_cam);
var _camx = camera_get_view_x(_cam);
var _camy = camera_get_view_y(_cam);
var _x_scale = (_camw * 0.7) / spr_w;
var _y_scale = (_camh * 0.2) / spr_h;
var _draw_width = _x_scale * spr_w;
var _draw_height = _y_scale * spr_h;
var _x_draw_location = _camx + (_camw / 2);
var _y_draw_location = _camy + _camh - (_draw_height / 2);



//Draw hand
draw_self();
//draw_sprite_ext(spr, 0 , _x_draw_location, _y_draw_location, 
				//		_x_scale, _y_scale,
				//		0, c_white, 100);
					
/*					
//Draw tiles in hand
var i = 0;
var _tile_size = _draw_height * 0.75;
var _offset = _tile_size / hand_width;
var _left_align = _x_draw_location - (_draw_width * 0.5) + _offset;

for(i = 0; i < hand_width; i++)
{	
	var _tile = tile_array[i];
	
	if(_tile != noone)
	{
		_x_draw_location = _left_align + (_offset * i) + (_tile_size * i);
		_y_draw_location = _camy + _camh - _draw_height + (_tile_size / 4);
		
		//Draw tile
		draw_sprite_stretched_ext(_tile.spr, 0 , _x_draw_location, _y_draw_location, 
							_tile_size, _tile_size,
							c_white, 100);
							
			
	
		//Draw letters
		//Set font and align to center of tile
		draw_set_font(_tile.font);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);

		var _letter_y_offset = _tile_size * 0.1;
		var _letter_x_offset = _tile_size * 0.1
		
		_x_draw_location += (_x_scale * font_get_size(_tile.font)) / 2;
		_y_draw_location += (_y_scale * font_get_size(_tile.font)) / 2;

		//Draw tile letter
		draw_text_transformed_color(_x_draw_location + _letter_x_offset, _y_draw_location + _letter_y_offset, _tile.letter, 
		_x_scale, _x_scale, 0, c_black, c_black, c_black, c_black, 100);
		
		
	}
	
}
