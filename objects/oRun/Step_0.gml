if(!global.paused and !(room == rGameOver)){time ++;}
var _seconds = string(time div 60 mod 60)
var _minutes = string(time div 3600 mod 60)
var _hours = string(time div 216000)

length = _hours + " H, " + _minutes + " M, " + _seconds + " S";

if(input_check_pressed("confirm") and room == rGameOver)
{
	screenTransition(rMainMenu, , ST_CHECKER_DIAG_UL_TO_DR_Y);
}

var _bool = false;

with(yui_document)
{
	if(yui_file == "YUI screens/results.yui")
	{
		_bool = true;	
	}
}

if(room == rResults and _bool == false)
{
	instance_create_layer(0, 0, "YUI", yui_document, global.stResults);		
}

if(instance_exists(oPlayer))
{
	if(old_money != oPlayer.money)
	{
		if(old_money < oPlayer.money)
		{
			oStats.total_money_earned += (oPlayer.money - money_earned)
			money_earned += (oPlayer.money - money_earned);	
			audio_play_sound_on(oGame.emitter_SE, sdCoinGet, false, 1);
		}
		old_money = oPlayer.money;
	}	
}

vowel_count = 0;
consonant_count = 0;
if(!instance_exists(oTilebag)){exit;}
var _array = [];
if(room == rGame)
{
	_array = oTilebag.match_tiles;	
}
else
{
	_array = oTilebag.tiles;
}
for(var i = 0; i < array_length(_array); i++)
{
	var _letter = _array[i].letter;
	if(array_contains(global.vowels, _letter))
	{
		vowel_count++;
	}
	else if(array_contains(global.consonants, _letter))
	{
		consonant_count++;	
	}
}
