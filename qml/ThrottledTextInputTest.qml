import Qt 4.7
import QmlUnitTest 0.1

QmlTestCase {
    id: test

    ThrottledTextInput {
        id: input
    }

    function setup() {
        input.text = ""
    }

    function asyncTest_checkThrottle() {
        expect(3)

        var UPDATED_TEXT = "FOO"

        connect(input.throttledTextChanged, function() {
            equals(input.throttledText, UPDATED_TEXT, "Text is changed eventually to")
            test.start()
        })

        equals(input.throttledText, "", "Initial text is")
        input.text = UPDATED_TEXT
        equals(input.throttledText, "", "Immediately after change text is")
    }
}
