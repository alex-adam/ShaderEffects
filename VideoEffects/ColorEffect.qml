import QtQuick 2.0

ShaderEffect {
    id: cEffect

           property real slidervalue
           property variant source: cEffect.source
           property color tint: sliderToColor(slidervalue)
           fragmentShader: "
               uniform sampler2D source;
               uniform lowp vec4 tint;
               uniform lowp float qt_Opacity;
               varying highp vec2 qt_TexCoord0;
               void main() {
                   lowp vec4 c = texture2D(source, qt_TexCoord0);
                   lowp float lo = min(min(c.x, c.y), c.z);
                   lowp float hi = max(max(c.x, c.y), c.z);
                   gl_FragColor = qt_Opacity * vec4(mix(vec3(lo), vec3(hi), tint.xyz), c.w);
               }"


           function sliderToColor(x) {
               return Qt.rgba(saturate(Math.max(2 - 6 * x, 6 * x - 4 )),
                              saturate(Math.min(6 * x, 4 - 6* x)),
                              saturate(Math.min(6 * x - 2, 6 - 6 * x)))
        }

           function saturate(x) {
               return Math.min(Math.max(x, 0), 1)
           }

}
