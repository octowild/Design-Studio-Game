shader_type canvas_item;

uniform sampler2D noise_gradient;
uniform sampler2D color;

void fragment() {
	vec4 noisegrad = texture(noise_gradient,UV); 
	vec4 colorgrad = texture(color,UV);
	COLOR.rgb *= colorgrad.rgb;
	COLOR.a = (noisegrad.r+noisegrad.g+noisegrad.b)/3.0;
	// Place fragment code here.
}
