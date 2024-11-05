shader_type canvas_item;

uniform float scale = 1.0;
uniform vec4 mod_color: source_color;

uniform float flash: hint_range(0.0, 1.0) = 0.0;

uniform sampler2D screen_texture: hint_screen_texture;

void fragment() {
	//vec2 distortedUV = UV;
	//distortedUV.x += UV.y * 0.2;
	//vec4 pixelColor = texture(TEXTURE, distortedUV);

	vec4 pixelColor = texture(TEXTURE, UV);
	COLOR = mix(pixelColor, vec4(1), flash);
	COLOR.a = pixelColor.a;
	//float value = (pixelColor.r + pixelColor.g + pixelColor.b) / 3.0;
	////COLOR = vec4(value, value, value, pixelColor.a);
	//COLOR = pixelColor + mod_color;

}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
