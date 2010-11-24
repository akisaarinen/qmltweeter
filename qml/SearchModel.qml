import Qt 4.7

 XmlListModel {
     source: "http://search.twitter.com/search.rss?phrase=" + phrase
     query: "/rss/channel/item"
     property string phrase: ""

     XmlRole { name: "title"; query: "title/string()" }
     XmlRole { name: "pubDate"; query: "pubDate/string()" }
     XmlRole { name: "author"; query: "author/string()" }
 }

