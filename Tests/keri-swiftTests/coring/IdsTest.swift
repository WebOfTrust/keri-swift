//
// Created by Kevin Griffin on 2/16/22.
//

import XCTest

@testable import keri_swift

final class IdTests: XCTestCase {
    func testIds() {
        XCTAssertTrue(ids.contains(.dollar))
        XCTAssertTrue(ids.contains(.at))
        XCTAssertTrue(ids.contains(.id))
        XCTAssertTrue(ids.contains(.i))
        XCTAssertTrue(ids.contains(.d))
    }

    func testBadInit() {
        XCTAssertEqual(Id(rawValue: "foo"), nil)
    }
}
