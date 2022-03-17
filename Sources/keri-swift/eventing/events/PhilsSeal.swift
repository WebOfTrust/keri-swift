//
// Created by Kevin Griffin on 2/25/22.
//

import Foundation

public struct PhilsSeal {
    public var s: Int
    public var d: String

    public init(s: Int, d: String) {
        self.s = s
        self.d = d
    }

    enum CodingKeys: String, CodingKey {
        case s, d
    }
}

extension PhilsSeal: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.d = try values.decode(String.self, forKey: .d)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.d, forKey: .d)
    }
}
