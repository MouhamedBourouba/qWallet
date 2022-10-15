import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {

    property int currentItem : 1

    header: Rectangle {
        width: parent.width
        height: 60
        color: Material.primary
        RowLayout {
            anchors.fill: parent
            Label {
                text: currentItem === 1 ? "Main Wallet" : currentItem === 2 ? "Transfer" : "Settings"
                color: Material.foreground
                Layout.leftMargin: 12
                font.weight: 600
                font {
                    family: mFont.font
                    pointSize: 15
                    bold: true
                }
            }

            ToolButton {
                id: qrCodeButton
                icon.source: "qrc:/assets/images/qr-code.svg"
                icon.color: "White"
                visible: homePageButton.selected
                Layout.alignment: Qt.AlignRight
            }
        }
    }

    StackLayout {
        id: mStackView
        anchors.fill: parent
        currentIndex: currentItem - 1

        onCurrentIndexChanged: {
            animate.start()
        }



//        OpacityAnimator {
//            id: animate
//            easing: Easing.OutCubic
//            target: mStackView
//            from: 0.3
//            to: 1
//            duration: 500
//        }
        NumberAnimation {
            id: animate
            target: mStackView
            property: "opacity"
            from: 0.2
            to: 1
            easing.type: Easing.OutCubic
        }

        Transfer {}
        MainWallet {}
        Settings {}
    }

    footer: ToolBar {

        height: 60
        RowLayout {
            anchors.fill: parent

            BottomNavigationBarButton {
                id: homePageButton
                selected: currentItem === 1
                icon.source: Qt.resolvedUrl("qrc:/assets/images/wallet.svg")
                onClicked: {
                    currentItem = 1
                }
                Layout.fillWidth: true
            }
            BottomNavigationBarButton {
                selected:currentItem === 2
                icon.source: Qt.resolvedUrl("qrc:/assets/images/transfer.svg")
                Layout.fillWidth: true
                onClicked: {
                    currentItem = 2
                }
            }
            BottomNavigationBarButton {
                selected: currentItem === 3
                Layout.fillWidth: true
                icon.source: Qt.resolvedUrl("qrc:/assets/images/settings.svg")
                onClicked: {
                    currentItem = 3
                }
            }
        }
    }
}
