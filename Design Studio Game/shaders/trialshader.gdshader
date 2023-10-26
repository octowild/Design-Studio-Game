shader_type canvas_item;

uniform sampler2D noise;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap; 
uniform sampler2D Texture;

void fragment() {
	vec4 noise_col =texture(noise, UV);
	vec4 flatwhite = texture(Texture,UV);
	vec4 newnoise = mix(flatwhite, noise_col,0.7);
	vec4 screencolor= texture(SCREEN_TEXTURE, SCREEN_UV);
	COLOR.rgba += noise_col.rgba/ vec4(10,10,10,1000000);
	// Place fragment code here.
}
