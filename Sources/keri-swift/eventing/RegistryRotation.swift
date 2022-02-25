//
// Created by Kevin Griffin on 2/25/22.
//

import Foundation

// Registry Rotation
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "vrt",
///  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
///  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
///  "s" : "2",
///  "p" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
///  "bt": "1",
///  "br" : ["BbIg_3-11d3PYxSInLN-Q9_T2axD6kkXd3XRgbGZTm6s"],
///  "ba" : []
/// }
public struct RegistryRotation {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var s: Int
    public var p: String
    public var bt: Int
    public var br: [String]
    public var ba: [String]

    public init(v: String, t: Ilk, d: String, i: String, s: Int, p: String, bt: Int, br: [String], ba: [String]) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.s = s
        self.p = p
        self.bt = bt
        self.br = br
        self.ba = ba
    }

    enum CodingKeys: String, CodingKey {
        case v,t,d,i,s,p,bt,br,ba
    }
}

extension RegistryRotation: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.p = try values.decode(String.self, forKey: .p)
        let _bt = try values.decode(String.self, forKey: .bt)
        self.bt = Int(_bt)!
        self.br = try values.decode([String].self, forKey: .br)
        self.ba = try values.decode([String].self, forKey: .ba)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.p, forKey: .p)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.br, forKey: .br)
        try container.encode(self.ba, forKey: .ba)
    }
}