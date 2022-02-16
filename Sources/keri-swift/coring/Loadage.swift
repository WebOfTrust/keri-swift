//
// Created by Kevin Griffin on 2/16/22.
//

import Foundation

protocol Loadage {}

extension Loadage {
    /// loads
    /// utility function to handle deserialization by kind
    /// - Parameters:
    ///   - raw: raw serialization to deserialize as dictionary
    ///   - size: number of bytes to consume for the deserialization. If 0 then consume all bytes
    ///   - kind: serialization kind (JSON, MGPK, CBOR)
    /// - Returns: deserialized ked
    /// - Throws:
    func loads(raw: [UInt8] = [], size: Int = 0, kind: Serial = .json) throws -> [String: Any]? {
        var dict: [String: Any]?
        if kind == .json {
            dict = try JSONSerialization.jsonObject(with: Data(raw)) as? [String: Any]
        } else if kind == .mgpk {
            // let mpv = try MessagePack.unpackAll(Data(bytes: raw))
            throw SerderErrors.notImplemented(kind)
        } else if kind == .cbor {
            // let decoded = try! CBOR.decode(raw)
            throw SerderErrors.notImplemented(kind)
        } else {
            throw SerderErrors.invalidDeserializationKind(kind)
        }

        return dict
    }

    /// dumps
    /// utility function to handle serialization by kind
    /// - Parameters:
    ///   - ked: key event dict or message dict to serialize
    ///   - kind: serialization kind (JSON, MGPK, CBOR)
    /// - Returns: serialized version of ked dict
    /// - Throws:
    func dumps(ked: [String: Any], kind: Serial = .json) throws -> [UInt8] {
        var raw: [UInt8] = []

        if kind == .json {
            raw = try [UInt8](JSONSerialization.data(withJSONObject: ked))
        } else if kind == .mgpk {
            throw SerderErrors.notImplemented(kind)
        } else if kind == .cbor {
            throw SerderErrors.notImplemented(kind)
        } else {
            throw SerderErrors.invalidSerializationKind(kind)
        }

        return raw
    }
}
