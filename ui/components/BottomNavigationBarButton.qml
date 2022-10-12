import QtQuick
import QtQuick.Controls

ToolButton {
    id: root

    property bool selected: false
    property string selectedColor
    property string nonSelectedColor
    property string title

    icon.height: 25
    icon.width: 25
    icon.color: selected ? "#EEEEEE":  Material.accent
}




