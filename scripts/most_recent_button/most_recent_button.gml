function most_recent_button(_button_array, _pressed_chron_order_arr)
{
	var _currently_pressed_arr = array_filter(_button_array, keyboard_check);

	//removes buttons from _pressed_chron_order_arr that are not currently being pressed
	var i = 0;
	while (i < array_length(_pressed_chron_order_arr))
	{
		var _match_func1 = function(x){return (x == _pressed_chron_order_arr[i]);};
		if (array_find_index(_currently_pressed_arr, _match_func1) == -1)
		{
			array_delete(_pressed_chron_order_arr, i, 1);
		}
		else
		{
			i++;
		}
	}

	//checks if the buttons currently pressed are new presses
	//if they are, add them to pressed_chron_order
	for (var i = 0; i < array_length(_currently_pressed_arr); i++)
	{
		var _match_func2 = function(x){return (x == _currently_pressed_arr[i]);};
		if (array_find_index(_pressed_chron_order_arr, _match_func2) == -1)
		{
			array_push(_pressed_chron_order_arr, _currently_pressed_arr[i]);
		}
	}

	//return the most recently pressed button, or vk_nokey if no button is being pressed
	if (array_length(_pressed_chron_order_arr) > 0)
	{
		return _pressed_chron_order_arr[array_length(_pressed_chron_order_arr) - 1];
	}
	return vk_nokey;
}
