function Vector3(x, y, z) constructor {
    gml_pragma("forceinline");
	
	self.x = x;
    self.y = y;
    self.z = z;
    
    static Add = function(val) {
		gml_pragma("forceinline");
        return new Vector3(self.x + val.x, self.y + val.y, self.z + val.z);
    };
    
    static Sub = function(val) {
		gml_pragma("forceinline");
        return new Vector3(self.x - val.x, self.y - val.y, self.z - val.z);
    };
    
    static Mul = function(val) {
		gml_pragma("forceinline");
        if (is_numeric(val)) {
            return new Vector3(self.x * val, self.y * val, self.z * val);
        }
        return new Vector3(self.x * val.x, self.y * val.y, self.z * val.z);
    };
    
    static Div = function(val) {
		gml_pragma("forceinline");
        if (is_numeric(val)) {
            return new Vector3(self.x / val, self.y / val, self.z / val);
        }
        return new Vector3(self.x / val.x, self.y / val.y, self.z / val.z);
    };
    
    static Magnitude = function() {
		gml_pragma("forceinline");
        return point_distance_3d(0, 0, 0, self.x, self.y, self.z);
    };
    
    static DistanceTo = function(val) {
		gml_pragma("forceinline");
        return point_distance_3d(val.x, val.y, val.z, self.x, self.y, self.z);
    };
    
    static Dot = function(val) {
		gml_pragma("forceinline");
        return dot_product_3d(self.x, self.y, self.z, val.x, val.y, val.z);
    };
    
    static Cross = function(val) {
		gml_pragma("forceinline");
        return new Vector3(self.y * val.z - val.y * self.z, self.z * val.x - val.z * self.x, self.x * val.y - val.x * self.y);
    };
    
    static Equals = function(val) {
		gml_pragma("forceinline");
        return (self.x == val.x) && (self.y == val.y) && (self.z == val.z);
    };
    
    static Normalize = function() {
		gml_pragma("forceinline");
        var mag = self.Magnitude();
        return new Vector3(self.x / mag, self.y / mag, self.z / mag);
    };
    
    static Abs = function() {
		gml_pragma("forceinline");
        return new Vector3(abs(self.x), abs(self.y), abs(self.z));
    };
}