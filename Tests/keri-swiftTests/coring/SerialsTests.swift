//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class SerialsTests: XCTestCase {
    func testSerials() {
        XCTAssertTrue(Serials.contains(.json))
        XCTAssertTrue(Serials.contains(.mgpk))
        XCTAssertTrue(Serials.contains(.cbor))
    }

    func testBadInit() {
        XCTAssertEqual(Serial(rawValue: "foo"), nil)
    }
}
