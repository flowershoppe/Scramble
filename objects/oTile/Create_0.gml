wait_for_input = false;
selected = false;

font		= oGame.tile_font;
font_scale	= 1;
font_color	= oGame.tile_font_color;

spr_size	= 64;

xscale = 1;
yscale = 1;
hover = false;

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