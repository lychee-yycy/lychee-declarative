import QtQuick
import QtQuick.Templates as T

T.Frame {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    padding: 16
    leftPadding: 20
    rightPadding: 20
    spacing: 10

    background: Rectangle {
        radius: 9
        color: Qt.styleHints.colorScheme === Qt.Dark ? control.palette.light : control.palette.base
    }
}
