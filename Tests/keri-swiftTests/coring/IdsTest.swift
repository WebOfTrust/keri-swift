//
// Created by Kevin Griffin on 2/16/22.
//

import XCTest

@testable import keri_swift

final class IdTests: XCTestCase {
    func testIds() {
        XCTAssertTrue(Ids.contains(.dollar))
        XCTAssertTrue(Ids.contains(.at))
        XCTAssertTrue(Ids.contains(.id))
        XCTAssertTrue(Ids.contains(.i))
        XCTAssertTrue(Ids.contains(.d))
    }

    func testBadInit() {
        XCTAssertEqual(Id(rawValue: "foo"), nil)
    }
}
