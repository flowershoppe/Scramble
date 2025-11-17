if(instance_exists(oRun))
{
	switch(oRun.stage)
	{
		case 1:
			spr = spLab;
			c = c_white;
		break;
		case 2:
			spr = spNoEntry;
			c = c_yellow
		break;
		case 3:
			spr = spCore;
			c = c_red;
		break;
	}
}