var _array = oBoard.holders;

_array[4, 4].start_point = true;
_array[1, 1].wmult = 2;
_array[7, 1].wmult = 2;
_array[1, 7].wmult = 2;
_array[7, 7].wmult = 2;
_array[3, 3].lmult = 2;
_array[5, 3].lmult = 2;
_array[5, 5].lmult = 2;
_array[3, 5].lmult = 2;

remove_holder(4, 1);
remove_holder(4, 7);
remove_holder(1, 4);
remove_holder(7, 4);