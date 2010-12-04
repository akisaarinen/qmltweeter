import Qt 4.7

XmlListModel {
    source: {
        if (phrase == "") { return "" }
        "http://search.twitter.com/search.rss?phrase=" + phrase
    }
    query: "/rss/channel/item"
    property bool ready: false
    property string phrase: ""

    XmlRole { name: "title"; query: "title/string()" }
    XmlRole { name: "pubDate"; query: "pubDate/string()" }
    XmlRole { name: "author"; query: "author/string()" }

    onStatusChanged: {
        ready = (status == XmlListModel.Ready)
        switch (status) {
        case XmlListModel.Ready:    console.log("[READY]   '" + source + "' | "  + count + " items")
        case XmlListModel.Error:    console.log("[ERROR]   '" + source + "' | Error: ''" + errorString() + "'")
        case XmlListModel.Loading:  console.log("[LOADING] '" + source + "'")
        }
    }
}

