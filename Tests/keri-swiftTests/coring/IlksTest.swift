//
// Created by Kevin Griffin on 2/14/22.
//

import XCTest

@testable import keri_swift

final class IlksTests: XCTestCase {
    func testIlks() {
        XCTAssertTrue(Ilks.contains(.icp))
        XCTAssertTrue(Ilks.contains(.rot))
        XCTAssertTrue(Ilks.contains(.ixn))
        XCTAssertTrue(Ilks.contains(.dip))
        XCTAssertTrue(Ilks.contains(.drt))
        XCTAssertTrue(Ilks.contains(.rct))
        XCTAssertTrue(Ilks.contains(.ksn))
        XCTAssertTrue(Ilks.contains(.qry))
        XCTAssertTrue(Ilks.contains(.rpy))
        XCTAssertTrue(Ilks.contains(.exn))
        XCTAssertTrue(Ilks.contains(.exp))
        XCTAssertTrue(Ilks.contains(.fwd))
        XCTAssertTrue(Ilks.contains(.vcp))
        XCTAssertTrue(Ilks.contains(.vrt))
        XCTAssertTrue(Ilks.contains(.iss))
        XCTAssertTrue(Ilks.contains(.rev))
        XCTAssertTrue(Ilks.contains(.bis))
        XCTAssertTrue(Ilks.contains(.brv))
    }
}
