// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keybind(_verb)
{
	oSettings.verb_to_set = _verb;
	
	var _binder = function(_binding)
	{
	    //On success, set a binding and show positive feedback
	    input_binding_set_safe(oSettings.verb_to_set, _binding);
	    display_prompt("Binding set");
	}
	//Start a binding scan
	input_binding_scan_start(_binder,
	function(_result)
	{
	    //On failure, show negative feedback
	    display_prompt("Failed to set binding");
	})
	
}