import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T

T.ToolBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    background: Rectangle {
        implicitHeight: 49
        color: Qt.styleHints.colorScheme === Qt.Dark ? control.palette.light : control.palette.base
        Rectangle {
            height: 1
            width: parent.width
            y: control.position === T.TabBar.Footer ? 0 : parent.height - 1
            color: control.palette.mid
        }
    }
}
