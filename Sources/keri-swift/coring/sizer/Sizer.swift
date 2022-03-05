//
// Created by Kevin Griffin on 3/1/22.
//

import Foundation

struct Sizer {
    /// Takes an updated Sizable, extracts the existing version string, calculates the new
    /// Sizable size replacing the version string with an updated one.
    ///
    /// - Parameters:
    ///   - sizable: provides current version
    ///   - raw: bytes of entity being sized
    ///   - kind: defaults to Serial.json
    /// - Throws:
    func sizeify(sizable: Sizeable, raw: inout [UInt8], kind: Serial = .json) throws {
        // purposefully ignoring returned size as that's what we're calculating
        let (ident, knd, version, _) = try deversify(vs: sizable.v)
        if kind != knd {
            throw SizeifyErrors.mismatchedSerialization
        }

        // only support current version
        if version != version {
            throw SizeifyErrors.invalidVersion
        }

        // convert given version string to bytes
        let vsb: [UInt8] = Array(sizable.v.utf8)

        // range of found version string bytes in raw
        let vsr: Range<Int> = raw.firstRange(of: vsb)! // happy to force unwrap as we found the bytes

        // calculate new version string
        let vers: String = versify(ident: ident, version: version, size: raw.count)
        // replace old version string in raw with new one
        raw.replaceSubrange(vsr, with: [UInt8](Array(vers.utf8)))
    }
}
