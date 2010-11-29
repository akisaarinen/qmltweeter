
import Qt 4.7
import QmlUnitTest 0.1


QmlTestCase {
    id: test

    SearchModel {
        id: searchModel
    }

    function asyncTest_fetchDataWithNormalKeyword() {
        expect(3)
        searchModel.phrase = "meegoconf"
        connect(searchModel.readyChanged, function() {
            equals(searchModel.count, 15, "Model contains data")
            equals(searchModel.phrase, "meegoconf")
            ok(searchModel.get(0).title.indexOf(searchModel.phrase) > -1, "Item contains search string")
            test.start()
        })
        test.stop()
    }

    function asyncTest_fetchDataWithUsername() {
        expect(3)
        searchModel.phrase = "@mfeathers"
        connect(searchModel.readyChanged, function() {
            equals(searchModel.count, 15, "Model contains data")
            equals(searchModel.phrase, "@mfeathers")
            ok(searchModel.get(0).title.indexOf(searchModel.phrase) > -1, "Item contains search string")
            test.start()
        })
        test.stop()
    }
}
