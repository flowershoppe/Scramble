function dist_standard(_tilebag)
{
	var _letters = global.letters;
	var _letter_num;
	var _letter;
	var _count;
	var _inc = 0;
		
	
	
	
			
	//Add blank spaces
	_letter = "_";
	_count = 1;
	add_tile_to_bag(_letter, _letters[? _letter], _count);
	
	//loop through all letters of the alphabet
	_count = 0;
	_letter_num = ord("A");
	_letter = chr(_letter_num);
	
	while(_inc < 26)
	{
		switch(_letter)
		{
			#region
			case "A":
				_count = 2;
				break;
			case "B":
				_count = 1;
				break;
			case "C":
				_count = 1;
				break;
			case "D":
				_count = 1;
				break;
			case "E":
				_count = 2;
				break;
			case "F":
				_count = 1;
				break;
			case "G":
				_count = 1;
				break;
			case "H":
				_count = 1;
				break;
			case "I":
				_count = 2;
				break;
			case "J":
				_count = 1;
				break;
			case "K":
				_count = 1;
				break;
			case "L":
				_count = 1;
				break;
			case "M":
				_count = 1;
				break;
			case "N":
				_count = 1;
				break;
			case "O":
				_count = 2;
				break;
			case "P":
				_count = 1;
				break;
			case "Q":
				_count = 1;
				break;
			case "R":
				_count = 1;
				break;
			case "S":
				_count = 1;
				break;
			case "T":
				_count = 1;
				break;
			case "U":
				_count = 2;
				break;
			case "V":
				_count = 1;
				break;
			case "W":
				_count = 1;
				break;
			case "X":
				_count = 1;
				break;
			case "Y":
				_count = 1;
				break;
			case "Z":
				_count = 1;
				break;
			#endregion
		}
		add_tile_to_bag(_letter, _letters[? _letter], _count);
			
		//increment to next alphabet letter
		_letter_num ++;
		_letter = chr(_letter_num);		
		_inc++;
	}
}
