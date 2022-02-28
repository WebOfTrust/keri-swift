//
// Created by Kevin Griffin on 2/17/22.
//

import Collections
import Foundation

protocol Sizable {}

class Sizer {
    /// Takes an updated key event dictionary, extracts the existing version string, calculates the new
    /// ked size replacing the version string with an updated one.
    ///
    /// Mutates ked.
    ///
    /// - Parameters:
    ///   - ked: key event dictionary
    ///   - kind: defaults to Serial.json
    /// - Returns:
    ///   - raw: (bytes of ked),
    ///   - kind: Serial
    ///   - version: Versionage
    /// - Throws:
    func sizeify(ked: inout OrderedDictionary<String, Any>, kind: Serial = .json)
        throws -> (raw: [UInt8], kind: Serial, version: Versionage)
    {
//        guard let vs = ked["v"] as? String else {
//            throw SizeifyErrors.missingVersion
//        }
//
//        let (ident, knd, version, size) = try deversify(vs: vs)
//
//        if kind != knd {
//            throw SerderErrors.exhaleKindMismatch
//        }
//
//        if !Serials.contains(kind) {
//            throw SerialErrors.invalidSerialization(kind)
//        }
//
//        var raw: [UInt8] = try dumps(ked: ked)
//        let rsize: Int = raw.count
//
//        guard let vs = String(data: Data(raw[0 ..< MinSniffSize]), encoding: .utf8) else {
//            throw VersionErrors.invalidVersion
//        }
//        print(vs)
//        // convert found version string to bytes
//        let vsb: [UInt8] = Array(vs.utf8)
//        print(vsb)
//        // range of found version string bytes in raw
//        let vsr: Range<Int> = raw.firstRange(of: vsb)! // happy to force unwrap as we found the bytes
//        print(vsr)
//        // update vs with latest kind version size
//        let vers: String = versify(ident: ident, version: version, size: size)
//        print(vers)
//        // new version string bytes
//        let nvsb: [UInt8] = Array(vers.utf8)
//
//        print(nvsb)
//        print(vsb.count, nvsb.count)
//
//        if vsb.count != nvsb.count {
//            throw SerderErrors.failedVersionSubstitution
//        }
//
//        // replace old version string in raw with new one
//        raw.replaceSubrange(vsr, with: nvsb)
//        if size != rsize {
//            throw SerderErrors.failedVersionSubstitution
//        }
//
//        ked["v"] = vs
//
//        return (raw: raw, kind: kind, version: version)
//    }
        return ([UInt8](), .json, Version)
    }
}

// protocol Sizeify: Loadage {}
//
// extension Sizeify {
//    /// Takes an updated key event dictionary, extracts the existing version string, calculates the new
//    /// ked size replacing the version string with an updated one.
//    ///
//    /// Mutates ked.
//    ///
//    /// - Parameters:
//    ///   - ked: key event dictionary
//    ///   - kind: defaults to Serial.json
//    /// - Returns:
//    ///   - raw: (bytes of ked),
//    ///   - kind: Serial
//    ///   - version: Versionage
//    /// - Throws:
//    func sizeify(ked: inout OrderedDictionary<String, Any>, kind: Serial = .json)
//        throws -> (raw: [UInt8], kind: Serial, version: Versionage)
//    {
//        guard let vs = ked["v"] as? String else {
//            throw SizeifyErrors.missingVersion
//        }
//
//        let (ident, knd, version, size) = try deversify(vs: vs)
//
//        if kind != knd {
//            throw SerderErrors.exhaleKindMismatch
//        }
//
//        if !Serials.contains(kind) {
//            throw SerialErrors.invalidSerialization(kind)
//        }
//
//        var raw: [UInt8] = try dumps(ked: ked)
//        let rsize: Int = raw.count
//
//        guard let vs = String(data: Data(raw[0 ..< MinSniffSize]), encoding: .utf8) else {
//            throw VersionErrors.invalidVersion
//        }
//        print(vs)
//        // convert found version string to bytes
//        let vsb: [UInt8] = Array(vs.utf8)
//        print(vsb)
//        // range of found version string bytes in raw
//        let vsr: Range<Int> = raw.firstRange(of: vsb)! // happy to force unwrap as we found the bytes
//        print(vsr)
//        // update vs with latest kind version size
//        let vers: String = versify(ident: ident, version: version, size: size)
//        print(vers)
//        // new version string bytes
//        let nvsb: [UInt8] = Array(vers.utf8)
//
//        print(nvsb)
//        print(vsb.count, nvsb.count)
//
//        if vsb.count != nvsb.count {
//            throw SerderErrors.failedVersionSubstitution
//        }
//
//        // replace old version string in raw with new one
//        raw.replaceSubrange(vsr, with: nvsb)
//        if size != rsize {
//            throw SerderErrors.failedVersionSubstitution
//        }
//
//        ked["v"] = vs
//
//        return (raw: raw, kind: kind, version: version)
//    }
// }
