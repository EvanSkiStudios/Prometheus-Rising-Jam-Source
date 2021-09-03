function ai_pathfind(_grid,_path,_xgoal,_ygoal,_allowdiag,_speed,_end_action,_absolute){
//Sets up pathfinding for current object
//{real} grid The id of the grid to use
//{real} path The id of the path to use
//{real} xgoal The target X cord
//{real} ygoal The target Y cord
//{boolean} allowdiag Indicates whether diagonal moves are allowed instead of just horizontal or vertical
//{real} speed The speed of which to follow the path in pixels per step, negative meaning going backwards.
//end_action What to do when the end of the path is reached
//{boolean} absolute Whether the calling instance should follow the absolute path as it is in the editor (true) or a relative path to its current position (false).


	with(obj_enemy_outcast){
		var cell_h = x div obj_ctrl_pathfind.cell_size;
		var cell_v = y div obj_ctrl_pathfind.cell_size;
		mp_grid_add_cell(_grid, cell_h , cell_v);
	}

	//clear my cell
	var cell_h = x div obj_ctrl_pathfind.cell_size;
	var cell_v = y div obj_ctrl_pathfind.cell_size;
	mp_grid_clear_cell(_grid, cell_h , cell_v);


	//if the path using the grid is possible then do it.
	if mp_grid_path(_grid, _path, x, y, _xgoal, _ygoal, _allowdiag)
	{
		path_start(_path, _speed, _end_action, _absolute);
	}
	else
	{
		//if it is not possible and we have already started the path, end it
		if (path_index != -1)
		{
			path_end();	
		}
	}
	
	with(obj_enemy_outcast){
		var cell_h = x div obj_ctrl_pathfind.cell_size;
		var cell_v = y div obj_ctrl_pathfind.cell_size;
		mp_grid_clear_cell(_grid, cell_h , cell_v);
	}
	
}

