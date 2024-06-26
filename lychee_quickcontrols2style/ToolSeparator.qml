import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.ToolSeparator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    horizontalPadding: vertical ? 13 : 7
    verticalPadding: vertical ? 7 : 13

    contentItem: Rectangle {
        implicitHeight: control.vertical ? 23 : 1
        implicitWidth: control.vertical ? 1 : 23
        color: control.palette.mid
    }
}
