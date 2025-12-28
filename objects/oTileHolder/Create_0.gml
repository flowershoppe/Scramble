rot = 0;
chance = 1;
alarm_set(0, 1);

//coin
if(room != rGame or oGame.loading){exit;}
if(visible and !winspot and !start_point and layer != layer_get_id("Hand_Tile_Holders") and irandom_range(0, 100) < oRun.coinchance)
{
	instance_create_layer(x, y, "Hand_Tiles", oCoin);
	oRun.coinchance = 0;
}
else
{
	oRun.coinchance++;
}