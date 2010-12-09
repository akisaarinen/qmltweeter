import Qt 4.7
import Qt.labs.particles 1.0

Rectangle {
    signal exit

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
        source: "data:image/jpg;base64,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"
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
            exit()
        }
    }
}
