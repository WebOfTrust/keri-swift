//
// Created by Kevin Griffin on 2/22/22.
//

import Foundation

/// ReplyMessage
/// {
///  "v" : "KERI10JSON00011c_",
///  "t" : "rpy",
///  "d" : "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
///  "dt": "2020-08-22T17:50:12.988921+00:00",
///  "r" : "logs/processor",
///  "a" :
///  {
///    "d":  "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
///    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
///    "name": "John Jones",
///    "role": "Founder",
///  }
/// }
public struct ReplyMessage {
    public var v: String
    public var t: Ilk
    public var d: String
    public var dt: Date
    public var r: String
    // This isn't a viable solution
    public var a: Reply

    public init(v: String, t: Ilk, d: String, dt: Date, r: String, a: Reply) {
        self.v = v
        self.t = t
        self.d = d
        self.dt = dt
        self.r = r
        self.a = a
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, dt, r, a
    }
}

extension ReplyMessage: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
        self.r = try values.decode(String.self, forKey: .r)
        self.a = try values.decode(Reply.self, forKey: .a)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
        try container.encode(self.r, forKey: .r)
        try container.encode(self.a, forKey: .a)
    }
}

public struct Reply {
    public var d: String
    public var i: String
    public var name: String
    public var role: String

    public init(d: String, i: String, name: String, role: String) {
        self.d = d
        self.i = i
        self.name = name
        self.role = role
    }

    enum CodingKeys: String, CodingKey {
        case d, i, name, role
    }
}

extension Reply: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        self.name = try values.decode(String.self, forKey: .name)
        self.role = try values.decode(String.self, forKey: .role)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.role, forKey: .role)
    }
}
