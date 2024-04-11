pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Templates as T

T.VerticalHeaderView {
    id: control

    // The contentWidth of TableView will be zero at start-up, until the delegate
    // items have been loaded. This means that even if the implicit width of
    // VerticalHeaderView should be the same as the content width in the end, we
    // need to ensure that it has at least a width of 1 at start-up, otherwise
    // TableView won't bother loading any delegates at all.
    implicitWidth: Math.max(1, contentWidth)
    implicitHeight: syncView ? syncView.height : 0

    delegate: Rectangle {
        id: delegate

        required property var model

        readonly property real cellPadding: 8

        implicitWidth: Math.max(control.width, text.implicitWidth + (cellPadding * 2))
        implicitHeight: text.implicitHeight + (cellPadding * 2)
        color: control.palette.button

        Label {
            id: text
            text: delegate.model[control.textRole]
            width: delegate.width
            height: delegate.height
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
