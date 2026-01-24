shop_size = tile_count + charm_count;

buffer = 60;
size = sprite_get_width(spLetterTile);
width = (size + buffer) * (tile_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2);

