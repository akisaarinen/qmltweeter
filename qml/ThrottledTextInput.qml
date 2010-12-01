import Qt 4.7

TextInput {
    id: input
    font.pointSize: 14
    color: "white"
    property string throttledText: ""
    property int throttleInterval: 500

    onTextChanged: {
        throttleTimer.restart()
    }

    Timer {
        id: throttleTimer
        interval: input.throttleInterval
        repeat: false
        onTriggered: {
            input.throttledText = input.text
        }
    }
}

