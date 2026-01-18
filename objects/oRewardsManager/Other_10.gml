//reward
size = sprite_get_width(spLetterTile);
width = (size + buffer) * (reward_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2) + 50;

broadcast("reward amount");

var _i = 0;
var _x_loc = x_loc;
var _y_loc = y_loc;
var _vowels = global.vowels;
var _consonants = global.consonants;
var _letter = "";
var _letters = [];

var _reward_count = 0;
var _pointvalue = 0;

//if not last level of stage...create reward struct

if(array_length(reward_structs) < 1)
{
	if(array_get_index(oRun.levels, oRun.current_level) != array_length(oRun.levels) - 1)
	{
		//TILE REWARD
		_reward_count += 5;
		while(_i < _reward_count)
		{
			var _is_vowel = irandom_range(0, 1);
			var _chance = 25;
			var _roll = irandom_range(0, 100);
	
			//equal chance for vowel or consonant
			if(_is_vowel)
			{
				_letters = _vowels;
			}
			else 
			{
				_letters = _consonants;	
			}

			//select random letter
			_letter = _letters[irandom_range(0, array_length(_letters) - 1)];

			if(_roll <= _chance)
			{
				_pointvalue = global.letters[? _letter];
			}
			else
			{
				_pointvalue = (global.letters[? _letter]) * 2;
			}
	
			var _reward = 
			{
				obj : oTile,
				letter : _letter,
				pointvalue : _pointvalue,
				persistent : false,
				visible : false
			};
		
			array_push(reward_structs, _reward);
			_i++;
		}
	}
	else
	{
		//CHARM REWARD
		_i = 0;
		_reward_count += 3;
		while(_i < _reward_count)
		{
			//if player has all charms, exit
			if(array_length(global.charms) == array_length(oCharmManager.charms)){exit;}
			
			//randomly select a charm until an unowned one is chosen
			var _reward = 
			{
				obj : oCharm,
				charm : global.charms[irandom_range(0, array_length(global.charms) - 1)]
			}
			while(instance_exists(_reward.charm))
			{
				_reward.charm = global.charms[irandom_range(0, array_length(global.charms) - 1)];
			}
		
			array_push(reward_structs, _reward);		
			_i++;
		}
	}
save_game();
}

//create objects from struct array
for(var i = 0; i < array_length(reward_structs); i++)
{
	var _struct = reward_structs[i];
	if(_struct.obj == oTile)
	{
		var _reward = instance_create_layer(_x_loc, _y_loc, "UI", oTile,
		{
			letter : _struct.letter,
			pointvalue : _struct.pointvalue,
			persistent : _struct.persistent,
			visible : _struct.visible
		});		
	}
	else if(_struct.obj == oCharm)
	{
		var _reward = instance_create_layer(_x_loc, _y_loc, "UI", _struct.charm, {persistent : false, visible : false});	
	}
	
	array_push(array_rewards, _reward);
	_x_loc = _x_loc + buffer + size;
}

//CREATE YUI
var _bool = false;
with(yui_document)
{
	if(yui_file == "YUI screens/charmrewards.yui" or yui_file == "YUI screens/tilerewards.yui"
		or yui_file == "YUI screens/norewards.yui")
	{
		_bool = true;
	}
}
if(_bool == false)
{
	if(oMatchManager.exchange_count > 0)
	{
		instance_create_layer(0, 0, "UI", yui_document,
		{
			data_context : oRewardsManager,
			yui_file : "YUI screens/norewards.yui",
			persistent : false
		});		
	}
	else
	{
		reward_money();
		//give reward based on current level in stage
		//if not last level of stage...
		if(array_get_index(oRun.levels, oRun.current_level) != array_length(oRun.levels) - 1)
		{
			instance_create_layer(0, 0, "UI", yui_document,
			{
				data_context : oRewardsManager,
				yui_file : "YUI screens/tilerewards.yui",
				persistent : false
			});			
		}
		else
		{
			instance_create_layer(0, 0, "UI", yui_document,
			{
				data_context : oRewardsManager,
				yui_file : "YUI screens/charmrewards.yui",
				persistent : false
			});	
		}
	}
}