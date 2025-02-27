draw_self();

if(!active)
{
	iconc = c_gray;
	icona = 0.75;
}
else
{
	iconc = c_red;
	icona = 1;
}

draw_sprite_stretched_ext(icon, 0, x - (sprite_width / 2), y - (sprite_height / 1.8), sprite_width, sprite_height,
							iconc, icona);