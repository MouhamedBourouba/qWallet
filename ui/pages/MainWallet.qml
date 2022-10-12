import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Page {
    objectName: "Main Wallet"

    Pane {
        id: balanceDiv
        
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            topMargin: 8
        }
        
        Column {
            anchors.fill: parent
            Label {
                id: balance
                text: "$250.54"
                color: "Black"
                font {
                    family: mFont.font
                    pointSize: 40
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                id: cashBalanceText
                text: "Cash Balance"
                color: "Gray"
                font {
                    family: mFont.font
                    pointSize: 10
                }
                anchors {
                    left: balance.left
                    right: balance.right
                }
                horizontalAlignment: Label.AlignHCenter
            }
        }
    }
  
    Label {
        id: recordHistoryText
        text: "Record History :"
        color: "Black"
        height: 50
        leftPadding: 16
        verticalAlignment: Label.AlignVCenter

        font {
            family: mFont.font
        }

        background: Rectangle {
            color: Material.background
            border {
                color: "LightGray"    
            }
        }
        
        anchors {
            top: balanceDiv.bottom
            left: parent.left
            right: parent.right
        }
    }
    
    
    ListView {
        id: recordsListView
        model: fakeData
        boundsBehavior: ListView.StopAtBounds
        boundsMovement: ListView.StopAtBounds
        
        spacing: 6
        anchors {
            left: parent.left
            right: parent.right
            top: recordHistoryText.bottom
            bottom: parent.bottom
            topMargin: 6
        }
        delegate: ListItem {
            title: username
            subTitle: why
            imageSrc: image
            transfermationAmount: amount
        }
        z: -1
    }
    
    ListModel {
        id: fakeData
        
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-64.64"
            date: "2022/6/9"
            why: "for the resterant"
        }
        ListElement {
            username: "Bourouba, Smain"
            image: "qrc:/assets/images/logo.svg"
            amount: "-51.51"
            date: "2022/6/9"
            why: "for the bus"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+160.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-12.10"
            date: "2022/6/9"
            why: "for the resterant"
        }
        ListElement {
            username: "Bourouba, Smain"
            image: "qrc:/assets/images/logo.svg"
            amount: "-51.51"
            date: "2022/6/9"
            why: "for the bus"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+64.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+160.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-12.10"
            date: "2022/6/9"
            why: "for the resterant"
        }
        
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-12.10"
            date: "2022/6/9"
            why: "for the resterant"
        }
        ListElement {
            username: "Bourouba, Smain"
            image: "qrc:/assets/images/logo.svg"
            amount: "-51.51"
            date: "2022/6/9"
            why: "for the bus"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+64.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+160.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-12.10"
            date: "2022/6/9"
            why: "for the resterant"
        }
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-12.10"
            date: "2022/6/9"
            why: "for the resterant"
        }
        ListElement {
            username: "Bourouba, Smain"
            image: "qrc:/assets/images/logo.svg"
            amount: "-51.51"
            date: "2022/6/9"
            why: "for the bus"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+64.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Brarma, Ibrahim"
            image: "qrc:/assets/images/logo.svg"
            amount: "+160.64"
            date: "2022/6/9"
            why: "Pc reparation costs"
        }
        ListElement {
            username: "Bourouba, Mouhamed"
            image: "qrc:/assets/images/logo.svg"
            amount: "-12.10"
            date: "2022/6/9"
            why: "for the resterant"
        }
    }
}

