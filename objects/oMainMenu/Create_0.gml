i = 0;
array_logo_letters = [spS, spC, spR, spA, spM, spB, spL, spE];
array = array_logo_letters;
length = array_length(array);
size = (sprite_get_width(spM) / 2);
width = size * (length - 1);
letter_delay = 25;

x_loc = (room_width / 2) - (width / 2);
y_loc = room_height * 0.2;

alarm_set(0, letter_delay);
