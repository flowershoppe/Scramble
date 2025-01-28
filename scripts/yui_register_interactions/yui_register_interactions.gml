function yui_unregister_interactions(interactions) {
    with YuiCursorManager {
        if !ds_exists(participation_map, ds_type_map) return;

        var i = 0; repeat array_length(interactions) {
            var interaction = interactions[i++];
            var inner_map = participation_map[? interaction];
        
            if inner_map == undefined {
                throw yui_error("attempting to unregister interaction that was not registered")
            }
        
            // clean up
            ds_map_delete(inner_map, self.id);
            if ds_map_empty(inner_map) {
                ds_map_destroy(inner_map);
                ds_map_delete(participation_map, interaction);
            }
        }
    }
}