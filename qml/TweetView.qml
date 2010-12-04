import Qt 4.7

ListView {
    id: tweetView
    visible: model.ready

    delegate: Column {
        spacing: 2
        width: parent.width

        Text {
            id: authorText
            text: author
            font.pointSize: 13
            color: "black"
            wrapMode: Text.WordWrap
            width: parent.width
        }

        Text {
            id: titleText
            text: title
            font.pointSize: 10
            color: "black"
            wrapMode: Text.WordWrap
            width: parent.width
        }

        Item {
            width: parent.width
            height: 5
        }

        Rectangle {
            width: parent.width
            height: 1
            color: "gray"
        }

        Item {
            width: parent.width
            height: 5
        }
    }
}
