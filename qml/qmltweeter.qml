import Qt 4.7

Rectangle {
    id: root

    function settingsSaved(filename) {
        console.log("Settings saved to " + filename)
    }

    states: [
        State {
            name: "search"
            PropertyChanges {
                target: aboutView
                opacity: 0.0
            }
        },
        State {
            name: "about"
            PropertyChanges {
                target: aboutView
                opacity: 1.0
            }
            PropertyChanges {
                target: backgroundAnimation
                state: "b"
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "opacity";
            easing.type: Easing.InOutQuad
            duration: 300
        }
    }

    About {
        id: aboutView
        anchors.fill: parent
        opacity: 0.0
        z: 100
    }


    Rectangle {
        id: mainView
        anchors.fill: parent

        Rectangle {
            id: topBar
            width: parent.width
            height: logo.height + 10
            z: 10

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#000" }
                GradientStop { position: 0.3; color: "#333" }
                GradientStop { position: 1.0; color: "#888" }
            }

            Image {
                id: logo
                source: "/img/twitter_logo.png"

                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 12
                anchors.left: parent.left

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        root.state = "about"
                    }
                }
            }

            ThrottledTextInput {
                id: searchInput

                anchors.verticalCenter: parent.verticalCenter

                anchors.left: logo.right
                anchors.leftMargin: 10
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.margins: 2

                height: parent.height - 6
                text: searchTerm
                focus: true

                onThrottledTextChanged: {
                    console.log("Throttled text changed to " + throttledText)
                    settings.setSearchTerm(throttledText)
                    settings.save()
                }
            }
        }

        Rectangle {
            id: topGradient
            width: parent.width
            y: topBar.height
            height: 10
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#444" }
                GradientStop { position: 0.2; color: "#ccc" }
                GradientStop { position: 0.5; color: "#eee" }
                GradientStop { position: 1.0; color: "#fff" }
            }
        }

        Rectangle {
            id: bottomGradient
            width: parent.width
            anchors.bottom: parent.bottom
            height: 20
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#fff" }
                GradientStop { position: 0.6; color: "#eee" }
                GradientStop { position: 1.0; color: "#ccc" }
            }
        }

        Rectangle {
            id: content
            x: 0
            width: parent.width
            anchors.top: topGradient.bottom
            anchors.bottom: bottomGradient.top

            TweetView {
                id: tweetView
                model: searchModel
                anchors.fill: parent
                onVisibleChanged: {
                    searchInput.focus = true
                }
            }
        }

        SearchModel {
            id: searchModel
            phrase: searchInput.throttledText
        }
    }

    Gradient {
        id: grayGradient
        GradientStop { position: 0.0; color: "#888" }
        GradientStop { position: 1.0; color: "#666" }
    }
}
