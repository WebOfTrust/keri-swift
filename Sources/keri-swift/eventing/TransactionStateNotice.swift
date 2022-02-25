//
// Created by Kevin Griffin on 2/25/22.
//

import Foundation

/// Transaction State Notice
// {
//  "v": "KERI10JSON0001b0_",
//  "d": "EpltHxeKueSR1a7e0_oSAhgO6U7VDnX7x4KqNCwBqbI0",
//  "i": "EoN_Ln_JpgqsIys-jDOH8oWdxgWqs7hzkDGeLWHb9vSY",
//  "s": "1",
//  "ii": "EaKJ0FoLxO1TYmyuprguKO7kJ7Hbn0m0Wuk5aMtSrMtY",
//  "dt": "2021-01-01T00:00:00.000000+00:00",
//  "et": "vrt",
//  "a": {
//    "s": 2,
//    "d": "Ef12IRHtb_gVo5ClaHHNV90b43adA0f8vRs3jeU-AstY"
//  },
//  "bt": "1",
//  "br": [],
//  "ba": [
//    "BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"
//  ],
//  "b": [
//    "BwFbQvUaS4EirvZVPUav7R_KDHB8AKmSfXNpWnZU_YEU"
//  ],
//  "c": []
// }
public struct TransactionStateNotice {
    public var v: String
    public var d: String
    public var i: String
    public var s: Int
    public var ii: String
    public var dt: Date
    public var et: Ilk
    public var a: PhilsSeal
    public var bt: Int
    public var br: [String]
    public var ba: [String]
    public var b: [String]
    public var c: [String]

    // swiftlint:disable line_length
    public init(v: String, d: String, i: String, s: Int, ii: String, dt: Date, et: Ilk, a: PhilsSeal, bt: Int, br: [String], ba: [String], b: [String], c: [String]) {
        self.v = v
        self.d = d
        self.i = i
        self.s = s
        self.ii = ii
        self.dt = dt
        self.et = et
        self.a = a
        self.bt = bt
        self.br = br
        self.ba = ba
        self.b = b
        self.c = c
    }

    // swiftlint:enable line_length

    enum CodingKeys: String, CodingKey {
        case v, d, i, s, ii, dt, et, a, bt, br, ba, b, c
    }
}

extension TransactionStateNotice: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.ii = try values.decode(String.self, forKey: .ii)
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
        self.et = try values.decode(Ilk.self, forKey: .et)
        self.a = try values.decode(PhilsSeal.self, forKey: .a)
        let _bt = try values.decode(String.self, forKey: .bt)
        self.bt = Int(_bt)!
        self.br = try values.decode([String].self, forKey: .br)
        self.ba = try values.decode([String].self, forKey: .ba)
        self.b = try values.decode([String].self, forKey: .b)
        self.c = try values.decode([String].self, forKey: .c)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.ii, forKey: .ii)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
        try container.encode(self.et.rawValue, forKey: .et)
        try container.encode(self.a, forKey: .a)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.br, forKey: .br)
        try container.encode(self.ba, forKey: .ba)
        try container.encode(self.b, forKey: .b)
        try container.encode(self.c, forKey: .c)
    }
}
