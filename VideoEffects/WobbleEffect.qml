import QtQuick 2.0

ShaderEffect {
id: wEffect
    property real slidervalue
    property variant source: wEffect.source
    property real amplitude: 0.04 * slidervalue
    property real frequency: 20
    property real time: 0
NumberAnimation on time { loops: Animation.Infinite; from: 0; to: Math.PI * 2; duration: 600 }
//! [fragment]
fragmentShader:
    "uniform lowp float qt_Opacity;" +
    "uniform highp float amplitude;" +
    "uniform highp float frequency;" +
    "uniform highp float time;" +
    "uniform sampler2D source;" +
    "varying highp vec2 qt_TexCoord0;" +
    "void main() {" +
    "    highp vec2 p = sin(time + frequency * qt_TexCoord0);" +
    "    gl_FragColor = texture2D(source, qt_TexCoord0 + amplitude * vec2(p.y, -p.x)) * qt_Opacity;" +
    "}"
//! [fragment]

}

