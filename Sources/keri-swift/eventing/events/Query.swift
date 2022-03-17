//
// Created by Kevin Griffin on 2/22/22.
//

import Foundation
import RNJSON

/// Query Message
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "qry",
///  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
///  "dt": "2020-08-22T17:50:12.988921+00:00",
///  "r" : "logs",
///  "rr": "log/processor",
///  "q" :
///  {
///    "d" : "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
///    "i" : "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
///    "s" : "5",
///    "dt": "2020-08-01T12:20:05.123456+00:00"
///  }
/// }
struct QueryMessage {
    public var v: String
    public var t: Ilk
    public var d: String
    public var dt: Date
    public var r: String
    public var rr: String
    public var q: Query

    public init(v: String, t: Ilk, d: String, dt: Date, r: String, rr: String, q: Query) {
        self.v = v
        self.t = t
        self.d = d
        self.dt = dt
        self.r = r
        self.rr = rr
        self.q = q
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, dt, r, rr, q
    }
}

extension QueryMessage: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
        self.r = try values.decode(String.self, forKey: .r)
        self.rr = try values.decode(String.self, forKey: .rr)
        self.q = try values.decode(Query.self, forKey: .q)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
        try container.encode(self.r, forKey: .r)
        try container.encode(self.rr, forKey: .rr)
        try container.encode(self.q, forKey: .q)
    }
}

struct Query {
    public var d: String
    public var i: String
    public var s: Int
    public var dt: Date

    enum CodingKeys: String, CodingKey {
        case d, i, s, dt
    }
}

extension Query: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _s = try values.decode(String.self, forKey: .s)
        self.s = Int(_s)!
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(String(self.s), forKey: .s)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
    }
}
