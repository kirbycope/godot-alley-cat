shader_type canvas_item;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    
    // Set the color to white, keeping the original alpha
    tex_color.rgb = vec3(1.0, 1.0, 1.0);
    
    COLOR = tex_color;
}
