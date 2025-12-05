var _x = view_get_wport(0) / 2;
var _y = view_get_hport(0) / 3;
if(typist != 0)
{	
	if(oRun.stage >= oRun.stage_count and oRun.current_level == oRun.levels[array_length(oRun.levels) - 1])
	{
		var t = scribble("[rainbow][fnt_reality_hyper_big][fa_center]Sequence Complete");
		t.draw(_x, _y, typist);
		t.sdf_outline(c_black, 2);		
	}
	else
	{
		var t = scribble("[cycle, 140, 140, 140, 130][fnt_reality_hyper_big][fa_center]Memory Processed");
		scribble_anim_cycle(0.5, 255, 255);
		t.draw(_x, _y, typist);
		t.sdf_outline(c_black, 2);
		//val = sin_oscillate(160, 255, 2);
	}
}

//NO VOWELS
var _no_vowels = false;
if(turn == 1 and room == rGame)
{
	with(oTile)
	{	
		if(visible)
		{
			if(!array_contains(global.vowels, letter) and letter != "Y")
			{
				_no_vowels = true;
			}
			else
			{
				_no_vowels = false;
				break;
			}
		}
	}
}
if(_no_vowels)
{
	var t = scribble("[fa_center]No vowels present on first turn.\nYou may exchange with no penalty.");
	t.starting_format(font_get_name(oGame.tile_font), c_white);
	t.draw(_x, _y);
	t.sdf_outline(c_black, 2);
}