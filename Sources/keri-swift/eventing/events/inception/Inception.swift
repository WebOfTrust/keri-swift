//
// Created by Kevin Griffin on 2/18/22.
//

import Foundation

/// Inception Event
///
/// When the AID in the i field is a self-addressing self-certifying AID, the new Inception Event has two
/// derived digest fields. In this case both the d and i fields must have the same value. This means the digest suite's
/// derivation code, used for the i field must be the same for the d field.
///
/// The derivation of the d and i fields is special. Both the d and i fields are replaced with dummy # characters of
/// the length of the digest to be used. The digest of the Inception event is then computed and both the d and i fields
/// are replaced with the fully qualified digest value. Validation of an inception event requires examining the i
/// field's derivation code and if it is a digest type then the d field must be identical otherwise the inception event
/// is invalid.
///
/// When the AID is not self-addressing, i.e. the i field derivation code is not a digest. Then the i is given its value
/// and the d field is replaced with dummy characters # of the correct length and then the digest is computed. This is
/// the standard SAID algorithm.
///
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "icp",
///  "d" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
///  "i" : "EZAoTNZH3ULvaU6Z-i0d8JJR2nmwyYAfSVPzhzS6b5CM",
///  "s" : "0",
///  "kt": "1",
///  "k" : ["DaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM"],
///  "n" : "EZ-i0d8JZAoTNZH3ULvaU6JR2nmwyYAfSVPzhzS6b5CM",
///  "bt": "1",
///  "b" : ["DTNZH3ULvaU6JR2nmwyYAfSVPzhzS6bZ-i0d8JZAo5CM"],
///  "c" : ["EO"],
///  "a" : []
/// }
public struct ICP {
    let v: String
    let t: Ilk
    let d: String
    let i: String
    let s: Int
    let kt: Int
    let k: [String]
    let n: String
    let bt: Int
    let b: [String]
    let c: [String]

    // swiftlint:disable line_length
    public init(v: String, t: Ilk, d: String, i: String, s: Int, kt: Int, k: [String], n: String, bt: Int, b: [String], c: [String]) {
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
    }

    // swiftlint:enable line_length

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, s, kt, k, n, bt, b, c
    }

    // protocols
    let _kind: Serial = .json
    let _code: String = ""
}

extension ICP: Codable {
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
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(String(self.kt), forKey: .kt)
        try container.encode(self.k, forKey: .k)
        try container.encode(self.n, forKey: .n)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.b, forKey: .b)
        try container.encode(self.c, forKey: .c)
    }
}
