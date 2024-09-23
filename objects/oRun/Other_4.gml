switch(room)
{
	case rGame:	
		if(play_dialogue)
		{
			dialogue_open(adialogue, []);
			play_dialogue = false;
		}
	
		instance_create_layer(0, 0, "YUI", yui_document,
		{
			x: 0,
			y: 0,
			image_xscale: window_get_width() / image_xscale,
			image_yscale: 0.75,
			yui_file: "YUI screens/info_bar.yui",
			data_context: oRun,
			is_full_screen: false,
		});
	break;
	
	case rResults:
		play_dialogue = true;
	break;
}


