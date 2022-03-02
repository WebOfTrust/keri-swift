//
// Created by Kevin Griffin on 2/23/22.
//
// Adapted from https://gist.github.com/mikebuss/17142624da4baf9cdcc337861e256533

import Foundation
// swiftlint:disable line_length
// public class JSONNull: Codable, Hashable {
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        true
//    }
//
//    public var hashValue: Int {
//        0
//    }
//
//    public func hash(into hasher: inout Hasher) {
//        // No-op
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
// }
//
// class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        nil
//    }
//
//    required init?(stringValue: String) {
//        self.key = stringValue
//    }
//
//    var intValue: Int? {
//        nil
//    }
//
//    var stringValue: String {
//        self.key
//    }
// }
//
// public class JSONAny: Codable {
//    public let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw self.decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try self.decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try self.decodeDictionary(from: &container)
//        }
//        throw self.decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try self.decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try self.decodeDictionary(from: &container)
//        }
//        throw self.decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try self.encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try self.encode(to: &container, dictionary: value)
//            } else {
//                throw self.encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try self.encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try self.encode(to: &container, dictionary: value)
//            } else {
//                throw self.encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw self.encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
// }

// struct JSONCodingKeys: CodingKey {
//    var stringValue: String
//
//    init(stringValue: String) {
//        self.stringValue = stringValue
//    }
//
//    var intValue: Int?
//
//    init?(intValue: Int) {
//        self.init(stringValue: "\(intValue)")
//        self.intValue = intValue
//    }
// }
//
// extension KeyedDecodingContainer {
//    func decode(_ type: [String: Any].Type, forKey key: K) throws -> [String: Any] {
//        let container = try self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
//        return try container.decode(type)
//    }
//
//    func decode(_ type: [Any].Type, forKey key: K) throws -> [Any] {
//        var container = try self.nestedUnkeyedContainer(forKey: key)
//        return try container.decode(type)
//    }
//
//    func decode(_ type: [String: Any].Type) throws -> [String: Any] {
//        var dictionary = [String: Any]()
//
//        for key in allKeys {
//            if let boolValue = try? decode(Bool.self, forKey: key) {
//                dictionary[key.stringValue] = boolValue
//            } else if let stringValue = try? decode(String.self, forKey: key) {
//                dictionary[key.stringValue] = stringValue
//            } else if let intValue = try? decode(Int.self, forKey: key) {
//                dictionary[key.stringValue] = intValue
//            } else if let doubleValue = try? decode(Double.self, forKey: key) {
//                dictionary[key.stringValue] = doubleValue
//            } else if let nestedDictionary = try? decode([String: Any].self, forKey: key) {
//                dictionary[key.stringValue] = nestedDictionary
//            } else if let nestedArray = try? decode([Any].self, forKey: key) {
//                dictionary[key.stringValue] = nestedArray
//            }
//        }
//        return dictionary
//    }
// }
//
// extension UnkeyedDecodingContainer {
//    mutating func decode(_ type: [Any].Type) throws -> [Any] {
//        var array: [Any] = []
//
//        while isAtEnd == false {
//            let value: String? = try decode(String?.self)
//            if value == nil {
//                continue
//            }
//            if let value = try? decode(Bool.self) {
//                array.append(value)
//            } else if let value = try? decode(Int.self) {
//                array.append(value)
//            } else if let value = try? decode(Double.self) {
//                array.append(value)
//            } else if let value = try? decode(String.self) {
//                array.append(value)
//            } else if let nestedDictionary = try? decode([String: Any].self) {
//                array.append(nestedDictionary)
//            } else if let nestedArray = try? decode([Any].self) {
//                array.append(nestedArray)
//            }
//        }
//        return array
//    }
//
//    mutating func decode(_ type: [String: Any].Type) throws -> [String: Any] {
//        let nestedContainer = try self.nestedContainer(keyedBy: JSONCodingKeys.self)
//        return try nestedContainer.decode(type)
//    }
// }
//
//
// extension KeyedEncodingContainerProtocol where Key == JSONCodingKeys {
//    mutating func encode(_ value: [String: Any]) throws {
//        try value.forEach({ (key, value) in
//            let key = JSONCodingKeys(stringValue: key)
//            switch value {
//            case let value as Bool:
//                try encode(value, forKey: key)
//            case let value as Int:
//                try encode(value, forKey: key)
//            case let value as String:
//                try encode(value, forKey: key)
//            case let value as Double:
//                try encode(value, forKey: key)
//            case let value as CGFloat:
//                try encode(value, forKey: key)
//            case let value as [String: Any]:
//                try encode(value, forKey: key)
//            case let value as [Any]:
//                try encode(value, forKey: key)
//            case Optional<Any>.none:
//                try encodeNil(forKey: key)
//            default:
//                throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: codingPath + [key], debugDescription: "Invalid JSON value"))
//            }
//        })
//    }
// }
//
// extension KeyedEncodingContainerProtocol {
//    mutating func encode(_ value: [String: Any]?, forKey key: Key) throws {
//        if value != nil {
//            var container = self.nestedContainer(keyedBy: JSONCodingKeys.self, forKey: key)
//            try container.encode(value!)
//        }
//    }
//
//    mutating func encode(_ value: [Any]?, forKey key: Key) throws {
//        if value != nil {
//            var container = self.nestedUnkeyedContainer(forKey: key)
//            try container.encode(value!)
//        }
//    }
// }
//
// extension UnkeyedEncodingContainer {
//    mutating func encode(_ value: [Any]) throws {
//        try value.enumerated().forEach({ (index, value) in
//            switch value {
//            case let value as Bool:
//                try encode(value)
//            case let value as Int:
//                try encode(value)
//            case let value as String:
//                try encode(value)
//            case let value as Double:
//                try encode(value)
//            case let value as CGFloat:
//                try encode(value)
//            case let value as [String: Any]:
//                try encode(value)
//            case let value as [Any]:
//                try encode(value)
//            case Optional<Any>.none:
//                try encodeNil()
//            default:
//                let keys = JSONCodingKeys(intValue: index).map({ [ $0 ] }) ?? []
//                throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: codingPath + keys, debugDescription: "Invalid JSON value"))
//            }
//        })
//    }
//
//    mutating func encode(_ value: [String: Any]) throws {
//        var nestedContainer = self.nestedContainer(keyedBy: JSONCodingKeys.self)
//        try nestedContainer.encode(value)
//    }
// }
// swiftlint:enable line_length
