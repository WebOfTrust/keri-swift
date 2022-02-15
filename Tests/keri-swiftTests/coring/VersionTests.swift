//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class VersionTests: XCTestCase {
    func testVersify() throws {
        var vsy = ""

        XCTAssertNoThrow(vsy = try Versify(ident: .keri, version: Version, kind: .json, size: 0))
        XCTAssertEqual(vsy, "KERI10JSON000000_")
    }

    func testDeversify() throws {
        let v = try XCTUnwrap(try Deversify(vs: "KERI10JSON000000_"))
        XCTAssertNotNil(v)

        XCTAssertEqual(v.ident, .keri)
        XCTAssertEqual(v.kind, .json)
        XCTAssertEqual(v.version.major, 1)
        XCTAssertEqual(v.version.minor, 0)
        XCTAssertEqual(v.size, 0)
    }

    func testDeversifyEmpty() throws {
        XCTAssertThrowsError(try Deversify(vs: "")) { error in
            XCTAssertEqual(error as! VersionErrors, VersionErrors.invalidVersion)
        }
    }

    func testDeversifyBadIdent() throws {
        XCTAssertThrowsError(try Deversify(vs: "AAAA10JSON000000_")) { error in
            XCTAssertEqual(error as! VersionErrors, VersionErrors.invalidVersion)
        }
    }
}
