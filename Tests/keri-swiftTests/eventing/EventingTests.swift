//
// Created by Kevin Griffin on 3/8/22.
//

import XCTest

@testable import keri_swift

final class EventingTests: XCTestCase {
    func testIncept() throws {
        let icp = try incept(keys: [""], sith: 1, nxt: "", code: matterCodex[MatterCodes.Ed25519]!)
        print(icp)
    }
}
