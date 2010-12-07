import Qt 4.7

Rectangle {
    id: root

    function settingsSaved(filename) {
        console.log("Settings saved to " + filename)
    }

    states: [
        State {
            name: "search"
        },
        State {
            name: "about"
            PropertyChanges {
                target: mainView
                x: -mainView.width
            }
        }
    ]

    transitions: Transition {
        from: "*"
        to: "*"
        NumberAnimation {
            properties: "x";
            easing.type: Easing.InOutQuad
            duration: 300
        }
    }

    About {
        id: aboutView
        width: parent.width
        height: parent.height
        anchors.left: mainView.right
        z: 100
        onExit: {
            root.state = "search"
        }
    }

    MainView {
        id: mainView
        width: parent.width
        height: parent.height
    }

    Gradient {
        id: grayGradient
        GradientStop { position: 0.0; color: "#888" }
        GradientStop { position: 1.0; color: "#666" }
    }
}
