//
// Created by Kevin Griffin on 2/28/22.
//

import RNJSON
import XCTest

@testable import keri_swift

final class DumpableTests: XCTestCase {
    struct Testy: Codable, Dumpable, Loadable {
        let a: String
        let b: Int
        let c: nested
        var _kind: Serial

        enum CodingKeys: String, CodingKey {
            case a, b, c
        }

        init(a: String, b: Int, c: nested, kind: Serial? = .json) {
            self.a = a
            self.b = b
            self.c = c
            self._kind = kind!
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.a = try values.decode(String.self, forKey: .a)
            let _b = try values.decode(String.self, forKey: .b)
            self.b = Int(_b)!
            self.c = try values.decode(nested.self, forKey: .c)
            self._kind = .json
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(self.a, forKey: .a)
            try container.encode(String(self.b), forKey: .b)
            try container.encode(self.c, forKey: .c)
        }

        func kind() -> Serial {
            self._kind
        }
    }

    struct nested: Codable {
        let d: String

        init(d: String) {
            self.d = d
        }
    }

    func testJSONDumpAndLoad() throws {
        let tsty = Testy(a: "a", b: 1, c: nested(d: "d"))
        let out = try tsty.dumps()
        XCTAssertEqual(out, [123, 34, 97, 34, 58, 34, 97, 34, 44, 34, 98, 34, 58, 34, 49, 34, 44, 34, 99, 34, 58, 123, 34, 100, 34, 58, 34, 100, 34, 125, 125])

        let tt: Testy = try Testy.loads(raw: out, kind: Serial.json)

        XCTAssertEqual(tt.a, "a")
        XCTAssertEqual(tt.b, 1)
        XCTAssertEqual(tt.c.d, "d")
    }

    func testCBORDumps() throws {
        let tsty = Testy(a: "a", b: 1, c: nested(d: "d"), kind: .cbor)
        XCTAssertThrowsError(try tsty.dumps()) { error in
            XCTAssertEqual(error as! DumpableErrors, DumpableErrors.notImplemented(.cbor))
        }
    }

    func testMGPKDumps() throws {
        let tsty = Testy(a: "a", b: 1, c: nested(d: "d"), kind: .mgpk)
        XCTAssertThrowsError(try tsty.dumps()) { error in
            XCTAssertEqual(error as! DumpableErrors, DumpableErrors.notImplemented(.mgpk))
        }
    }

    func testCBORLoads() throws {
        let raw: [UInt8] = [123, 34, 97, 34, 58, 34, 97, 34, 44, 34, 98, 34, 58, 34, 49, 34, 44, 34, 99, 34, 58, 123, 34, 100, 34, 58, 34, 100, 34, 125, 125]
        XCTAssertThrowsError(try Testy.loads(raw: raw, kind: Serial.cbor)) { error in
            XCTAssertEqual(error as! LoadableErrors, LoadableErrors.notImplemented(.cbor))
        }
    }

    func testMGPKLoads() throws {
        let raw: [UInt8] = [123, 34, 97, 34, 58, 34, 97, 34, 44, 34, 98, 34, 58, 34, 49, 34, 44, 34, 99, 34, 58, 123, 34, 100, 34, 58, 34, 100, 34, 125, 125]
        XCTAssertThrowsError(try Testy.loads(raw: raw, kind: Serial.mgpk)) { error in
            XCTAssertEqual(error as! LoadableErrors, LoadableErrors.notImplemented(.mgpk))
        }
    }
}
