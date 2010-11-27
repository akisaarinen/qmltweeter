import Qt 4.7
import QmlUnitTest 0.1

QmlTestCase {

    SearchModel {
        id: searchModel
        onReadyChanged: {
            if (ready) {
                equals(searchModel.count, 15, "Model contains data")
                start()
            }
        }
    }


    function asyncTest_fetchDataWithNormalKeyword() {
        expect(1)
        searchModel.phrase = "meegoconf"
        stop()
    }


    function asyncTest_fetchDataWithUsername() {
        expect(1)
        searchModel.phrase = "@mfeathers"
        stop()
    }
}
