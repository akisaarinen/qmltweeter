import Qt 4.7

XmlListModel {
    source: "http://search.twitter.com/search.rss?phrase=" + phrase
    query: "/rss/channel/item"
    property string phrase: ""

    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "pubDate"; query: "pubDate/string()" }
    XmlRole { name: "author"; query: "author/string()" }

    onStatusChanged: {
        console.log("Status change for: " + source + " => " + status)
        switch (status) {
        case XmlListModel.Ready: console.log("Done")
        case XmlListModel.Error: console.log("Error: " + errorString())
        case XmlListModel.Loading: console.log("Loading")
        }
    }
}

