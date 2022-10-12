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
        
        anchors {
            left: parent.left
            right: parent.right
            top: headerText.bottom
            topMargin: 16
            rightMargin: 16
            leftMargin: 16
        }
    }
}

