function gen_board(_lvl)
{
	var _point_scale = 1;
	var _point_base = 0;
	var _point_scale_mult = 1;
	switch(_lvl)
	{		
		case oLevel1:
		#region
		_point_base = 100;
		_point_scale = 5;
		for(var i = 0; i < array_length(oRun.levels); i++)
		{
			if(oRun.levels[i].active)
			{
				_point_scale_mult = i;
			}
		}
		specs(_point_base + (_point_scale * _point_scale_mult), -1, -1, 10);
		//randomly select a lv1 gen
			var _larray = oRun.levels1;
			var _ran = _larray[irandom_range(0, array_length(_larray) - 1)];
			switch(_ran)
			{
				//VERTICAL
				case 1:					
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 9,
						grid_height: 9
					});
					
					var _array = oBoard.holders;
					var _rand = irandom_range(0, 1);
					if(_rand == 0)
					{			
						_array[0, 0].start_point = true;
						
						_array[8, 8].winspot = true;
						_array[8, 7].winspot = true;
						_array[8, 6].winspot = true;
						_array[7, 8].winspot = true;
						_array[6, 8].winspot = true;
						_array[7, 7].winspot = true;
						_array[6, 7].winspot = true;
						_array[7, 6].winspot = true;
						_array[6, 6].winspot = true;
					}
					else
					{		
						_array[8, 8].start_point = true;
						
						_array[0, 0].winspot = true;
						_array[0, 1].winspot = true;
						_array[0, 2].winspot = true;
						_array[1, 0].winspot = true;
						_array[1, 1].winspot = true;
						_array[1, 2].winspot = true;
						_array[2, 0].winspot = true;
						_array[2, 1].winspot = true;
						_array[2, 2].winspot = true;				
					}

					remove_holder(2, 3);
					remove_holder(2, 4);
					remove_holder(2, 5);
					
					remove_holder(6, 3);
					remove_holder(6, 4);
					remove_holder(6, 5);

					_array[0, 8].wmult = 2;
					_array[4, 4].wmult = 2;
					_array[8, 0].wmult = 2;
					_array[0, 4].lmult = 2;
					_array[4, 0].lmult = 2;	
					_array[8, 4].wmult = 2;
					_array[4, 8].wmult = 2;
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
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
					}*/
				break;
				//HORIZONTAL
				case 2:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 9,
						grid_height: 9
					});
					
					var _array = oBoard.holders;
					var _rand = irandom_range(0, 1);
					if(_rand == 0)
					{
						_array[4, 0].start_point = true;

						_array[3, 6].winspot = true;
						_array[3, 7].winspot = true;
						_array[3, 8].winspot = true;
						_array[4, 6].winspot = true;
						_array[4, 7].winspot = true;
						_array[4, 8].winspot = true;
						_array[5, 6].winspot = true;
						_array[5, 7].winspot = true;
						_array[5, 8].winspot = true;
					}
					else
					{
						_array[4, 8].start_point = true;

						_array[3, 0].winspot = true;
						_array[3, 1].winspot = true;
						_array[3, 2].winspot = true;
						_array[4, 0].winspot = true;
						_array[4, 1].winspot = true;
						_array[4, 2].winspot = true;
						_array[5, 0].winspot = true;
						_array[5, 1].winspot = true;
						_array[5, 2].winspot = true;						
					}
					
					remove_holder(2, 4);
					remove_holder(3, 4);
					remove_holder(4, 4);
					remove_holder(5, 4);
					remove_holder(6, 4);

					_array[0, 0].wmult = 2;
					_array[8, 0].wmult = 2;
					_array[4, 3].wmult = 2;
					_array[4, 5].wmult = 2;
					_array[8, 4].lmult = 2;
					_array[0, 4].lmult = 2;
					_array[0, 8].wmult = 2;
					_array[8, 8].wmult = 2;					
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
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
					}*/
				break;
				//DOWN
				case 3:
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 7,
						grid_height: 11
					});
					var _array = oBoard.holders;

					_array[3, 5].start_point = true;

					_array[1, 3].wmult = 2;
					_array[5, 3].wmult = 2;
					_array[1, 7].wmult = 2;
					_array[5, 7].wmult = 2;
					_array[0, 5].lmult = 2;
					_array[6, 5].lmult = 2;
					_array[3, 1].lmult = 2;
					_array[3, 9].lmult = 2;
					
					_array[1, 0].winspot = true;
					_array[2, 0].winspot = true;
					_array[3, 0].winspot = true;
					_array[4, 0].winspot = true;
					_array[5, 0].winspot = true;
					
					_array[1, 10].winspot = true;
					_array[2, 10].winspot = true;
					_array[3, 10].winspot = true;
					_array[4, 10].winspot = true;
					_array[5, 10].winspot = true;
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
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
					}*/
				break;
				
				//RIGHT
				case 4:
				#region
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 11,
						grid_height: 7
					});
					var _array = oBoard.holders;
					
					_array[5, 3].start_point = true;
					
					_array[3, 1].wmult = 2;
					_array[3, 5].wmult = 2;
					_array[7, 1].wmult = 2;
					_array[7, 5].wmult = 2;
					_array[5, 0].lmult = 2;
					_array[5, 6].lmult = 2;
					_array[1, 3].lmult = 2;
					_array[9, 3].lmult = 2;
					
					_array[0, 1].winspot = true;
					_array[0, 2].winspot = true;
					_array[0, 3].winspot = true;
					_array[0, 4].winspot = true;
					_array[0, 5].winspot = true;
					
					_array[10, 1].winspot = true;
					_array[10, 2].winspot = true;
					_array[10, 3].winspot = true;
					_array[10, 4].winspot = true;
					_array[10, 5].winspot = true;
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					//_array[7, 3].winspot = true;
					
					//specs(-1, -1, -1, 7);
				break;
				#endregion
			}
		break;
		#endregion
		
		case oLevel2:
		#region
			_point_base = 120;
			_point_scale = 5;
			for(var i = 0; i < array_length(oRun.levels); i++)
			{
				if(oRun.levels[i].active)
				{
					_point_scale_mult = i;
				}
			}
			specs(_point_base + (_point_scale * _point_scale_mult), -1, -1, 10);
			//randomly select a lv2 gen
			var _larray = oRun.levels2;			
			var _ran = _larray[irandom_range(0, array_length(_larray) - 1)];
			switch(_ran)
			{
				//DIVIDE
				case 1:
				#region
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 11,
						grid_height: 11
					});
					var _array = oBoard.holders;
					
					_array[10, 0].start_point = true;
					_array[0, 10].start_point = true;
					
					for(var _i = 0; _i < oBoard.grid_height; _i++)
					{
						remove_holder(_i, _i);
					}
					
					_array[0, 1].winspot = true;
					_array[0, 2].winspot = true;
					_array[1, 2].winspot = true;
					
					_array[2, 0].winspot = true;
					_array[2, 1].winspot = true;
					_array[1, 0].winspot = true;
					
					_array[10, 9].winspot = true;
					_array[10, 8].winspot = true;
					_array[9, 8].winspot = true;
					
					_array[9, 10].winspot = true;
					_array[8, 10].winspot = true;
					_array[8, 9].winspot = true;
					
					_array[2, 5].wmult = 2;
					_array[5, 2].wmult = 2;
					_array[5, 8].wmult = 2;
					_array[8, 5].wmult = 2;
					_array[4, 6].lmult = 3;
					_array[6, 4].lmult = 3;
					_array[1, 10].lmult = 2;
					_array[10, 1].lmult = 2;
					_array[9, 0].lmult = 2;
					_array[0, 9].lmult = 2;
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
					{
						case 1:
							specs(60, -1, -1, 6);
						break;
						
						case 2:
							specs(-1, 20, 6, -1);
						break;
						
						case 3:
							specs(40, 50, 6, 6);
						break;
					}*/
				break;
				#endregion
				
				//HOLE PUNCH
				case 2:
				#region
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 10,
						grid_height: 10
					});
					var _array = oBoard.holders;
					
					_array[0, 0].start_point = true;
					
					_array[9, 9].winspot = true;
					_array[9, 8].winspot = true;
					_array[8, 9].winspot = true;
					_array[8, 8].winspot = true;
					
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
					
					//_array[9, 9].winspot = true;
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
					{
						case 1:
							specs(60, -1, -1, 8);
						break;
						
						case 2:
							specs(-1, 30, 8, -1);
						break;
					}*/
					
				break;
				#endregion
				
				//HOURGLASS
				case 3:
				#region
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 9,
						grid_height: 9
					});
					var _array = oBoard.holders;
					
					_array[4, 0].start_point = true;
					_array[0, 8].winspot = true;
					_array[1, 8].winspot = true;
					_array[2, 8].winspot = true;
					_array[3, 8].winspot = true;
					_array[4, 8].winspot = true;
					_array[5, 8].winspot = true;
					_array[6, 8].winspot = true;
					_array[7, 8].winspot = true;
					_array[8, 8].winspot = true;
					
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
					
					_array[0, 0].wmult = 2;
					_array[8, 0].wmult = 2;
					_array[4, 4].lmult = 3;
					_array[4, 7].wmult = 2;
					_array[2, 2].lmult = 2;
					_array[6, 2].lmult = 2;
					_array[2, 6].lmult = 2;
					_array[6, 6].lmult = 2;
					//_array[8, 8].winspot = true;
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
					{
						case 1:
							specs(50, -1, -1, 8);
						break;
						
						case 2:
							specs(-1, 20, 5, -1);
						break;
					}*/
				break;
				#endregion
				
				//CROSS
				case 4:
				#region
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 11,
						grid_height: 11
					});
					var _array = oBoard.holders;
					
					_array[5, 5].start_point = true;
					
					_array[4, 4].lmult = 2;
					_array[4, 6].lmult = 2;
					_array[6, 4].lmult = 2;
					_array[6, 6].lmult = 2;
					
					_array[5, 1].winspot = true;
					_array[4, 0].lmult = 3;
					_array[6, 0].lmult = 3;
					_array[4, 2].lmult = 3;
					_array[6, 2].lmult = 3;
					
					_array[1, 5].winspot = true;
					_array[0, 4].lmult = 3;
					_array[0, 6].lmult = 3;
					_array[2, 4].lmult = 3;
					_array[2, 6].lmult = 3;
					
					_array[9, 5].winspot = true;
					_array[10, 4].lmult = 3;
					_array[10, 6].lmult = 3;
					_array[8, 4].lmult = 3;
					_array[8, 6].lmult = 3;
					
					_array[5, 9].winspot = true;
					_array[4, 10].lmult = 3;
					_array[6, 10].lmult = 3;
					_array[4, 8].lmult = 3;
					_array[6, 8].lmult = 3;
					
					remove_holder(0, 0);
					remove_holder(0, 1);
					remove_holder(0, 2);
					remove_holder(0, 3);
					remove_holder(1, 0);
					remove_holder(1, 1);
					remove_holder(1, 2);
					remove_holder(1, 3);
					remove_holder(2, 0);
					remove_holder(2, 1);
					remove_holder(2, 2);
					remove_holder(2, 3);
					remove_holder(3, 0);
					remove_holder(3, 1);
					remove_holder(3, 2);
					remove_holder(3, 3);
					
					remove_holder(7, 0);
					remove_holder(7, 1);
					remove_holder(7, 2);
					remove_holder(7, 3);
					remove_holder(8, 0);
					remove_holder(8, 1);
					remove_holder(8, 2);
					remove_holder(8, 3);
					remove_holder(9, 0);
					remove_holder(9, 1);
					remove_holder(9, 2);
					remove_holder(9, 3);
					remove_holder(10, 0);
					remove_holder(10, 1);
					remove_holder(10, 2);
					remove_holder(10, 3);
					
					remove_holder(0, 10);
					remove_holder(1, 10);
					remove_holder(2, 10);
					remove_holder(3, 10);
					remove_holder(0, 9);
					remove_holder(1, 9);
					remove_holder(2, 9);
					remove_holder(3, 9);
					remove_holder(0, 8);
					remove_holder(1, 8);
					remove_holder(2, 8);
					remove_holder(3, 8);
					remove_holder(0, 7);
					remove_holder(1, 7);
					remove_holder(2, 7);
					remove_holder(3, 7);
					remove_holder(3, 3);
					
					remove_holder(10, 10);
					remove_holder(9, 10);
					remove_holder(8, 10);
					remove_holder(7, 10);
					remove_holder(10, 9);
					remove_holder(9, 9);
					remove_holder(8, 9);
					remove_holder(7, 9);
					remove_holder(10, 8);
					remove_holder(9, 8);
					remove_holder(8, 8);
					remove_holder(7, 8);
					remove_holder(10, 7);
					remove_holder(9, 7);
					remove_holder(8, 7);
					remove_holder(7, 7);
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*switch(_ran)
					{
						case 1:
							specs(50, -1, -1, 8);
						break;
						
						case 2:
							specs(-1, 20, 8, -1);
						break;
					}*/
					
				break;
				#endregion
			}		
		break;
		#endregion
		
		case oLevel3:
		#region
			_point_base = 140;
			_point_scale = 10;
			for(var i = 0; i < array_length(oRun.levels); i++)
			{
				if(oRun.levels[i].active)
				{
					_point_scale_mult = i;
				}
			}
			specs(_point_base + (_point_scale * _point_scale_mult), -1, -1, 10);
			//randomly select a lv3 gen
			var _larray = oRun.levels3;			
			var _ran = 3;//_larray[irandom_range(0, array_length(_larray) - 1)];
			switch(_ran)
			{
				//EYE
				#region
				case 1: 
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 13,
						grid_height: 9
					});
					var _array = oBoard.holders;
					
					_array[6, 2].start_point = true;
					//_array[5, 4].winspot = true;
					
					_array[0, 4].lmult = 2;
					_array[12, 4].lmult = 2;
					_array[2, 0].wmult = 2;
					_array[10, 0].wmult = 2;
					_array[2, 8].wmult = 2;
					_array[10, 8].wmult = 2;
					_array[6, 0].lmult = 2;
					_array[6, 8].lmult = 3;
					_array[6, 4].winspot = true;
					
					remove_holder(0, 0);
					remove_holder(0, 1);
					remove_holder(1, 0);
					remove_holder(12, 0);
					remove_holder(11, 0);
					remove_holder(12, 1);
					remove_holder(0, 8);
					remove_holder(0, 7);
					remove_holder(1, 8);
					remove_holder(12, 8);
					remove_holder(12, 7);
					remove_holder(11, 8);
					
					remove_holder(4, 4);
					remove_holder(5, 4);
					remove_holder(7, 4);
					remove_holder(8, 4);
					remove_holder(5, 3);
					remove_holder(5, 5);
					remove_holder(6, 3);
					remove_holder(7, 3);
					remove_holder(7, 5);
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					/*var _ran = irandom_range(1, 2);
					switch(_ran)
					{
						case 1:
							specs(60, -1, -1, 7);
						break;
						
						case 2:
							specs(-1, -1, -1, 4);
						break;
						
						case 3:
							specs(-1, 25, 4, -1);
						break;
					}*/
				break;
				#endregion
				//HEART
				#region
				case 2: 
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 13,
						grid_height: 11
					});
					var _array = oBoard.holders;
					
					_array[6, 2].start_point = true;
					_array[6, 10].winspot = true;
					
					_array[2, 0].wmult = 2;
					_array[10, 0].wmult = 2;
					_array[5, 1].lmult = 2;
					_array[7, 1].lmult = 2;
					_array[0, 6].lmult = 3;
					_array[0, 4].lmult = 3;
					_array[12, 4].lmult = 3;
					_array[6, 6].lmult = 2;
					_array[4, 8].wmult = 2;
					_array[8, 8].wmult = 2;
										
					remove_holder(0, 0);
					remove_holder(0, 1);
					remove_holder(1, 0);
					
					remove_holder(6, 0);
					remove_holder(7, 0);
					remove_holder(5, 0);
					remove_holder(6, 1);
					
					remove_holder(12, 0);
					remove_holder(12, 1);
					remove_holder(11, 0);
									
					remove_holder(0, 5);
					remove_holder(0, 6);
					remove_holder(0, 7);
					remove_holder(0, 8);
					remove_holder(0, 9);
					remove_holder(0, 10);
					remove_holder(1, 6);
					remove_holder(1, 7);
					remove_holder(1, 8);
					remove_holder(1, 9);
					remove_holder(1, 10);
					remove_holder(2, 7);
					remove_holder(2, 8);
					remove_holder(2, 9);
					remove_holder(2, 10);
					remove_holder(3, 8);
					remove_holder(3, 9);
					remove_holder(3, 10);
					remove_holder(4, 9);
					remove_holder(4, 10);
					remove_holder(5, 10);
					
					remove_holder(7, 10);
					remove_holder(8, 9);
					remove_holder(8, 10);
					remove_holder(9, 8);
					remove_holder(9, 9);
					remove_holder(9, 10);
					remove_holder(10, 7);
					remove_holder(10, 8);
					remove_holder(10, 9);
					remove_holder(10, 10);
					remove_holder(11, 6);
					remove_holder(11, 7);
					remove_holder(11, 8);
					remove_holder(11, 9);
					remove_holder(11, 10);	
					remove_holder(12, 5);
					remove_holder(12, 6);		
					remove_holder(12, 7);
					remove_holder(12, 8);
					remove_holder(12, 9);
					remove_holder(12, 10);				
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
				break;
				#endregion
				//WIDE OPEN
				#region
				case 3: 
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 13,
						grid_height: 13
					});
					var _array = oBoard.holders;
					
					_array[6, 6].start_point = true;
					
					_array[0, 0].wmult = 4;
					_array[12, 0].wmult = 4;
					_array[0, 12].wmult = 4;
					_array[12, 12].wmult = 4;
					_array[6, 0].lmult = 3;
					_array[6, 12].lmult = 3;
					_array[0, 6].lmult = 3;
					_array[12, 6].lmult = 3;
					
					array_delete(_larray, array_get_index(_larray, _ran), 1);
				break;
				#endregion
				//MOUNTAIN
				#region
				case 4: 
					instance_create_layer(0, 0, "Board", oBoard, 
					{
						grid_width: 11,
						grid_height: 11
					});
					var _array = oBoard.holders;
					
					_array[0, 10].start_point = true;
					_array[10, 10].wmult = 3;
					_array[2, 8].lmult = 2;
					_array[4, 6].wmult = 2;
					_array[6, 4].lmult = 3;
					_array[8, 2].wmult = 3;
					_array[10, 0].wmult = 4;
					_array[10, 0].winspot = true;
					
					for(var i = 0; i < 10; i++)
					{
						for(var k = 0; k < (10 - i); k++)
						{
							remove_holder(i, k);
						}
					}
										
					array_delete(_larray, array_get_index(_larray, _ran), 1);
					//specs(-1, -1, -1, 8);
				break;
				#endregion
			}
		break;
		#endregion
	}
}

