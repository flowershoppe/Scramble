function gen_board(_lvl)
{
	switch(_lvl)
	{
		case oLevel1:
		#region
		//randomly select a lv1 gen
			var _ran = irandom_range(1, 1);
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
					
					var _ran = irandom_range(3, 3);
					switch(_ran)
					{
						case 1:
							specs(25, -1, -1, 5);
						break;
						case 2:
							specs(-1, 10, 3, -1);
						break;
						case 3:
							specs(10, 25, 5, 5);
						break;
					}
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
					
					var _ran = irandom_range(1, 3);
					switch(_ran)
					{
						case 1:
							specs(25, -1, -1, 5);
						break;
						case 2:
							specs(-1, 10, 3, -1);
						break;
						case 3:
							specs(10, 25, 5, 5);
						break;
					}
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
					
					var _ran = irandom_range(1, 3);
					switch(_ran)
					{
						case 1:
							specs(25, -1, -1, 5);
						break;
						case 2:
							specs(-1, 10, 3, -1);
						break;
						case 3:
							specs(10, 25, 5, 5);
						break;
					}
				break;
				
				case 4:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 10,
						grid_height: 4
					});
					var _array = oBoard.holders;
					
					_array[0, 0].start_point = true;
					_array[9, 3].winspot = true;
					
					specs(-1, -1, -1, 7);
				break;
			}
		break;
		#endregion
		
		case oLevel2:
		
			//randomly select a lv2 gen
			var _ran = irandom_range(3, 3);
			switch(_ran)
			{
				case 1:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 9,
						grid_height: 9
					});
					var _array = oBoard.holders;
					
					_array[8, 0].start_point = true;
					_array[0, 8].start_point = true;
					
					for(var _i = 0; _i < oBoard.grid_height; _i++)
					{
						remove_holder(_i, _i);
					}
					
					_array[0, 1].wmult = 2;
					_array[1, 0].wmult = 2;
					_array[8, 7].wmult = 2;
					_array[7, 8].wmult = 2;
					_array[3, 5].lmult = 3;
					_array[5, 3].lmult = 3;
					_array[1, 7].lmult = 2;
					_array[7, 1].lmult = 2;
					
					var _ran = irandom_range(1, 1);
					switch(_ran)
					{
						case 1:
							specs(60, -1, -1, 6);
						break;
						
						case 2:
							specs(-1, 20, 6, -1);
						break;
						
						case 3:
							specs(40, 50, 5, 5);
						break;
					}
				break;
				
				case 2:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 10,
						grid_height: 10
					});
					var _array = oBoard.holders;
					
					_array[0, 0].start_point = true;
					_array[3, 4].lmult = 3;
					_array[4, 3].lmult = 3;
					_array[0, 9].wmult = 2;
					_array[9, 0].wmult = 2;
					_array[8, 1].lmult = 2;
					_array[1, 8].lmult = 2;
					_array[6, 6].wmult = 3;
					
					remove_holder(4, 5);
					remove_holder(5, 4);
					remove_holder(5, 5);
					remove_holder(4, 4);
					remove_holder(5, 3);
					remove_holder(6, 3);
					remove_holder(6, 4);
					remove_holder(4, 6);
					remove_holder(3, 6);
					remove_holder(3, 5);
					
					_array[9, 9].winspot = true;
					var _ran = irandom_range(1, 1);
					switch(_ran)
					{
						case 1:
							specs(60, -1, -1, 8);
						break;
						
						case 2:
							specs(-1, 20, 8, -1);
						break;
					}
					
				break;
				
				case 3:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 9,
						grid_height: 9
					});
					var _array = oBoard.holders;
					
					_array[0, 0].start_point = true;
					
					remove_holder(0, 1);
					remove_holder(0, 2);
					remove_holder(0, 3);
					remove_holder(0, 4);
					remove_holder(0, 5);
					remove_holder(0, 6);
					remove_holder(0, 7);
					
					remove_holder(1, 2);
					remove_holder(1, 3);
					remove_holder(1, 4);
					remove_holder(1, 5);
					remove_holder(1, 6);
					
					remove_holder(2, 3);
					remove_holder(2, 4);
					remove_holder(2, 5);
					
					remove_holder(3, 4);
										
					remove_holder(8, 1);
					remove_holder(8, 2);
					remove_holder(8, 3);
					remove_holder(8, 4);
					remove_holder(8, 5);
					remove_holder(8, 6);
					remove_holder(8, 7);
					
					remove_holder(7, 2);
					remove_holder(7, 3);
					remove_holder(7, 4);
					remove_holder(7, 5);
					remove_holder(7, 6);
					
					remove_holder(6, 3);
					remove_holder(6, 4);
					remove_holder(6, 5);
					
					remove_holder(5, 4);
					
					_array[4, 4].lmult = 3;
					_array[4, 0].wmult = 2;
					_array[4, 8].wmult = 2;
					_array[2, 2].lmult = 2;
					_array[6, 2].lmult = 2;
					_array[2, 6].lmult = 2;
					_array[6, 6].lmult = 2;
					_array[8, 8].winspot = true;
					
					var _ran = irandom_range(1, 1);
					switch(_ran)
					{
						case 1:
							specs(50, -1, -1, 8);
						break;
						
						case 2:
							specs(-1, 20, 8, -1);
						break;
					}
				break;
			}		
		break;
	}

}

