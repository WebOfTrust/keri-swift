//
// Created by Kevin Griffin on 2/4/22.
//

import XCTest

@testable import keri_swift

final class MatterSizesTests: XCTestCase {
    func testSizesContainsAllCodes() {
        MatterCodes.allCases.forEach {
            XCTAssertTrue(matterSizes.keys.contains(matterCodex[$0]!))
        }
        XCTAssertEqual(matterSizes.count, matterSizes.count)
    }
}
