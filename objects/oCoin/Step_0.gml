if(place_meeting(x, y, oCursor))
{
	if(image_alpha > .4)
	{
		image_alpha -= 0.1;	
	}
}
else
{
	if(image_alpha < 1)
	{
		image_alpha += 0.1;	
	}
}