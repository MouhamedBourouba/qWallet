import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root
    width: parent.width
    height: 70

    signal itemClicked()

    property alias title: title.text
    property alias subTitle: subTitle.text
    property alias imageSrc: image.source
    property alias transfermationAmount: transfermationAmount.text
    property alias imageSize: image.sourceSize
    property alias imageColor: image.color
    property alias backgroundColor: background.color

    Pane {
        id: row
        anchors.fill: parent
        background: Rectangle { id: background; color: Material.background; radius: 16 }
        MouseArea {
            anchors.fill: parent
            onPressed: { itemClicked() }
        }

        RowLayout {
            spacing: 16
            anchors.verticalCenter: parent.verticalCenter

            IconImage {
                id: image
                sourceSize: Qt.size(row.height -10, row.height -10)
                Layout.leftMargin: 6
            }

            Column {
                id: column 
                Label {
                    id: title
//                    text: "Bourouba, Mouhamed"
                    color: "Black"
                    font: mFont.font

                }
                Label {
                    id: subTitle
//                    text: "for the Bus"
                    color: Qt.darker("LightGray", 1.9)
                }
                Layout.alignment: Qt.AlignLeft
            }
        }


        Label {
            id: transfermationAmount
            color: text > 0 ? "Green" : "Red"
//            text: "+80.94"
            font {
                family: mFont.font
                pointSize: 15
            }
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                rightMargin: 16
            }
            verticalAlignment: Label.AlignVCenter
        }

    }

//    Rectangle {
//        width: parent.width
//        height: 1
//        color: "LightGray"
//        anchors.top: parent.bottom
//    }

}

