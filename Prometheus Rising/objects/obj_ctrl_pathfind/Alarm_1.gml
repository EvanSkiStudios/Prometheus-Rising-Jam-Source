//we wait for a completed frame then add all the walls and doors to the grid
var _grid = global.grid;

mp_grid_add_instances(_grid,obj_rm_wall,false);
mp_grid_add_instances(_grid,obj_rm_wall_moveable,false);
mp_grid_add_instances(_grid,obj_rm_door,false);
mp_grid_add_instances(_grid,obj_rm_door_sideways,false);

mp_grid_add_instances(_grid,obj_enemy_outcast,false);