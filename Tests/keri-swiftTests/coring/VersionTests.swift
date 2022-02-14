//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class VersionTests: XCTestCase {
    func testVersify() throws {
        let vsy = try Versify(ident: .keri, version: Version, kind: .json, size: 0)

        XCTAssertEqual(vsy, "KERI10JSON000000_")
    }

    func testVerex() throws {
        let x = try Deversify(vs: "KERI10JSON000000_")
        XCTAssertEqual(x.ident, .keri)
        XCTAssertEqual(x.kind, .json)
        XCTAssertEqual(x.version.major, 1)
        XCTAssertEqual(x.version.minor, 0)
        XCTAssertEqual(x.size, 0)
    }
}
