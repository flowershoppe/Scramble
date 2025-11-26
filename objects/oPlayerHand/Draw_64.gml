/*var _spr = spDropShadow;
draw_sprite_ext(_spr, 0, x, y, (spr_w + 128) / sprite_get_width(_spr), 
				(spr_h + 128) / sprite_get_height(_spr),
				0, c_white, 2);*/

var _spr = spr;
mask_index = _spr;
image_xscale = spr_w / sprite_get_width(spPanel);
image_yscale = spr_h / sprite_get_height(spPanel);
draw_sprite_ext(_spr, 0, x, y, image_xscale, image_yscale,
				0, c_white, 2);