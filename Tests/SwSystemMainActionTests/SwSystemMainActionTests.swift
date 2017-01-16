import XCTest
@testable import SwSystemMainAction

class SwSystemMainActionTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SwSystemMainAction().text, "Hello, World!")
    }


    static var allTests : [(String, (SwSystemMainActionTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
