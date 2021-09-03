function vertex_add_point(vbuffer, xx, yy, zz, nx, ny, nz, utex, vtex, color, alpha){
	
	vertex_position_3d(vbuffer, xx, yy, zz);
	vertex_normal(vbuffer, nx, ny, nz);
	vertex_texcoord(vbuffer, utex, vtex);
	vertex_color(vbuffer, color, alpha);
}

function load_E3D(filename, vertex_format, freeze){
	
	var model_data = buffer_load(filename+".E3D");
	Loaded_model = vertex_create_buffer_from_buffer(model_data, vertex_format);
	if (freeze) vertex_freeze(Loaded_model);
	buffer_delete(model_data);
	
	return(Loaded_model);
}

function load_obj(filename, mtlname){
	// Open the file
	var obj_file = file_text_open_read(filename);
	var mtl_file = file_text_open_read(mtlname);
	
	var mtl_name = "None";
	var active_mtl = "None";

	// Create ds_maps to link the color/alpha/other attributes to the material name

	var mtl_alpha = ds_map_create();
	var mtl_color = ds_map_create();

	// Set the default attributes

	ds_map_add(mtl_alpha, "None", 1);
	ds_map_add(mtl_color, "None", c_white);

	// For each line in the mtl file
	while(not file_text_eof(mtl_file)){
		var line = file_text_read_string(mtl_file);
		file_text_readln(mtl_file);
		// Split each line around the space character
		var terms, index;
		index = 0;
		terms[0] = "";
		terms[string_count(line, " ")] = "";
		for (var i = 1; i <= string_length(line); i++){
			if (string_char_at(line, i) == " "){
				index++;
				terms[index] = "";
			} else {
				terms[index] = terms[index]+string_char_at(line, i);
			}
		}
		switch(terms[0]){
			case "newmtl":
				// Set the material name
				mtl_name = terms[1];
				break;
			case "Kd":
				// Diffuse color (the color we're concerned with)
				var red = real(terms[1]) * 255;
				var green = real(terms[2]) * 255;
				var blue = real(terms[3]) * 255;
				var color = make_color_rgb(red, green, blue);
				ds_map_set(mtl_color, mtl_name, color);
				break;
			case "d":
				// "dissolved" (alpha)
				var alpha = real(terms[1]);
				ds_map_set(mtl_alpha, mtl_name, alpha);
				break;
			default:
				// There are way more available attributes in mtl files, but we're only concerned with these three (two)
				break;
		}
	}

	// Create the vertex buffer
	var model = vertex_create_buffer();
	vertex_begin(model, global.vertex_format);

	// Create the lists of position/normal/texture data
	var vertex_x = ds_list_create();
	var vertex_y = ds_list_create();
	var vertex_z = ds_list_create();

	var vertex_nx = ds_list_create();
	var vertex_ny = ds_list_create();
	var vertex_nz = ds_list_create();

	var vertex_xtex = ds_list_create();
	var vertex_ytex = ds_list_create();

	// Read each line in the file
	while(not file_text_eof(obj_file)){
		var line = file_text_read_string(obj_file);
		file_text_readln(obj_file);
		// Split each line around the space character
		var terms, index;
		index = 0;
		terms = array_create(string_count(line, " ") + 1, "");
		for (var i = 1; i <= string_length(line); i++){
			if (string_char_at(line, i) == " "){
				index++;
				terms[index] = "";
			} else {
				terms[index] += string_char_at(line, i);
			}
		}
		switch(terms[0]){
			// Add the vertex x, y an z position to their respective lists
			case "v":
				ds_list_add(vertex_x, real(terms[1]));
				ds_list_add(vertex_y, real(terms[2]));
				ds_list_add(vertex_z, real(terms[3]));
				break;
			// Add the vertex x and y texture position (or "u" and "v") to their respective lists
			case "vt":
				ds_list_add(vertex_xtex, real(terms[1]));
				ds_list_add(vertex_ytex, real(terms[2]));
				break;
			// Add the vertex normal's x, y and z components to their respective lists
			case "vn":
				ds_list_add(vertex_nx, real(terms[1]));
				ds_list_add(vertex_ny, real(terms[2]));
				ds_list_add(vertex_nz, real(terms[3]));
				break;
			case "f":
				// Split each term around the slash character
				for (var n = 1; n <= 3; n++){
					var data, index;
					index = 0;
					data = array_create(string_count(terms[n], "/") + 1, "");
					for (var i = 1; i <= string_length(terms[n]); i++){
						if (string_char_at(terms[n], i) == "/"){
							index++;
							data[index] = "";
						} else {
							data[index] += string_char_at(terms[n], i);
						}
					}
					// Look up the x, y, z, normal x, y, z and texture x, y in the already-created lists
					var xx = ds_list_find_value(vertex_x, real(data[0]) - 1);
					var yy = ds_list_find_value(vertex_y, real(data[0]) - 1);
					var zz = ds_list_find_value(vertex_z, real(data[0]) - 1);
					var xtex = ds_list_find_value(vertex_xtex, real(data[1]) - 1);
					var ytex = ds_list_find_value(vertex_ytex, real(data[1]) - 1);
					var nx = ds_list_find_value(vertex_nx, real(data[2]) - 1);
					var ny = ds_list_find_value(vertex_ny, real(data[2]) - 1);
					var nz = ds_list_find_value(vertex_nz, real(data[2]) - 1);
				
					// If the material exists in the materials map(s), set the vertex's color and alpha
					// (and other attributes, if you want to use them) based on the material

					var color = c_white;
					var alpha = 1;
					if (ds_map_exists(mtl_color, active_mtl)){
						color = ds_map_find_value(mtl_color, active_mtl);
					}
					if (ds_map_exists(mtl_alpha, active_mtl)){
						alpha = ds_map_find_value(mtl_alpha, active_mtl);
					}
				
					// Optional: swap the y and z positions (useful if you used the default Blender export settings)
					var t = yy;
					yy = zz;
					zz = t;
				
					// Add the data to the vertex buffers
					vertex_position_3d(model, xx, yy, zz);
					vertex_normal(model, nx, ny, nz);
					vertex_texcoord(model, xtex, ytex);
					vertex_color(model, color, alpha);
				}
				break;
			case "usemtl":
				active_mtl = terms[1];
				break;
			default:
				// There are a few other things you can find in an obj file that I haven't covered here (but may in the future)
				break;
		}
	}

	// End the vertex buffer, destroy the lists, close the text file and return the vertex buffer

	vertex_end(model);

	ds_list_destroy(vertex_x);
	ds_list_destroy(vertex_y);
	ds_list_destroy(vertex_z);
	ds_list_destroy(vertex_nx);
	ds_list_destroy(vertex_ny);
	ds_list_destroy(vertex_nz);
	ds_list_destroy(vertex_xtex);
	ds_list_destroy(vertex_ytex);

	ds_map_destroy(mtl_alpha);
	ds_map_destroy(mtl_color);

	file_text_close(obj_file);
	file_text_close(mtl_file);
	
	//CONVERT MODEL
	var vertex_data = buffer_create_from_vertex_buffer(model, buffer_fixed, 1);
	var filenameconverted = string_replace_all(string(filename),".obj","");
	var modelfilename = (filenameconverted+".E3D");
	buffer_save(vertex_data, modelfilename);
	buffer_delete(vertex_data);
	show_debug_message("########################-MODEL CONVERTED-########################");

	return model;
}
	
function load_gmmod(filename, vertex_format){
	
	var model = vertex_create_buffer();
	vertex_begin(model, vertex_format);

	var file = file_text_open_read(filename);

	var version = file_text_read_real(file);

	if (version != 100){
		show_message("Wrong version of the model file!");
		vertex_delete_buffer(model);
		file_text_close(file);
		return -1;
	}

	var n = file_text_read_real(file);
	file_text_readln(file);

	var line = array_create(10, 0);

	for (var i = 0; i < n; i++){
		for (var j = 0; j < 11; j++){
			line[j] = file_text_read_real(file);
		}
		var type = line[0];
		switch (type){
			case 0:
				// ignore this (primitive start)
				break;
			case 1:
				// ignore this (primitive end)
				break;
			case 2:	// vertex position
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				vertex_add_point(model, xx, yy, zz, 0, 0, 0, 0, 0, c_white, 1);
				break;
			case 3:	// vertex position, color
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var color = line[4];
				var alpha = line[5];
				vertex_add_point(model, xx, yy, zz, 0, 0, 0, 0, 0, color, alpha);
				break;
			case 4:	// vertex position, texture
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var xtex = line[4];
				var ytex = line[5];
				vertex_add_point(model, xx, yy, zz, 0, 0, 0, xtex, ytex, c_white, 1);
				break;
			case 5:	// vertex position, texture, color
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var xtex = line[4];
				var ytex = line[5];
				var color = line[6];
				var alpha = line[7];
				vertex_add_point(model, xx, yy, zz, 0, 0, 0, xtex, ytex, color, alpha);
				break;
			case 6:	// vertex position, normal
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var nx = line[4];
				var ny = line[5];
				var nz = line[6];
				vertex_add_point(model, xx, yy, zz, nx, ny, nz, 0, 0, c_white, 1);
				break;
			case 7:	// vertex position, normal, color
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var nx = line[4];
				var ny = line[5];
				var nz = line[6];
				var color = line[7];
				var alpha = line[8];
				vertex_add_point(model, xx, yy, zz, nx, ny, nz, 0, 0, color, alpha);
				break;
			case 8:	// vertex position, normal, texture
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var nx = line[4];
				var ny = line[5];
				var nz = line[6];
				var xtex = line[7];
				var ytex = line[8];
				vertex_add_point(model, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
				break;
			case 9:	// vertex position, normal, texture, color
				var xx = line[1];
				var yy = line[2];
				var zz = line[3];
				var nx = line[4];
				var ny = line[5];
				var nz = line[6];
				var xtex = line[7];
				var ytex = line[8];
				var color = line[9];
				var alpha = line[10];
				vertex_add_point(model, xx, yy, zz, nx, ny, nz, xtex, ytex, color, alpha);
				break;
			case 10: // block
				break;
			case 11: // cylinder
				break;
			case 12: // cone
				break;
			case 13: // ellipsoid
				break;
			case 14: // wall
				break;
			case 15: // floor
				break;
		}
	}

	file_text_close(file);
	vertex_end(model);
	
	//CONVERT MODEL
	var vertex_data = buffer_create_from_vertex_buffer(model, buffer_fixed, 1);
	var filenameconverted = string_replace_all(string(filename),".gmmod","");
	var modelfilename = (filenameconverted+".E3D");
	buffer_save(vertex_data, modelfilename);
	buffer_delete(vertex_data);
	show_debug_message("########################-MODEL CONVERTED-########################");

	return model;
}