rewarding = true;
size = sprite_get_width(spLetterTile);
width = size * (reward_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = room_height / 2;

var _i = 0;
var _x_loc = x_loc;
var _y_loc = y_loc;
var _vowels = vowels;
var _consonants = consonants;
var _letter = "";
var _letters = [];
var _reward_count = reward_count;
var _pointvalue = 0;

while(_i < _reward_count)
{
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
	_letter = _letters[irandom_range(0, array_length(_letters))];

	if(_is_base_point)
	{
		_pointvalue = global.letters[? _letter];
	}
	else
	{
		_pointvalue = (global.letters[? _letter]) * 2;
	}
	
	array_push(array_rewards, 
	instance_create_layer(_x_loc, _y_loc, "UI", oTile,
	{
		letter : _letter,
		pointvalue : _pointvalue
	}));
	_x_loc += size;
	_i++;
}

