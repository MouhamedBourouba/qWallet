import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {
    header: RowLayout {
        height: 60

        Rectangle {
            anchors.fill: parent
            color: Material.primary
        }

        Label {
            text: mStackView.currentItem.objectName
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
    
    StackView {
        anchors.fill: parent
        id: mStackView
        initialItem: Transfer {}
        Component.onCompleted: {
            console.log(mStackView.currentItem)
        }
    }
   

    footer: ToolBar {

        height: 60
        RowLayout {
            anchors.fill: parent

            BottomNavigationBarButton {
                id: homePageButton
                selected: mStackView.currentItem.objectName === "Main Wallet"
                icon.source: Qt.resolvedUrl("qrc:/assets/images/wallet.svg")
                onClicked: {
                    if(mStackView.currentItem.objectName !== "Main Wallet") {
                        mStackView.push(Qt.resolvedUrl("MainWallet.qml"))
                    }
                }
                Layout.fillWidth: true
            }
            BottomNavigationBarButton {
                selected: mStackView.currentItem.objectName === "Transfer"
                icon.source: Qt.resolvedUrl("qrc:/assets/images/transfer.svg")
                Layout.fillWidth: true
                onClicked: {
                    if(mStackView.currentItem.objectName !== "Transfer") {
                        mStackView.push(Qt.resolvedUrl("Transfer.qml"))
                    }
                }
            }
            BottomNavigationBarButton {
                selected: mStackView.currentItem.objectName === "Settings"
                Layout.fillWidth: true
                icon.source: Qt.resolvedUrl("qrc:/assets/images/settings.svg")
                onClicked: {
                    if(mStackView.currentItem.objectName !== "Settings") {
                        mStackView.push(Qt.resolvedUrl("Settings.qml"))
                    }
                }
            }
        }
    }

}
