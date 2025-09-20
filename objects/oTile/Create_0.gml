wait_for_input = false;
grabbable = true;
selected = false;
temp = false;

font		= global.tile_font;
font_scale	= 1;
font_color	= global.tile_font_color;

spr_size	= 64;

xscale = 1;
yscale = 1;
hover = false;

highlight = false;

true_layer = layer;

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