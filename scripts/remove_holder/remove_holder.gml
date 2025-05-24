function remove_holder(_x, _y)
{
	instance_destroy(oBoard.holders[_x, _y]);
	oBoard.holders[_x, _y] = noone;
}