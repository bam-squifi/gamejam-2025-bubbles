shader_type spatial;

uniform vec4 base_color = vec4(0.3,.5,.8,.1);
uniform float wobble_strength: hint_range(0.01, 0.05, 0.01) = 0.01;
uniform float wobble_speed: hint_range(1.0, 2.0, 0.2) = 2.0;
uniform float wobble_intensity: hint_range(1.0, 5.0, 0.25) = 4.0;
uniform vec2 uv_offset_speed = vec2(.1, .1);
uniform float distortion_amount: hint_range(0.0, 1.0, 0.1) = .01;

void vertex() {
	float wobble = sin(TIME * wobble_speed + VERTEX.y * wobble_intensity) * wobble_strength;
	VERTEX += NORMAL * wobble;
}

void fragment() {
	
	vec3 view_dir = normalize(VIEW);
	float angle = dot(NORMAL, view_dir);
	float iridescence = pow(abs(angle), 1.0);
	
	vec2 uv_distorted = UV + sin(TIME * uv_offset_speed + UV * 10.) * distortion_amount;
	vec3 rainbow = vec3(sin(uv_distorted.x * 5.0), sin(uv_distorted.y * 10.0), cos(uv_distorted.x * uv_distorted.y * 1.0));
	rainbow = mix(vec3(1.0), normalize(rainbow), iridescence);
	
	vec3 final_color = mix(base_color.rgb, rainbow, iridescence);
	
	ALBEDO = base_color.rgb;
	ALPHA = base_color.a;
	SPECULAR = 0.8;
	ROUGHNESS = .2;
	
}