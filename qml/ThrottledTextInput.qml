import Qt 4.7

FocusScope {
    id: root
    property string text
    property string throttledText: ""
    property int throttleInterval: 500

    Rectangle {
        anchors.fill: parent
        radius: 6
        smooth: true
        color: "#333"

        Rectangle {
            color: "white"
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#999" }
                GradientStop { position: 1.0; color: "#eee" }
            }
            radius: parent.radius
            anchors.centerIn: parent
            width: parent.width - 2
            height: parent.height - 2
            smooth: true

            TextInput {
                width: parent.width - 6
                anchors.centerIn: parent
                id: input
                font.pixelSize: 13
                color: "black"
                selectionColor: "green"
                text: root.text
                focus: true

                onTextChanged: {
                    throttleTimer.restart()
                }
            }
        }

        Timer {
            id: throttleTimer
            interval: root.throttleInterval
            repeat: false
            onTriggered: {
                root.throttledText = input.text
            }
        }
    }
}
