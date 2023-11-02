shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform sampler2D gradient;
uniform float opacity : hint_range(0.0, 1, 0.01) = 1;

void fragment() {
	vec4 screen = texture(SCREEN_TEXTURE,SCREEN_UV);
	vec4 colorgrad = texture(gradient,UV);
	COLOR.rgb= screen.rgb* colorgrad.rgb;
	COLOR.a = opacity;
	// Place fragment code here.
}
