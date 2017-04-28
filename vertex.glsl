attribute vec3 vertex;
attribute vec2 coord;
uniform mat4 transform;
varying vec2 vCoord;

void main(void){
    gl_Position = vec4(vertex, 1.0);
    vCoord = coord;
}