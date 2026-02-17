function add_tile_to_shop()
{
	with(oShop)
	{
		//generate shop contents
		var _vowels = global.vowels;
		var _consonants = global.consonants;
		var _letter = "";
		var _letters = [];
		var _pointvalue = 0;

		//populate tiles

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
		if(irandom_range(0, 9) >= 9)
		{
			//blank chance
			_letter = "_";
		}
		else
		{
			_letter = _letters[irandom_range(0, array_length(_letters) - 1)];
		}

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
			type : "tile",
			letter : _letter,
			pointvalue : _pointvalue,
			spr : spLetterTile,
			price : oShop.price_tile
		};
		tiles[array_get_index(tiles, undefined)] = _item;
	}
}