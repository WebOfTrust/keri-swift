//
// Created by Kevin Griffin on 2/24/22.
//

import Foundation

/// Expose Message
/// {
///  "v": "KERI10JSON00011c_",
///  "t": "exp",
///  "d": "EZ-i0d8JZAoTNZH3ULaU6JR2nmwyvYAfSVPzhzS6b5CM",
///  "r": "sealed/processor",
///  "a":
///  {
///    "d": "EaU6JR2nmwyZ-i0d8JZAoTNZH3ULvYAfSVPzhzS6b5CM",
///    "i": "EAoTNZH3ULvYAfSVPzhzS6baU6JR2nmwyZ-i0d8JZ5CM",
///    "dt": "2020-08-22T17:50:12.988921+00:00",
///    "name": "John Jones",
///    "role": "Founder",
///  }
/// }
public struct ExposeMessage {
    public var v: String
    public var t: Ilk
    public var d: String
    public var r: String
    public var a: A

    public init(v: String, t: Ilk, d: String, r: String, a: A) {
        self.v = v
        self.t = t
        self.d = d
        self.r = r
        self.a = a
    }

    enum CodingKeys: String, CodingKey {
        case v, t, d, r, a
    }
}

extension ExposeMessage: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.v = try values.decode(String.self, forKey: .v)
        self.t = try values.decode(Ilk.self, forKey: .t)
        self.d = try values.decode(String.self, forKey: .d)
        self.r = try values.decode(String.self, forKey: .r)
        self.a = try values.decode(A.self, forKey: .a)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.v, forKey: .v)
        try container.encode(self.t.rawValue, forKey: .t)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.r, forKey: .r)
        try container.encode(self.a, forKey: .a)
    }
}

/// A
public struct A {
    public var d: String
    public var i: String
    public var dt: Date
    public var name: String
    public var role: String

    public init(d: String, i: String, dt: Date, name: String, role: String) {
        self.d = d
        self.i = i
        self.dt = dt
        self.name = name
        self.role = role
    }

    enum CodingKeys: String, CodingKey {
        case d, i, dt, name, role
    }
}

extension A: Codable {
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.d = try values.decode(String.self, forKey: .d)
        self.i = try values.decode(String.self, forKey: .i)
        let _dt = try values.decode(String.self, forKey: .dt)
        self.dt = _dt.iso8601WithFractionalSeconds!
        self.name = try values.decode(String.self, forKey: .name)
        self.role = try values.decode(String.self, forKey: .role)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.d, forKey: .d)
        try container.encode(self.i, forKey: .i)
        try container.encode(self.dt.iso8601WithFractionalSeconds, forKey: .dt)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.role, forKey: .role)
    }
}
