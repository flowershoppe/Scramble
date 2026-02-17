//Add tile to hand from tilebag
function add_tile_to_hand(_amount, _letter = "")
{
	with(oPlayerHand)
	{
		alarm_set(0, 1);	
		inc = _amount;
		target_letter = _letter;
	}
}