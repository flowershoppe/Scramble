// TODO next major version - rename to YuiElementDrag
/// @description
function YuiElementDrag(_props, _resources) constructor {
	
	static default_props = {
		id: undefined,
		type: "element_drag",
		
		clamp_to_size: true, // restrict drag position to within the parent's size
		
		mode: "point", // "point" or "element"
		direct: false, // whether to directly move the target element
		
		normalized: false, // whether to normalize the resulting position within the size of the parent
		
		condition: undefined,
		on_position_changed: undefined,
		on_drag_end: undefined,

		trace: false,
	};
	
	props = yui_apply_props(_props);
	resources = _resources;
	
	static canStart = function(source_data) {
		return true; // eval condition?
	}
	
	static start = function(source_data, interaction, source_item) {
		
		// NOTE: assumes initiating event is a mouse button event
		button = interaction[$ "button"] ?? mb_left;
		
		// TODO: init_props on the parameters (and define defaults in .yui)
		parameters = variable_struct_get(interaction, "parameters") ?? {};
		
		on_position_changed = parameters[$ "on_position_changed"] ?? props.on_position_changed;
		on_drag_end = parameters[$ "on_drag_end"] ?? props.on_drag_end;
		
		// target might be an ancestor of the source, e.g. the window containing the title bar drag button
		var source_type = parameters[$"source_type"];
		if source_type != undefined {
			target = source_item.findAncestor(source_type);
		}
		else {
			target = source_item;
		}
		
		parent = target.parent;
		
		var gui_x = device_mouse_x_to_gui(0);
		var gui_y = device_mouse_y_to_gui(0);
		
		// cursor position relative to the target
		cursor_offset_x = gui_x - target.x;
		cursor_offset_y = gui_y - target.y;
		
		event = {
			source: target.id,
			left: undefined,
			top: undefined,
		};
		
		return undefined;
	}
	
	static update = function(visual_item, cursor_pos) {
		
		var parent_size = parent.draw_size;
		
		var relative_left = cursor_pos.x - parent_size.x;
		var relative_top = cursor_pos.y - parent_size.y;
		
		// in element mode, position by the corner of the target, not the position of the cursor
		if props.mode == "element" {
			relative_left -= cursor_offset_x;
			relative_top -= cursor_offset_y;
		}
		
		// if clamping, restrict the coords to the inside of the parent
		if props.clamp_to_size {
		
			var clamp_w = parent_size.w;
			var clamp_h = parent_size.h;
			
			// TODO: scrollbar needs some way to factor out the scrollbar thumb
			// since it can't offset it outside the length like Slider does
			
			relative_left = clamp(relative_left, 0, clamp_w);
			relative_top = clamp(relative_top, 0, clamp_h);
		}
		
		// if normalizing, calculate the position as a ratio of the actual position to the containing size
		if props.normalized {
			relative_left = relative_left / parent_size.w;
			relative_top = relative_top / parent_size.h;
		}
		
		// calculate the coordinate differences stince the last frame
		event.x_diff = event.left == undefined ? 0 : relative_left - event.left;
		event.y_diff = event.top == undefined ? 0 : relative_top - event.top;
		
		// top/left is either the raw top/left relative to the parent x/y,
		// or the normalized top/left within the parent size (relative to the x/y)
		event.source = target.id;
		event.left = relative_left;
		event.top = relative_top;
		
		if props.direct == true {
			target.move(event.x_diff, event.y_diff);
		}
		
		if props.trace || parameters[$"trace"] {
			yui_log(event);
		}

		yui_call_handler(on_position_changed, [event], target.data_source);
		
		if mouse_check_button_released(button) {
			if on_drag_end != undefined {
				yui_call_handler(on_drag_end, [event], target.data_source);
			}
			finish();
		}
	}
	
	static resetFrame = function() {
		// nothing to reset here
	}
	
	static finish = function() {
		YuiCursorManager.finishInteraction();
		
		parameters = undefined;
		button = undefined;
		target = undefined;
		parent = undefined;
		event = undefined;
		cursor_offset_x = undefined;
		cursor_offset_y = undefined;
		on_position_changed = undefined;
		on_drag_end = undefined;
	}
}