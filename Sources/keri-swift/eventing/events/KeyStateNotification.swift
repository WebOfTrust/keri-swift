//
// Created by Kevin Griffin on 2/24/22.
//

import Foundation

/// Key State Notification
/// {
///  "v": "KERI10JSON0001d9_",
///  "d": "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
///  "i": "E4BsxCYUtUx3d6UkDVIQ9Ke3CLQfqWBfICSmjIzkS1u4",
///  "s": "0",
///  "p": "",
///  "f": "0",
///  "dt": "2021-01-01T00:00:00.000000+00:00",
///  "et": "icp",
///  "kt": "1",
///  "k": [
///    "DqI2cOZ06RwGNwCovYUWExmdKU983IasmUKMmZflvWdQ"
///  ],
///  "n": "E7FuL3Z_KBgt_QAwuZi1lUFNC69wvyHSxnMFUsKjZHss",
///  "bt": "1",
///  "b": [
///    "BFUOWBaJz-sB_6b-_u_P9W8hgBQ8Su9mAtN9cY2sVGiY"
///  ],
///  "c": [],
///  "ee": {
///    "s": "0",
///    "d": "EYk4PigtRsCd5W2so98c8r8aeRHoixJK7ntv9mTrZPmM",
///    "br": [],
///    "ba": []
///  },
///  "di": ""
/// }
public struct KeyStateNotification {
    public var v: String
    public var d: String
    public var i: String
    public var s: Int
    public var p: String
    public var f: Int
    public var dt: Date
    public var et: Ilk
    public var kt: Int
    public var k: [String]
    public var n: String
    public var bt: Int
    public var b: [String]
    public var c: [String]
    public var ee: EstablishmentEvent
    public var di: String

    // swiftlint:disable line_length
    public init(v: String, d: String, i: String, s: Int, p: String, f: Int, dt: Date, et: Ilk, kt: Int, k: [String], n: String, bt: Int, b: [String], c: [String], ee: EstablishmentEvent, di: String) {
        self.v = v
        self.d = d
        self.i = i
        self.s = s
        self.p = p
        self.f = f
        self.dt = dt
        self.et = et
        self.kt = kt
        self.k = k
        self.n = n
        self.bt = bt
        self.b = b
        self.c = c
        self.ee = ee
        self.di = di
    }

    // swiftlint:enable line_length

    enum CodingKeys: String, CodingKey {
        case v, d, i, s, p, f, dt, et, kt, k, n, bt, b, c, ee, di
    }
}

extension KeyStateNotification: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.p = try values.decode(String.self, forKey: .p)
        let _f = try values.decode(String.self, forKey: .f)
        self.f = Int(_f)!
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
        self.et = try values.decode(Ilk.self, forKey: .et)
        let _kt = try values.decode(String.self, forKey: .kt)
        self.kt = Int(_kt)!
        self.k = try values.decode([String].self, forKey: .k)
        self.n = try values.decode(String.self, forKey: .n)
        let _bt = try values.decode(String.self, forKey: .bt)
        self.bt = Int(_bt)!
        self.b = try values.decode([String].self, forKey: .b)
        self.c = try values.decode([String].self, forKey: .c)
        self.ee = try values.decode(EstablishmentEvent.self, forKey: .ee)
        self.di = try values.decode(String.self, forKey: .di)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.p, forKey: .p)
        try container.encode(String(self.f), forKey: .f)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
        try container.encode(self.et.rawValue, forKey: .et)
        try container.encode(String(self.kt), forKey: .kt)
        try container.encode(self.k, forKey: .k)
        try container.encode(self.n, forKey: .n)
        try container.encode(String(self.bt), forKey: .bt)
        try container.encode(self.b, forKey: .b)
        try container.encode(self.c, forKey: .c)
        try container.encode(self.ee, forKey: .ee)
        try container.encode(self.di, forKey: .di)
    }
}

/// Last Establishment Event Map
public struct EstablishmentEvent {
    public var s: Int
    public var d: String
    public var br: [String]
    public var ba: [String]

    public init(s: Int, d: String, br: [String], ba: [String]) {
        self.s = s
        self.d = d
        self.br = br
        self.ba = ba
    }

    enum CodingKeys: String, CodingKey {
        case s, d, br, ba
    }
}

extension EstablishmentEvent: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        self.d = try values.decode(String.self, forKey: .d)
        self.br = try values.decode([String].self, forKey: .br)
        self.ba = try values.decode([String].self, forKey: .ba)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.br, forKey: .br)
        try container.encode(self.ba, forKey: .ba)
    }
}
