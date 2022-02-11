//
// Created by Kevin Griffin on 2/10/22.
//

import Foundation

import XCTest

@testable import keri_swift

final class HelpingTests: XCTestCase {
    func testB64ToInt() throws {
        XCTAssertThrowsError(try B64ToInt(s: "")) { error in
            XCTAssertEqual(error as! ConversionError, ConversionError.undefined)
        }

        XCTAssertThrowsError(try B64ToInt(s: "@")) { error in
            XCTAssertEqual(error as! ConversionError, ConversionError.characterNotFound("@"))
        }

        XCTAssertEqual(try B64ToInt(s: "A"), 0)
        XCTAssertEqual(try B64ToInt(s: "b"), 27)
        XCTAssertEqual(try B64ToInt(s: "Ab"), 27)
        XCTAssertEqual(try B64ToInt(s: "BQ"), 80)
        XCTAssertEqual(try B64ToInt(s: "__"), 4095)
        XCTAssertEqual(try B64ToInt(s: "BAA"), 4096)
        XCTAssertEqual(try B64ToInt(s: "Bd7"), 6011)
    }

    func testIntToB64() {
        XCTAssertEqual(IntToB64(i: 0), "A")
        XCTAssertEqual(IntToB64(i: 0, l: 0), "")
        XCTAssertEqual(IntToB64(i: 27), "b")
        XCTAssertEqual(IntToB64(i: 27, l: 2), "Ab")
        XCTAssertEqual(IntToB64(i: 80), "BQ")
        XCTAssertEqual(IntToB64(i: 4095), "__")
        XCTAssertEqual(IntToB64(i: 4096), "BAA")
        XCTAssertEqual(IntToB64(i: 6011), "Bd7")
    }
}
