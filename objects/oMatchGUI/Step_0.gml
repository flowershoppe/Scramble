var _no_vowels = 0;
if(oMatchManager.turn == 1)
{
	with(oTile)
	{				
		if(!array_contains(global.vowels, letter) and in_hand and letter != "Y")
		{
			_no_vowels++;
		}	
	}
}
if(_no_vowels >= oPlayerHand.size and alarm_get(0) <= 0)
{
	exchange_flash = true;
	alarm_set(0, 30);
}