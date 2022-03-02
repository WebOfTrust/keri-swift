//
// Created by Kevin Griffin on 2/25/22.
//

import Foundation

/// Registry Inception
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "vcp",
///  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
///  "i" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
///  "ii": "EJJR2nmwyYAfSVPzhzS6b5CMZAoTNZH3ULvaU6Z-i0d8",
///  "s" : "0",
///  "bt": "1",
///  "b" : ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],
///  "c" : ["NB"]
/// }
public struct RegistryInception {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var ii: String
    public var s: Int
    public var bt: Int
    public var b: [String]
    public var c: [String]

    public init(v: String, t: Ilk, d: String, i: String, ii: String, s: Int, bt: Int, b: [String], c: [String]) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.ii = ii
        self.s = s
        self.bt = bt
        self.b = b
        self.c = c
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, ii, s, bt, b, c
    }
}

extension RegistryInception: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        self.ii = try values.decode(String.self, forKey: .ii)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
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
        try container.encode(self.ii, forKey: .ii)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.b, forKey: .b)
        try container.encode(self.c, forKey: .c)
    }
}
