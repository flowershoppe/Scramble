function gen_board(_lvl)
{
	switch(_lvl)
	{
		case oLevel1:
		//randomly select a lv1 gen
			var _ran = irandom_range(1, 3);
			switch(_ran)
			{
				case 1:					
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 5,
						grid_height: 9
					});
					
					var _array = oBoard.holders;

					_array[2, 0].start_point = true;

					remove_holder(2, 3);
					remove_holder(2, 4);
					remove_holder(2, 5);

					_array[2, 6].wmult = 2;
					_array[0, 8].wmult = 2;
					_array[4, 8].wmult = 2;
					_array[0, 2].lmult = 2;
					_array[4, 2].lmult = 2;	
				break;
				
				case 2:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 9,
						grid_height: 5
					});
					
					var _array = oBoard.holders;

					_array[4, 0].start_point = true;

					remove_holder(3, 2);
					remove_holder(4, 2);
					remove_holder(5, 2);

					_array[0, 2].lmult = 2;
					_array[8, 2].lmult = 2;
					_array[4, 3].wmult = 2;
					_array[8, 4].wmult = 2;
					_array[0, 4].wmult = 2;
				break;
				
				case 3:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 7,
						grid_height: 7
					});
					var _array = oBoard.holders;

					_array[3, 3].start_point = true;

					_array[1, 1].wmult = 2;
					_array[5, 1].wmult = 2;
					_array[1, 5].wmult = 2;
					_array[5, 5].wmult = 2;
					_array[0, 3].lmult = 2;
					_array[6, 3].lmult = 2;
				break;
			}
	}

}