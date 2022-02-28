//
// Created by Kevin Griffin on 2/28/22.
//

import Foundation

/// Backed Credential Revocation
/// {
//  "v" : "KERI10JSON00011c_",
//  "t" : "brv",
//  "d" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
//  "i" : "E_D0eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqA7BxL",
//  "s" : "1",
//  "p" : "ELh3eYC2W_Su1izlvm0xxw01n3XK8bdV2Zb09IqlXB7A",
//  "ri" : "EvxMACzQxU2rDj-X5SPDZYtUn56i4fjjH8yDRFRzaMfI",
//  "ra" : {
//      "d": "E8ipype17kJlQfYp3gcF3F1PNKfdX6vpOLXU8YyykB5o",
//      "i": "EFvQCx4-O9bb9fGzY7KgbPeUtjtU0M4OBQWsiIk8za24",
//      "s": "0"
//  },
//  "dt": "2020-08-01T12:20:05.123456+00:00"
// }
public struct BackedCredentialRevocation {
    public var v: String
    public var t: Ilk
    public var d: String
    public var i: String
    public var s: Int
    public var p: String
    public var ri: String
    public var ra: EventSeal
    public var dt: Date

    public init(v: String, t: Ilk, d: String, i: String, s: Int, p: String, ri: String, ra: EventSeal, dt: Date) {
        self.v = v
        self.t = t
        self.d = d
        self.i = i
        self.s = s
        self.p = p
        self.ri = ri
        self.ra = ra
        self.dt = dt
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, i, s, p, ri, ra, dt
    }
}

extension BackedCredentialRevocation: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.p = try values.decode(String.self, forKey: .p)
        self.ri = try values.decode(String.self, forKey: .ri)
        self.ra = try values.decode(EventSeal.self, forKey: .ra)
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.p, forKey: .p)
        try container.encode(self.ri, forKey: .ri)
        try container.encode(self.ra, forKey: .ra)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
    }
}
