import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.MenuBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    delegate: MenuBarItem { }

    contentItem: Row {
        spacing: control.spacing
        Repeater {
            model: control.contentModel
        }
    }

    background: Rectangle {
        opacity: 0.98
        color: Qt.styleHints.colorScheme === Qt.Dark ? control.palette.light : control.palette.base
        Rectangle {
            height: 1
            width: parent.width
            color: control.palette.mid
            y: control.position === T.TabBar.Footer ? 0 : parent.height - 1
        }
    }
}
