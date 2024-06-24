//handler for settings menu
visible = true;
view_height = camera_get_view_height(0);
view_width = camera_get_view_width(0);

resolution_items = ["Fullscreen", 
					"720 x 480", 
					"960 x 540",
					"1280 x 720",
					"1600 x 900", 
					"1920 x 1080"];

emitter_SE = global.emitterSE;
emitter_MS = global.emitterMS;

selected_item = "960 x 540";

resolution_selector = new YuiArraySelector(resolution_items, resolution_items[2]);

verbs = ["left", "right", "up", "down", "confirm", "cancel", "special", "pause"]

verb_to_set = "";