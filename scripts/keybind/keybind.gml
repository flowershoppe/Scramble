function keybind(_verb)
{
	oSettings.verb_to_set = _verb;
	
	var _binder = function(_binding)
	{
	    //On success, set a binding and show positivse feedback
		var _verb_to_set = oSettings.verb_to_set;
	    input_binding_set_safe(_verb_to_set, _binding);
		
	}
	//Start a binding scan
	input_binding_scan_start(_binder,
	function(_result)
	{
	    //On failure, show negative feedback
	    show_message("Failed to set binding");
		input_binding_scan_abort()
	})
}
