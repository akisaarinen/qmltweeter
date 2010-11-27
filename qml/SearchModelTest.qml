import Qt 4.7
import QmlUnitTest 0.1

QmlTestCase {

    SearchModel {
        id: searchModel
        onReadyChanged: {
            if (ready) {
                start();
            }
        }
    }

    function setup() {
        searchModel.phrase = "meegoconf"
        stop();
    }

    function asyncTest_fetchData() {
        equals(searchModel.count, 15, "Model contains data")
        start();
    }
}
