tiles = [];
charms = [];
charm_count = 3;
tile_count = 5;
price_tile = 25;
price_charm = 100;
shop_size = tile_count + charm_count;

map = rMap;

buffer = 60;
size = sprite_get_width(spLetterTile);
width = (size + buffer) * (tile_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2);

var _x_loc = x_loc;
var _y_loc = y_loc;
var _vowels = global.vowels;
var _consonants = global.consonants;
var _letter = "";
var _letters = [];
var _pointvalue = 0;

var _x_loc = x_loc;
//populate tiles
for(var _i = 0; _i < tile_count; _i++)
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
	_letter = _letters[irandom_range(0, array_length(_letters) - 1)];

	if(_is_base_point)
	{
		_pointvalue = global.letters[? _letter];
	}
	else
	{
		_pointvalue = (global.letters[? _letter]) * 2;
	}
	
	var _item = instance_create_layer(_x_loc, _y_loc, "UI", oTile,
	{
		letter : _letter,
		pointvalue : _pointvalue,
		persistent : false,
		visible : false
	});
	array_push(tiles, _item);
	_x_loc = _x_loc + buffer + size;
}
_y_loc += buffer + size;
//populate charms
var _x_loc = x_loc;
for(var _i = 0; _i < charm_count; _i++)	
{
	//if player has all charms, exit
	if(array_length(global.charms) == array_length(oCharmManager.charms)){exit;}
			
	//randomly select a charm until an unowned one is chosen
	var _item = global.charms[irandom_range(0, array_length(global.charms) - 1)];
	while(instance_exists(_item))
	{
		_item = global.charms[irandom_range(0, array_length(global.charms) - 1)];
	}
	instance_create_layer(_x_loc, _y_loc, "UI", _item, {persistent : false, visible : false});
	array_push(charms, _item);
	_x_loc = _x_loc + buffer + size;
}	