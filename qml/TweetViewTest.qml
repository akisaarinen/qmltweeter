import Qt 4.7
import QmlUnitTest 0.1

QmlTestCase {
    id: test

    ListModel {
        id: testModel
        property bool ready: false

        ListElement {
            title: "First post"
            author: "@akisaarinen (Aki Saarinen)"
        }

        ListElement {
            title: "Second post"
            author: "@popstar (A Huge Pop Star)"
        }
    }

    TweetView {
        id: view
        model: testModel
    }

    function setup() {
    }

    function test_containsFirstPost() {
        view.currentIndex = 0
        equals(view.currentItem.children[0].text, "@akisaarinen (Aki Saarinen)")
    }

    function test_containsSecondPost() {
        view.currentIndex = 1
        equals(view.currentItem.children[0].text, "@popstar (A Huge Pop Star)")
    }


    // TODO: Disabled, visible-property doesn't seem to work in qmlunit tests,
    //       it's always kept false... :(
    /*
    function test_isHiddenWhenModelIsLoading() {
        testModel.ready = false
        equals(view.visible, false)
    }

    function test_isVisibleWhenModelIsReady() {
        testModel.ready = true
        equals(view.visible, true)
    }
    */
}
