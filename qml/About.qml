import Qt 4.7
import Qt.labs.particles 1.0

Rectangle {

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
