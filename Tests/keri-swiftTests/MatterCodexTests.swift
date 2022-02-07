//
// Created by Kevin Griffin on 2/4/22.
//

import XCTest

@testable import keri_swift

final class MatterCodesTests: XCTestCase {
    func testCodexContainsAllCodes() {
        MatterCodes.allCases.forEach {
            XCTAssertTrue(MatterCodex.keys.contains($0))
        }

        XCTAssertEqual(MatterCodes.allCases.count, MatterSizes.count)
    }
}
