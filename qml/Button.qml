import Qt 4.7

Rectangle {
    signal clicked;
    property string text;
    property color textColor;

    Text {
        text: parent.text
        anchors.centerIn: parent
        color: parent.textColor
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.clicked()
        }
    }
}
