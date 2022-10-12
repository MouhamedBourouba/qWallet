import QtQuick
import QtQuick.Controls

IconImage {
    id: root
    state: "invisibel"
    color: "Black"

    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.state === "visibel" ? root.state = "invisibel" : root.state = "visibel"
        }
    }

    states: [
        State {
            name: "visibel"

            PropertyChanges {
                target: root
                source: "qrc:/assets/images/visible.svg"
            }
        },
        State {
            name: "invisibel"
            PropertyChanges {
                target: root
                source: "qrc:/assets/images/invisible.svg"
            }
        }

    ]
}
