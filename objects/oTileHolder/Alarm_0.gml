//coin
if(room != rGame){exit;}
if(!winspot and !start_point and !array_contains(oPlayerHand.tile_holder_array, id) and irandom_range(0, 100) < oBoard.coinchance)
{
	hascoin = true;	
	oBoard.coinchance = 0;
}
else
{
	oBoard.coinchance++;
}