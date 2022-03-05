//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class IlksTests: XCTestCase {
    func testIlks() {
        XCTAssertTrue(ilks.contains(.icp))
        XCTAssertTrue(ilks.contains(.rot))
        XCTAssertTrue(ilks.contains(.ort))
        XCTAssertTrue(ilks.contains(.ixn))
        XCTAssertTrue(ilks.contains(.dip))
        XCTAssertTrue(ilks.contains(.drt))
        XCTAssertTrue(ilks.contains(.rct))
        XCTAssertTrue(ilks.contains(.ksn))
        XCTAssertTrue(ilks.contains(.qry))
        XCTAssertTrue(ilks.contains(.rpy))
        XCTAssertTrue(ilks.contains(.exn))
        XCTAssertTrue(ilks.contains(.exp))
        XCTAssertTrue(ilks.contains(.fwd))
        XCTAssertTrue(ilks.contains(.vcp))
        XCTAssertTrue(ilks.contains(.vrt))
        XCTAssertTrue(ilks.contains(.iss))
        XCTAssertTrue(ilks.contains(.rev))
        XCTAssertTrue(ilks.contains(.bis))
        XCTAssertTrue(ilks.contains(.brv))
    }
}
