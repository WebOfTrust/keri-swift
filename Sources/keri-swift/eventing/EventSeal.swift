//
// Created by Kevin Griffin on 2/21/22.
//

import Foundation

/// Event seal
/// {
///   "d": "ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM",
///   "i": "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
///   "s": "1"
/// }
public struct EventSeal {
    public var d: String
    public var i: String
    public var s: Int

    public init(d: String, i: String, s: Int) {
        self.d = d
        self.i = i
        self.s = s
    }

    enum CodingKeys: String, CodingKey {
        case d, i, s
    }
}

extension EventSeal: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
    }
}

extension EventSeal: Equatable {
    public static func == (lhs: EventSeal, rhs: EventSeal) -> Bool {
        lhs.d == rhs.d && lhs.i == rhs.i && lhs.s == rhs.s
    }
}
