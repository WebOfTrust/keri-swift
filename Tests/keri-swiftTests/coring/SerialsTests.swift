//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class SerialsTests: XCTestCase {
    func testSerials() {
        XCTAssertTrue(serials.contains(.json))
        XCTAssertTrue(serials.contains(.mgpk))
        XCTAssertTrue(serials.contains(.cbor))
    }

    func testBadInit() {
        XCTAssertEqual(Serial(rawValue: "foo"), nil)
    }
}
