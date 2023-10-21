shader_type canvas_item;
uniform float _pixelfactor:hint_range(2,512,4)=256;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
void fragment() {
	vec2 _uv=(floor(UV * _pixelfactor)+0.5) / _pixelfactor;
	COLOR =textureLod(screen_texture,_uv,0.0);
}
