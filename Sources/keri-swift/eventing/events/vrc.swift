//
// Created by Kevin Griffin on 2/22/22.
//

import Foundation

/// Transferable Prefix Signer Receipt
/// For receipts the d field is the SAID of the associated event not the receipt message itself.
/// {
//  "v": "KERI10JSON00011c_",
//  "t": "vrc",
//  "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
//  "i": "AaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
//  "s": "1",
//  "a":
//    {
//      "d": "DZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
//      "i": "AYAfSVPzhzS6b5CMaU6JR2nmwyZ-i0d8JZAoTNZH3ULv",
//      "s": "4"
//    }
// }
public struct vrc {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var s: Int
    public var a: EventSeal

    public init(v: String, t: Ilk, d: String, i: String, s: Int, a: EventSeal) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.s = s
        self.a = a
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, s, a
    }
}

extension vrc: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.a = try values.decode(EventSeal.self, forKey: .a)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.a, forKey: .a)
    }
}
