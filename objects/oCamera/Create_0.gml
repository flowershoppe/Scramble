//factor for zooming
zoomF = 1;

//parameters of visible view of game
view_h = view_get_hport(0);
view_w = view_get_wport(0);

mouse_xprevious = 0;
mouse_yprevious = 0;
cam = {
    x: camera_get_view_x(view_camera[0]),
    y: camera_get_view_y(view_camera[0]),
    w: camera_get_view_width(view_camera[0]),
    h: camera_get_view_height(view_camera[0])
};

mouse_xguiprev = 0;
mouse_yguiprev = 0;

//variables for managing camera movement
/*
horiz_button_arr = [global.left_button, global.right_button];
horiz_button_chron_order_arr = [];
horiz_button_currently_pressed_arr = [];
vert_button_arr = [global.down_button, global.up_button];
vert_button_chron_order_arr = [];
vert_button_currently_pressed_arr = [];
