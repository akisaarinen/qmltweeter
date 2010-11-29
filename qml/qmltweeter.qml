import Qt 4.7

Rectangle {
    id: root
    width: 600
    height: 300

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
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "opacity";
            easing.type: Easing.InOutQuad
            duration: 300
        }
    }

    Rectangle {
        id: aboutView
        anchors.fill: parent
        opacity: 0.0
        z: 100

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#888" }
            GradientStop { position: 0.3; color: "#666" }
            GradientStop { position: 1.0; color: "#555" }
        }

        Rectangle {
            width: 300
            height: 60
            color: "#888"
            radius: 10
            anchors.centerIn: parent

            border.color: "#444"
            border.width: 3

            Image {
                id: aboutLogo
                source: "/img/twitter_logo.png"
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -12
                y: 0
            }

            Text {
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 10
                y: aboutLogo.height
                font.pointSize: 18
                color: "white"
                text: "QmlTweeter"
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                root.state = "search"
            }
        }
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
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.state = "about"
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
            anchors.bottom: searchBar.top
            height: 20
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#fff" }
                GradientStop { position: 0.6; color: "#eee" }
                GradientStop { position: 1.0; color: "#ccc" }
            }
        }

        Rectangle {
            id: searchBar
            width: parent.width
            height: 30
            color: "black"
            anchors.bottom: parent.bottom

            ThrottledTextInput {
                id: searchInput
                anchors.centerIn: parent
                width: parent.width
                text: "meegoconf"
                focus: true
            }
        }

        Rectangle {
            id: content
            x: 0
            width: parent.width
            anchors.top: topGradient.bottom
            anchors.bottom: bottomGradient.top

            Image {
                id: loading
                source: "/img/ajax-loader.gif"
                anchors.centerIn: parent
                visible: !tweetView.visible
                NumberAnimation on rotation {
                    from: 0
                    to: 360
                    running: loading.visible == true
                    loops: Animation.Infinite
                    duration: 1500
                }
            }

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
}
