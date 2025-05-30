/// @description
function YuiViewportElement(_props, _resources, _slot_values) : YuiBaseElement(_props, _resources, _slot_values) constructor {
	static default_props = {
		type: "viewport",

		// visuals
		background: undefined,
		border_color: undefined,
		border_thickness: 1,
		border_focus_color: undefined,
		
		// offset within the viewport to render the contents at
		viewport_x: 0,
		viewport_y: 0,
		
		// size of the contained content
		content_w: infinity,
		content_h: infinity,
		
		// where to send viewport info (for scrollbar sizes etc)
		on_viewport_info: undefined,
		
		// the content to display inside the viewport
		content: undefined,
	};
	
	props = yui_apply_element_props(_props);
	
	baseInit(props);
	
	content_element = yui_resolve_element(props.content, resources, slot_values);
	
	resolveBackgroundAndBorder();
	
	on_viewport_info = yui_bind_handler(props.on_viewport_info, resources, slot_values);
	
	viewport_x = yui_bind(props.viewport_x, resources, slot_values);
	viewport_y = yui_bind(props.viewport_y, resources, slot_values);
	
	// supports slots etc but not live binding
	content_w = yui_bind(props.content_w, resources, slot_values);
	content_h = yui_bind(props.content_h, resources, slot_values);
	
	is_viewport_x_bound = yui_is_live_binding(viewport_x);
	is_viewport_y_bound = yui_is_live_binding(viewport_y);
	
	is_bound = base_is_bound
		|| is_viewport_x_bound
		|| is_viewport_y_bound;
		
	// ===== functions =====
		
	static getLayoutProps = function() {
		return {
			// base
			alignment: alignment,
			size: size,
			// border
			content_element,
			border_color,
			border_thickness: props.border_thickness,
			border_focus_color,
			// viewport
			content_w,
			content_h,
			on_viewport_info,
		};
	}
	
	// feather ignore once GM2017
	static getBoundValues = function YuiViewportElement_getBoundValues(data, prev) {
		var viewport_x = is_viewport_x_bound ? self.viewport_x.resolve(data) : self.viewport_x;
		var viewport_y = is_viewport_y_bound ? self.viewport_y.resolve(data) : self.viewport_y;
		
		// diff
		if prev
			&& viewport_x == prev.viewport_x
			&& viewport_y == prev.viewport_y
		{
			return true;
		}
		
		return {
			is_live: is_bound,
			data_source: data,
			// viewport
			viewport_x: viewport_x,
			viewport_y: viewport_y,
		};
	}
}





