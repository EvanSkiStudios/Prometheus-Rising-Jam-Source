//UPDATE PATH FIND GRID
var _grid = global.grid;

//Add objects to advoid
mp_grid_add_instances(_grid,obj_rm_wall,false);
mp_grid_add_instances(_grid,obj_rm_wall_moveable,false);
mp_grid_add_instances(_grid,obj_enemy_outcast,false);