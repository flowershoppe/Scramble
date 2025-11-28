//generate shop contents
var _x_loc = x_loc;
var _y_loc = y_loc;
var _vowels = global.vowels;
var _consonants = global.consonants;
var _letter = "";
var _letters = [];
var _pointvalue = 0;

tile_specs = [];
charms = [];

var _x_loc = x_loc;
//populate tiles
for(var _i = 0; _i < tile_count; _i++)
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
	var _item =
	{
		letter : _letter,
		pointvalue : _pointvalue,
	};
	array_push(tile_specs, _item);
	
}
_y_loc += buffer + size;
//populate charms
var _x_loc = x_loc;
for(var _i = 0; _i < charm_count; _i++)	
{
	var _noshop =
	[
		oRupee
	];
	//if player has all charms, exit
	if(array_length(global.charms) == array_length(oCharmManager.charms)){exit;}
			
	//randomly select a charm until an unowned one is chosen
	var _item = global.charms[irandom_range(0, array_length(global.charms) - 1)];
	while(instance_exists(_item) or array_contains(charms, _item) or array_contains(_noshop, _item))
	{
		_item = global.charms[irandom_range(0, array_length(global.charms) - 1)];
	}
	array_push(charms, _item);
}	