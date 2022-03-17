//
// Created by Kevin Griffin on 2/24/22.
//

import Foundation

/// Exchange Message
/// {
///  "v": "KERI10JSON00006a_",
///  "t": "exn",
///  "d": "EF3Dd96ATbbMIZgUBBwuFAWx3_8s5XSt_0jeyCRXq_bM",
///  "dt": "2021-11-12T19:11:19.342132+00:00",
///  "r": "/echo",
///  "rr": "/echo/response"
///  "a": {
///    "msg": "test"
///  }
/// }
public struct ExchangeMessage {
    public var v: String
    public var t: Ilk
    public var d: String
    public var dt: Date
    public var r: String
    public var rr: String
    public var a: Exchange

    public init(v: String, t: Ilk, d: String, dt: Date, r: String, rr: String, a: Exchange) {
        self.v = v
        self.t = t
        self.d = d
        self.dt = dt
        self.r = r
        self.rr = rr
        self.a = a
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, dt, r, rr, a
    }
}

extension ExchangeMessage: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
        self.r = try values.decode(String.self, forKey: .r)
        self.rr = try values.decode(String.self, forKey: .rr)
        self.a = try values.decode(Exchange.self, forKey: .a)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
        try container.encode(self.r, forKey: .r)
        try container.encode(self.rr, forKey: .rr)
        try container.encode(self.a, forKey: .a)
    }
}

public struct Exchange {
    public var msg: String

    public init(msg: String) {
        self.msg = msg
    }

    enum CodingKeys: String, CodingKey {
        case msg
    }
}

extension Exchange: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.msg = try values.decode(String.self, forKey: .msg)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.msg, forKey: .msg)
    }
}
