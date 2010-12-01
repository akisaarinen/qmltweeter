import Qt 4.7
import Qt.labs.particles 1.0

Rectangle {
    id: root
    width: 600
    height: 300

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
            id: backgroundAnimation
            anchors.fill: parent
            color: "red"
            opacity: 0.15


            SequentialAnimation on color {
                ColorAnimation {
                    from: "red"
                    to: "blue"
                    duration: 10000
                }

                ColorAnimation {
                    from: "blue"
                    to: "yellow"
                    duration: 10000
                }

                ColorAnimation {
                    from: "yellow"
                    to: "red"
                    duration: 10000
                }

                loops: Animation.Infinite
            }
        }

        Particles {
            anchors.fill: parent
            source: "/img/twitter_logo.png"
            lifeSpan: 5000
            count: 40
            emissionRate: 10
            angle:270
            opacity: 0.2
            angleDeviation: 36
            velocity: 20
            velocityDeviation: 10
            ParticleMotionWander {
                xvariance: 20
                pace: 30
            }
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
                anchors.right: parent.right
                anchors.left: logo.right
                anchors.leftMargin: 10
                anchors.margins: 2
                width: parent.width - logo.width
                height: parent.height - 6
                text: searchTerm
                focus: true

                onThrottledTextChanged: {
                    console.log("Throttled text changed to " + throttledText)
                    settings.setSearchTerm(throttledText)
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
