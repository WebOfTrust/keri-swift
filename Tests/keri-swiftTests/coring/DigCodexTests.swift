//
// Created by Kevin Griffin on 3/15/22.
//

import XCTest

@testable import keri_swift

final class DigCodexTests: XCTestCase {
    func testCodexContainsAllCodes() {
        XCTAssertEqual(["0D", "0E", "0F", "0G", "E", "F", "G", "H", "I"], digCodex.sorted())
    }
}
