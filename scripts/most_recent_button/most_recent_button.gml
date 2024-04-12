function most_recent_button(_button_array, _pressed_chron_order_arr)
{
	var _currently_pressed_arr = array_filter(_button_array, keyboard_check);

	//removes buttons from _pressed_chron_order_arr that are not currently being pressed
	var i = 0;
	while (i < array_length(_pressed_chron_order_arr))
	{
		var _is_pressed = false;
		for (var j = 0; j < array_length(_currently_pressed_arr); j++)
		{
			if (_currently_pressed_arr[j] == _pressed_chron_order_arr[i])
			{
				_is_pressed = true;
				break;
			}
		}
		if (_is_pressed)
		{
			i++;
		}
		else
		{
			array_delete(_pressed_chron_order_arr, i, 1);
		}
	}

	//checks if the buttons currently pressed are new presses
	//if they are, add them to pressed_chron_order
	for (var i = 0; i < array_length(_currently_pressed_arr); i++)
	{
		var _is_new_press = true;
		for (var j = 0; j < array_length(_pressed_chron_order_arr); j++)
		{
			if (_pressed_chron_order_arr[j] == _currently_pressed_arr[i])
			{
				_is_new_press = false;
				break;
			}
		}
		if (_is_new_press)
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
