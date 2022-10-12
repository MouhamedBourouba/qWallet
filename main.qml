import QtQuick
import QtQuick.Controls
import Qt.labs.settings
import "ui/pages"


ApplicationWindow {
    width: 430
    height: 800
    visible: true
    title: qsTr("qWallet")

    Material.accent: "#102D4D"
    Material.primary: "#4072AF"
    Material.background: "#DAE2EF"
    Material.foreground: "#EEEEEE"

    Settings {
        id: settings
        property string userId
    }

    FontLoader {
        id: mFont
        source: "qrc:/assets/fonts/PastikaDemoMedium-gxlz6.ttf"
    }

    Authentication {
        anchors.fill: parent
    }
}
