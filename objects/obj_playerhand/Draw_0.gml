var _cam = maincam;
var _camw = camera_get_view_width(_cam);
var _camh = camera_get_view_height(_cam);
var _camx = camera_get_view_x(_cam);
var _camy = camera_get_view_y(_cam);
var _x_scale = _camw / spr_w;
var _y_scale = _camh / spr_h;
var _hand_x_center = _camx + (_camw / 2);
var _hand_y_center = _camy + _camh - (sprite_get_height(spr) / 2 * _y_scale);

//draw hand bg sprite at the center-bottom of the screen and scale with cam view
draw_sprite_ext(spr_plank, 0, _hand_x_center, _hand_y_center, _x_scale, _y_scale, 0, c_white, 100);
