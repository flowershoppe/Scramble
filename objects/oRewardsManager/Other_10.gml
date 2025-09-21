//reward
size = sprite_get_width(spLetterTile);
width = (size + buffer) * (reward_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2) + 50;

var _i = 0;
var _x_loc = x_loc;
var _y_loc = y_loc;
var _vowels = global.vowels;
var _consonants = global.consonants;
var _letter = "";
var _letters = [];
var _reward_count = oOpponent.reward_amount;
var _pointvalue = 0;

while(_i < _reward_count)
{
	switch(oOpponent.reward_type)
	{
		case oTile:
			var _is_vowel = irandom_range(0, 1);
			var _is_base_point = irandom_range(0, 1);
	
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

			if(_is_base_point)
			{
				_pointvalue = global.letters[? _letter];
			}
			else
			{
				_pointvalue = (global.letters[? _letter]) * 2;
			}
	
			var _reward = instance_create_layer(_x_loc, _y_loc, "UI", oTile,
			{
				letter : _letter,
				pointvalue : _pointvalue,
				persistent : false,
				visible : false
			});
		break;
		
		case oCharm:
			//if player has all charms, exit
			if(array_length(global.charms) == array_length(oCharmManager.charms)){exit;}
			
			//randomly select a charm until an unowned one is chosen
			var _reward = global.charms[irandom_range(0, array_length(global.charms) - 1)];
			while(instance_exists(_reward))
			{
				_reward = global.charms[irandom_range(0, array_length(global.charms) - 1)];
			}
			instance_create_layer(_x_loc, _y_loc, "UI", _reward, {persistent : false, visible : false});
		break;
	}
	
	array_push(array_rewards, _reward);
	
	_x_loc = _x_loc + buffer + size;
	_i++;
}