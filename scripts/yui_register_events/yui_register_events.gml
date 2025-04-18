/// @description registers events on a yui_cursor_item
function yui_register_events(events) {
	if events.on_mouse_down != undefined {
		left_pressed = function() {
			if !enabled return;
			var source = self;
			var args = {
				source: source,
				button: "left",
			};
			yui_call_handler(events.on_mouse_down, [args], data_source);
		}
	}
	
	if events.on_mouse_up != undefined {
		left_click = function() {
			if !enabled return;
			var source = self;
			var args = {
				source: source,
				button: "left",
			};
			yui_call_handler(events.on_mouse_up, [args], data_source);
		}
	}
	
	if events.on_click != undefined {
		left_click = function() {
			if !enabled return;
			
			if focusable
				focus();
			
			var source = self;
			var args = {
				source: source,
				button: "left",
			};
			yui_call_handler(events.on_click, [args], data_source);
		}
	}
	
	if events.on_right_click != undefined {
		right_click = function() {
			if !enabled return;
			var source = self;
			var args = {
				source: source,
				button: "right",
			};
			yui_call_handler(events.on_right_click, [args], data_source);
		}
	}
	
	if events.on_double_click != undefined {
		left_double_click = function() {
			if !enabled return;
			
			if focusable
				focus();
			
			var source = self;
			var args = {
				source: source,
				button: "left",
				clicks: 2,
			};
			yui_call_handler(events.on_double_click, [args], data_source);
		}
	}
	
	// TODO hook up other mouse buttons
	
	if events.on_mouse_wheel_up != undefined {
		on_mouse_wheel_up = function() {
			if !enabled return;
			var source = self;
			var args = {
				source: source,
			};
			yui_call_handler(events.on_mouse_wheel_up, [args], data_source);
		}
	}
	
	if events.on_mouse_wheel_down != undefined {
		on_mouse_wheel_down = function() {
			if !enabled return;
			var source = self;
			var args = {
				source: source,
			};
			yui_call_handler(events.on_mouse_wheel_down, [args], data_source);
		}
	}
	
	// should the rest of these return if disabled?
	
	if events.on_hover_changed != undefined {
		on_hover_changed = function() {
			var source = self;
			var args = {
				source: source,
				hover: source.highlight,
			};
			yui_call_handler(events.on_hover_changed, [args], data_source);
		}
	}
	
	if events.on_got_focus != undefined {
		base_on_got_focus = on_got_focus;
		on_got_focus = function() {
			var source = self;
			var args = {
				source: source,
			};
			yui_call_handler(events.on_got_focus, [args], data_source);
			
			// call base handler
			if base_on_got_focus base_on_got_focus();
		}
	}
	
	if events.on_lost_focus != undefined {
		base_on_lost_focus = on_lost_focus;
		on_lost_focus = function() {
			var source = self;
			var args = {
				source: source,
			};
			yui_call_handler(events.on_lost_focus, [args], data_source);
			
			// call base handler
			if base_on_lost_focus base_on_lost_focus();
		}
	}
}