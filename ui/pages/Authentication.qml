import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import io.qt.mouhamed.backend 1.0
import "../components/"

Page {

    property bool loginOrRegester: true

    Dialog {
        id: loadingDialog
        width: parent.width / 3
        height: width
        parent: Overlay.overlay
        modal: true
        anchors.centerIn: parent
        closePolicy: Dialog.NoAutoClose
//        anchors.centerIn: parent
        enter: Transition {
               NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 }
        }
        contentItem:  Pane {
            anchors.fill: parent
            Column {
                anchors.centerIn: parent
                spacing: 6
                BusyIndicator {
                    id: busyIndicator
                }
                Text {
                    text: loginOrRegester ? "Login in ..." : "Creating Account"
                    font {
                        family: mFont.font
                        pointSize: 12
                    }
                }
            }
        }
    }

    function checkEmail(email) {
        const regexExp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/gi;
        return regexExp.test(email.toLowerCase())
    }

    ToolTip {
        id: errorToast
        y: (parent.height) - 50
        //        anchors.bottom: parent.bottom
        background: Rectangle { color: Qt.darker("Red", 1.7); radius: 6 }
    }

    AuthenticationRepository {
        id: authenticationBackend

        onError: function(errorMessage) {
            loadingDialog.close()
            console.log(errorMessage)
            errorToast.text = errorMessage
            errorToast.visible = true
            errorToast.timeout = 1500
        }
        onAuthCompletedSuccessfully: {
            loadingDialog.close()
            loader.source = "ui/pages/Home.qml"
        }
    }

    ColumnLayout {
        id: column
        anchors.fill: parent; anchors.leftMargin: 30; anchors.rightMargin: 30; anchors.bottomMargin: Screen.height / 15


        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: Material.background
            Item {
                width: parent.width
                anchors.centerIn: parent
                IconImage {
                    anchors.centerIn: parent
                    id: logo
                    anchors.left: parent.left; anchors.right: parent.right
                    horizontalAlignment: IconImage.AlignHCenter
                    source: Qt.resolvedUrl("qrc:/assets/images/logo.svg")
                    sourceSize: Qt.size(Math.min(parent.width / 2, 300), Math.min(parent.width / 2, 300))
                }
                Label {
                    text: "QWallet"
                    font.family: mFont.font
                    font.pointSize: logo.width /8
                    color: Qt.darker(Material.accent, 1.5)
                    anchors.left: parent.left; anchors.right: parent.right; anchors.top: logo.bottom; anchors.topMargin: 16
                    horizontalAlignment: Label.AlignHCenter
                }
            }

        }

        TextField {
            id: userName
            Layout.fillWidth: true
            placeholderText: "User name"
            visible: !loginOrRegester
            Material.foreground: "Black"
        }
        TextField {
            id: userIdentifire
            Layout.fillWidth: true
            placeholderText: loginOrRegester ? "Email / UserName" : "Email"
            Material.foreground: "Black"
        }
        TextField {
            id: userPassword
            Layout.fillWidth: true
            placeholderText: "Password"
            echoMode: TextField.Password
            Material.foreground: "Black"

            Visibility {
                sourceSize: Qt.size(parent.height / 1.7, parent.height / 1.7)
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }
                onStateChanged: {
                    if (state === "visibel") {
                        userPassword.echoMode = TextField.Normal
                    }
                    else {
                        userPassword.echoMode = TextField.echoMode = TextField.Password
                    }
                }
            }

        }
        RoundButton {
            enabled: {
                var canLogin = userIdentifire.text !== "" && userPassword.text !== ""
                var canRegester = canLogin && userName.text !== ""
                loginOrRegester ? canLogin : canRegester
            }

            highlighted: enabled
            text: loginOrRegester ? "Login" : "Regester"
            font.family: mFont.font
            Layout.fillWidth: true
            Layout.topMargin: 6
            onClicked: {
                loadingDialog.open()

                // screen is on register mode
                if(!loginOrRegester) {
                    authenticationBackend.createAccount(userIdentifire.text, userName.text, userPassword.text)
                }

                else {
                    authenticationBackend.login(checkEmail(userIdentifire.text) ? "" : userIdentifire.text,
                                                checkEmail(userIdentifire.text) ? userIdentifire.text : "",
                                                userPassword.text)
                }
            }
        }
        Flow {
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 6
            Text {
                text: qsTr(loginOrRegester ? "New here? , " : "Already have Account? , ")
                font.family: mFont.font
                font.pointSize: 11
            }
            Text {
                text: qsTr(loginOrRegester ? "Create Account now!" : "Login Here!")
                color: Material.accent
                font.family: mFont.font
                font.pointSize: 11
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        loginOrRegester = !loginOrRegester
                    }
                }
            }
        }
    }
}


