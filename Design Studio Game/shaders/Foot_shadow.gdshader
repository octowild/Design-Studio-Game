shader_type canvas_item;

uniform float transparency : hint_range(0.0, 1, 0.01);
uniform sampler2D colors;

void fragment(){
	vec4 colorgrad = texture(colors, UV);
	COLOR.rgb += colorgrad.rgb;
	COLOR.a -= transparency;
}
