//
// Created by Kevin Griffin on 2/17/22.
//

import XCTest

@testable import keri_swift

final class SaidifyTests: XCTestCase {
    func testSaider() throws {
        struct TestSaidable: Saidable {
            func kind() -> Serial {
                .json
            }

            var v: String
            var d: String

            enum CodingKeys: String, CodingKey {
                case v, d
            }

            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(self.v, forKey: .v)
                try container.encode(self.d, forKey: .d)
            }

            mutating func setId(v: String) {
                self.d = v
            }
        }

        var ts = TestSaidable(v: "foo", d: "bar") as Saidable
        try Saider.saidify(sad: &ts)
        let ss = ts as! TestSaidable

        XCTAssertEqual(ss.d, "Tt2mvUm3Xxc2/ieMYNC4HgVdVgC6cuRoqItrCjHqBQ8=")
    }

    func testSaiderWithDefaultPreHash() throws {
        struct TestSaidable: Saidable {
            func kind() -> Serial {
                .json
            }

            var v: String
            var d: String

            enum CodingKeys: String, CodingKey {
                case v, d
            }

            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(self.v, forKey: .v)
                try container.encode(self.d, forKey: .d)
            }

            func getLabel() -> Id {
                Id.d
            }

            mutating func setId(v: String) {
                self.d = v
            }

            mutating func preHash() {
                self.v = "some calculated new version"
            }
        }

        var ts = TestSaidable(v: "foo", d: "bar") as Saidable
        try Saider.saidify(sad: &ts)
        let ss = ts as! TestSaidable

        XCTAssertEqual(ss.d, "J//y/3ZLEF75Yt60XNbJastQpjJBODRqnOQxc4FB4Ao=")
    }
}
