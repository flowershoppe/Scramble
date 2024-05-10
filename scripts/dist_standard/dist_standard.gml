function dist_standard(_tilebag)
{
	var _letters = global.letters;
	var _letter_num;
	var _letter;
	var _count;
	var _div;
	var _mult;
	var _amount;
	var _player_count = instance_number(oPlayer);
	var _inc = 0;
		
	
	//loop through all letters of the alphabet
	_count = 0;
	_div = 0;
	_amount = 0;
	_letter_num = ord("A");
	_letter = chr(_letter_num);
		
	//change divider depending on player count
	switch(_player_count)
	{
		case 1:
			_div = 4;
			break;
		case 2:
			_div = 2;
			break;
		case 3:
			_div = 1.25;
			break;
		case 4:
			_div = 1;
			break;
	}
	
	//Add blank spaces
	_letter = "_";
	_count = 2;
	_amount = _count / _div
	add_tile_to_bag(_letter, _letters[? _letter], _amount);
	
	_letter = chr(_letter_num);
	_count = 0;
	
	while(_inc < 26)
	{
		switch(_letter)
		{
			//letter amounts when there are 4 players
			#region
			case "A":
				_count = 9;
				break;
			case "B":
				_count = 2;
				break;
			case "C":
				_count = 2;
				break;
			case "D":
				_count = 4;
				break;
			case "E":
				_count = 12;
				break;
			case "F":
				_count = 2;
				break;
			case "G":
				_count = 3;
				break;
			case "H":
				_count = 2;
				break;
			case "I":
				_count = 9;
				break;
			case "J":
				_count = 1;
				break;
			case "K":
				_count = 1;
				break;
			case "L":
				_count = 4;
				break;
			case "M":
				_count = 2;
				break;
			case "N":
				_count = 6;
				break;
			case "O":
				_count = 8;
				break;
			case "P":
				_count = 2;
				break;
			case "Q":
				_count = 1;
				break;
			case "R":
				_count = 6;
				break;
			case "S":
				_count = 4;
				break;
			case "T":
				_count = 6;
				break;
			case "U":
				_count = 4;
				break;
			case "V":
				_count = 2;
				break;
			case "W":
				_count = 2;
				break;
			case "X":
				_count = 1;
				break;
			case "Y":
				_count = 2;
				break;
			case "Z":
				_count = 1;
				break;
			#endregion
		}
		_amount = round(_count / _div);
		add_tile_to_bag(_letter, _letters[? _letter], _amount);
			
		//increment to next alphabet letter
		_letter_num ++;
		_letter = chr(_letter_num);		
		_inc++;
	}
}
