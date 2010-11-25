import Qt 4.7

TextInput {
    font.pointSize: 14
    color: "white"
    property string throttledText: ""
    property int throttleInterval: 500

    onTextChanged: {
        throttleTimer.restart()
    }

    Timer {
        id: throttleTimer
        interval: parent.throttleInterval
        repeat: false
        onTriggered: {
            parent.throttledText = parent.text
        }
    }
}

