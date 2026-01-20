if(fade)
{
	alpha -= 0.01;
}
else if(!oMatchManager.active)
{
	instance_destroy();
}
if(alpha <= 0)
{
	instance_destroy();	
}