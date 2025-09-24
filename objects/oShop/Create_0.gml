tile_specs = [];
tiles = [];
charms = [];
charm_count = 3;
tile_count = 5;
price_tile = 25;
price_charm = 100;
shop_size = tile_count + charm_count;

buffer = 60;
size = sprite_get_width(spLetterTile);
width = (size + buffer) * (tile_count - 1);
x_loc = (room_width / 2) - (width / 2);
y_loc = (room_height / 2);

