precision highp float;

varying vec2 vCoord;
uniform sampler2D texture;
uniform vec2  mouse;

void main(void){
    vec2 position = vCoord;
    float distance = length(position - mouse);
    float textureX = ((position.x - mouse.x) / (1.0 + distance)) + mouse.x;
    float textureY = ((position.y - mouse.y) / (1.0 + distance)) + mouse.y;
    vec4 colorShadow = texture2D(texture, vec2(textureX, textureY));
    vec4 colorBase = texture2D(texture, vCoord);
    vec4 color = vec4(0, 0, 0, 0);
    if (0.0 < colorBase.a && (colorBase.r < 1.0 || colorBase.g < 1.0 || colorBase.b < 1.0)) {
        // Charactor Area
        color.r = colorBase.r + ((0.2 - distance) * 2.0);
        color.g = colorBase.g + ((0.2 - distance) * 2.0);
        color.b = colorBase.b + ((0.2 - distance) * 2.0);
        color.a = colorBase.a;
    } else if (0.0 < colorShadow.a && (colorShadow.r < 1.0 || colorShadow.g < 1.0 || colorShadow.b < 1.0)) {
        // Shadow Area
        color.r = colorShadow.r + 0.8 + (distance * 0.2);
        color.g = colorShadow.g + 0.8 + (distance * 0.2);
        color.b = colorShadow.b + 0.8 + (distance * 0.2);
        color.a = colorShadow.a;
    }
    gl_FragColor = color;
}