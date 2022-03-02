//
// Created by Kevin Griffin on 2/17/22.
//

import XCTest

@testable import keri_swift

final class SizeifyTests: XCTestCase {
    struct TestSizeable: Sizeable, Loadable {
        var v: String
        var a: String?

        var kind: Serial

        init(v: String, a: String? = "", kind: Serial? = .json) {
            self.v = v
            self.a = a
            self.kind = kind!
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.v, forKey: .v)
            try container.encode(self.a, forKey: .a)
        }

        enum CodingKeys: String, CodingKey {
            case v, a
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.v = try values.decode(String.self, forKey: .v)
            self.a = try values.decode(String.self, forKey: .a)
            self.kind = .json
        }
    }

    func testSizeify() throws {
        let actual = TestSizeable(v: "KERI10JSON000000_")
        var ab: [UInt8] = try actual.dumps()
        XCTAssertEqual(32, ab.count)
        XCTAssertEqual("KERI10JSON000000_", actual.v)

        try Sizer().sizeify(sizable: actual as Sizeable, raw: &ab)

        var new = try TestSizeable.loads(raw: ab, kind: .json)
        XCTAssertEqual("KERI10JSON000020_", new.v)
        XCTAssertEqual("", new.a)

        new.a = "an updated longer string"
        var nb = try new.dumps()
        try Sizer().sizeify(sizable: new as Sizeable, raw: &nb)

        let final = try TestSizeable.loads(raw: nb)
        XCTAssertEqual("KERI10JSON000038_", final.v)
    }

    func testBadKind() throws {
        let actual = TestSizeable(v: "KERI10CBOR000000_")
        var ab: [UInt8] = try actual.dumps()

        XCTAssertThrowsError(try Sizer().sizeify(sizable: actual as Sizeable, raw: &ab)) { error in
            XCTAssertEqual(error as! SizeifyErrors, SizeifyErrors.mismatchedSerialization)
        }
    }

    func testBadVersion() throws {
        let actual = TestSizeable(v: "KERI11JSON000000_")
        var ab: [UInt8] = try actual.dumps()

        XCTAssertThrowsError(try Sizer().sizeify(sizable: actual as Sizeable, raw: &ab)) { error in
            XCTAssertEqual(error as! SizeifyErrors, SizeifyErrors.invalidVersion)
        }
    }
}
