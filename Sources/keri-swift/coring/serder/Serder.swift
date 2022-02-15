//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation
import MessagePack
import SwiftCBOR

//        .diger is Diger instance of digest of .raw
//        .dig  is qb64 digest from .diger
//        .digb is qb64b digest from .diger
//        .verfers is list of Verfers converted from .ked["k"]
//        .werfers is list of Verfers converted from .ked["b"]
//        .tholder is Tholder instance from .ked["kt'] else None
//        .sn is int sequence number converted from .ked["s"]
//        .pre is qb64 str of identifier prefix from .ked["i"]
//        .preb is qb64b bytes of identifier prefix from .ked["i"]
//        .said is qb64 of .ked['d'] if present
//        .saidb is qb64b of .ked['d'] of present

/// Serder is KERI key event serializer-deserializer class
// Only supports current version VERSION
struct Serder {
    private var _raw: [UInt8] = []
    /// Bytes of serialized event
    public var raw: [UInt8] {
        self._raw
    }

    private var _ked: [String: Any] = [:]
    /// key event dict
    public var ked: [String: Any] {
        self._ked
    }

    private var _kind: Ident = .keri
    /// serialization kind string value (see coring.Ident)
    public var kind: Ident {
        self._kind
    }

    private var _sad: String = ""
    /// Bytes of serialized event
    public var sad: String {
        self._sad
    }

    /// init
    ///
    /// - Parameters:
    ///   - raw:
    ///   - ked:
    ///   - kind:
    ///   - sad:
    ///   - code:
    /// - Throws:
    init(raw: [UInt8] = [], ked: [String: Any], kind: Ident = .keri, sad: String = "", code: String = MatterCodex[MatterCodes.Blake3_256]!) throws {
        if kind != .keri {
            throw SerderErrors.invalidIdent
        }

        if raw.count > 0 {
            self._raw = raw
        } else if ked.count > 0 {
            self._kind = kind
            self._ked = ked
        } else if sad.count > 0 {
            self._sad = sad
        } else {
            throw SerderErrors.improperInitialization
        }
    }

    private let MinSniffSize = VerFullSize + 12

    /// sniff
    ///
    /// - Returns:
    /// - Throws:
    private func sniff() throws -> (ident: Ident, kind: Serial, version: Versionage, size: Int) {
        if self._raw.count < self.MinSniffSize {
            throw SerderErrors.insufficientBytes
        }

        guard let vs = String(data: Data(raw[0 ..< MinSniffSize]), encoding: .utf8) else {
            throw VersionErrors.invalidVersion
        }

        return try Deversify(vs: vs)
    }

    /// inhale
    ///
    /// - Returns:
    /// - Throws:
    private func inhale() throws -> ([String: Any], Ident, Serial, Versionage, Int) {
        let v = try sniff()

        if v.version != Version {
            throw VersionErrors.unsupportedVersion
        }

        if self._raw.count < v.size {
            throw SerderErrors.insufficientBytes
        }

        guard let ked = try loads(raw: self._raw, size: v.size, kind: v.kind) else {
            throw SerderErrors.failedKedExtraction
        }

        return (ked, v.ident, v.kind, v.version, v.size)
    }

    ///
    ///
    /// - Parameters:
    ///   - ked: key event dict
    ///   - kind:
    /// - Returns:
    /// - Throws:
    private func exhale(ked: [String: Any], kind: Serial?) throws -> (raw: [UInt8], kind: Ident, ked: [String: Any], version: Versionage) {
        try Sizeify(ked: ked, kind: kind)
    }

    /// loads
    /// utility function to handle deserialization by kind
    /// - Parameters:
    ///   - raw: raw serialization to deserialize as dictionary
    ///   - size: number of bytes to consume for the deserialization. If 0 then consume all bytes
    ///   - kind: serialization kind (JSON, MGPK, CBOR)
    /// - Returns: deserialized ked
    /// - Throws:
    private func loads(raw: [UInt8] = [], size: Int = 0, kind: Serial = .json) throws -> [String: Any]? {
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
    private func dumps(ked: [String: Any], kind: Serial = .json) throws -> [UInt8] {
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
