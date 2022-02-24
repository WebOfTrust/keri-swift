//
// Created by Kevin Griffin on 2/21/22.
//

import Foundation

/// Delegated Inception Event
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "dip",
///  "d" : "E0d8JJR2nmwyYAfZAoTNZH3ULvaU6Z-iSVPzhzS6b5CM",
///  "i" : "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
///  "s" : "0",
///  "kt": "1",
///  "k" : ["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
///  "n" : "EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
///  "bt": "1",
///  "b" : ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
///  "c" : ["DND"],
///  "di": "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM"
/// }

public struct DIP {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var s: Int
    public var kt: Int
    public var k: [String]
    public var n: String
    public var bt: Int
    public var b: [String]
    public var c: [String]
    public var di: String

    // swiftlint:disable line_length
    public init(v: String, t: Ilk, d: String, i: String, s: Int, kt: Int, k: [String], n: String, bt: Int, b: [String], c: [String], di: String) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.s = s
        self.kt = kt
        self.k = k
        self.n = n
        self.bt = bt
        self.b = b
        self.c = c
        self.di = di
    }

    // swiftlint:enable line_length

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, s, kt, k, n, bt, b, c, di
    }
}

extension DIP: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        let _kt = try values.decode(String.self, forKey: .kt)
        self.kt = Int(_kt)!
        self.k = try values.decode([String].self, forKey: .k)
        self.n = try values.decode(String.self, forKey: .n)
        let _bt = try values.decode(String.self, forKey: .bt)
        self.bt = Int(_bt)!
        self.b = try values.decode([String].self, forKey: .b)
        self.c = try values.decode([String].self, forKey: .c)
        self.di = try values.decode(String.self, forKey: .di)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(String(self.kt), forKey: .kt)
        try container.encode(self.k, forKey: .k)
        try container.encode(self.n, forKey: .n)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.b, forKey: .b)
        try container.encode(self.c, forKey: .c)
        try container.encode(self.di, forKey: .di)
    }
}
