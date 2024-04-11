import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl
import QtQuick.Controls.Lychee.impl

T.ToolTip {
    id: control

    x: parent ? (parent.width - implicitWidth) / 2 : 0 - (background ? background.leftInset : 0)
    y: -implicitHeight - (background ? background.topInset : 0)

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding)

    topMargin: background ? background.topInset : 0
    leftMargin: background ? background.leftInset : 0
    rightMargin: background ? background.rightInset : 0
    bottomMargin: background ? background.bottomInset : 0

    topPadding: background ? background.topPadding : 0
    leftPadding: background ? background.leftPadding : 0
    rightPadding: background ? background.rightPadding : 0
    bottomPadding: background ? background.bottomPadding : 0

    topInset: background ? -background.topInset || 0 : 0
    leftInset: background ? -background.leftInset || 0 : 0
    rightInset: background ? -background.rightInset || 0 : 0
    bottomInset: background ? -background.bottomInset || 0 : 0

    closePolicy: T.Popup.CloseOnEscape | T.Popup.CloseOnPressOutsideParent | T.Popup.CloseOnReleaseOutsideParent

    contentItem: Text {
        text: control.text
        wrapMode: Text.Wrap
        font: control.font
        color: control.palette.toolTipText
    }

    background: NinePatchImage {
        source: Lychee.url + "tooltip-background"
        NinePatchImageSelector on source {
            states: [
                {"light": Qt.styleHints.colorScheme === Qt.Light},
                {"dark": Qt.styleHints.colorScheme === Qt.Dark}
            ]
        }
    }
}
