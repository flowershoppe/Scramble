//convert an integer its word counterpart up to twenty
function wordify(_num)
{
	var _string = "";
	
	switch(_num)
	{
		case 0:
			_string = "ZERO";
		break;
		
		case 1:
			_string = "ONE";
		break;

		case 2:
			_string = "TWO";
		break;

		case 3:
			_string = "THREE";
		break;
		
		case 4:
			_string = "FOUR";
		break;
		
		case 5:
			_string = "FIVE";
		break;
		
		case 6:
			_string = "SIX";
		break;
		
		case 7:
			_string = "SEVEN";
		break;
		
		case 8:
			_string = "EIGHT";
		break;
		
		case 9:
			_string = "NINE";
		break;
		
		case 10:
			_string = "TEN";
		break;
		
		case 11:
			_string = "ELEVEN";
		break;
		
		case 12:
			_string = "TWELVE";
		break;
		
		case 13:
			_string = "THIRTEEN";
		break;
		
		case 14:
			_string = "FOURTEEN";
		break;
		
		case 15:
			_string = "FIFTEEN";
		break;
		
		case 16:
			_string = "SIXTEEN";
		break;
		
		case 17:
			_string = "SEVENTEEN";
		break;
		
		case 18:
			_string = "EIGHTEEN";
		break;
		
		case 19:
			_string = "NINETEEN";
		break;

		case 20:
			_string = "TWENTY";
		break;		
	}
	
	return _string;
}