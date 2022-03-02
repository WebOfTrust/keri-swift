//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class VersionTests: XCTestCase {
    func testVersify() throws {
        var vsy = ""

        XCTAssertNoThrow(vsy = versify(ident: .keri, version: Version, kind: .json, size: 284))
        XCTAssertEqual(vsy, "KERI10JSON00011c_")
    }

    func testDeversify() throws {
        let v = try XCTUnwrap(try deversify(vs: "KERI10JSON00011c_"))
        XCTAssertNotNil(v)

        XCTAssertEqual(v.ident, .keri)
        XCTAssertEqual(v.kind, .json)
        XCTAssertEqual(v.version.major, 1)
        XCTAssertEqual(v.version.minor, 0)
        XCTAssertEqual(v.size, 284)
    }

    func testDeversifyEmpty() throws {
        XCTAssertThrowsError(try deversify(vs: "")) { error in
            XCTAssertEqual(error as! VersionErrors, VersionErrors.invalidVersion)
        }
    }

    func testDeversifyBadIdent() throws {
        XCTAssertThrowsError(try deversify(vs: "AAAA10JSON000000_")) { error in
            XCTAssertEqual(error as! VersionErrors, VersionErrors.invalidVersion)
        }
    }
}
