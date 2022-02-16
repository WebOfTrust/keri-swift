//
// Created by Kevin Griffin on 2/14/22.
//

import Foundation
import MessagePack
import SwiftCBOR

/// Serder is KERI key event serializer-deserializer class
/// Only supports current version VERSION
struct Serder: Loadage {
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
    ///   - raw: bytes of serialized event only
    ///   - ked: key event dict
    ///   - kind: serialization kind string value
    ///   - sad: self addressing data
    ///   - code: default code
    /// - Throws:
    init(raw: [UInt8] = [], ked: [String: Any], kind: Ident = .keri, sad: String = "", code: String = MatterCodex[MatterCodes.Blake3_256]!) throws {
        if kind != .keri {
            throw SerderErrors.invalidIdent
        }

        if !raw.isEmpty {
            self._raw = raw
        } else if !ked.isEmpty {
            self._kind = kind
            self._ked = ked
        } else if !sad.isEmpty {
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
    private func sniff() throws -> Deversified {
        if self._raw.count < self.MinSniffSize {
            throw SerderErrors.insufficientBytes
        }

        guard let vs = String(data: Data(raw[0 ..< MinSniffSize]), encoding: .utf8) else {
            throw VersionErrors.invalidVersion
        }

        return try deversify(vs: vs)
    }

    /// inhale
    ///
    /// - Returns:
    /// - Throws:
    //swiftlint:disable large_tuple
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

    /// exhale - (sizeify)
    ///
    /// - Parameters:
    ///   - ked: key event dict, mutated with new version
    ///   - kind: serialization if given else use one given in ked
    /// - Returns:tuple of (raw, kind, ked, version) where:
    ///     - raw is serialized event as bytes of kind
    ///     - kind is serialization kind
    ///     - version is Versionage instance
    /// - Throws:
    private func exhale(ked: inout [String: Any], kind: Serial = .json)
        throws -> (raw: [UInt8], kind: Serial, version: Versionage)
    {
        guard let vs = ked["v"] as? String else {
            throw SizeifyErrors.missingVersion
        }

        let (ident, knd, version, size) = try deversify(vs: vs)

        if kind != knd {
            throw SerderErrors.exhaleKindMismatch
        }

        if !Serials.contains(kind) {
            throw SerialErrors.invalidSerialization(kind)
        }

        var raw: [UInt8] = try dumps(ked: ked)
        let rsize: Int = raw.count

        guard let vs = String(data: Data(raw[0 ..< MinSniffSize]), encoding: .utf8) else {
            throw VersionErrors.invalidVersion
        }

        // convert found version string to bytes
        let vsb: [UInt8] = Array(vs.utf8)
        // range of found version string bytes in raw
        let vsr: Range<Int> = raw.firstRange(of: vsb)! // happy to force unwrap as we found the bytes
        // update vs with latest kind version size
        let vers: String = versify(ident: ident, version: version, size: size)
        // new version string bytes
        let nvsb: [UInt8] = Array(vers.utf8)

        if vsb.count != nvsb.count {
            throw SerderErrors.failedVersionSubstitution
        }

        // replace old version string in raw with new one
        raw.replaceSubrange(vsr, with: nvsb)
        if size != rsize {
            throw SerderErrors.failedVersionSubstitution
        }

        ked["v"] = vs

        return (raw: raw, kind: kind, version: version)
    }
}
