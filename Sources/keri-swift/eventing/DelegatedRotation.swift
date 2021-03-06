//
// Created by Kevin Griffin on 2/21/22.
//

import Foundation

/// Delegated Rotation Event
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "drt",
///  "d" : "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
///  "i" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
///  "s" : "1",
///  "p" : "EULvaU6JR2nmwyZ-i0d8JZAoTNZH3YAfSVPzhzS6b5CM",
///  "kt": "1",
///  "k" : ["EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
///  "n" : "EYAfSVPzhzZ-i0d8JZAoTNZH3ULvaU6JR2nmwyS6b5CM",
///  "bt": "1",
///  "ba": ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
///  "br": ["DH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8TNZJZAo5CM"],
///  "di": "EJJR2nmwyYAZAoTNZH3ULvaU6Z-i0d8fSVPzhzS6b5CM"
/// }
public struct DRT {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var s: Int
    public var p: String
    public var kt: Int
    public var k: [String]
    public var n: String
    public var bt: Int
    public var ba: [String]
    public var br: [String]
    public var di: String

    // swiftlint:disable line_length
    public init(v: String, t: Ilk, d: String, i: String, s: Int, p: String, kt: Int, k: [String], n: String, bt: Int, ba: [String], br: [String], di: String) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.s = s
        self.p = p
        self.kt = kt
        self.k = k
        self.n = n
        self.bt = bt
        self.ba = ba
        self.br = br
        self.di = di
    }

    // swiftlint:enable line_length

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, s, p, kt, k, n, bt, ba, br, di
    }
}

extension DRT: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.p = try values.decode(String.self, forKey: .p)
        let _kt = try values.decode(String.self, forKey: .kt)
        self.kt = Int(_kt)!
        self.k = try values.decode([String].self, forKey: .k)
        self.n = try values.decode(String.self, forKey: .n)
        let _bt = try values.decode(String.self, forKey: .bt)
        self.bt = Int(_bt)!
        self.ba = try values.decode([String].self, forKey: .ba)
        self.br = try values.decode([String].self, forKey: .br)
        self.di = try values.decode(String.self, forKey: .di)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.p, forKey: .p)
        try container.encode(String(self.kt), forKey: .kt)
        try container.encode(self.k, forKey: .k)
        try container.encode(self.n, forKey: .n)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.ba, forKey: .ba)
        try container.encode(self.br, forKey: .br)
        try container.encode(self.di, forKey: .di)
    }
}
