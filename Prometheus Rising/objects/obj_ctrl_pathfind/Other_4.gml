//destroy grid
mp_grid_destroy(global.grid);
path_delete(global.grid_path);

//Recreate grid for room
event_perform(ev_create,0);