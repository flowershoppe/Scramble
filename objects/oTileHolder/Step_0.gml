if(hascoin and !place_meeting(x, y, oCoin))
{
	instance_create_layer(x, y, "Hand_Tiles", oCoin);
}