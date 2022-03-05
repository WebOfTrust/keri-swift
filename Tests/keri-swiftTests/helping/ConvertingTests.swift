//
// Created by Kevin Griffin on 2/10/22.
//

import Foundation
import XCTest

@testable import keri_swift

final class ConvertingTests: XCTestCase {
    func testB64ToInt() throws {
        XCTAssertThrowsError(try b64ToInt(s: "")) { error in
            XCTAssertEqual(error as! ConversionErrors, ConversionErrors.undefined)
        }

        XCTAssertThrowsError(try b64ToInt(s: "@")) { error in
            XCTAssertEqual(error as! ConversionErrors, ConversionErrors.characterNotFound("@"))
        }

        XCTAssertEqual(try b64ToInt(s: "A"), 0)
        XCTAssertEqual(try b64ToInt(s: "b"), 27)
        XCTAssertEqual(try b64ToInt(s: "Ab"), 27)
        XCTAssertEqual(try b64ToInt(s: "BQ"), 80)
        XCTAssertEqual(try b64ToInt(s: "__"), 4095)
        XCTAssertEqual(try b64ToInt(s: "BAA"), 4096)
        XCTAssertEqual(try b64ToInt(s: "Bd7"), 6011)
    }

    func testIntToB64() {
        XCTAssertEqual(intToB64(i: 0), "A")
        XCTAssertEqual(intToB64(i: 0, l: 0), "")
        XCTAssertEqual(intToB64(i: 27), "b")
        XCTAssertEqual(intToB64(i: 27, l: 2), "Ab")
        XCTAssertEqual(intToB64(i: 80), "BQ")
        XCTAssertEqual(intToB64(i: 4095), "__")
        XCTAssertEqual(intToB64(i: 4096), "BAA")
        XCTAssertEqual(intToB64(i: 6011), "Bd7")
    }
}
