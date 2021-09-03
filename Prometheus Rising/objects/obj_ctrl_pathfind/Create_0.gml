//cell width and height
cell_size = 32;

//Get number of cells
_Hcells = ceil(room_width/cell_size);
_Vcells = ceil(room_height/cell_size);

//Create grid for room
global.grid = mp_grid_create(0,0,_Hcells,_Vcells,cell_size,cell_size);

var _grid = global.grid;

mp_grid_add_instances(_grid,obj_rm_wall,false);
mp_grid_add_instances(_grid,obj_rm_wall_moveable,false);
mp_grid_add_instances(_grid,obj_rm_door,false);
mp_grid_add_instances(_grid,obj_rm_door_sideways,false);

mp_grid_add_instances(_grid,obj_enemy_outcast,false);

//create path for grid for objects to use
global.grid_path = path_add();

alarm[1] = GAME_SPEED;
alarm[0] = GAME_SPEED * 2;
