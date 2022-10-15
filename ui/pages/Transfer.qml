import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {
    objectName: "Transfer"

    Label {
        id: headerText
        text: "Transfer Options"
        color: "Black"
        font {
            family: mFont.font
            pointSize: 18
        }
        //        background: Rectangle { }
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            topMargin: 16
        }
        horizontalAlignment: Label.AlignHCenter

        Rectangle {
            height: 1
            color: "LightGray"
            anchors {
                left: parent.left
                right: parent.right
                top: parent.bottom
                topMargin: 1
            }
        }
    }

    Column {
        id: optionsColumn
        spacing: 16
        //        color: "Red"
        ListItem {
            title: "Send With ID"
            imageSrc: "qrc:/assets/images/fingerprint.svg"
            imageSize: Qt.size(40, 40)
            imageColor: Material.accent
            backgroundColor: "#E8EFFC"
        }
        ListItem {
            title: "Send With QrCode"
            imageSrc: "qrc:/assets/images/qr-code.svg"
            imageSize: Qt.size(40, 40)
            imageColor: Material.accent
            backgroundColor: "#E8EFFC"
        }
        ListItem {
            title: "Make Request"
            imageSrc: "qrc:/assets/images/request.svg"
            imageSize: Qt.size(40, 40)
            imageColor: Material.accent
            backgroundColor: "#E8EFFC"
        }

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            top: headerText.bottom
            topMargin: 16
            rightMargin: 16
            leftMargin: 16
        }
    }
}
