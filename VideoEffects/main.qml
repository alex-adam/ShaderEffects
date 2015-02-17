import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.0

ApplicationWindow {
    title: qsTr("Shader Test")
    width: 920
    height: 860
    visible: true
    color: "black"


    Item {
        width: 460
        height: 320
        Webcam {
            id: cam
        }
        ColorEffect {
            width: parent.width
            height: parent.height
            source: ShaderEffectSource { sourceItem: cam; hideSource: true }
            slidervalue: effectSlider.value
        }
    }

    Item {
        width: 460
        height: 320
        x: 460
        Webcam {
            id: cam2
        }
        WobbleEffect {
            width: parent.width
            height: parent.height
            source: ShaderEffectSource { sourceItem: cam2; hideSource: true }
            slidervalue: effectSlider.value
        }
    }

    Item {
        width: 920
        height: 540
        y: 290
        Webcam {
            id: cam3
        }
        GenieEffect {
            width: parent.width
            height: parent.height
            source: ShaderEffectSource { sourceItem: cam3; hideSource: true }
            slidervalue: effectSlider.value
        }
    }

    Text {
        x: 10; y:825
        color: "white"
    font.family: "Helvetica"
        text: "Move slider to change effects:"
    }

    //One Slider for all effects
    Slider {
        id: effectSlider
        value: 0.5
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        height: 20
    }



}





