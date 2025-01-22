instance_create_layer(x_loc, y_loc, "Meta", oTitleLetter,
{
	sprite_index : array[i],
	image_blend : c_orange
});
i++;
x_loc += size;	

if(i < length)
{
	alarm_set(0, letter_delay);	
}