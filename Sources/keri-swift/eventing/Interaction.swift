//
// Created by Kevin Griffin on 2/21/22.
//

import Foundation

/// Interaction Event (Also delegating Interaction)
/// {
///  "v": "KERI10JSON00011c_",
///  "t": "ixn",
///  "d": "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
///  "i": "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
///  "s": "2",
///  "p": "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
///  "a":
///  [
///    {
///      "d": "ELvaU6Z-i0d8JJR2nmwyYAZAoTNZH3UfSVPzhzS6b5CM",
///      "i": "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
///      "s": "1"
///    }
///  ]
/// }
public struct IXN {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var s: Int
    public var p: String
    public var a: [EventSeal]

    // swiftlint:disable line_length
    public init(v: String, t: Ilk, d: String, i: String, s: Int, p: String, a: [EventSeal]) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.s = s
        self.p = p
        self.a = a
    }

    // swiftlint:enable line_length

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, s, p, a
    }
}

extension IXN: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.p = try values.decode(String.self, forKey: .p)
        self.a = try values.decode([EventSeal].self, forKey: .a)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.p, forKey: .p)
        try container.encode(self.a, forKey: .a)
    }
}
