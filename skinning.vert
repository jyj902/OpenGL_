#version 330 core
// TODO: complete the loop for TP7 exercise 1

// ---- camera geometry
uniform mat4 projection, view;

// ---- skinning globals and attributes
const int MAX_VERTEX_BONES=4, MAX_BONES=128;
uniform mat4 bone_matrix[MAX_BONES];

// ---- vertex attributes
layout(location = 0) in vec3 position;
layout(location = 1) in vec3 color;
layout(location = 2) in vec4 bone_ids;
layout(location = 3) in vec4 bone_weights;

// ----- interpolated attribute variables to be passed to fragment shader
out vec3 fragment_color;

void main() {

    // ------ creation of the skinning deformation matrix
    mat4 skin_matrix = mat4(1.);  // TODO complete shader here for exercise 1!

    // ------ compute world and normalized eye coordinates of our vertex
    vec4 w_position4 = skin_matrix * vec4(position, 1.0);
    gl_Position = projection * view * w_position4;

    fragment_color = color;
}
