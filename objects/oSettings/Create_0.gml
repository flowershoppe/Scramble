//handler for settings menu
visible = true;
display_height = global.display_height;
display_width = global.display_width;

resolution_items = ["Fullscreen", 
					"720 x 480", 
					"960 x 540",
					"1280 x 720",
					"1600 x 900", 
					"1920 x 1080"];

emitter_SE = global.emitterSE;
emitter_MS = global.emitterMS;

selected_item = "960 x 540";

menu = noone;

resolution_selector = new YuiArraySelector(resolution_items, resolution_items[2])

confirm_button = global.confirm_button;
left_button = global.left_button;
right_button = global.right_button;
up_button = global.up_button;
down_button = global.down_button;
zoom_in = global.zoom_in;
zoom_out = global.zoom_out;
pause_button = global.pause_button;
skip_button = global.skip_button;
return_button = global.return_button;