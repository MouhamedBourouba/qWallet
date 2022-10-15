import QtQuick
import QtQuick.Controls
import io.qt.mouhamed.backend 1.0
import "ui/pages"

Window {
    id: root
    width: 430
    height: 800
    visible: true
    title: qsTr("qWallet")

    // #E8EFFC
    Material.accent: "#102D4D"
    Material.primary: "#4072AF"
    Material.background: "#DAE2EF"
    Material.foreground: "#EEEEEE"

    Preferences {
        id: settings
    }

    Component.onCompleted: {
        console.log("username: " + settings.getValue("username"))
    }

    FontLoader {
        id: mFont
        source: "qrc:/assets/fonts/PastikaDemoMedium-gxlz6.ttf"
    }

    Loader {
        id: loader
        anchors.fill: parent
        source: settings.getValue("userId") === 0 ? Qt.resolvedUrl("ui/pages/Authentication.qml")
                                                   : Qt.resolvedUrl("ui/pages/Home.qml")
    }
}
