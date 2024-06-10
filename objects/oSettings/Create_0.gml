//handler for settings menu

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

resolution_selector = new YuiArraySelector(resolution_items, resolution_items[2])

prev_room = noone;