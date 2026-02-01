wait_for_input = false;
selected = false;

font		= oGame.tile_font;
font_scale	= 1;
font_color	= oGame.tile_font_color;

spr_size	= 64;

xscale = 1;
yscale = 1;
hover = false;

//wiggle
wiggleLength = 30;
wiggleTime = 0;
wigglePeriod = 15;
wiggleMaxAmplitude = 15;
wiggleFalloff = wiggleMaxAmplitude / wiggleLength;
wiggleAmplitude = 30;

cornerNumDir = point_direction(0, 0, sprite_width * 0.3, -sprite_height * 0.3);
cornerNumDist = point_distance(0, 0, sprite_width * 0.3, -sprite_height * 0.3);

receiver = new Receiver();

receiver.add("match end", function()
	{
		if(temp)
		{
			persistent = false;	
		}
	});

receiver.add("turn start", function()
	{
		if(temp)
		{
			instance_destroy();	
		}
	});
layer_name = "";