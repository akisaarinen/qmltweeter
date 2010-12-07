import Qt 4.7

Rectangle {
    id: root

    MainView {
        id: mainView
        width: parent.width
        height: parent.height
        onLogoClicked: {
            root.state = "about"
        }
    }

    About {
        id: aboutView
        width: parent.width
        height: parent.height
        anchors.left: mainView.right
        onExit: {
            root.state = "search"
        }
    }

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
}
