import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl

T.Button {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    bottomPadding: 4
    topPadding: 4
    rightPadding: 4
    leftPadding: 4

    icon.width: 17
    icon.height: 17
    icon.color: control.flat ? (control.down ? control.palette.highlight : control.palette.button)
                             : control.palette.buttonText

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: control.flat ? (control.down ? control.palette.highlight : control.palette.button)
                            : control.palette.buttonText
    }

    background: Rectangle {
        implicitHeight: 17
        implicitWidth: 10
        radius: 4

        visible: !control.flat
        color: !control.down ? control.palette.button : control.palette.highlight
    }
}
