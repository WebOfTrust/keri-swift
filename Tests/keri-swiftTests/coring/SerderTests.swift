//
// Created by Kevin Griffin on 2/15/22.
//

import XCTest

@testable import keri_swift

final class SerderTests: XCTestCase {
    func testSerder() {
        print("hi")
        let s = "{\"v\":\"KERI10JSON00006f_\",\"d\":\"EgzrpOMEx_A-dvAruhmptnIbP2c55WZAd4fc1nGuyTwU\",\"i\":\"ABCDEFG\",\"s\":\"0001\",\"t\":\"rot\"}"
        let raw: [UInt8] = Array(s.utf8)
        print(raw)
        let d = Data(raw[0 ..< (12 + 17)])
        print(d)

        let p = String(data: d, encoding: .utf8)
        print(p!)

        let snort: String = Data(raw[0 ..< 26]).withUnsafeBytes {
            $0.pointee
        }

        print(snort)
    }
}
