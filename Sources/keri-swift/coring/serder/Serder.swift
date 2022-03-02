//
// Created by Kevin Griffin on 2/14/22.
//

import Collections
import Foundation
import MessagePack
import SwiftCBOR

/// Serder is KERI key event serializer-deserializer class
/// Only supports current version VERSION
// struct Serder {
//    private var _raw: [UInt8] = []
//    /// Bytes of serialized event
//    public var raw: [UInt8] {
//        self._raw
//    }
//
//    private var _ked: OrderedDictionary<String, Any> = [:]
//    /// key event dict
//    public var ked: OrderedDictionary<String, Any> {
//        self._ked
//    }
//
//    private var _kind: Ident = .keri
//    /// serialization kind string value (see coring.Ident)
//    public var kind: Ident {
//        self._kind
//    }
//
//    private var _sad: String = ""
//    /// Bytes of serialized event
//    public var sad: String {
//        self._sad
//    }
//
//    /// init
//    ///
//    /// - Parameters:
//    ///   - raw: bytes of serialized event only
//    ///   - ked: key event dict
//    ///   - kind: serialization kind string value
//    ///   - sad: self addressing data
//    ///   - code: default code
//    /// - Throws:
//    init(raw: [UInt8] = [], ked: OrderedDictionary<String, Any>, kind: Ident = .keri, sad: String = "", code: String = MatterCodex[MatterCodes.Blake3_256]!) throws {
//        if kind != .keri {
//            throw SerderErrors.invalidIdent
//        }
//
//        if !raw.isEmpty {
//            self._raw = raw
//        } else if !ked.isEmpty {
//            self._kind = kind
//            self._ked = ked
//        } else if !sad.isEmpty {
//            self._sad = sad
//        } else {
//            throw SerderErrors.improperInitialization
//        }
//    }
//
//    /// sniff
//    ///
//    /// - Returns:
//    /// - Throws:
//    private func sniff() throws -> Deversified {
//        if self._raw.count < MinSniffSize {
//            throw SerderErrors.insufficientBytes
//        }
//
//        guard let vs = String(data: Data(raw[0 ..< MinSniffSize]), encoding: .utf8) else {
//            throw VersionErrors.invalidVersion
//        }
//
//        return try deversify(vs: vs)
//    }
//
//    /// inhale
//    ///
//    /// - Returns:
//    /// - Throws:
//    // swiftlint:disable large_tuple
//    private func inhale() throws -> (OrderedDictionary<String, Any>, Ident, Serial, Versionage, Int) {
//        let v = try sniff()
//
//        if v.version != Version {
//            throw VersionErrors.unsupportedVersion
//        }
//
//        if self._raw.count < v.size {
//            throw SerderErrors.insufficientBytes
//        }
//
////        guard let ked = try loads(raw: self._raw, size: v.size, kind: v.kind) else {
////            throw SerderErrors.failedKedExtraction
////        }
//
//        return (self.ked, v.ident, v.kind, v.version, v.size)
//    }
//
//    /// exhale - (sizeify)
//    ///
//    /// - Parameters:
//    ///   - ked: key event dict, mutated with new version
//    ///   - kind: serialization if given else use one given in ked
//    /// - Returns:tuple of (raw, kind, ked, version) where:
//    ///     - raw is serialized event as bytes of kind
//    ///     - kind is serialization kind
//    ///     - version is Versionage instance
//    /// - Throws:
////    private func exhale(ked: inout OrderedDictionary<String, Any>, kind: Serial = .json)
////        throws -> (raw: [UInt8], kind: Serial, version: Versionage)
////    {
//    ////        try sizeify(ked: &ked, kind: kind)
////    }
// }
