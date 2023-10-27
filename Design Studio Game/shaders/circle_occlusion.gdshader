shader_type canvas_item;

uniform sampler2D noise;
//uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap; 
uniform sampler2D Texture;
uniform sampler2D alpha;
uniform float tinting : hint_range(0.0, 100, 0.1);
uniform float circlesize : hint_range(0.0, 3.0, 0.1);

void fragment() {
	vec4 noise_col =texture(noise, UV);
	vec4 gradient1 = texture(Texture,UV);
	vec4 alphamap = texture(alpha,UV*circlesize-vec2(0.25,0.25));
//	vec4 newnoise = mix(flatwhite, noise_col,0.7);
//	vec4 screencolor= texture(SCREEN_TEXTURE, SCREEN_UV);
	vec4 finalcolor = mix(noise_col, gradient1,0.5);
	COLOR.rgb *= finalcolor.rgb/vec3(2,2,2);
	COLOR.a -= alphamap.a/ 1.1;
//	COLOR.rgba += (noise_col.rgba/ vec4(10,10,10,1000000) + gradient1.rgba/ vec4(2,2,2 ,tinting));
	// Place fragment code here.
}

