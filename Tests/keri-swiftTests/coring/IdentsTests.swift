//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class IdentsTest: XCTestCase {
    func testIdents() {
        XCTAssertTrue(idents.contains(.keri))
        XCTAssertTrue(idents.contains(.acdc))
    }

    func testBadInit() {
        XCTAssertEqual(Ident(rawValue: "foo"), nil)
    }
}
