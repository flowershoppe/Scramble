var _time = 60;
var _delay = 0;
xscale = 0;
yscale = 0;
spr = noone;
alpha = 1;
wait = true;
scalemax = 0;
if(gui and pointvalue == oMatchManager.last_play)
{	
	if(oMatchManager.victory and !oMatchManager.loss)
	{
		//END MATCH FX
		with(oTile)
		{
			if(on_board)
			{
				instance_create_depth(x, y, depth - 1, oShine,
				{
					alpha : 0.75,
					color : 15784459,
					fade : true
				});
			}
		}
		audio_play_sound_on(oGame.emitter_SE, sdInfo, false, 1);	
		instance_create_layer(0, 0, "UI", oCompleteMessage);	
		create_continue_button();
		broadcast("match end");	
	}		
	
	if(pointvalue < 10)
	{
		spr = spBend;
		xscale = 1.5;
		yscale = 1.5;
	}
	else if(pointvalue >= 10)
	{
		spr = spCircleStar;	
		xscale = 2;
		yscale = 2;
	}
	else if(pointvalue >= 20)
	{
		spr = spNeutron;	
		xscale = 3;
		yscale = 3;
	}
	scalemax = xscale * 2;
	_time = 120;
	_delay = 60;
	direction = irandom_range(-5, 5);
	//audio_play_sound_on(oGame.emitter_SE, sdWhoosh, false, 1);
	audio_play_sound_on(oGame.emitter_SE, sdImpact1, false, 1);
	//audio_play_sound_on(oGame.emitter_SE, sdHit2, false, 1);
	//audio_play_sound_on(oGame.emitter_SE, sdHit3, false, 1);
	audio_play_sound_on(oGame.emitter_SE, sdPowerHit, false, 1);
	audio_play_sound_on(oGame.emitter_SE, sdBuffUp, false, 1);
}
else if(!gui)
{
	xscale = 1;
	yscale = 1;
	_time = 60;
	_delay = 1;
	direction = irandom_range(80, 100);	
	speed = 1;
}
alarm_set(1, _time);
alarm_set(0, _delay);
t = scribble("[fa_center][fa_middle]" + string(pointvalue));
typist = scribble_typist();
