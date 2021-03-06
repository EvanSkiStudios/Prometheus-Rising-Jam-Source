function NewColAABBFromMinMax(point_min, point_max) {
	gml_pragma("forceinline");
	
    var center_position = point_min.Add(point_max).Div(2);
    var half_size = point_max.Sub(point_min).Div(2).Abs();
    return new ColAABB(center_position, half_size);
}

function NewColRayFromPoints(start, finish) {
	gml_pragma("forceinline");
	
    var dir = finish.Sub(start).Normalize();
    return new ColRay(start, dir);
}