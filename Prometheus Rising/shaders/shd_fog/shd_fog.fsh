varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec3 v_worldPosition;

uniform vec4 fogColor;
uniform float fogStart;
uniform float fogEnd;

void main()
{
	vec4 starting_color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec3 fogOrigin = vec3(0.0, 0.0, 0.0);
	float dist = length(v_worldPosition - fogOrigin);
	
	float fraction = clamp( (dist- fogStart) / (fogEnd - fogStart), 0.0, 1.0 );
	//float fraction = clamp(fogStart / max(dist, 0.01), 0.0, 1.0);
	
	vec4 newfogcolor = fogColor / 255.;
	
	vec4 final_color = mix(starting_color, newfogcolor, fraction);
	
    gl_FragColor = final_color;
}
